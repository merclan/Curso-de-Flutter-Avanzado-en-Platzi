import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/place/model/place.dart';
import 'package:platzi_trips_app/place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/user/model/user.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/user/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreApi.updateUserData(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreApi.updatePlaceData(place);

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placeListSnapshot) =>
      _cloudFirestoreApi.buildMyPlaces(placeListSnapshot);

  List<CardImageWithFabIcon> buildPlaces(
          List<DocumentSnapshot> placeListSnapshots) =>
      _cloudFirestoreApi.buildPlaces(placeListSnapshots);
}
