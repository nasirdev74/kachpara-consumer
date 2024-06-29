import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/sources/firestore/feed_data.dart';
import 'package:kachpara/domain/entities/feed_item.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class FeedUseCase {
  FeedUseCase(this._feedData);

  final FeedData _feedData;

  Future<Result<List<FeedItem>>> getFeed() async {
    String currentUserId = getIt<UserBloc>().state.user!.id;
    return await _feedData.getFeed(currentUserId);
  }
}
