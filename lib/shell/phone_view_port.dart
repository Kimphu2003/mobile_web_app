import 'package:flutter/material.dart';
import 'package:mobile_web_app/shell/phone_app.dart';

class PhoneViewport extends StatelessWidget {
  const PhoneViewport({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight * 0.9;

        return Center(
          child: SizedBox(
            height: height,
            child: AspectRatio(
              aspectRatio: 9 / 19.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: PhoneApp(),
              ),
            ),
          ),
        );
      },
    );
  }
}