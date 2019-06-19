import 'package:platzi_trips_app/place/model/place.dart';
import 'package:platzi_trips_app/user/model/user.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  void updateUserDataFirestore(User user) => _cloudFirestoreApi.updateUserData(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreApi.updatePlaceData(place);
}