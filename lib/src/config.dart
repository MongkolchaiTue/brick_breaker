import 'package:flutter/material.dart'; // Add this import

const brickColors = [
  // Add this const
  Color(0xfff94144),
  Color(0xfff3722c),
  Color(0xfff8961e),
  Color(0xfff9844a),
  Color(0xfff9c74f),
  Color(0xff90be6d),
  Color(0xff43aa8b),
  Color(0xff4d908e),
  Color(0xff277da1),
  Color(0xff577590),
  Color(0x9ff94144),
  Color(0x8ff3722c),
  Color(0x7ff8961e),
  Color(0x6ff9844a),
  Color(0x5ff9c74f),
  Color(0x4f90be6d),
  Color(0x3f43aa8b),
  Color(0x2f4d908e),
  Color(0x1f277da1),
  Color(0x0f577590),
  Color(0xff994144),
  Color(0xf8f3722c),
  Color(0xf7f8961e),
  Color(0xf6f9844a),
  Color(0xf5f9c74f),
  Color(0xf490be6d),
  Color(0xf343aa8b),
  Color(0xf24d908e),
  Color(0xf1277da1),
  Color(0xf0577590),
  Color(0xf0571590),
];

const gameWidth = 820.0;
const gameHeight = 1600.0;
const ballRadius = gameWidth * 0.02;
const batWidth = gameWidth * 0.2;
const batHeight = ballRadius * 2;
const batStep = gameWidth * 0.05;
const brickGutter = gameWidth * 0.015; // Add from here...
final brickWidth =
    (gameWidth - (brickGutter * (brickColors.length + 1))) / brickColors.length;
const brickHeight = gameHeight * 0.03;
const difficultyModifier = 1.03;                                // To here.