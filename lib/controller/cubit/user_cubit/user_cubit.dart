import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../core/constants/constants.dart';
import '../../../core/models/user_model.dart';

part 'user_state.dart';

////

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  // get pic from my devise
  File? userImgFile;

  void getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      userImgFile = File(pickedImage.path);
      emit(UserImageSelectedSuccessState());
    } else {
      emit(FailedToGeUserImageSelectedState());
    }
  }

  // upload image to firestore
  Future<String> uploadImageToStorage() async {
    try {
      Reference imageRef =
          FirebaseStorage.instance.ref(basename(userImgFile!.path));
      await imageRef.putFile(userImgFile!);
      String downloadURL = await imageRef.getDownloadURL();
      print("Image uploaded successfully: $downloadURL");
      return downloadURL;
    } catch (e) {
      print("Failed to upload image: $e");
      throw Exception("Image upload failed");
    }
  }

  // send data of registration to firestore

  Future<void> sendUserDataToFireStore({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String userID,
  }) async {
    UserModel userModel = UserModel(
      // image: image,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      id: userID,
    );
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .set(userModel.toJson());
      print(
          "============================User data sent to Firestore successfully");
      emit(SavePatientDataOnFirestoreSuccessState());
    } on FirebaseException catch (e) {
      print(
          "===========================Failed to save user data to Firestore: $e");
      emit(FailedToSaveUserDataOnFirestoreState());
    }
  }

  // registration methode to create user, send verification link to email and send data to firestore
  Future<void> register({
    // String? image,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    emit(LoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("========================= ${userCredential.user!.uid}");

      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      // String imageUrl = await uploadImageToStorage();
      await sendUserDataToFireStore(
        // image: imageUrl,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        userID: userCredential.user!.uid,
      );
      emit(UserCreatedSuccessState());
    } on FirebaseException catch (e) {
      print("FirebaseException: $e");
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("The password provided is too weak")),
        // );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("The account already exists for that email")),
        // );
      }
      emit(FailedToCreateUserState());
    } catch (e) {
      print("Exception: $e");
      emit(FailedToCreateUserState());
    }
  }

  // methode to update user score for each quiz he answers
  Future<void> updateUserQuizScore({
    required String userId,
    required String lecureName,
    required int score,
  }) async {
    try {
      String quizField = 'quiz${lecureName}Score';
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({quizField: score});
      print("Quiz score updated successfully");
      emit(UpdateUserQuizScoreSuccessState());
    } on FirebaseException catch (e) {
      print("Failed to update quiz score: $e");
      emit(FailedToUpdateUserQuizScoreState());
    }
  }

  // update user profile data
  Future<void> updateUserProfile({
    required String firstName,
    required String lastName,
    required String address,
    required String phoneNumber,
    required String chooseStatus,
    required String university,
    required String gender,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Constants.userID)
          .update({
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'phoneNumber': phoneNumber,
        'chooseStatus': chooseStatus,
        'university': university,
        'sex': gender,
      });
      print("============= updated user profile");
      emit(updateUserDataOnFirestoreSuccessState()); // Emit success state
    } catch (e) {
      print("============= can't update user profile");
      emit(FailedToupdateUserDataOnFirestoreState()); // Emit failure state
    }
  }

// get List of all the users from firebase [used for admin app]

  List<UserModel> users = [];

  void getUsers() async {
    users.clear();
    emit(GetUsersLoadingState());
    try {
      await FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var item in value.docs) {
          if (item.id != Constants.userID) {
            users.add(UserModel.fromJson(data: item.data()));
          }
        }
        emit(GetUsersDataSuccessState());
      });
    }
    // on FirebaseException
    catch (e) {
      users = [];
      emit(FailedToGetUsersDataState());
    }
  }

  // get the user data from firebase

  UserModel? userModel;

  void getUsersData() async {
    emit(
        GetUsersLoadingState()); // Emit loading state before starting the operation
    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(Constants.userID)
              .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null) {
          userModel = UserModel.fromJson(data: data);
          emit(SuccessGetUsersDataState(userModel));
          print("User data retrieved: ${userModel!.firstName}");
        } else {
          print("No user data found for user ID: ${Constants.userID}");
          emit(FailedToGetMyDataState());
        }
      } else {
        print("User document does not exist for user ID: ${Constants.userID}");
        emit(FailedToGetMyDataState());
      }
    } on FirebaseException catch (e) {
      print("Error fetching user data from Firestore: $e");
      emit(FailedToGetMyDataState());
    }
  }
}
