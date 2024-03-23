import 'package:flutter_modular/flutter_modular.dart';
import 'package:jpsf_msc/stores/a_star_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AStarStore.new);
  }
}
