import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/user/model/user.dart';

class ProfilePlacesList extends StatelessWidget {

  UserBloc userBloc;
  User user;
  ProfilePlacesList(this.user);

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.done:
              case ConnectionState.active:
              default:
                return Column(
                    children: userBloc.buildMyPlaces(snapshot.data.documents));
            }
          },
          stream: userBloc.myPlacesListStream(user.uid)),
    );
  }
}
