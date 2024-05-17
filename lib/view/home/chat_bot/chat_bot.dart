import 'package:flutter/material.dart';
import 'package:pediatric_pt/core/theming/colors.dart';
import 'package:pediatric_pt/view/home/chat_bot/text_only_chat_bot.dart';
import 'package:pediatric_pt/view/home/chat_bot/text_with_image_chat_bot.dart';

import '../../../generated/l10n.dart';

const apiKey = "AIzaSyCB2CIzPywnOfUNl0jmnC6pMdF6WdeBm3I";

class chatBot extends StatefulWidget {
  const chatBot({super.key});

  @override
  State<chatBot> createState() => _chatBotState();
}

class _chatBotState extends State<chatBot> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(25), // Same as container's borderRadius
            ),
            color: ColorManager.mainColor
                .withOpacity(0.8), // Color of the selected tab indicator
          ),
          indicatorWeight: 1,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black.withOpacity(0.7),
          labelStyle: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              color: Colors.white), // Style of the label of the selected tab
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              color: Colors.black.withOpacity(0.8),
              fontSize: 12), // Style of the label of unselected tabs
          tabs: [
            Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(S.of(context).textOnly),
              ),
            ),
            Tab(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(S.of(context).textWithImage),
              ),
            )
            // Tab 2 button
          ],
        ),
        body: const TabBarView(
          children: [TextOnly(), TextWithImage()],
        ),
      ),
    );
  }
}
