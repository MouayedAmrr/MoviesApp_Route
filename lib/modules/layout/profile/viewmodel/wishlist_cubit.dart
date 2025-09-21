import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../moviedetails/data/models/movie_details_model.dart';
import '../../../moviedetails/data/mapper/movie_detailes_mapper.dart';
import '../../../moviedetails/domain/entities/movie_details_entity.dart';
import 'wishlist_states.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  StreamSubscription? _wishlistSubscription;

  void loadWishlist() {
    emit(WishlistLoading());

    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      emit(const WishlistError("User not logged in"));
      return;
    }

    _wishlistSubscription = _firestore
        .collection("users")
        .doc(uid)
        .collection("favorites")
        .snapshots()
        .listen(
          (snapshot) {
            final movies =
                snapshot.docs
                    .map(
                      (doc) =>
                          MovieDetailsModel.fromJson(doc.data()).toEntity(),
                    )
                    .toList();
            emit(WishlistLoaded(movies));
          },
          onError: (e) {
            print(e);
            emit(WishlistLoaded([]));
          },
        );
  }

  Future<void> toggleFavorite(MovieDetailsEntity movie) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final favoritesRef = _firestore
        .collection("users")
        .doc(uid)
        .collection("favorites");

    final movieId = movie.id.toString();
    final docRef = favoritesRef.doc(movieId);

    final doc = await docRef.get();
    if (doc.exists) {
      await docRef.delete();
    } else {
      await docRef.set(movie.toJson());
    }
  }

  @override
  Future<void> close() {
    _wishlistSubscription?.cancel();
    return super.close();
  }
}
