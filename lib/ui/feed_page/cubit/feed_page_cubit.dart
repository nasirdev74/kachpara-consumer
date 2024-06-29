import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/domain/entities/feed_item.dart';
import 'package:kachpara/domain/usecases/feed_usecase.dart';
import 'package:kachpara/utils/status.dart';

part 'feed_page_cubit.freezed.dart';
part 'feed_page_state.dart';

@injectable
class FeedPageCubit extends Cubit<FeedPageState> {
  FeedPageCubit(this._feedUseCase) : super(const FeedPageState()) {
    getFeed();
  }

  final FeedUseCase _feedUseCase;

  Future<void> getFeed() async {
    emit(state.copyWith(status: Status.loading));
    final feed = await _feedUseCase.getFeed();

    feed.when(success: (feedList) {
      emit(state.copyWith(status: Status.success, feeds: feedList));
    }, error: (e) {
      emit(state.copyWith(status: Status.failed));
    });
  }

  void getMore() async {
    await _feedUseCase.getFeed();
  }
}
