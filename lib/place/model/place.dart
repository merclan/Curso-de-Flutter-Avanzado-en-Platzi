import 'package:flutter/material.dart';

class Place {
  String uid;
  String name;
  String description;
  String urlImage;
  int likes;

  Place(
      {Key key,
      this.uid,
      @required this.name,
      @required this.description,
      @required this.urlImage,
      this.likes});
}
