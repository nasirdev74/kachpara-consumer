import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/models/feed_model.dart';
import 'package:kachpara/domain/entities/feed_item.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class FeedData {
  FeedData(this._firebaseFirestore);

  final List<FeedItem> _feedList = [];
  final FirebaseFirestore _firebaseFirestore;
  QueryDocumentSnapshot? _lastDocument;

  Future<Result<List<FeedItem>>> getFeed(String currentUserId) async {
    const int itemsPerPage = 20;
    String userId = getIt<UserBloc>().state.user!.id;

    Query query = _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection("feed")
        .orderBy("timeStamp", descending: true)
        .limit(itemsPerPage);

    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }

    final snapshot = await query.get();

    if (snapshot.docs.isNotEmpty) {
      final feedlist = snapshot.docs
          .map((doc) =>
              FeedModel.fromJson(doc.data() as Map<String, dynamic>).toDomain())
          .toList();
      if (feedlist.isNotEmpty) {
        _lastDocument = snapshot.docs.last;

        debugPrint(_lastDocument!.exists.toString());
        debugPrint(_lastDocument!.id);

        _feedList.addAll(feedlist);

        return Result.success(_feedList);
      } else {
        return const Result.error("Error fetching feed");
      }
    } else {
      return const Result.error("an unknown Error fetching feed");
    }
  }
}
