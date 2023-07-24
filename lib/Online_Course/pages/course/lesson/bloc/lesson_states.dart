import 'package:equatable/equatable.dart';

import '../../../../common/entities/entities.dart';

class LessonStates extends Equatable {
  final List<LessonVideoItem> lessonVideoItem;
  final Future<void>? initializeVideoPlayerFuture;
  final bool isPlay;
  final int videoIndex;

  const LessonStates(
      {this.lessonVideoItem = const <LessonVideoItem>[],
      this.isPlay = false,
      this.initializeVideoPlayerFuture,
      this.videoIndex = 0});
  LessonStates copyWith(
      {List<LessonVideoItem>? lessonVideoItem,
      bool? isPlay,
      Future<void>? initializeVideoPlayerFuture,
      int? videoIndex}) {
    return LessonStates(
        lessonVideoItem: lessonVideoItem ?? this.lessonVideoItem,
        isPlay: isPlay ?? this.isPlay,
        initializeVideoPlayerFuture:
            initializeVideoPlayerFuture ?? this.initializeVideoPlayerFuture,
        videoIndex: videoIndex ?? this.videoIndex);
  }

  @override
  List<Object?> get props =>
      [lessonVideoItem, initializeVideoPlayerFuture, isPlay, videoIndex];
}
