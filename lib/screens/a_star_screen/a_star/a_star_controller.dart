import 'package:flutter/foundation.dart';
import 'package:jpsf_msc/models/enemy.dart';
import 'package:jpsf_msc/models/player.dart';

class AStarController with ChangeNotifier {
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  void setIsPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  final Player _player = Player(name: 'Saguiro', coordinates: (10, 10));
  Player get player => _player;

  int _fieldHeight = 21;
  int get fieldHeight => _fieldHeight;
  void setFieldHeight(int value) {
    _fieldHeight = value;
    notifyListeners();
  }

  int _fieldWidth = 21;
  int get fieldWidth => _fieldWidth;
  void setFieldWidth(int value) {
    _fieldWidth = value;
    notifyListeners();
  }

  // This allow users to create walls by clicking the tiles
  bool _isWallMode = false;
  bool get isWallMode => _isWallMode;
  void setIsWallMode(bool value) {
    _isWallMode = value;
    notifyListeners();
  }

  final Map<(int, int), bool> _walls = {};
  Map<(int, int), bool> get walls => _walls;
  void toggleWall((int, int) coords) {
    if (hasPlayer(coords) || hasEnemy(coords)) {
      return;
    }
    _walls.update(
      coords,
      (value) => !value,
      ifAbsent: () => true,
    );
    notifyListeners();
  }

  final Map<String, Enemy> _enemies = {};
  Map<String, Enemy> get enemies => _enemies;
  Enemy? spawnEnemyAt((int, int) coords) {
    if (hasPlayer(coords) || hasWall(coords)) {
      return null;
    }
    final aux = Enemy(name: 'Zombie', coordinates: coords);
    final spawned = _enemies.putIfAbsent(aux.id, () => aux);
    notifyListeners();
    return spawned;
  }

  void removeEnemyAt(String enemyId) {
    _enemies.remove(enemyId);
    notifyListeners();
  }

  bool hasPlayer((int, int) coords) {
    return player.coordinates == coords;
  }

  bool hasWall((int, int) coords) {
    return walls.containsKey(coords) && walls[coords] == true;
  }

  bool hasEnemy((int, int) coords) {
    return enemies.entries.any((e) => e.value.coordinates == coords);
  }
}
