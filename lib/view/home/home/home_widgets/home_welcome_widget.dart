import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

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
          child: Row(
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
                    '${S.of(context).hello}${S.of(context).doctor}${name}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Are you ready to learn and practice?",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: CircleAvatar(
                  radius: 25,
                  child: Image.asset(imageUrl),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
