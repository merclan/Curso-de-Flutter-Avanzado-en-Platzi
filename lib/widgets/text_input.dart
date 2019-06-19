import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final TextInputType inputType;
  final TextEditingController controller;
  int maxLines = 1;

  TextInput(
      {Key key,
      @required this.hint,
      @required this.inputType,
      @required this.controller,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20, left: 30),
        child: TextField(
            controller: controller,
            keyboardType: inputType,
            maxLines: maxLines,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Lato',
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFe5e5e5),
                border: InputBorder.none,
                hintText: hint,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                    borderRadius: BorderRadius.all(Radius.circular(9))))));
  }
}
