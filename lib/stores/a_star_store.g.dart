// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'a_star_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AStarStore on _AStarStoreBase, Store {
  Computed<bool>? _$isPlayingComputed;

  @override
  bool get isPlaying =>
      (_$isPlayingComputed ??= Computed<bool>(() => super.isPlaying,
              name: '_AStarStoreBase.isPlaying'))
          .value;
  Computed<String>? _$heuristicComputed;

  @override
  String get heuristic =>
      (_$heuristicComputed ??= Computed<String>(() => super.heuristic,
              name: '_AStarStoreBase.heuristic'))
          .value;
  Computed<Player>? _$playerComputed;

  @override
  Player get player => (_$playerComputed ??=
          Computed<Player>(() => super.player, name: '_AStarStoreBase.player'))
      .value;
  Computed<int>? _$fieldHeightComputed;

  @override
  int get fieldHeight =>
      (_$fieldHeightComputed ??= Computed<int>(() => super.fieldHeight,
              name: '_AStarStoreBase.fieldHeight'))
          .value;
  Computed<int>? _$fieldWidthComputed;

  @override
  int get fieldWidth =>
      (_$fieldWidthComputed ??= Computed<int>(() => super.fieldWidth,
              name: '_AStarStoreBase.fieldWidth'))
          .value;
  Computed<bool>? _$isWallModeComputed;

  @override
  bool get isWallMode =>
      (_$isWallModeComputed ??= Computed<bool>(() => super.isWallMode,
              name: '_AStarStoreBase.isWallMode'))
          .value;
  Computed<Map<(int, int), bool>>? _$wallsComputed;

  @override
  Map<(int, int), bool> get walls =>
      (_$wallsComputed ??= Computed<Map<(int, int), bool>>(() => super.walls,
              name: '_AStarStoreBase.walls'))
          .value;
  Computed<String?>? _$selectedEnemyComputed;

  @override
  String? get selectedEnemy =>
      (_$selectedEnemyComputed ??= Computed<String?>(() => super.selectedEnemy,
              name: '_AStarStoreBase.selectedEnemy'))
          .value;
  Computed<Map<String, Enemy>>? _$enemiesComputed;

  @override
  Map<String, Enemy> get enemies =>
      (_$enemiesComputed ??= Computed<Map<String, Enemy>>(() => super.enemies,
              name: '_AStarStoreBase.enemies'))
          .value;

  late final _$_isPlayingAtom =
      Atom(name: '_AStarStoreBase._isPlaying', context: context);

  @override
  bool get _isPlaying {
    _$_isPlayingAtom.reportRead();
    return super._isPlaying;
  }

  @override
  set _isPlaying(bool value) {
    _$_isPlayingAtom.reportWrite(value, super._isPlaying, () {
      super._isPlaying = value;
    });
  }

  late final _$_heuristicAtom =
      Atom(name: '_AStarStoreBase._heuristic', context: context);

  @override
  String get _heuristic {
    _$_heuristicAtom.reportRead();
    return super._heuristic;
  }

  @override
  set _heuristic(String value) {
    _$_heuristicAtom.reportWrite(value, super._heuristic, () {
      super._heuristic = value;
    });
  }

  late final _$_playerAtom =
      Atom(name: '_AStarStoreBase._player', context: context);

  @override
  Player get _player {
    _$_playerAtom.reportRead();
    return super._player;
  }

  @override
  set _player(Player value) {
    _$_playerAtom.reportWrite(value, super._player, () {
      super._player = value;
    });
  }

  late final _$_fieldHeightAtom =
      Atom(name: '_AStarStoreBase._fieldHeight', context: context);

  @override
  int get _fieldHeight {
    _$_fieldHeightAtom.reportRead();
    return super._fieldHeight;
  }

  @override
  set _fieldHeight(int value) {
    _$_fieldHeightAtom.reportWrite(value, super._fieldHeight, () {
      super._fieldHeight = value;
    });
  }

  late final _$_fieldWidthAtom =
      Atom(name: '_AStarStoreBase._fieldWidth', context: context);

  @override
  int get _fieldWidth {
    _$_fieldWidthAtom.reportRead();
    return super._fieldWidth;
  }

  @override
  set _fieldWidth(int value) {
    _$_fieldWidthAtom.reportWrite(value, super._fieldWidth, () {
      super._fieldWidth = value;
    });
  }

  late final _$_isWallModeAtom =
      Atom(name: '_AStarStoreBase._isWallMode', context: context);

  @override
  bool get _isWallMode {
    _$_isWallModeAtom.reportRead();
    return super._isWallMode;
  }

  @override
  set _isWallMode(bool value) {
    _$_isWallModeAtom.reportWrite(value, super._isWallMode, () {
      super._isWallMode = value;
    });
  }

  late final _$_wallsAtom =
      Atom(name: '_AStarStoreBase._walls', context: context);

  @override
  Map<(int, int), bool> get _walls {
    _$_wallsAtom.reportRead();
    return super._walls;
  }

  @override
  set _walls(Map<(int, int), bool> value) {
    _$_wallsAtom.reportWrite(value, super._walls, () {
      super._walls = value;
    });
  }

  late final _$_selectedEnemyAtom =
      Atom(name: '_AStarStoreBase._selectedEnemy', context: context);

  @override
  String? get _selectedEnemy {
    _$_selectedEnemyAtom.reportRead();
    return super._selectedEnemy;
  }

  @override
  set _selectedEnemy(String? value) {
    _$_selectedEnemyAtom.reportWrite(value, super._selectedEnemy, () {
      super._selectedEnemy = value;
    });
  }

  late final _$_enemiesAtom =
      Atom(name: '_AStarStoreBase._enemies', context: context);

  @override
  Map<String, Enemy> get _enemies {
    _$_enemiesAtom.reportRead();
    return super._enemies;
  }

  @override
  set _enemies(Map<String, Enemy> value) {
    _$_enemiesAtom.reportWrite(value, super._enemies, () {
      super._enemies = value;
    });
  }

  late final _$_AStarStoreBaseActionController =
      ActionController(name: '_AStarStoreBase', context: context);

  @override
  void setIsPlaying(bool value) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase.setIsPlaying');
    try {
      return super.setIsPlaying(value);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHeuristic(String value) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase.setHeuristic');
    try {
      return super.setHeuristic(value);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setPlayer(Player value) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase._setPlayer');
    try {
      return super._setPlayer(value);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFieldHeight(int value) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase.setFieldHeight');
    try {
      return super.setFieldHeight(value);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFieldWidth(int value) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase.setFieldWidth');
    try {
      return super.setFieldWidth(value);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsWallMode(bool value) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase.setIsWallMode');
    try {
      return super.setIsWallMode(value);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleWall((int, int) coords) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase.toggleWall');
    try {
      return super.toggleWall(coords);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedEnemy(String? enemyId) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase.setSelectedEnemy');
    try {
      return super.setSelectedEnemy(enemyId);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Enemy? spawnEnemyAt((int, int) coords) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase.spawnEnemyAt');
    try {
      return super.spawnEnemyAt(coords);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeEnemyAt(String enemyId) {
    final _$actionInfo = _$_AStarStoreBaseActionController.startAction(
        name: '_AStarStoreBase.removeEnemyAt');
    try {
      return super.removeEnemyAt(enemyId);
    } finally {
      _$_AStarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
heuristic: ${heuristic},
player: ${player},
fieldHeight: ${fieldHeight},
fieldWidth: ${fieldWidth},
isWallMode: ${isWallMode},
walls: ${walls},
selectedEnemy: ${selectedEnemy},
enemies: ${enemies}
    ''';
  }
}
