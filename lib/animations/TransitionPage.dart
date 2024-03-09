import 'dart:async';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:valorant_trainer/home/HomePage.dart';
import 'package:valorant_trainer/hub/Hub.dart';


class TransitionPage extends StatefulWidget {
  @override
  _TransitionPageState createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  double _progressValue = 0.0;
  List<String> _messages = ["Analyse de vos données", "Création de votre programme personnalisé","Finalisation..."];
  int _currentMessageIndex = 0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _progressValue += 0.0035;

        if(_progressValue>0.33 && _progressValue <0.70){
          _currentMessageIndex = 1;
        }
        if(_progressValue>0.71 && _progressValue <1){
          _currentMessageIndex = 2;
        }
        if (_progressValue >= 1.0) {

        }
        if(_progressValue >=1.5){
          timer.cancel();
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>

              DoubleBack(
                  message: "Appuyez à nouveau pour quitter l'application",
                  textStyle: TextStyle(fontSize: 17,color: Colors.white),
                  child:Hub()
              )


            ),

          );
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 20,
              child: LinearProgressIndicator(
                value: _progressValue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _messages[_currentMessageIndex],
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),

            _progressValue >= 1.0 ?
                CircularProgressIndicator()
                :
                Container()
          ],
        ),
      ),
    );
  }
}
