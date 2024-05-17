import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../course_player.dart';

class videoDetailsWidget extends StatelessWidget {
  const videoDetailsWidget({
    super.key,
    required this.widget,
  });

  final coursePlayer widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${S.of(context).lecture} ${widget.lectureNum}',
            style: const TextStyle(
                fontFamily: "Georgia",
                fontWeight: FontWeight.w700,
                letterSpacing: 1.6,
                fontSize: 24,
                color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 4),
            child: Text(
              widget.description,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ),
          Text(
            '${S.of(context).presenter}${widget.presenter}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
