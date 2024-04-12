import 'package:flutter/material.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_ctrls.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star/a_star_maze.dart';

class AStar extends StatefulWidget {
  const AStar({super.key});

  @override
  State<AStar> createState() => _AStarState();
}

class _AStarState extends State<AStar> {
  late DateTime _startTime;
  Duration? _initializationDuration;
  bool isThirdWidgetRendered = false;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final endTime = DateTime.now();
      setState(() {
        _initializationDuration = endTime.difference(_startTime);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${_initializationDuration?.inMilliseconds}'),
        const AStarCtrls(),
        const Divider(height: 1),
        isThirdWidgetRendered
            ? const Center(child: AStarMaze())
            : FutureBuilder(
                future: Future.delayed(Duration.zero),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        isThirdWidgetRendered = true;
                      });
                    });
                    return const Center(
                      child: Text('Loading...'),
                    );
                  }
                  return Container();
                },
              ),
      ],
    );
  }
}
