import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jpsf_msc/components/action_on_coordinates/action_on_coordinates.dart';
import 'package:jpsf_msc/stores/a_star_store.dart';

final aStarStore = Modular.get<AStarStore>();

class AStarCtrls extends StatelessWidget {
  const AStarCtrls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(builder: (_) {
                return Text('Player: ${aStarStore.player.coordinates}');
              }),
              Observer(builder: (_) {
                return Text(
                    'Board: ${aStarStore.fieldWidth} x ${aStarStore.fieldHeight}');
              }),
              Observer(builder: (_) {
                return Text('Enemies: ${aStarStore.enemies.length}');
              }),
              Observer(builder: (_) {
                return Text('Walls: ${aStarStore.walls.length}');
              }),
              Observer(builder: (_) {
                return CheckboxListTile(
                  title: const Text("Wall Mode"),
                  value: aStarStore.isWallMode,
                  onChanged: (newValue) {
                    aStarStore.setIsWallMode(newValue ?? false);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              })
            ],
          ),
        ),
        Observer(builder: (_) {
          return Expanded(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    final keys = (aStarStore.enemies.keys);
                    print(
                        '${aStarStore.enemies[keys.first]?.aStar.toString()}');
                  },
                  child: const Text('Test'),
                ),
                ...(aStarStore.enemies.keys).map(
                  (key) => CheckboxListTile(
                    title: Text("${aStarStore.enemies[key]?.coordinates}"),
                    value: aStarStore.selectedEnemy == key,
                    onChanged: (newValue) {
                      aStarStore.setSelectedEnemy(key);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ],
            ),
          );
        }),
        Expanded(
          child: ActionOnCoordinates(
            label: 'Add Enemy:',
            onPress: (coords) {
              aStarStore.spawnEnemyAt(coords);
            },
          ),
        ),
      ],
    );
  }
}
