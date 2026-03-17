import 'package:flutter/material.dart';
import 'package:mobile_web_app/shell/phone_view_port.dart';

class WebShell extends StatelessWidget {
  const WebShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// background
        Positioned.fill(
          child: Image.asset(
            "assets/images/bg.png",
            fit: BoxFit.cover,
          ),
        ),

        /// phone viewport
        const Center(
          child: PhoneViewport(),
        ),
      ],
    );
  }
}
