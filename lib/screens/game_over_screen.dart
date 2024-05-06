import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key, required this.game});
  static const String id = 'gameOver';
  final FlappyBirdGame game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.birds.score}',
              style: const TextStyle(
                  fontSize: 60, color: Colors.white, fontFamily: 'Game'),
            ),
            const SizedBox(height: 20),
            Image.asset(Assets.gameover),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: const RoundedRectangleBorder()),
                onPressed: onRestart,
                child: const Text('Restart',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white, fontFamily: 'Game')))
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.birds.reset();
    game.overlays.remove(id);
    game.resumeEngine();
  }
}
