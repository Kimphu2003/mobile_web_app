import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/floor_map.dart';
import '../widgets/map_node_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int selectedFloorIndex = 0;

  // Calculate actual image rect after BoxFit.contain scaling
  Rect _getImageRect(Size containerSize, Size imageSize) {
    final containerRatio = containerSize.width / containerSize.height;
    final imageRatio = imageSize.width / imageSize.height;

    double renderedWidth, renderedHeight;
    if (imageRatio > containerRatio) {
      // Image wider than container — fit by width
      renderedWidth = containerSize.width;
      renderedHeight = containerSize.width / imageRatio;
    } else {
      // Image taller than container — fit by height
      renderedHeight = containerSize.height;
      renderedWidth = containerSize.height * imageRatio;
    }

    final offsetX = (containerSize.width - renderedWidth) / 2;
    final offsetY = (containerSize.height - renderedHeight) / 2;

    return Rect.fromLTWH(offsetX, offsetY, renderedWidth, renderedHeight);
  }

  @override
  Widget build(BuildContext context) {
    final floor = floors[selectedFloorIndex];

    return Scaffold(
      body: Column(
        children: [
          /// MAP VIEW
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final containerSize = Size(
                  constraints.maxWidth,
                  constraints.maxHeight,
                );

                // Use actual image dimensions from your assets
                // Replace with real dimensions per floor if they differ
                final imageSize = Size(
                  floor.imageWidth.toDouble(),   // add this to your Floor model
                  floor.imageHeight.toDouble(),  // add this to your Floor model
                );

                final imageRect = _getImageRect(containerSize, imageSize);

                return InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 5.0,
                  boundaryMargin: const EdgeInsets.all(80),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Stack(
                      children: [
                        /// MAP IMAGE — contained in center
                        Positioned.fill(
                          child: Image.asset(
                            floor.asset,
                            fit: BoxFit.contain,
                          ),
                        ),

                        /// NODES — positioned relative to actual image rect
                        ...floor.nodes.map((node) {
                          // node.x and node.y are 0.0–1.0 fractions
                          // of the IMAGE (not the container)
                          final left = imageRect.left +
                              node.x * imageRect.width -
                              20; // half of node widget width
                          final top = imageRect.top +
                              node.y * imageRect.height -
                              20; // half of node widget height

                          return Positioned(
                            left: left,
                            top: top,
                            child: MapNodeWidget(
                              label: node.id,
                              onTap: () => context.push('/audio'),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// FLOOR SELECTOR
          Container(
            color: Colors.black,
            height: 64,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: floors.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedFloorIndex;
                return GestureDetector(
                  onTap: () => setState(() => selectedFloorIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 72,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected
                              ? Colors.white
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map_outlined,
                          size: 20,
                          color: isSelected
                              ? Colors.white
                              : Colors.white54,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          floors[index].id,
                          style: TextStyle(
                            fontSize: 11,
                            color: isSelected
                                ? Colors.white
                                : Colors.white54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
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
