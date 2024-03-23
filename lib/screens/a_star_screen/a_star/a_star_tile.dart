import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jpsf_msc/models/path_finder_node.dart';
import 'package:jpsf_msc/stores/a_star_store.dart';

final aStarStore = Modular.get<AStarStore>();

class AStarTile extends StatelessWidget {
  const AStarTile({
    required this.tileCoordinates,
    super.key,
  });

  final (int, int) tileCoordinates;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final selectedEnemy = aStarStore.enemies[aStarStore.selectedEnemy];
      final hasSelectedEnemy = selectedEnemy == null ? false : true;
      final path = <(int, int)>[];
      if (hasSelectedEnemy) {
        PathFinderNode? node = selectedEnemy.aStar.goalLeaf;
        while (node != null) {
          path.add(node.coordinates);
          node = selectedEnemy.aStar.goalLeaf?.parent;
        }
      }
      final color = aStarStore.hasWall(tileCoordinates)
          ? Colors.black87
          : aStarStore.hasEnemy(tileCoordinates)
              ? Colors.redAccent
              : aStarStore.hasPlayer(tileCoordinates)
                  ? Colors.orangeAccent
                  : path.contains(tileCoordinates)
                      ? Colors.deepPurple
                      : const Color.fromRGBO(179, 235, 231, 1);
      return GestureDetector(
        onTap: aStarStore.isWallMode
            ? () {
                aStarStore.toggleWall(tileCoordinates);
              }
            : null,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: color,
          ),
          child: const Center(
            child: Text(''),
          ),
        ),
      );
    });
  }
}
