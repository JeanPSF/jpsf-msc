import 'package:flutter/material.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_controller.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_ctrls.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_maze.dart';
import 'package:provider/provider.dart';

class AStar extends StatefulWidget {
  const AStar({super.key});

  @override
  State<AStar> createState() => _AStarState();
}

class _AStarState extends State<AStar> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AStarController(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AStarCtrls(),
          Divider(height: 1),
          AStarMaze(),
        ],
      ),
    );
  }
}
