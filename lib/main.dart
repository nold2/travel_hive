import 'package:travel_hive/chewie_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final double aspectRatio = queryData.size.width / queryData.size.height;

    return PlayerWidget(
        videoPlayerController: VideoPlayerController.asset('videos/Blueball.mp4'),
        looping: true,
        aspectRatio: aspectRatio,
    );
  }
}
