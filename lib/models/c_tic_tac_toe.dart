import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/w_tic_tac_toe.dart';
import 'package:get/get.dart';

class TicTacToeController extends GetxController {
  ValueNotifier<bool> turn = ValueNotifier(true);
  ValueNotifier<List<CustomPainter>> painterList = ValueNotifier([]);

  @override
  void onInit() {
    super.onInit();
    put_();
  }

  void put_() {
    for (var i = 0; i < 9; i++) {
      painterList.value.add(EmptyPainter());
    }
  }

  void showSign(int index) {
    if (painterList.value[index].toString().contains("EmptyPainter")) {
      if (turn.value) {
        List<CustomPainter> temp = [...painterList.value];
        temp[index] = CrossPainter();
        painterList.value = temp;
        String cross = "CrossPainter";
        checkWin(cross);
        turn.value = false;
      } else {
        List<CustomPainter> temp = [...painterList.value];
        temp[index] = CirclePainter();
        painterList.value = temp;
        String cross = "CirclePainter";
        checkWin(cross);
        turn.value = true;
      }
    }
  }

  void checkDraw() {
    bool drawww = false;
    for (var element in painterList.value) {
      if (element.toString().contains("EmptyPainter")) {
        drawww = false;
        break;
      } else {
        drawww = true;
      }
    }

    if (drawww) {
      Get.dialog(
          barrierDismissible: false,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Draw",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                    onPressed: () {
                      resetGame();
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.replay,
                      size: 40,
                      color: Colors.white,
                    ))
              ],
            ),
          ));
    }
  }

  void checkWin(String data) {
    if ((check(0, data)) && (check(1, data)) && (check(2, data)) ||
        (check(3, data)) && (check(4, data)) && (check(5, data)) ||
        (check(6, data)) && (check(7, data)) && (check(8, data)) ||
        (check(0, data)) && (check(3, data)) && (check(6, data)) ||
        (check(1, data)) && (check(4, data)) && (check(7, data)) ||
        (check(2, data)) && (check(5, data)) && (check(8, data)) ||
        (check(0, data)) && (check(4, data)) && (check(8, data)) ||
        (check(2, data)) && (check(4, data)) && (check(6, data))) {
      Get.dialog(
          barrierDismissible: false,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data == "CrossPainter" ? "X Win" : "O Win",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                    onPressed: () {
                      resetGame();
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.replay,
                      size: 40,
                      color: Colors.white,
                    ))
              ],
            ),
          ));
    } else {
      checkDraw();
    }
  }

  bool check(int index, String keyWord) {
    if (painterList.value[index].toString().contains(keyWord)) {
      return true;
    } else {
      return false;
    }
  }

  void resetGame() {
    turn.value = true;
    painterList.value = [];
    put_();
  }
}
