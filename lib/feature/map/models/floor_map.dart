
import 'map_node.dart';

class FloorMap {
  final String id;
  final String asset;
  final List<MapNode> nodes;
  final int imageWidth;
  final int imageHeight;

  FloorMap({
    required this.id,
    required this.asset,
    required this.nodes,
    required this.imageWidth,
    required this.imageHeight,
  });
}

final floors = [
  FloorMap(
    id: 'L1',
    asset: 'assets/maps/map_l1.png',
    imageWidth: 1200,
    imageHeight: 800,
    nodes: [
      MapNode(id: '19', x: 0.75, y: 0.3),
      MapNode(id: '35', x: 0.60, y: 0.45),
      MapNode(id: '21', x: 0.68, y: 0.55),
    ],
  ),
  FloorMap(
    id: 'L2',
    asset: 'assets/maps/map_l2.png',
    imageWidth: 1200,
    imageHeight: 900,
    nodes: [
      MapNode(id: '01', x: 0.42, y: 0.38),
      MapNode(id: '02', x: 0.61, y: 0.52),
      MapNode(id: '03', x: 0.78, y: 0.44),
    ],
  ),
  FloorMap(
    id: 'L3',
    asset: 'assets/maps/map_l3.png',
    imageWidth: 1100,
    imageHeight: 750,
    nodes: [
      MapNode(id: '04', x: 0.35, y: 0.50),
      MapNode(id: '05', x: 0.55, y: 0.35),
    ],
  ),
];