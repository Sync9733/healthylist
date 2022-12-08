import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthylist/auth/video_info.dart';
import 'package:healthylist/colors/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:video_player/video_player.dart';

class VideoplayerPage extends StatefulWidget {
  const VideoplayerPage({super.key});

  @override
  State<VideoplayerPage> createState() => _VideoplayerPageState();
}

class _VideoplayerPageState extends State<VideoplayerPage> {
  late VideoPlayerController _controller;
  int _currentIndex = 0;

  void _playvideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= videos.length) return;

    if (!init) {
      _controller.pause();
    }

    setState(() => _currentIndex = index);

    _controller = VideoPlayerController.network(videos[_currentIndex].url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _controller.play());
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final miniute = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      miniute,
      seconds,
    ].join(':');
  }

  @override
  void initState() {
    super.initState();
    _playvideo(init: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------------------------ Appbar ------------------------------------
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Icon(
                      LineIcons.arrowLeft,
                      size: 22,
                      color: black.withOpacity(0.3),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 135.0),
              child: Text(
                "Video player",
                style: GoogleFonts.getFont('Poppins',
                    fontSize: 16, fontWeight: FontWeight.bold, color: black),
              ),
            ),
          ],
        ),
      ),
      // ------------------------------------ Video Player ------------------------------------
      body: Column(
        children: [
          Container(
            color: primary,
            height: 300,
            child: _controller.value.isInitialized
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        child: VideoPlayer(_controller),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: _controller,
                            builder: (context, VideoPlayerValue value, child) {
                              return Text(
                                _videoDuration(value.position),
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: white,
                                  fontSize: 16,
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 20,
                              child: VideoProgressIndicator(
                                _controller,
                                allowScrubbing: true,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 12,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            _videoDuration(_controller.value.duration),
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 16, color: white),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () => _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play(),
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: white,
                          size: 40,
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: white,
                    ),
                  ),
          ),
          // ------------------------------------ Video List ------------------------------------
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _playvideo(index: index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            videos[index].thumbnail,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          videos[index].name,
                          style: GoogleFonts.getFont('Poppins', fontSize: 16),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
