import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_trainer/global/GlobalVariable.dart';

import '../animations/ScrollBehavior1.dart';
import '../statics/Player.dart';

import '../statics/Ranks.dart';
import '../statics/Training.dart';
import 'TrainDescription.dart';

class HubMain extends StatefulWidget {
  @override
  _HubMainState createState() => _HubMainState();
}

class _HubMainState extends State<HubMain> {


  int numberOfDays = 0; // Nombre de jours initial
  double progressValue = 0.5; // Valeur de progression initiale (entre 0 et 1)

  Future<Player?> getPlayerFromSharedPreferences() async {
    print(1);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('playerKey');
    print(2);

    if (jsonString != null) {
      return Player.fromJsonString(jsonString);
    }
    return null;
  }




  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Player?>(
        future: getPlayerFromSharedPreferences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // En attendant la résolution de la future
          } else if (snapshot.hasError) {
            print('Erreur : ${snapshot.error}');
            return Text("Une erreur est survenue...");
          } else {
            print("DATAAAAAAAAA");
            print(snapshot.data);

            Player player = snapshot.data!;

            return Scaffold(

              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50),

                    // Image centrée en haut de l'écran
                    Image.asset(
                      rankList[player.rankGoal]!.imagePath,
                      width: 300,
                      height: 300,
                    ),

                    Text(rankList[player.rankGoal]!.name,style: TextStyle(fontSize: 25),),

                    SizedBox(height: 20),

                    // Barre de progression
                    Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                      child:
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        minHeight: 15,
                        value: (player.dayActu??0)/player.dayBeforeGoal!,
                      ),
                    ),

                    // Nombre de jours
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Dans ${player.dayBeforeGoal! - player.dayActu!} jours',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

                    SizedBox(height: 15,),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 50),child: Divider()),
                    SizedBox(height: 15,),

                    buildJourEntrainement(player.dayActu!,trainingList[player.entrainement![player.dayActu!][0]]!, player),

                    SizedBox(height: 5,),

                    GestureDetector(
                      onTap: (){

                        int newDayActu = player.dayActu!+1;
                        if(newDayActu < player.dayBeforeGoal!){
                          setState(() {
                            player.dayActu = newDayActu;
                            savePlayerToSharedPreferences(player);
                          });
                        }
                        else if (newDayActu == player.dayBeforeGoal){

                        }


                      },
                      child: Padding(padding: EdgeInsets.only(top: 10),
                        child:
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          height: 50,
                          color: Color(0xFF52907E), //borderRadius: BorderRadius.circular(10)

                          child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child:
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xCDFFFFFF))),
                                child:  Text(
                                  "Completer jour ${player.dayActu!+1}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Valorant"
                                  ),
                                ),
                              )


                          ),
                        )
                        ,),
                    )


                    ,

                    SizedBox(height: 80,)

                  ],
                ),
              )

              ,
            );

          }

        });



  }

  Column buildJourEntrainement(int numeroTraining,TrainingInfo trainingInfo,Player player){

    List<Color> colors = [Color(0xFF0596F2),Color(0xFFF2994B),Color(0xFFF27A5E),Color(0xFFF24949),Color(0xFFF24949),Color(0xFFF24949),Color(0xFFF24949)];




    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Jour ${numeroTraining+1}",style: TextStyle(fontSize: 20),)],))
        ,
        GestureDetector(
          onTap: () {

            showModalBottomSheet(
              backgroundColor: Color(0xFF0F1923),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              context: context,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.70,
              ),
              isScrollControlled: true,
              builder: (context) {

                GlobalVariable.toolContext = context;

                return ScrollConfiguration(
                  behavior: ScrollBehavior1(),
                  child: TrainDescription(trainingInfo,player,numeroTraining),
                );
              },
            ).then((value) => GlobalVariable.toolContext=null);

          },

          child: Container(
            padding: EdgeInsets.only(top: 20,bottom:0),
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: colors[numeroTraining % player.joursSemaine!],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text("${trainingInfo.titre}",style: TextStyle(fontSize: 22,fontFamily: "Valorant"),textAlign: TextAlign.center,),
                Text("Durée - ${player.entrainement![numeroTraining][1]}min",style: TextStyle(fontSize: 19)),
                Text("Lieu - ${trainingInfo.lieu}",style: TextStyle(fontSize: 18)),
                Image.asset("${trainingInfo.image}",scale: 3.5,)
              ],
            ),
          ),
        )
      ],
    );

  }

  Future<void> savePlayerToSharedPreferences(Player player) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = player.toJsonString();
    await prefs.setString('playerKey', jsonString);
  }

}
