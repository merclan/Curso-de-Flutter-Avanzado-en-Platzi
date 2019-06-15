import 'package:flutter/material.dart';

class User {
  final String photoUrl;
  final String name;
  final String email;

  User(
      {Key key,
      @required this.photoUrl,
      @required this.name,
      @required this.email});
}
