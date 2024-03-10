import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:valorant_trainer/statics/BoutonValorant.dart';

import '../statics/Player.dart';

class ReactionTest extends StatefulWidget {


  @override
  _ReactionTestState createState() => _ReactionTestState();
}

class _ReactionTestState extends State<ReactionTest> {
  Color _color = Color(0xFF5EBEF2); //blue
  String _text = "Quand l'écran rouge devient vert, cliquez aussi vite que possible.\n Cliquez pour commencer.";
  DateTime? _startTime;
  DateTime? _endTime;
  bool? gameLaunch;
  Timer? _timer;
  bool? entrainement;
  Player? player;
  bool? defiDejaFait = false;

  _ReactionTestState();


  @override
  void initState() {
    super.initState();
    gameLaunch = false;
    entrainement = true;
    LoadSharedPrefs();
  }
  LoadSharedPrefs() async {

    getPlayerFromSharedPreferences().then((playerr) {

      print(playerr);


      setState(() {

       player = playerr;
       if(player!.defiValide![player!.dayActu!] != null){
         defiDejaFait = true;
       }
      });

    });


  }


  void _startTimer() {

    setState(() {
      _color = Color(0xFFFD4554);
      _text = "Attendez...";
    });

    Random random = Random();

    // Générer un double aléatoire entre 0 et 8
    int randomInt = random.nextInt(8001 - 1000) + 1000; // entre 1 et 8secondes
    print(randomInt);
    _timer = Timer(Duration(milliseconds: randomInt), () {
      if(gameLaunch!){
        setState(() {
          _color = Color(0xFF52907E);
          _text = "Cliquez !";
          _startTime = DateTime.now();
        });
      }

    });
  }

  void _handleTap() async {

    if(entrainement!){
      if (_color == Color(0xFF52907E)) {
        _endTime = DateTime.now();
        _showReactionTime();
      }
      else{
        print("perdu");
        setState(() {
          _color = Color(0xFF5EBEF2);
          _text = "Trop tôt...\nCliquez pour recommencer";
          gameLaunch = false;
          _timer!.cancel();
        });
    }
    }
    else{//defi
      if (_color == Color(0xFF52907E)) {
        _endTime = DateTime.now();
        if (_startTime != null && _endTime != null) {
          final reactionTime = _endTime!.difference(_startTime!);
          final reactionTimeInMilliseconds = reactionTime.inMilliseconds;
          if(reactionTimeInMilliseconds <= 273){

            //defi reussi

            player!.defiValide![player!.dayActu!] = true;

            setState(() {
              _color = Color(0xFF5EBEF2);
              _text = "Temps de reaction: ${reactionTimeInMilliseconds}ms\nVous avez réussi !";
              gameLaunch = false;
            });

          }
          else{
            //defi perdu
            player!.defiValide![player!.dayActu!] = false;


            setState(() {
              _color = Color(0xFF5EBEF2);
              _text = "Temps de reaction: ${reactionTimeInMilliseconds}ms\nVous n'avez pas réussi aujourd'hui.";
              gameLaunch = false;
            });

          }
        }
      }
      else{
        print("perdu");
        //defi perdu
        player!.defiValide![player!.dayActu!] = false;

        setState(() {
          _color = Color(0xFF5EBEF2);
          _text = "Vous avez cliqué trop tôt...\nVous n'avez pas réussi aujourd'hui.";
          gameLaunch = false;
          _timer!.cancel();
        });
      }
      savePlayerToSharedPreferences(player!);
      setState(() {
        entrainement = true;
        defiDejaFait = true;
      });
    }
  }

  void _showReactionTime() {
    if (_startTime != null && _endTime != null) {
      final reactionTime = _endTime!.difference(_startTime!);
      final reactionTimeInMilliseconds = reactionTime.inMilliseconds;

      setState(() {
        _color = Color(0xFF5EBEF2);
        _text = "Temps de reaction: ${reactionTimeInMilliseconds}ms\nCliquez pour recommencer";
        gameLaunch = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

              Padding(
                  padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Temps de reaction",
                        style: TextStyle(fontSize: 25, fontFamily: "Valorant"),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Divider(),
                      ),
                      SizedBox(height: 20),
                      Text("Score pour valider: 273ms",style: TextStyle(fontSize: 18),),
                      BoutonValorant(enabled: (entrainement! && !defiDejaFait!),text: "Lancer le defi", onTap: (){

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Temps de réaction'),
                              content: Text(
                                  "Vous n'aurez qu'un seul essai, êtes-vous prets ?"),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Retour'),
                                  onPressed: () {
                                    Navigator.of(context).pop();

                                  },
                                ),
                                TextButton(
                                  child: Text('Démarrer'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      entrainement = false;
                                    });

                                  },
                                ),

                              ],
                            );
                          },
                        );

                      }
                      ,
                      ),
                      SizedBox(height: 20,),
                      entrainement! ?
                      Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Entraînement",style: TextStyle(fontSize: 20),)],))
                      :
                      Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Defi",style: TextStyle(fontSize: 20),)],)),

                        Expanded(
                        child:
                        GestureDetector(
                          onTap: (){

                            if(gameLaunch == false){
                              setState(() {
                                gameLaunch = true;
                                _startTimer();
                              });
                            }
                            else{
                              _handleTap();
                            }


                          },
                          child:
                          Container(
                            decoration: BoxDecoration(
                              color: _color,
                              borderRadius: BorderRadius.circular(20)
                            ),
                          child: Center(
                            child: Text(
                              _text,
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ))
                        ,
                      ),
                    ],
                  ),
                ),


    );
  }


  Future<void> savePlayerToSharedPreferences(Player player) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = player.toJsonString();
    await prefs.setString('playerKey', jsonString);
  }

  Future<Player?> getPlayerFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('playerKey');
    if (jsonString != null) {
      return Player.fromJsonString(jsonString);
    }
    return null;
  }
}
