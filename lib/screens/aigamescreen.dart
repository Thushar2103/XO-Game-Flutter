import 'dart:math';
import 'package:flutter/material.dart';

class AIXOGamePage extends StatefulWidget {
  const AIXOGamePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AIXOGamePageState createState() => _AIXOGamePageState();
}

class _AIXOGamePageState extends State<AIXOGamePage> {
  List<String> board = List.filled(9, '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI XO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: board.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onTileClicked(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          board[index],
                          style: const TextStyle(fontSize: 40.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onTileClicked(int index) {
    if (board[index] == '') {
      setState(() {
        board[index] = 'X';
        if (!_checkWinner('X')) {
          _aiMove();
        }
      });
    }
  }

  // dumb ai
  void _aiMove() {
    int emptyCells = board.where((cell) => cell == '').length;
    if (emptyCells > 0) {
      int randomIndex;
      do {
        randomIndex = Random().nextInt(board.length);
      } while (board[randomIndex] != '');
      setState(() {
        board[randomIndex] = 'O';
        _checkWinner('O');
      });
    }
  }

  // need same changes
  // void _aiMove() {
  //   // Check for winning moves
  //   for (int i = 0; i < 9; i++) {
  //     if (board[i] == '') {
  //       board[i] = 'O';
  //       if (_checkWinner('O')) {
  //         _checkWinner('O'); // Trigger game over if AI wins
  //         return;
  //       }
  //       board[i] = ''; // Reset the move
  //     }
  //   }

  //   // Check for blocking opponent's winning moves
  //   for (int i = 0; i < 9; i++) {
  //     if (board[i] == '') {
  //       board[i] = 'X';
  //       if (_checkWinner('X')) {
  //         board[i] = 'O'; // Block opponent's winning move
  //         _checkWinner('X'); // Check if game over after blocking
  //         return;
  //       }
  //       board[i] = ''; // Reset the move
  //     }
  //   }

  //   // If no winning moves or blocking moves, make a random move
  //   int emptyCells = board.where((cell) => cell == '').length;
  //   if (emptyCells > 0) {
  //     int randomIndex;
  //     do {
  //       randomIndex = Random().nextInt(board.length);
  //     } while (board[randomIndex] != '');
  //     board[randomIndex] = 'O';
  //     _checkWinner('O');
  //   }
  // }

  bool _checkWinner(String player) {
    if (_checkRow(0, 1, 2, player) ||
        _checkRow(3, 4, 5, player) ||
        _checkRow(6, 7, 8, player) ||
        _checkRow(0, 3, 6, player) ||
        _checkRow(1, 4, 7, player) ||
        _checkRow(2, 5, 8, player) ||
        _checkRow(0, 4, 8, player) ||
        _checkRow(2, 4, 6, player)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Game Over'),
          content: Text('Player $player wins!'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      );
      return true;
    } else if (!board.contains('')) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Game Over'),
          content: const Text('It\'s a draw!'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      );
      return true;
    }
    return false;
  }

  bool _checkRow(int a, int b, int c, String player) {
    return board[a] == player && board[b] == player && board[c] == player;
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
    });
  }
}
