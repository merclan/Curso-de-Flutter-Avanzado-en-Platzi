import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String text;
  double height = 0.0;
  double width = 0.0;
  VoidCallback onPressed;

  ButtonGreen(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.height,
      this.width});

  @override
  _ButtonGreenState createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onPressed,
        child: Container(
            margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    colors: [Color(0xFFA7FF84), Color(0xFF1CBB78)],
                    begin: FractionalOffset(0.2, 0.0),
                    end: FractionalOffset(1.0, 0.6),
                    stops: [0.0, 0.6],
                    tileMode: TileMode.clamp)),
            child: Center(
                child: Text(widget.text,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Lato",
                        color: Colors.white)))));
  }
}
