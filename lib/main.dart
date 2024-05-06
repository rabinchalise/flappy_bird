import 'package:flame/game.dart';
import 'package:flappy_bird/screens/game_over_screen.dart';
import 'package:flappy_bird/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game/flappy_bird_game.dart';

final game = FlappyBirdGame();
Widget gameWidget = GameWidget(game: game, initialActiveOverlays: const [
  MainScreen.id
], overlayBuilderMap: {
  'mainMenu': (context, _) => MainScreen(game: game),
  'gameOver': (context, _) => GameOverScreen(game: game)
});
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(gameWidget);
}
