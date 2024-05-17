import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class setting_card_widget extends StatelessWidget {
  final Icon card_icon;
  final String card_title;
  final VoidCallback card_finction;

  const setting_card_widget({
    super.key,
    required this.card_icon,
    required this.card_title,
    required this.card_finction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: card_finction,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        width: MediaQuery.of(context).size.width - 32,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                card_icon,
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    card_title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.secondaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
