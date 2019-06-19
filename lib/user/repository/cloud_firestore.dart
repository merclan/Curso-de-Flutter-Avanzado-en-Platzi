import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/place/model/place.dart';
import 'package:platzi_trips_app/user/model/user.dart';

class CloudFirestoreApi {
  static const String USERS = "users";
  static const String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference ref = _db.collection(PLACES);
    /*
    await _auth.currentUser().then((FirebaseUser user) {
      ref.add({
        'name': place.name,
        'description': place.description,
        'likes': place.likes,
        'userOwner': "${USERS}/${user.uid}" //reference string type
      });
    });
    */
    /*
    FirebaseUser user = await _auth.currentUser();
    DocumentReference _userRef = _db.collection(USERS).document(user.uid);
    return ref.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _userRef //reference
    });
    */
    await _auth.currentUser().then((FirebaseUser user) {
      ref.add({
        'name': place.name,
        'description': place.description,
        'likes': place.likes,
        'userOwner': _db.document("$USERS/${user.uid}")
        //reference
      }).then((DocumentReference dr) {
        dr.get().then((DocumentSnapshot snapshot) {
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);
          refUsers.updateData({
            'myPlaces': FieldValue.arrayUnion(
                [_db.document("$PLACES/${snapshot.documentID}")])
          });
        });
      });
    });
  }
}
