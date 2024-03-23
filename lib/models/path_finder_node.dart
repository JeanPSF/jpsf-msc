class PathFinderNode {
  PathFinderNode({
    required this.coordinates,
    this.parent,
  });

  (int x, int y) coordinates;

  PathFinderNode? parent;
}
