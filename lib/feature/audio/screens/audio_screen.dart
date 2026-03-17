import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:go_router/go_router.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _player = AudioPlayer();

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    await _player.setAsset('assets/audio/audio.mp3');

    _duration = _player.duration ?? Duration.zero;

    _player.positionStream.listen((pos) {
      setState(() => _position = pos);
    });

    _player.durationStream.listen((dur) {
      setState(() => _duration = dur ?? Duration.zero);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        title: const Text(
          "00-ประวัติพระราชวังเอกสาร",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),

      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          /// IMAGE
          Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                'assets/images/dinh_doc_lap.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Spacer(),

          /// PLAYER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    /// Play Button
                    GestureDetector(
                      onTap: () {
                        if (_player.playing) {
                          _player.pause();
                        } else {
                          _player.play();
                        }
                        setState(() {});
                      },
                      child: Icon(
                        _player.playing
                            ? Icons.pause_circle
                            : Icons.play_circle,
                        size: 40,
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// Time
                    Text(_format(_position)),

                    /// Slider
                    Expanded(
                      child: Slider(
                        activeColor: Colors.black,
                        thumbColor: Colors.black,
                        value: _position.inSeconds.toDouble().clamp(
                          0,
                          _duration.inSeconds.toDouble(),
                        ),
                        max: _duration.inSeconds.toDouble() == 0
                            ? 1
                            : _duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          _player.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),

                    /// Duration
                    Text(_format(_duration)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _format(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}