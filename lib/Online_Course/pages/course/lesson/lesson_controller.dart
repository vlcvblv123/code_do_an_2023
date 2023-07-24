import 'package:CodeGenius/Online_Course/common/apis/lesson_api.dart';
import 'package:CodeGenius/Online_Course/common/entities/entities.dart';
import 'package:CodeGenius/Online_Course/pages/course/lesson/bloc/lesson_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/course/lesson/bloc/lesson_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class LessonController {
  final BuildContext context;
  VideoPlayerController? videoPlayerController;
  LessonController({required this.context});
  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    //set the earilier video to false means, stop playing
    context.read<LessonBlocs>().add(TriggerPlay(false));
    asyncLoadLessonData(args['id']);
  }

  Future<void> asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonAPI.lessonDetail(params: lessonRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<LessonBlocs>().add(TriggerLessonVideo(result.data!));
        if (result.data!.isNotEmpty) {
          var url = result.data!.elementAt(0).url;
          print("my url is $url");
          //this url is important for init video player
          videoPlayerController = VideoPlayerController.networkUrl(
            Uri.parse(
                url!),
            videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
          );
          //here actually stream start to happen
          var initPlayer = videoPlayerController?.initialize();
          context.read<LessonBlocs>().add(TriggerUrlItem(initPlayer));
          videoPlayerController?.play();
        }
      }
    }

  }
  void playVideo(String url) {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    context.read<LessonBlocs>().add(const TriggerPlay(false));
    context.read<LessonBlocs>().add(const TriggerUrlItem(null));
    var initPlayer = videoPlayerController?.initialize().then((value) {
      videoPlayerController?.seekTo(const Duration(microseconds: 0));
    });
    context.read<LessonBlocs>().add(TriggerUrlItem(initPlayer));
    context.read<LessonBlocs>().add(const TriggerPlay(true));
  }
}
