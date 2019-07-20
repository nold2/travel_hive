import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


final videoPlayerController = VideoPlayerController.asset(
  'videos/Blueball.mp4'
);

class PlayerWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final double aspectRatio;

  PlayerWidget({
     @required this.videoPlayerController,
    this.looping,
    this.aspectRatio,
    Key key,
  }) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget>{
  ChewieController _controller;

  @override
  void initState(){
    super.initState();

    _controller = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: widget.aspectRatio,
      autoInitialize: true,
      looping: widget.looping,
      autoPlay: true,
      showControls: false,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      errorBuilder: (context, error){
        return Center(
          child: Text(
            error,
            style: TextStyle(color: Colors.red),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      child: Chewie(
        controller: _controller,
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController.dispose();
    _controller.dispose();
  }
}