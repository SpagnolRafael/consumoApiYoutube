// ignore_for_file: must_be_immutable

import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';

class ReprodutorVideo extends StatefulWidget {
  String? videoID;
  ReprodutorVideo(this.videoID, {Key? key}) : super(key: key);
  @override
  _ReprodutorVideoState createState() => _ReprodutorVideoState();
}

class _ReprodutorVideoState extends State<ReprodutorVideo> {
  // ignore: prefer_final_fields
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.videoID!.toString(),
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        useHybridComposition: true,
      ),
    );
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: YoutubePlayerControllerProvider(
                controller: _controller,
                child: YoutubePlayerIFrame(
                  aspectRatio: 16 / 9,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }
}
