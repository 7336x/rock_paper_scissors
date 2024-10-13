import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(RockPaperScissors());
}

class RockPaperScissors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Rock Paper Scissors',
            style: TextStyle(
              color: Colors.white,    // White text color
              fontWeight: FontWeight.bold,  // Bold font
            ),
          ),
          backgroundColor: Colors.orange,  // AppBar color
        ),
        backgroundColor: Color(0xFFFFE5B4),  // Scaffold background baby orange
        body: GameScreen(),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int player1Choice = 0;
  int player2Choice = 0;
  String player1Result = "";  // Result for Player 1
  String player2Result = "";  // Result for Player 2

  List<String> choices = ['rock', 'paper', 'scissors'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/${choices[player1Choice]}.png',
                  height: 120,  
                  width: 120,   
                ),
                SizedBox(height: 10),
                Text(
                  'Player 1',  // Label for Player 1
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  player1Result,  // Display result for Player 1
                  style: TextStyle(
                    color: Colors.green,  
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/${choices[player2Choice]}.png',
                  height: 120, 
                  width: 120,   
                ),
                SizedBox(height: 10),
                Text(
                  'Player 2',  // Label for Player 2
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  player2Result,  // Display result for Player 2
                  style: TextStyle(
                    color: Colors.red,  
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: playGame,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,  // Button color
          ),
          child: Text(
            'Play',
            style: TextStyle(
              color: Colors.white,    // White text color
              fontWeight: FontWeight.bold,  
            ),
          ),
        ),
      ],
    );
  }

  void playGame() {
    setState(() {
      player1Choice = Random().nextInt(3);
      player2Choice = Random().nextInt(3);

      // the challenage  to determine the result using if-else statements
      if (player1Choice == player2Choice) {
        player1Result = "It's a Tie!";
        player2Result = "It's a Tie!";
      } else if ((player1Choice == 0 && player2Choice == 2) ||  // Rock beats Scissors
                 (player1Choice == 1 && player2Choice == 0) ||  // Paper beats Rock
                 (player1Choice == 2 && player2Choice == 1)) {  // Scissors beats Paper
        player1Result = "Player 1 Wins!";
        player2Result = "Player 2 Loses!";
      } else {
        player1Result = "Player 1 Loses!";
        player2Result = "Player 2 Wins!";
      }
    });
  }
}



