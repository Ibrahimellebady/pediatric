import 'package:flutter/material.dart';

import '../../../../../../core/theming/colors.dart';

class boolenQuestion extends StatefulWidget {
  final ValueChanged<bool?> onChanged;
  final String question;
  final String fieldName;
  final TextEditingController fieldController;

  boolenQuestion(
      {Key? key,
      required this.onChanged,
      required this.question,
      required this.fieldController,
      required this.fieldName})
      : super(key: key);

  @override
  _boolenQuestionState createState() => _boolenQuestionState();
}

class _boolenQuestionState extends State<boolenQuestion> {
  bool? boolen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: TextStyle(
              fontSize: 16,
              color: Color(0xff542D94).withOpacity(0.8),
              fontWeight: FontWeight.w700),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  value: boolen == true,
                  onChanged: (value) {
                    setState(() {
                      boolen = value;
                      if (value != null) widget.onChanged(value);
                    });
                  },
                ),
                Text('Yes'),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                  value: boolen == false,
                  onChanged: (value) {
                    setState(() {
                      boolen = !value!;
                      widget.onChanged(!value);
                    });
                  },
                ),
                Text('No'),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Visibility(
          visible: boolen == true,
          child: TextField(
            controller: widget.fieldController,
            decoration: InputDecoration(
              labelText: widget.fieldName,
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
                borderSide: BorderSide(color: ColorManager.secondaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
