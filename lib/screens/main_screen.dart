import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';
  const MainScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.menu), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.message),
              const SizedBox(height: 50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: const RoundedRectangleBorder()),
                  onPressed: () {
                    game.overlays.remove(id);
                    game.resumeEngine();
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Game'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
