import 'package:flutter/material.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_controller.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_tile.dart';
import 'package:provider/provider.dart';

class AStarMaze extends StatelessWidget {
  const AStarMaze({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<AStarController>(context);
    return LayoutBuilder(builder: (ctx, constraints) {
      double screenWidth = constraints.maxWidth;
      // Calculate the width of each cell. Subtract total padding/margin from the screenWidth before dividing by ctrl.fieldWidth.
      // Assume 1.0 as the margin for each side, adjust this value as needed.
      double cellWidth =
          (screenWidth - ((ctrl.fieldWidth - 1) * 1.0)) / ctrl.fieldWidth;

      return Column(
        children: List.generate(ctrl.fieldHeight, (i) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: (ctrl.fieldHeight - 1) != i ? 1.0 : 0.0),
            child: Row(
              children: List.generate(ctrl.fieldWidth, (j) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: (ctrl.fieldWidth - 1) != j ? 1.0 : 0.0),
                  child: SizedBox(
                    width: cellWidth,
                    height: cellWidth,
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
