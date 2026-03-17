import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_web_app/core/router/route_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/home_bg.png", fit: BoxFit.cover),
          ),
          Center(
            child: IconButton(
              onPressed: () => context.go(Routes.landmarkDetail),
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.brown.shade600,
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
