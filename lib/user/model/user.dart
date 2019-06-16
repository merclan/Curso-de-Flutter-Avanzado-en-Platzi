import 'package:flutter/material.dart';
import 'package:platzi_trips_app/place/model/place.dart';

class User {
  final String uid;
  final String photoUrl;
  final String name;
  final String email;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;


  User({Key key,
    @required this.uid,
    @required this.photoUrl,
    @required this.name,
    @required this.email,
    this.myFavoritePlaces, this.myPlaces});
}
