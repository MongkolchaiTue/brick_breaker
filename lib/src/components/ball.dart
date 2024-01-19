import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';
import 'bat.dart';
import 'brick.dart';
import 'play_area.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<BrickBreaker> {
  Ball({
    Color color = const Color(0xff1e6091),
    required this.velocity,
    required super.position,
    required double radius,
    required this.difficultyModifier,
  }) : super(
            radius: radius,
            anchor: Anchor.center,
            paint: Paint()
              ..color = color
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]);

  final Vector2 velocity;
  final double difficultyModifier;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (position.x < 0) {
      position.x = radius * dt;
    } else if (position.x > game.width) {
      position.x = game.width - radius * dt;
    }

    if (position.y <= 0) {
      position.y = radius * dt;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayArea) {
      if (intersectionPoints.first.x <= 0 ||
          intersectionPoints.first.x >= game.width) velocity.x = -velocity.x;

      if (intersectionPoints.first.y <= 0) {
        velocity.y = -velocity.y;
      } else if (intersectionPoints.first.y >= game.height) {
        add(RemoveEffect(
            delay: 0.35,
            onComplete: () {
              // Modify from here
              game.ballcount.value--;
              game.scoreTotal.value =
                  game.score.value + game.ballcount.value * 15;
              if (game.ballcount.value < 1) game.playState = PlayState.gameOver;
            })); // To here.
      }
    } else if (other is Bat) {
      velocity.y = -velocity.y;
      velocity.x = velocity.x +
          (position.x - other.position.x) / other.size.x * game.width * 0.3;
    } else if (other is Ball) {
      velocity.y = velocity.y +
          (position.y - other.position.y) / other.size.y * game.height * 0.5;
      velocity.x = velocity.x +
          (position.x - other.position.x) / other.size.x * game.width * 0.4;
    } else if (other is Brick) {
      if (position.y < other.position.y - other.size.y / 2) {
        velocity.y = -velocity.y;
      } else if (position.y > other.position.y + other.size.y / 2) {
        velocity.y = -velocity.y;
      } else if (position.x < other.position.x) {
        velocity.x = -velocity.x;
      } else if (position.x > other.position.x) {
        velocity.x = -velocity.x;
      }
      velocity.setFrom(velocity * difficultyModifier);
    }
  }
}
