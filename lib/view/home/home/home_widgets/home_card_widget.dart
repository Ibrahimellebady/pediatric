import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class homeCardWidget extends StatelessWidget {
  final String cardMainText;
  final String cardbuttonText;
  final String cardDescription;
  final String cardImage;
  final Function cardbuttonFunction;

  const homeCardWidget(
      {super.key,
      required this.cardMainText,
      required this.cardbuttonText,
      required this.cardbuttonFunction,
      required this.cardImage,
      required this.cardDescription});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 6, right: 6, bottom: 8, top: 18),
          child: Text(
            cardDescription,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.black.withOpacity(0.8),
              fontFamily: 'Edu',
            ),
          ),
        ),
        Material(
          elevation: 5.0,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorManager.secondaryColor.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.mainColor.withOpacity(0.9),
                        ColorManager.thirdColor,
                      ],
                      begin: const FractionalOffset(0.4, 0.8),
                      end: Alignment.bottomRight,
                    ),
                    // border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            right: 110, left: 12, top: 12, bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardMainText,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: "Lato",
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  height: 1.2),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                cardbuttonFunction();
                              },
                              child: Container(
                                width: 110,
                                margin: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 8,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    cardbuttonText,
                                    style: const TextStyle(
                                      color: ColorManager.mainColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -12,
                  right: 8,
                  child: SizedBox(
                    height: 170,
                    width: 100,
                    child: Hero(
                      tag: 'find doctor',
                      child: Image(
                        image: AssetImage(cardImage),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
