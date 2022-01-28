import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/grid.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  @override
  void initState() {
    numbers.shuffle();
    super.initState();
  }

  String gamestatus = "Game Begin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          gamestatus,
          style: Theme.of(context).textTheme.headline2!.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.blue.shade900,
              fontFamily: 'MyFonts'),
        ),
        Container(width: double.infinity),
        Grid(number: numbers, onClick: onClick),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                  color: Colors.blue.shade900,
                  child: Text(
                    "Solve",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      numbers.sort(((a, b) => a.compareTo(b)));
                      gamestatus = "Game Over";
                    });
                  }),
              CupertinoButton(
                  color: Colors.blue.shade900,
                  child: Text(
                    "Shuffle",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      numbers.shuffle();
                      gamestatus = "GameBegin";
                    });
                  }),
            ],
          ),
        )
      ],
    ));
  }

  void onClick(index) {
    if (index - 1 > 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
      if (checkForWin(numbers)) {
        setState(() {
          gamestatus = "Game Over";
        });
      }
    }
  }

  bool checkForWin(List numberl) {
    int first = numberl.first;
    for (int i = 1; i < numberl.length; i++) {
      int nextNumber = numberl[i];
      if (first > nextNumber) return false;
      first = numberl[i];
    }
    return true;
  }
}
