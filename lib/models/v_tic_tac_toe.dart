import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/models/c_tic_tac_toe.dart';
import 'package:tic_tac_toe/models/w_tic_tac_toe.dart';

class TicTacToePage extends StatelessWidget {
  const TicTacToePage({super.key});

  @override
  Widget build(BuildContext context) {
    TicTacToeController controller = Get.put(TicTacToeController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
              onPressed: () {
                controller.resetGame();
              },
              child: const Icon(Icons.replay_outlined)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: Get.width * 0.85,
          height: Get.width * 0.85,
          child: CustomPaint(
            painter: HashPainter(),
            child: ValueListenableBuilder(
              valueListenable: controller.painterList,
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.showSign(index);
                      },
                      child: CustomPaint(
                        painter: value[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
