import 'package:flutter/material.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // Variables + Functions
  int counter = 0;
  int answersIndex = 0;
  List<String> answers = ["Your Answer ? ", "Right Answer", "Wrong Answer"];

  int right = 1;
  int left = 1;


  void change(){
    right = Random().nextInt(9) + 1 ;
    left = Random().nextInt(9) + 1 ;
  }


  void reset(){
    counter = 0 ;
    answersIndex = 0 ;
    right = 1 ;
    left = 1 ;
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
                  reset() ;
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
                "Score : $counter",
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
              child: Text(
                answers[answersIndex],
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
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (left != right){
                          counter++ ;
                          answersIndex = 1 ;
                        } else {
                          counter = 0 ;
                          answersIndex = 2 ;
                        }
                        change() ;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 70),
                      child: Container(
                        child: Center(
                          child: Text(
                            "False",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Pacifico",
                              fontSize: 30,
                            ),
                          ),
                        ),
                        //TODO:
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (left == right){
                          counter++ ;
                          answersIndex = 1 ;
                        } else {
                          counter = 0 ;
                          answersIndex = 2 ;
                        }
                        change() ;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 70),
                      child: Container(
                        child: Center(
                          child: Text(
                            "True",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Pacifico",
                              fontSize: 30,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                      ),
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
