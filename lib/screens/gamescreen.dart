import 'package:flutter/material.dart';

class XOGamePage extends StatefulWidget {
  const XOGamePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _XOGamePageState createState() => _XOGamePageState();
}

class _XOGamePageState extends State<XOGamePage> {
  List<String> board = List.filled(9, '');

  bool player1Turn = true;
  String currentPlayer = 'X';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XO Game'),
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
                    padding: const EdgeInsets.all(5),
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
            const SizedBox(height: 20.0),
            Text(
              'Current Player: $currentPlayer',
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  void _onTileClicked(int index) {
    if (board[index] == '') {
      setState(() {
        board[index] = currentPlayer;
        _checkWinner();
        if (player1Turn) {
          currentPlayer = 'O';
        } else {
          currentPlayer = 'X';
        }
        player1Turn = !player1Turn;
      });
    }
  }

  void _checkWinner() {
    String? winner;

    if (_checkRow(0, 1, 2) ||
        _checkRow(3, 4, 5) ||
        _checkRow(6, 7, 8) ||
        _checkRow(0, 3, 6) ||
        _checkRow(1, 4, 7) ||
        _checkRow(2, 5, 8) ||
        _checkRow(0, 4, 8) ||
        _checkRow(2, 4, 6)) {
      winner = currentPlayer;
    }

    if (winner != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Game Over'),
          content: Text('Player $winner wins!'),
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
    }
  }

  bool _checkRow(int a, int b, int c) {
    return board[a] != '' && board[a] == board[b] && board[b] == board[c];
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      player1Turn = true;
      currentPlayer = 'X';
    });
  }
}

class FourxfourXOGamePage extends StatefulWidget {
  const FourxfourXOGamePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FourxfourXOGamePageState createState() => _FourxfourXOGamePageState();
}

class _FourxfourXOGamePageState extends State<FourxfourXOGamePage> {
  List<String> board = List.filled(16, '');

  bool player1Turn = true;
  String currentPlayer = 'X';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XO Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: board.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onTileClicked(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
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
            const SizedBox(height: 20.0),
            Text(
              'Current Player: $currentPlayer',
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  void _onTileClicked(int index) {
    if (board[index] == '') {
      setState(() {
        board[index] = currentPlayer;
        _checkWinner();
        if (player1Turn) {
          currentPlayer = 'O';
        } else {
          currentPlayer = 'X';
        }
        player1Turn = !player1Turn;
      });
    }
  }

  void _checkWinner() {
    String? winner;
    if (_checkRow(0, 1, 2, 3) ||
        _checkRow(4, 5, 6, 7) ||
        _checkRow(8, 9, 10, 11) ||
        _checkRow(12, 13, 14, 15) ||
        _checkRow(0, 4, 8, 12) ||
        _checkRow(1, 5, 9, 13) ||
        _checkRow(2, 6, 10, 14) ||
        _checkRow(3, 7, 11, 15) ||
        _checkRow(0, 5, 10, 15) ||
        _checkRow(3, 6, 9, 12)) {
      winner = currentPlayer;
    }
    if (winner != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Game Over'),
          content: Text('Player $winner wins!'),
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
    }
  }

  bool _checkRow(int a, int b, int c, int d) {
    return board[a] != '' &&
        board[a] == board[b] &&
        board[b] == board[c] &&
        board[c] == board[d];
  }

  void _resetGame() {
    setState(() {
      board = List.filled(16, '');
      player1Turn = true;
      currentPlayer = 'X';
    });
  }
}
