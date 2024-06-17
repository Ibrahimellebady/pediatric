import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../controller/cubit/user_cubit/user_cubit.dart';
import '../../../../controller/features/check_locale.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';

class homeWelcomeWidget extends StatelessWidget {
  final String name;
  final String imageUrl;

  const homeWelcomeWidget(
      {super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context)..getUsersData();
    return Container(
      child: ClipPath(
        clipper: isLocaleArabic()
            ? WaveClipperTwo(
                flip: true,
              )
            : WaveClipperTwo(),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 150,
          decoration: const BoxDecoration(
            color: ColorManager.mainColor,
          ),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              final user = userCubit.userModel;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '${S.of(context).hello}${S.of(context).doctor}${user?.firstName ?? ''}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "Are you ready to learn and practice?",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Image.asset(imageUrl)),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
