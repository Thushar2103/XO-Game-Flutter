import 'package:flutter/material.dart';
import 'package:xo_game/screens/aigamescreen.dart';
import 'package:xo_game/screens/gamescreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XO Game'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('One Vs AI'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AIXOGamePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Local One vs One'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const XOGamePage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
