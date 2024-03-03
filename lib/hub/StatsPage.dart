import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../statics/MyLineChart.dart';
import '../statics/Player.dart';

import '../statics/Ranks.dart';

/*
plusieurs graphiques:
-un qui contient les données rentrés une ligne par donnée
- entrainement validé aujourd'hui ?

 */

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> with SingleTickerProviderStateMixin{

  Future<Player?> getPlayerFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('playerKey');
    if (jsonString != null) {
      return Player.fromJsonString(jsonString);
    }
    return null;
  }

  late Player player;

  late AnimationController _controller;
  late Animation<double> _animationHeadShot;
  late Animation<double> _animationKdRatio;
  late Animation<double> _animationWin;
  late Animation<double> _animationDamage;

  double _currentPercentageHeadShot = 0.0; // La valeur actuelle du pourcentage
  double _currentPercentageKdRatio = 0.0; // La valeur actuelle du pourcentage
  double _currentPercentageWin = 0.0; // La valeur actuelle du pourcentage
  double _currentPercentageDamage = 0.0; // La valeur actuelle du pourcentage

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Durée de l'animation (2 secondes dans cet exemple)
    );

    LoadAndLaunchAnimations();






    // Lance l'animation lorsque la page est construite
  }

  void LoadAndLaunchAnimations() async {

      Player player = await getPlayerFromSharedPreferences() ?? Player(kdRatio: [[0]],damageRound: [[0]],win: [[0]],headShot: [[0]]);

    //init animation

    _animationHeadShot = Tween<double>(
      begin: 0.0,
      end: player.headShot![player.headShot!.length-1][0],
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _currentPercentageHeadShot= _animationHeadShot.value;
        });
      });

    _animationKdRatio = Tween<double>(
      begin: 0.0,
      end: player.kdRatio![player.kdRatio!.length-1][0],
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _currentPercentageKdRatio = _animationKdRatio.value;
        });
      });

    _animationWin = Tween<double>(
      begin: 0.0,
      end: player.win![player.win!.length-1][0],
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _currentPercentageWin = _animationWin.value;
        });
      });

    _animationDamage = Tween<double>(
      begin: 0.0,
      end: player.damageRound![player.damageRound!.length-1][0],
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _currentPercentageDamage = _animationDamage.value;
        });
      });

    setState(() {
      _controller.forward();
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


      return Scaffold(

          body:
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 80,right: 50,left: 20,bottom: 100),
              child:
              Column(
                children: [
                  Container(
                    height: 0,
                    width: MediaQuery.of(context).size.width,
                    //child:MyLineChart(lst: [[0.2, '12/02'], [0.5,'13/02'], [0.7,'15/02'],[0.8,'16/02'],[0.7,'15/02']],))
                    child: Text(""),)
                  ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),

                      Stack(
                        children: [
                          CustomPaint(
                            size: Size(150, 150),
                            painter: CirclePainter(_currentPercentageHeadShot / 100), // Convertit le pourcentage en une valeur entre 0 et 1
                          ),
                          Positioned(
                            top: 58 , // La moitié de la hauteur du cercle moins la moitié de la taille du texte
                            left: 40, // La moitié de la largeur du cercle moins la moitié de la largeur du texte
                            child: Text(
                              '${_currentPercentageHeadShot.toStringAsFixed(1)}%',
                              style: TextStyle(fontSize: 24.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),

                      Text("HeadShot%",style: TextStyle(fontSize: 17))
                    ],
                  ),
                  SizedBox(height: 40,)

                  ,Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      SizedBox(width: 20,),

                      Stack(
                        children: [
                          CustomPaint(
                            size: Size(150, 150),
                            painter: CirclePainter(_currentPercentageWin / 100), // Convertit le pourcentage en une valeur entre 0 et 1
                          ),
                          Positioned(
                            top: 58 , // La moitié de la hauteur du cercle moins la moitié de la taille du texte
                            left: 40, // La moitié de la largeur du cercle moins la moitié de la largeur du texte
                            child: Text(
                              '${_currentPercentageWin.toStringAsFixed(1)}%',
                              style: TextStyle(fontSize: 24.0),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),

                      Text("Win%",style: TextStyle(fontSize: 17))

                    ],
                  ),
                  SizedBox(height: 40,)

                  ,Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      SizedBox(width: 20,),

                      Stack(
                        children: [
                          CustomPaint(
                            size: Size(150, 150),
                            painter: CirclePainter(_currentPercentageKdRatio/2.3), // Convertit le pourcentage en une valeur entre 0 et 1
                          ),
                          Positioned(
                            top: 58 , // La moitié de la hauteur du cercle moins la moitié de la taille du texte
                            left: 50, // La moitié de la largeur du cercle moins la moitié de la largeur du texte
                            child: Text(
                              '${_currentPercentageKdRatio.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 24.0),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),

                      Text("K/D Ratio",style: TextStyle(fontSize: 17))

                    ],
                  ),
                  SizedBox(height: 40,)

                  ,Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      SizedBox(width: 20,),
                      Stack(
                        children: [
                          CustomPaint(
                            size: Size(150, 150),
                            painter: CirclePainter(_currentPercentageDamage/250), // Convertit le pourcentage en une valeur entre 0 et 1
                          ),
                          Positioned(
                            top: 58 , // La moitié de la hauteur du cercle moins la moitié de la taille du texte
                            left: 50, // La moitié de la largeur du cercle moins la moitié de la largeur du texte
                            child: Text(
                              '${_currentPercentageDamage.toStringAsFixed(1)}',
                              style: TextStyle(fontSize: 24.0),
                              textAlign: TextAlign.center,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),

                      Text("Damage/\nRound",style: TextStyle(fontSize: 17),)

                    ],
                  )





                ],
              )
              ,
            ),
          )


      );
    }




  }


class CirclePainter extends CustomPainter {
  final double percentage;

  CirclePainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    print("percent");
    print(percentage);
    final double strokeWidth = 10.0;
    final double radius = min(size.width, size.height) / 2 - strokeWidth;

    final Paint paint = Paint()
      ..color = Color(0xFF162533)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius,
      paint,
    );

    final double sweepAngle = 2 * pi * percentage;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
      -pi / 2, // Start angle (from top)
      sweepAngle,
      false,
      paint..color = Color(0xFFFD4554),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

