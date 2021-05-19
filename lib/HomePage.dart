import 'package:flutter/material.dart';
import 'GamePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        leading: Icon(Icons.settings , color: Colors.indigo,),

        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 160.0),
                      child: Container(
                        width: 305,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.indigo[100],
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 160.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return GamePage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "Start The Game",
                              style: TextStyle(color: Colors.white , fontFamily: "Pacifico" , fontSize: 20),
                            ),
                          ),
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Text(
                      "Welcome To Is The Same",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Pacifico",
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Image.asset('images/image-1.png'),
            ),
          ),
        ],
      ),
    );
  }
}
