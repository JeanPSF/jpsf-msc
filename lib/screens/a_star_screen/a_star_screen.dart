import 'package:flutter/material.dart';
import 'package:jpsf_msc/components/app_scaffold/app_scaffold.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star.dart';

class AStarScreen extends StatefulWidget {
  const AStarScreen({super.key});

  @override
  State<AStarScreen> createState() => _AStarScreenState();
}

class _AStarScreenState extends State<AStarScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'A*',
      content: AStar(),
    );
  }
}
