import 'package:flutter/material.dart';
import 'package:jpsf_msc/models/npc.dart';
import 'package:jpsf_msc/models/path_finder_node.dart';
import 'package:jpsf_msc/models/path_finder_result.dart';
import 'package:jpsf_msc/models/player.dart';

class Enemy extends Npc {
  Enemy({
    required super.name,
    required super.coordinates,
    required this.target,
    required this.walls,
    required this.boundaries,
  });

  final Player target;
  final Map<(int, int), bool> walls;
  final (int x, int y) boundaries;

  dynamic manhattanDistance(
    (int, int) x,
    (int, int) y,
  ) {}

  // This algorythm is not naive, it prunes already visited paths
  // It will return the leaf node (target place), if a path was found
  // a list of visited nodes
  // a list of to visit nodes that weren't visited
  PathFinderResult? get aStar {
    try {
      final start = coordinates;
      final goal = target.coordinates;
      List<PathFinderNode> toVisit = [PathFinderNode(coordinates: start)];
      List<PathFinderNode> visited = [];
      PathFinderNode? result;
      while (toVisit.first.coordinates != goal) {
        if (toVisit.isEmpty) {
          debugPrint('No path found!');
          break;
        }
        if (toVisit.first.coordinates == goal) {
          debugPrint('path found!');
          break;
        }
        final current = toVisit.first;
        final adjacents = _findAdjacents(current);
        // Prune already visited and in to visit list
        adjacents.removeWhere(
          (adjacent) =>
              visited.any(
                  (visited) => adjacent.coordinates == visited.coordinates) ||
              toVisit.any(
                  (visited) => adjacent.coordinates == visited.coordinates),
        );
        toVisit.addAll(adjacents);
        visited.add(toVisit.first);
        toVisit.removeAt(0);
        // if next to visit is the goal, this while won't run, so...
        // set it as the result
        if (toVisit.firstOrNull?.coordinates == goal) {
          result = toVisit.first;
        }
      }
      return PathFinderResult(
        goalLeaf: result,
        toVisit: toVisit,
        visited: visited,
      );
    } catch (e) {
      print('Error calculating path => $e');
    }
    return null;
  }

  List<PathFinderNode> _findAdjacents(PathFinderNode central) {
    // Aonde X é o central node
    // [
    //  1 2 3
    //  4 X 6
    //  7 8 9
    // ]
    final result = <PathFinderNode>[];
    // Olha 4
    if (central.coordinates.$1 > 0) {
      result.add(
        PathFinderNode(
          coordinates: (central.coordinates.$1 - 1, central.coordinates.$2),
          parent: central,
        ),
      );
    }
    // Olha 6
    if (central.coordinates.$1 < boundaries.$1) {
      result.add(
        PathFinderNode(
          coordinates: (central.coordinates.$1 + 1, central.coordinates.$2),
          parent: central,
        ),
      );
    }
    // Olha 2
    if (central.coordinates.$2 > 0) {
      result.add(
        PathFinderNode(
          coordinates: (central.coordinates.$1, central.coordinates.$2 - 1),
          parent: central,
        ),
      );
    }
    // Olha 8
    if (central.coordinates.$2 < boundaries.$2) {
      result.add(
        PathFinderNode(
          coordinates: (central.coordinates.$1 + 1, central.coordinates.$2 + 1),
          parent: central,
        ),
      );
    }
    return result;
  }
}
