import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pediatric_pt/controller/cubit/user_cubit/user_cubit.dart';
import 'package:pediatric_pt/core/theming/colors.dart';
import 'package:pediatric_pt/view/home/settings/screens/edit_account_screen.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context)..getUsersData();

    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          final user = userCubit.userModel!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Hero(
                    tag: "userImage",
                    child: Image.asset(
                      "images/my_pic.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Text(
                          '${user.firstName} ${user.lastName}',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.mainColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Card(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditAccountScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            child: const Icon(
                              Icons.mode_edit_sharp,
                              size: 28,
                              color: ColorManager.mainColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextSemiCardWidget(
                      CardIcon: Icons.male,
                      CardInfo: "${user.sex}",
                      cardName: 'Gender',
                    ),
                    TextSemiCardWidget(
                      CardIcon: Icons.numbers,
                      CardInfo: '${user.birthDate}',
                      cardName: 'Age',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextSemiCardWidget(
                      CardIcon: Icons.phone,
                      CardInfo: "${user.phoneNumber}",
                      cardName: 'Phone',
                    ),
                    TextSemiCardWidget(
                      CardIcon: Icons.location_on,
                      CardInfo: "${user.address}",
                      cardName: 'Address',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextSemiCardWidget(
                      CardIcon: Icons.location_city,
                      CardInfo: "${user.university}",
                      cardName: 'University',
                    ),
                    TextSemiCardWidget(
                      CardIcon: Icons.short_text,
                      CardInfo: "${user.chooseStatus}",
                      cardName: 'Status',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TextCardWidget extends StatelessWidget {
  const TextCardWidget(
      {super.key,
      required this.CardIcon,
      required this.CardInfo,
      required this.cardName});

  final String cardName;
  final String CardInfo;
  final IconData CardIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.only(top: 12),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 10, bottom: 8),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black45),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    CardInfo,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.mainColor,
                    ),
                  ),
                  Icon(CardIcon, color: ColorManager.mainColor)
                ],
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.white38.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text(
                cardName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSemiCardWidget extends StatelessWidget {
  const TextSemiCardWidget(
      {super.key,
      required this.CardIcon,
      required this.CardInfo,
      required this.cardName});

  final String cardName;
  final String CardInfo;
  final IconData CardIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 32,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.only(top: 12),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 10, bottom: 8),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black45),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 92,
                    child: Text(
                      CardInfo,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87.withOpacity(0.8)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Icon(CardIcon, color: ColorManager.mainColor)
                ],
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                cardName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
