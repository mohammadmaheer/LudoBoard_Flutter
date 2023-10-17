import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: LudoBoard(),
    ));

class LudoBoard extends StatelessWidget {
  const LudoBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ludo Game'),
      ),
      body: Center(
        child: Container(
          width: 394,
          height: 394,
          decoration: BoxDecoration(
            color: Colors.white, // Ludo board background color
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: const Stack(
            children: [
              // Player 1's home area (top-left)
              Positioned(
                top: 0,
                left: 0,
                child: PlayerArea(Colors.red),
              ),
              // Player 2's home area (top-right)
              Positioned(
                top: 0,
                right: 0,
                child: PlayerArea(Colors.blue),
              ),
              // Player 3's home area (bottom-left)
              Positioned(
                bottom: 0,
                left: 0,
                child: PlayerArea(Colors.green),
              ),
              // Player 4's home area (bottom-right)
              Positioned(
                bottom: 0,
                right: 0,
                child: PlayerArea(Colors.yellow),
              ),
              //VERTICAL PLUS AREA
              Row(
                children: [
                  SizedBox(
                    width: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HorizontalBoxes(
                        rows: 5,
                        column: 3,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      HorizontalBoxes(
                        rows: 3,
                        column: 3,
                        isEmpty: true,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      HorizontalBoxes(
                        rows: 5,
                        column: 3,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ],
                  ),
                ],
              ),
              //HORIZONTAL PLUS AREA
              Center(
                child: Row(
                  children: [
                    //1st part
                    HorizontalBoxes(
                      rows: 3,
                      column: 150 ~/ 30,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: Center(
                          child: Text(
                        "LUDO",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                    ),
                    //mid part
                    // const HorizontalBoxes(
                    //   rows: 3,
                    //   column: 90 ~/ 30,
                    //   isEmpty: true,
                    // ),
                    //last Part
                    HorizontalBoxes(
                      rows: 3,
                      column: 150 ~/ 30,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalBoxes extends StatelessWidget {
  final int rows, column;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isEmpty;
  const HorizontalBoxes({
    required this.rows,
    required this.column,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.isEmpty = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        ...List.generate(
          rows,
          (index) => Row(
            children: [
              for (int i = 0; i < column; i++)
                LudoBox(
                  isEmpty: isEmpty,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class LudoBox extends StatelessWidget {
  final bool isEmpty;
  const LudoBox({
    super.key,
    required this.isEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: isEmpty
          ? null
          : BoxDecoration(
              border: Border.all(
              color: Colors.black,
              width: 0.1,
            )),
    );
  }
}

class PlayerArea extends StatelessWidget {
  final Color color;

  const PlayerArea(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: color,
    );
  }
}
