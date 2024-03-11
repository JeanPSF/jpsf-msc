import 'package:flutter/material.dart';
import 'package:jpsf_msc/components/side_menu/side_menu.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.content,
    this.title = '',
    super.key,
  });

  final Widget content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const Drawer(child: SideMenu()),
      body: content,
    );
  }
}
