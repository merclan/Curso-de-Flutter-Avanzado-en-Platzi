import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/place/model/place.dart';
import 'package:platzi_trips_app/place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescription = TextEditingController();

    return Scaffold(
        body: Stack(children: <Widget>[
      GradientBack("", 300),
      Row(children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 25, left: 5),
            child: SizedBox(
              height: 45,
              width: 45,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left,
                      color: Colors.white, size: 45),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )),
        Flexible(
            child: Container(
                padding: EdgeInsets.only(top: 45, left: 20, right: 10),
                child: TitleHeader(title: "Add a new place"))),
      ]),
      Container(
          margin: EdgeInsets.only(top: 120, bottom: 20),
          child: ListView(children: <Widget>[
            Container(
                alignment: Alignment.center,
                child: CardImageWithFabIcon(
                    pathImage: widget.image.path,
                    iconData: Icons.camera_alt,
                    height: 250,
                    width: 350,
                    marginLeft: 0)),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: TextInput(
                    hint: "Title",
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePlace)), // title
            TextInput(
                inputType: TextInputType.multiline,
                hint: "Description",
                maxLines: 4,
                controller: _controllerDescription),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextInputLocation(
                    iconData: Icons.add_location, hint: "Add location")),
            Container(
                width: 70,
                child: ButtonPurple(
                    buttonText: "Add place",
                    onPress: () {
                      //1. Firebase storage <> image url
                      userBloc.currentUser.then((FirebaseUser user) {
                        if (user != null) {
                          String path =
                              "${user.uid}/${DateTime.now().toString()}.jpg";
                          userBloc
                              .uploadFile(path, widget.image)
                              .then((StorageUploadTask storageUploadTask) {
                            storageUploadTask.onComplete
                                .then((StorageTaskSnapshot snapshot) {
                              snapshot.ref.getDownloadURL().then((urlImage) {
                                //2. Firebase cloud firestore
                                userBloc
                                    .updatePlaceData(Place(
                                        name: _controllerTitlePlace.text,
                                        description:
                                            _controllerDescription.text,
                                        urlImage: urlImage,
                                        likes: 0))
                                    .whenComplete(() {
                                  print("Saved");
                                  Navigator.pop(context);
                                });
                              });
                            });
                          });
                        }
                      });
                    }))
          ]))
    ]));
  }
}
