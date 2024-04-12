import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_tile.dart';
import 'package:jpsf_msc/stores/a_star_store.dart';

final aStarStore = Modular.get<AStarStore>();

class AStarMaze extends StatelessWidget {
  const AStarMaze({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      rowSizes: List.generate(
        aStarStore.fieldWidth,
        (index) => const FixedTrackSize(20),
      ),
      columnSizes: List.generate(
        aStarStore.fieldHeight,
        (index) => const FixedTrackSize(20),
      ),
      columnGap: 4,
      rowGap: 4,
      children: [
        for (int i = 0; i < aStarStore.fieldWidth; i++)
          for (int j = 0; j < aStarStore.fieldHeight; j++)
            AStarTile(tileCoordinates: (i, j))
                .withGridPlacement(columnStart: i, rowStart: j)
      ],
    );
  }
}
