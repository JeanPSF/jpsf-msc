import 'package:jpsf_msc/models/path_finder_node.dart';

class PathFinderResult {
  PathFinderResult({
    this.visited = const [],
    this.toVisit = const [],
    this.goalLeaf,
  });

  List<PathFinderNode> visited;
  List<PathFinderNode> toVisit;
  PathFinderNode? goalLeaf;
}
