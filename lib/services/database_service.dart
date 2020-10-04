import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_provider/models/post.dart';
import 'package:flutter_firebase_provider/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

//  collection reference
  final CollectionReference myCollection = Firestore.instance.collection('users');

  Future updateUserData(String sugars, String name, int strength) async {
    return await myCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

  List<Post> _postListFromSnapshot(QuerySnapshot snapshot) {
    var i = -1;
    return snapshot.docs.map((doc) {
      i++;
      print('iter is $i');
      return Post(
        name: doc.data()['name'] ?? ' ',
        sugars: doc.data()['sugars'] ?? '0',
        strength: doc.data()['strength'] ?? 0,
        key: i.toString(),
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      sugars: snapshot.data()['sugars'],
      strength: snapshot.data()['strength'],
    );
  }

  Stream<List<Post>> get posts {
    print('uid is $uid');
    return myCollection.snapshots().map(_postListFromSnapshot);
  }

  Stream<UserData> get userData {
    return myCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

}