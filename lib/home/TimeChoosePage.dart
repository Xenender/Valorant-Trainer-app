import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_trainer/animations/TransitionPage.dart';
import 'package:valorant_trainer/statics/TrainBuilder.dart';

import 'dart:math';
import '../statics/Player.dart';

/*
recuperation temps de jeu
 */


class TimeChoosePage extends StatefulWidget {

  Player player;

  TimeChoosePage(this.player);

  @override
  _TimeChoosePageState createState() => _TimeChoosePageState(player);
}

class _TimeChoosePageState extends State<TimeChoosePage> {
  int daysPerWeek = 1;
  int timePerDay = 1;
  Player player;

  _TimeChoosePageState(this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Combien de temps pouvez-vous consacrer à Valorant ?',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre de jours par semaine',
              style: TextStyle(fontSize: 16.0),
            ),

            DropdownButton<int>(
              style: TextStyle(fontSize: 20),
              value: daysPerWeek,
              onChanged: (newValue) {
                setState(() {
                  daysPerWeek = newValue!;
                });
              },
              items: List.generate(7, (index) {
                return DropdownMenuItem<int>(
                  value: index,
                  child: Text('${index + 1}'),
                );
              }),
            ),

            SizedBox(height: 20),
            Text(
              'Nombre d\'heures par jour',
              style: TextStyle(fontSize: 16.0),
            ),
            Slider(
              value: timePerDay.toDouble(),
              onChanged: (double newValue) {
                setState(() {
                  timePerDay = newValue.round();
                });
              },
              min: 0,
              max: 32, // double de la valeur maximale (16 * 2)
              divisions: 32, // double du nombre de divisions
              label: '${(timePerDay / 2).toStringAsFixed(1)} heure(s)',
            ),
            SizedBox(height: 20),

            Padding(padding: EdgeInsets.all(10)
              ,child:  Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                child: ElevatedButton(onPressed: (){
                  // Vous pouvez utiliser daysPerWeek et timePerDay ici
                  print('Jours par semaine: ${daysPerWeek+1}');
                  print('Temps par jour: ${timePerDay/2} heures');

                  player.joursSemaine = daysPerWeek+1;
                  player.heureJours = timePerDay/2;

                  TrainBuilder trainBuilder = TrainBuilder(player);

                  List<List<String>> qualityWeakness = trainBuilder.createQualityWeakness();
                  player.quality = qualityWeakness[0];
                  player.weakness = qualityWeakness[1];

                  int rankToPass = player.rankGoal! - player.rankActu!;
                  print("aeae");
                  print(player.rankGoal);
                  print(player.rankActu);
                  int pointToHave = rankToPass * 100;
                  int nbGameWinToHave = (pointToHave ~/ 20);

                  print("win to have");

                  print(nbGameWinToHave);

                  player.dayBeforeGoal = nbGameWinToHave;
                  player.dayActu = 0;

                  List<int> entrainement = trainBuilder.createEntrainement();

                  int dureeTrain = 0;
                  if(player.heureJours! > 13){
                    dureeTrain = 120;
                  }
                  else if(player.heureJours! > 9){
                    dureeTrain = 60;
                  }
                  else if(player.heureJours! > 5){
                    dureeTrain = 30;
                  }
                  else if(player.heureJours! > 0){
                    dureeTrain = 15;
                  }

                  print("duree train");
                  print(dureeTrain);
                  List<List<int>> entrainementDuree = [];

                  Random random = Random();

                  int vraiDuree = 0;
                  entrainement.forEach((element) {
                    int indexAleatoire = random.nextInt(3);
                    vraiDuree = dureeTrain;
                    print("index alea");
                    print(indexAleatoire);
                    if(indexAleatoire == 0){
                      vraiDuree = vraiDuree - 15;
                      print("passage 0");
                    }
                    else if(indexAleatoire == 1){
                      print("passage 1");
                      vraiDuree = vraiDuree + 15;
                    }
                    else{
                      print("passage else");
                      vraiDuree = vraiDuree;
                    }
                    print("aze");
                    print(element);
                    print(vraiDuree);

                    if(vraiDuree == 0) vraiDuree=15;
                    entrainementDuree.add([element,vraiDuree]);
                  });

                  print("entrainement duree");
                  entrainementDuree.forEach((element) {
                    print(element);
                  });
                  player.entrainement = entrainementDuree;


                  //Enregistrer le json dans les sharedprefs
                  savePlayerToSharedPreferences(player);

                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                    builder: (context) => TransitionPage(),
                  ),
                  );

                }, child: Text("Terminer"),

                ),
              ),)
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

