import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  // Variables + Functions
  int scoreCounter = 0;
  int answersIndex = 0;
  List<String> answers = ["Your Answer ? ", "Right Answer", "Wrong Answer"];

  int right = 1;
  int left = 1;

  bool startTimerBool = false ;


  void change() {
    right = Random().nextInt(9) + 1;
    left = Random().nextInt(9) + 1;
  }

  int _counter = 60;
  Timer _timer;


  void reset() {
    scoreCounter = 0;
    answersIndex = 0;
    right = 1;
    left = 1;
    startTimerBool = false ;
    _counter = 60 ;
  }

  //TODO:Add Timer


  void _startTimer() {
    print("Working One");

    if(startTimerBool){
      _counter = 60;
      _timer = Timer.periodic(
        Duration(seconds: 1),
            (timer) {
          setState(() {
            if (_counter > 0) {
              _counter--;
            } else {
              _timer.cancel();
            }
          });
        },
      );
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        elevation: 0,
        title: Text(""),
        //TODO:Delete Me
        actions: [
          IconButton(
              icon: Icon(Icons.repeat),
              onPressed: () {
                setState(() {


            //      startTimerBool = false ;
                  reset();
                  _timer.cancel() ;
                });
              })
        ],
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "Score : $scoreCounter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Pacifico",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              //TODO: Add timer here
              child: Text(
                _counter.toString(),
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: "Pacifico",
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset("images/image-$left.png"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset("images/image-$right.png"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 15),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      child: Text(
                        "False",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Pacifico",
                          fontSize: 25,
                        ),
                      ),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {

                          if(!startTimerBool){
                            startTimerBool = true ;
                            _startTimer() ;
                          }



                          if (right != left) {
                            scoreCounter++;
                            answersIndex = 1;
                          } else {
                            scoreCounter = 0;
                            answersIndex = 2;
                          }

                          change();
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 15),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      child: Text(
                        "True",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Pacifico",
                          fontSize: 25,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          if(!startTimerBool){
                            startTimerBool = true ;
                            _startTimer() ;
                          }

                          if (right == left) {
                            scoreCounter++;
                            answersIndex = 1;
                          } else {
                            scoreCounter = 0;
                            answersIndex = 2;
                          }

                          change();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    print(timerText);
    if (timerText == "00") {
      timerText = "Done";
    }

    return Text(
      "$timerText",
      style: TextStyle(
        color: Colors.white,
        fontSize: 60,
        fontFamily: "Pacifico",
        //aaaaaa
      ),
    );
  }
}
