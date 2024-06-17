import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pediatric_pt/routes.dart';

import '../../../components/custombuttonauth.dart';
import '../../../components/customlogoauth.dart';
import '../../../components/textformfield.dart';
import '../../../controller/cubit/user_cubit/user_cubit.dart';
import '../login/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  bool isLoading = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is LoadingState) {
            setState(() {
              isLoading = true;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
          if (state is FailedToCreateUserState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('state.message'),
              ),
            );
          }
          if (state is UserCreatedSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: ListView(children: [
              Form(
                key: formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 50),
                    const CustomLogoAuth(),
                    Container(height: 20),
                    const Text("SignUp",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Container(height: 10),
                    const Text("SignUp To Continue Using The App",
                        style: TextStyle(color: Colors.grey)),
                    Container(height: 20),
                    BlocProvider.of<UserCubit>(context).userImgFile != null
                        ? GestureDetector(
                            onTap: () {
                              BlocProvider.of<UserCubit>(context).getImage();
                            },
                            child: Container(
                              width: 75,
                              height: 75,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                      BlocProvider.of<UserCubit>(context)
                                          .userImgFile!),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              BlocProvider.of<UserCubit>(context).getImage();
                            },
                            child: Container(
                              width: 75,
                              height: 75,
                              child: Image.asset("name"),
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                    const Text(
                      "username",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Container(height: 10),
                    CustomTextForm(
                        hinttext: "First name",
                        mycontroller: firstName,
                        validator: (val) {
                          if (val == "") {
                            return "Can't To be Empty";
                          }
                          return null;
                        }),
                    Container(height: 20),
                    CustomTextForm(
                        hinttext: "Last name",
                        mycontroller: lastName,
                        validator: (val) {
                          if (val == "") {
                            return "Can't To be Empty";
                          }
                          return null;
                        }),
                    Container(height: 20),
                    CustomTextForm(
                      hinttext: "Phone number",
                      mycontroller: phoneNumber,
                      validator: (val) {
                        if (val == "") {
                          return "Can't To be Empty";
                        }
                        return null;
                      },
                    ),
                    Container(height: 20),
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Container(height: 10),
                    CustomTextForm(
                        hinttext: "Enter Your Email",
                        mycontroller: email,
                        validator: (val) {
                          if (val == "") {
                            return "Can't To be Empty";
                          }
                          return null;
                        }),
                    Container(height: 10),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Container(height: 10),
                    CustomTextForm(
                        hinttext: "Enter Your Password",
                        mycontroller: password,
                        validator: (val) {
                          if (val == "") {
                            return "Can't To be Empty";
                          }
                          return null;
                        }),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      alignment: Alignment.topRight,
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButtonAuth(
                title: "SignUp",
                onPressed: () {
                  if (formState.currentState!.validate()) {
                    try {
                      BlocProvider.of<UserCubit>(context).register(
                          firstName: firstName.text,
                          lastName: lastName.text,
                          phoneNumber: phoneNumber.text,
                          email: email.text,
                          password: password.text);
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                            "Please, fill your information first and try again"),
                      ),
                    );
                  }
                },
              ),
              Container(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoute.login);
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Have An Account?",
                        ),
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
