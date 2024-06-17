import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pediatric_pt/core/theming/colors.dart';

import '../../../../controller/cubit/user_cubit/user_cubit.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/shared/gender_card_widget.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String? gender;
  String? selectedDate;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController university = TextEditingController();
  final TextEditingController chooseStatus = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userCubit = BlocProvider.of<UserCubit>(context)..getUsersData();
    if (userCubit.userModel != null && userCubit.userModel!.sex != null) {
      gender = userCubit.userModel!.sex!;
    } else {
      gender = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<UserCubit>(context)..userModel;
    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is updateUserDataOnFirestoreSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          firstName.text = user.userModel!.firstName ?? "";
          lastName.text = user.userModel!.lastName ?? "";
          phoneNumber.text = user.userModel!.phoneNumber ?? "";
          university.text = user.userModel!.university ?? "";
          chooseStatus.text = user.userModel!.chooseStatus ?? "";
          address.text = user.userModel!.address ?? "";
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      child: Hero(
                        tag: "userImage",
                        child: Image.asset(
                          "images/my_pic.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Icon(
                          Icons.photo_camera,
                          size: 32,
                          color: ColorManager.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textField(
                      fieldWidth: MediaQuery.of(context).size.width / 2.5,
                      fieldName: "First name",
                      controller: firstName,
                    ),
                    textField(
                      fieldWidth: MediaQuery.of(context).size.width / 2.5,
                      fieldName: "Last name",
                      controller: lastName,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: textField(
                    fieldWidth: MediaQuery.of(context).size.width,
                    fieldName: "Phone Number",
                    controller: phoneNumber,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "Male";
                          });
                        },
                        child: genderCardWidget(
                          gender: gender!,
                          Sex: 'Male',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "Female";
                          });
                        },
                        child: genderCardWidget(
                          gender: gender!,
                          Sex: 'Female',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: textField(
                    fieldWidth: MediaQuery.of(context).size.width,
                    fieldName: "university",
                    controller: university,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: textField(
                    fieldWidth: MediaQuery.of(context).size.width,
                    fieldName: "Status",
                    controller: chooseStatus,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: textField(
                    fieldWidth: MediaQuery.of(context).size.width,
                    fieldName: "Address",
                    controller: address,
                  ),
                ),

                // GestureDetector(
                //   onTap: () => _selectDate(context),
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     padding: const EdgeInsets.all(12),
                //     margin: const EdgeInsets.symmetric(horizontal: 24),
                //     decoration: BoxDecoration(
                //       border: Border.all(width: 2, color: Colors.black54),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         selectedDate == null
                //             ? const Text(
                //                 'Enter your birth day',
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.w500,
                //                     color: Colors.black54),
                //               )
                //             : Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text(
                //                     DateFormat.yMMMd().format(selectedDate!),
                //                     style: const TextStyle(
                //                       fontSize: 16,
                //                       color: ColorManager.mainColor,
                //                       fontWeight: FontWeight.w500,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //         const Icon(
                //           Icons.date_range,
                //           color: ColorManager.mainColor,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                GestureDetector(
                  onTap: () {
                    context.read<UserCubit>().updateUserProfile(
                          firstName: firstName.text,
                          lastName: lastName.text,
                          address: address.text,
                          phoneNumber: phoneNumber.text,
                          chooseStatus: chooseStatus.text,
                          university: university.text,
                          gender: gender ?? "",
                        );
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.mainColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      margin: EdgeInsets.all(16),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                      child: Text(
                        "Update Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  updateProfile() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Constants.userID)
          .update({
        'firstName': firstName.text,
        'lastName': lastName.text,
        "address": address.text,
        'phoneNumber': phoneNumber.text,
        'chooseStatus': chooseStatus.text,
        'university': university.text,
        'sex': gender.toString(),
      });
      print("============= updated user profile");
    } catch (e) {
      print("============= can't update user profile");
    }
  }

// void _selectDate(BuildContext context) async {
//   final DateTime? pickedDate = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(2000),
//     lastDate: DateTime.now(),
//   );
//
//   if (pickedDate != null && pickedDate != selectedDate) {
//     setState(() {
//       selectedDate = pickedDate;
//     });
//   }
// }
}

class textField extends StatelessWidget {
  textField(
      {required this.fieldWidth,
      required this.fieldName,
      required this.controller});

  double fieldWidth;
  String fieldName;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 70,
      width: fieldWidth,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: fieldName,
          labelStyle: TextStyle(
              color: ColorManager.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            // Border when the field is focused
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ColorManager.mainColor),
          ),
        ),
        onSaved: (value) {},
      ),
    );
  }
}
