import 'package:travel_hive/chewie_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final double aspectRatio = queryData.size.width / queryData.size.height;

    Expanded customButton(String label, IconData icon, Color color, Color buttonColor){
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(8),
          child: RaisedButton(
            onPressed: (){},
            color: buttonColor,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icon, color: color),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(label, style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: color
                  )),
                )
              ],
            ),
          ),
        )
      );
    }

    return Stack(
        children: <Widget>[
          PlayerWidget(
            videoPlayerController: VideoPlayerController.asset('videos/Blueball.mp4'),
            looping: true,
            aspectRatio: aspectRatio,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 1.0,
            child: Container(
              height: 120,
              child: Column(
                children: <Widget>[
                  customButton('Sign In', Icons.people, Colors.black, Colors.white),
                  customButton('Sign Up', Icons.people, Colors.white, Colors.black),
                ],
              ),
            ),
          )
        ],
    );
  }
}
