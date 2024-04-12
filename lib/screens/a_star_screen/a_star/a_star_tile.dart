import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jpsf_msc/stores/a_star_store.dart';

final aStarStore = Modular.get<AStarStore>();

class AStarTile extends StatefulWidget {
  const AStarTile({
    required this.tileCoordinates,
    super.key,
  });

  final (int, int) tileCoordinates;

  @override
  State<AStarTile> createState() => _AStarTileState();
}

class _AStarTileState extends State<AStarTile>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Color?>? _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _colorAnimation = ColorTween(begin: Colors.white, end: Colors.green)
        .animate(_animationController!);
    _animationController?.forward();
  }

  @override
  void didUpdateWidget(AStarTile oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final selectedEnemy = aStarStore.enemies[aStarStore.selectedEnemy];
      bool isToVisit = false;
      if (selectedEnemy != null) {
        isToVisit = selectedEnemy.aStar?.toVisit
                .where((e) => e.coordinates == widget.tileCoordinates)
                .isNotEmpty ??
            false;
      }
      bool isVisited = false;
      if (selectedEnemy != null) {
        isVisited = selectedEnemy.aStar?.visited
                .where((e) => e.coordinates == widget.tileCoordinates)
                .isNotEmpty ??
            false;
      }
      final color = aStarStore.hasWall(widget.tileCoordinates)
          ? Colors.black87
          : aStarStore.hasEnemy(widget.tileCoordinates)
              ? Colors.redAccent
              : aStarStore.hasPlayer(widget.tileCoordinates)
                  ? Colors.orangeAccent
                  : isToVisit
                      ? Colors.deepPurple
                      : isVisited
                          ? Colors.blue
                          : const Color.fromRGBO(179, 235, 231, 1);
      return GestureDetector(
        onTap: aStarStore.isWallMode
            ? () {
                aStarStore.toggleWall(widget.tileCoordinates);
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
