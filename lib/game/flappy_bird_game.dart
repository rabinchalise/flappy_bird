import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_group.dart';

import 'package:flappy_bird/game/configuration.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Birds birds;
  late TextComponent score;
  bool isHit = false;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  @override
  FutureOr<void> onLoad() async {
    addAll([
      BackGround(),
      Ground(),
      birds = Birds(),
      PipeGroup(),
      score = buildScore()
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
        text: 'Score: 0',
        position: Vector2(
          size.x / 2,
          size.y / 2 * 0.2,
        ),
        anchor: Anchor.center,
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 40, fontFamily: 'Game')));
  }

  @override
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
    score.text = 'Score: ${birds.score}';
  }

  @override
  void onTap() {
    birds.fly();
    super.onTap();
  }
}
