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

  Widget _buildLocationCard(
      BuildContext context, {
        required String imageUrl,
        required String title,
        required Color color,
      }) {

    double cardHeight = MediaQuery.of(context).size.height * 0.25;

    return SizedBox(
      height: cardHeight,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              // 1. Image
              Expanded(
                flex: 2,
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // 2. Red Banner text
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
