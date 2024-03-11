import 'package:uuid/uuid.dart';

class Npc {
  Npc({
    required this.name,
    required this.coordinates,
  }) : _id = const Uuid().v4();

  final String _id;
  String get id => _id;
  String name;
  (int, int) coordinates;
}
