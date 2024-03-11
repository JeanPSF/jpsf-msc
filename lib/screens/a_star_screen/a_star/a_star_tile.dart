import 'package:flutter/material.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_controller.dart';
import 'package:provider/provider.dart';

class AStarTile extends StatelessWidget {
  const AStarTile({
    required this.tileCoordinates,
    super.key,
  });

  final (int, int) tileCoordinates;

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<AStarController>(context);
    final color = ctrl.hasWall(tileCoordinates)
        ? Colors.black87
        : ctrl.hasEnemy(tileCoordinates)
            ? Colors.redAccent
            : ctrl.hasPlayer(tileCoordinates)
                ? Colors.orangeAccent
                : const Color.fromRGBO(179, 235, 231, 1);

    return GestureDetector(
      onTap: ctrl.isWallMode
          ? () {
              ctrl.toggleWall(tileCoordinates);
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
  }
}
