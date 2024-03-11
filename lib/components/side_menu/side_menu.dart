import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('EES'),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            context.pushNamed('/');
          },
        ),
        ListTile(
          title: const Text('A*'),
          onTap: () {
            context.pushNamed('a-star');
          },
        ),
      ],
    );
  }
}
