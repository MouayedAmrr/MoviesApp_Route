import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_movies_app/modules/moviedetails/data/mapper/movie_detailes_mapper.dart';
import '../../../moviedetails/data/models/movie_details_model.dart';
import '../../../moviedetails/domain/entities/movie_details_entity.dart';
import 'history_states.dart';


class HistoryCubit extends Cubit<HistoryState> {

  HistoryCubit() : super(HistoryInitial());

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> addToHistory(MovieDetailsEntity movie) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    try {
      final historyRef =
      _firestore.collection("users").doc(uid).collection("history");

      final movieId = movie.id.toString();
      final docRef = historyRef.doc(movieId);

      await docRef.set({
        ...movie.toJson(),
        "watchedAt": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> loadHistory() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    emit(HistoryLoading());
    try {
      final historyRef =
      _firestore.collection("users").doc(uid).collection("history");

      final snapshot =
      await historyRef.orderBy("watchedAt", descending: true).get();

      if (snapshot.docs.isEmpty) {
        emit(HistoryLoaded([]));
        return;
      }

      final movies = snapshot.docs.map((doc) {
        final data = doc.data();
        return MovieDetailsModel.fromJson(doc.data()).toEntity();
      }).toList();

      emit(HistoryLoaded(movies));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }


  Future<void> removeFromHistory(int movieId) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    try {
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("history")
          .doc("$movieId")
          .delete();

      await loadHistory();
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }
}
