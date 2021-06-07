import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScorePage extends StatelessWidget {
  ScorePage({@required this.maxScore, this.reset});

  final int maxScore;
  final Function reset;

  @override
  Widget build(BuildContext context) {
    int topScore = maxScore;

    if (maxScore > topScore) {
      topScore = maxScore;
    }

    return Scaffold(
      backgroundColor: Colors.indigo,

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(

              //TODO: Return The Main Size
              "Best Score : $maxScore",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: "Pacifico",
              ),
            ),
            Text(
              "Top Score : $topScore",
              style: TextStyle(
                //TODO: Return Top Score
                color: Colors.indigo,
                fontSize: 30,
                fontFamily: "Pacifico",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  reset();
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "Try Again",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 30,
                          fontFamily: "Pacifico"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//  Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return ScorePage();
//                       },
//                     ),
//                   );
