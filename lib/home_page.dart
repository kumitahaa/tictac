import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var grid = [
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
    '-',
  ];
  var currentPlayer = 'X';
  var counter = 0;
  // var reset_controller = '0';
  void makeTurn(i) {
    if (grid[i] == '-') {
      setState(
        () {
          grid[i] = currentPlayer;
        },
      );

      if (currentPlayer == 'X') {
        currentPlayer = 'O';
      } else {
        currentPlayer = 'X';
      }
      counter = counter + 1;
      if (counter == 9) {
        currentPlayer = "Game Over!!!";
      }
      // if (reset_controller == '1') {
      //   grid[0] = '-';
      //   reset_controller = '0';
      //   currentPlayer = 'X';
      // }
    }
  }

  void reset() {
    setState(() {
      grid = [
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
        '-',
      ];
    });

    currentPlayer = 'X';
    counter = 0;
    // reset_controller = "1";
    // makeTurn(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 2, 33, 50),
            margin: const EdgeInsets.all(30),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: grid.length,
              itemBuilder: (context, index) => Material(
                color: Colors.purple,
                child: InkWell(
                  splashColor: Colors.blue,
                  onTap: () => makeTurn(index),
                  child: Center(
                    child: Text(
                      grid[index],
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Turn:    $currentPlayer",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: () => reset(),
            icon: const Icon(
              Icons.refresh,
            ),
            label: const Text("Play Again"),
          ),
        ],
      ),
    );
  }
}
