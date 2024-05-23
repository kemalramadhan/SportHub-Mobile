import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProfile {
  // get collection of user profile
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  // CREATE: add a user profile
  Future<void> addUsers(String firstName, lastName, email) {
    return this.users.add(
      {
        'first name': firstName,
        'last name': lastName,
        'email': email,
        'timestamp': Timestamp.now(),
      },
    );
  }
}

class FirestoreService {
  // get collection of workout program
  final CollectionReference workout =
      FirebaseFirestore.instance.collection('workout');

  // CREATE: add a workout program
  Future<void> addWorkout(String workout) {
    return this.workout.add({
      'workout': workout,
      'timestamp': Timestamp.now(),
    });
  }

  // READ: get workout from database
  Stream<QuerySnapshot> getWorkoutStream() {
    final workoutStream =
        workout.orderBy('timestamp', descending: true).snapshots();

    return workoutStream;
  }

  // UPDATE: update workout given a doc id

  // DELETE: delete workout given a doc id
}
