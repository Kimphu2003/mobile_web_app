import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildLocationCard(
                  context,
                  imageUrl: 'assets/images/pic3.png',
                  title: '0 - พระราชวังเอกราช',
                  color: themeRed,
                ),
                const SizedBox(height: 16),
                _buildLocationCard(
                  context,
                  imageUrl: 'assets/images/pic4.png',
                  title: '1 - อาคารนิทรรศการ',
                  color: themeRed,
                ),
                const SizedBox(height: 16),
                _buildLocationCard(
                  context,
                  imageUrl: 'assets/images/pic5.png',
                  title: '2 - อาคารนิทรรศการ',
                  color: themeRed,
                ),
                const SizedBox(height: 16),
                _buildLocationCard(
                  context,
                  imageUrl: 'assets/images/pic6.png',
                  title: '3 - อาคารนิทรรศการ',
                  color: themeRed,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Reusable responsive widget for the image cards
  Widget _buildLocationCard(
      BuildContext context, {
        required String imageUrl,
        required String title,
        required Color color,
      }) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // Define a height based on screen size so it never grows too large
    double cardHeight = MediaQuery.of(context).size.height * 0.25;

    return SizedBox(
      height: cardHeight, // Strictly control the total height of the card
      // margin: EdgeInsets.symmetric(
      //     vertical: screenWidth * 0.02,
      //     horizontal: screenWidth * 0.04
      // ),
      width: double.infinity,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              // 1. Image takes up 60% of the card height
              Expanded(
                flex: 2,
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // 2. Red Banner takes up 40% (or fits text)
              SizedBox(
                height: cardHeight * 0.25,
                child: Container(
                  color: color,
                  width: double.infinity,
                  padding: EdgeInsets.all(6),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
