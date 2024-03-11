import 'package:flutter/material.dart';
import 'package:jpsf_msc/components/app_scaffold/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Home',
      content: Text('Home'),
    );
  }
}
