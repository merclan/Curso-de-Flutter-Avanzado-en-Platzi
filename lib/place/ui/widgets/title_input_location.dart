import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final IconData iconData;

  TextInputLocation(
      {Key key,
      @required this.hint,
      @required this.controller,
      @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20, left: 30),
        child: TextField(
            controller: controller,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Lato',
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                hintText: hint,
                suffixIcon: Icon(iconData),
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))))),
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12, blurRadius: 15, offset: Offset(0.0, 7.0))
        ]));
  }
}
