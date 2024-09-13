import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/models/v_tic_tac_toe.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(useMaterial3: true),
    debugShowCheckedModeBanner: false,
    home: const TicTacToePage(),
  ));
}
