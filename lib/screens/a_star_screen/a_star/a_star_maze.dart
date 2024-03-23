import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_tile.dart';
import 'package:jpsf_msc/stores/a_star_store.dart';

final aStarStore = Modular.get<AStarStore>();

class AStarMaze extends StatelessWidget {
  const AStarMaze({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: List.generate(aStarStore.fieldHeight, (i) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: (aStarStore.fieldHeight - 1) != i ? 1.0 : 0.0),
            child: Row(
              children: List.generate(aStarStore.fieldWidth, (j) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: (aStarStore.fieldWidth - 1) != j ? 1.0 : 0.0),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: AStarTile(tileCoordinates: (i, j)),
                  ),
                );
              }),
            ),
          );
        }),
      );
    });
  }
}
