import 'package:flutter/material.dart';
import 'package:jpsf_msc/components/action_on_coordinates/action_on_coordinates.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_controller.dart';
import 'package:provider/provider.dart';

class AStarCtrls extends StatelessWidget {
  const AStarCtrls({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<AStarController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Player: ${ctrl.player.coordinates}'),
              Text('Board: ${ctrl.fieldWidth} x ${ctrl.fieldHeight}'),
              Text('Enemies: ${ctrl.enemies.length}'),
              Text('Walls: ${ctrl.walls.length}'),
              CheckboxListTile(
                title: const Text("Wall Mode"),
                value: ctrl.isWallMode,
                onChanged: (newValue) {
                  ctrl.setIsWallMode(newValue ?? false);
                },
                controlAffinity: ListTileControlAffinity.leading,
              )
            ],
          ),
        ),
        Expanded(
          child: ActionOnCoordinates(
            label: 'Add Enemy:',
            onPress: (coords) {
              ctrl.spawnEnemyAt(coords);
            },
          ),
        ),
      ],
    );
  }
}
