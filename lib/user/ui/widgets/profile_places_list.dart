import 'package:flutter/material.dart';
import 'package:platzi_trips_app/place/model/place.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_place.dart';

class ProfilePlacesList extends StatelessWidget {
  //Place place = new Place('Knuckles Mountains Range', 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '123,123,123');
  Place place = Place(
      name: 'Knuckles Mountains Range',
      description: 'Hiking. Water fall hunting. Natural bath',
      urlImage:
          'https://www.capturelandscapes.com/wp-content/uploads/2017/03/DSC2441-Panorama.jpeg',
      likes: 2);

  //Place place2 = new Place('Mountains', 'Hiking. Water fall hunting. Natural bath', 'Scenery & Photography', '321,321,321');
  Place place2 = Place(
      name: 'Mountains',
      description: 'Hiking. Water fall hunting. Natural bath',
      urlImage:
          'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip',
      likes: 5);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      ),
    );
  }
}
