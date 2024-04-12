import 'package:jpsf_msc/models/enemy.dart';
import 'package:jpsf_msc/models/player.dart';
import 'package:mobx/mobx.dart';

part 'a_star_store.g.dart';

class AStarStore extends _AStarStoreBase with _$AStarStore {}

abstract class _AStarStoreBase with Store {
  @observable
  bool _isPlaying = false;
  @computed
  bool get isPlaying => _isPlaying;
  @action
  void setIsPlaying(bool value) {
    _isPlaying = value;
  }

  @observable
  String _heuristic = 'euclidean';
  @computed
  String get heuristic => _heuristic;
  @action
  void setHeuristic(String value) {
    _heuristic = value;
  }

  @observable
  Player _player = Player(name: 'Saguiro', coordinates: (10, 10));
  @computed
  Player get player => _player;
  @action
  void _setPlayer(Player value) => _player = value;

  @observable
  int _fieldHeight = 21;
  @computed
  int get fieldHeight => _fieldHeight;
  @action
  void setFieldHeight(int value) {
    _fieldHeight = value;
  }

  @observable
  int _fieldWidth = 21;
  @computed
  int get fieldWidth => _fieldWidth;
  @action
  void setFieldWidth(int value) {
    _fieldWidth = value;
  }

  // This allow users to create walls by clicking the tiles
  @observable
  bool _isWallMode = false;
  @computed
  bool get isWallMode => _isWallMode;
  @action
  void setIsWallMode(bool value) {
    _isWallMode = value;
  }

  @observable
  Map<(int, int), bool> _walls = {};
  @computed
  Map<(int, int), bool> get walls => _walls;
  @action
  void toggleWall((int, int) coords) {
    if (hasPlayer(coords) || hasEnemy(coords)) {
      return;
    }
    final aux = {..._walls};
    aux.update(
      coords,
      (value) => !value,
      ifAbsent: () => true,
    );
    _walls = aux;
  }

  @observable
  String? _selectedEnemy;
  @computed
  String? get selectedEnemy => _selectedEnemy;
  @action
  void setSelectedEnemy(String enemyId) => _selectedEnemy = enemyId;

  @observable
  Map<String, Enemy> _enemies = {};
  @computed
  Map<String, Enemy> get enemies => _enemies;
  @action
  Enemy? spawnEnemyAt((int, int) coords) {
    if (hasPlayer(coords) || hasWall(coords) || hasEnemy(coords)) {
      return null;
    }
    final enemyAux = Enemy(
      name: 'Zombie',
      coordinates: coords,
      target: player,
      walls: walls,
      boundaries: (_fieldHeight, _fieldWidth),
      heuristic: _heuristic,
    );
    final aux = {..._enemies};
    final spawned = aux.putIfAbsent(enemyAux.id, () => enemyAux);
    _enemies = aux;
    return spawned;
  }

  @action
  void removeEnemyAt(String enemyId) {
    final aux = {..._enemies};
    aux.remove(enemyId);
    _enemies = aux;
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
