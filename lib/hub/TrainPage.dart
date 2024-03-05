import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_trainer/animations/FadePageRoute.dart';
import 'package:valorant_trainer/animations/SlideFadePageRoute.dart';
import 'package:valorant_trainer/hub/TrainDescription.dart';
import 'package:valorant_trainer/hub/TrainListePage.dart';
import 'package:valorant_trainer/statics/Training.dart';

import '../animations/ScrollBehavior1.dart';
import '../global/GlobalVariable.dart';
import '../statics/Player.dart';

import '../statics/Ranks.dart';

/*
Quel champion on lui conseille
style de jeu : + ou moins agressif
entrainements personalisés : 15minutes de bots
-deathmatch
-
 */

class TrainPage extends StatefulWidget {
  @override
  _TrainPageState createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {


  List<String> quality = [];
  List<String> weakness = [];

  int semaineActuelle = 0;
  //Player? player = Player(rankActu: 1,rankGoal: 2,kdRatio: [[0.2, '12/02/2024']],headShot: [[10, '12/02/2024']],win: [[10, '12/02/2024']],damageRound: [[10, '12/02/2024']],agents: [1],joursSemaine: 2,heureJours: 3,quality: ["r"],weakness: ["a"],dayBeforeGoal: 10,dayActu: 1,entrainement: [[0,30]]);

  Player? player;
  @override
  void initState() {
    super.initState();


    LoadSharedPrefs();

  }


  Future<Player?> getPlayerFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('playerKey');
    if (jsonString != null) {
      return Player.fromJsonString(jsonString);
    }
    return null;
  }

  LoadSharedPrefs() async {

    getPlayerFromSharedPreferences().then((playerr) {

      print(playerr);


      setState(() {

        quality = playerr!.quality!;
        weakness = playerr.weakness!;
        player = playerr;
        semaineActuelle = player!.dayActu! ~/ player!.joursSemaine!;

      });

    });


  }

  @override
  Widget build(BuildContext context) {

    if(player == null) return Center(child: CircularProgressIndicator(),);
    else{
      return Scaffold(

          body:
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 80,horizontal: 0),
              child: Column(
                children: [
                  Text("Mon bilan",style: TextStyle(fontSize: 30,fontFamily: "Valorant"),),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child:

                    Row(



                      mainAxisAlignment: MainAxisAlignment.spaceEvenly
                      ,
                      children: [
                        buildPointsForts(),
                        buildPointsFaibles(),

                      ],
                    ),

                  ),
                  SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50),child: Divider()),
                  SizedBox(height: 20,),

                  Text("Mon programme",style: TextStyle(fontSize: 30,fontFamily: "Valorant"),),



                  buildSemaineEntrainement(player!, semaineActuelle)

                  ,
                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      GestureDetector(
                        onTap: (){

                          int maxSemaine = player!.dayBeforeGoal! ~/ player!.joursSemaine!;
                          int newSemaine = semaineActuelle + -1;
                          if(newSemaine >=0){
                            setState(() {
                              semaineActuelle = newSemaine;
                            });
                          }

                        },
                        child: Padding(padding: EdgeInsets.all(10),
                          child:
                          Container(
                            width: 150,
                            color: Color(0xFFFD4554),
                            child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child:
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xCDFFFFFF))),
                                  child:  Text(
                                    "Semaine précédente",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )


                            ),
                      )

                      ,
                        )
                        ,),


                      GestureDetector(
                        onTap: (){

                          int maxSemaine = player!.dayBeforeGoal! ~/ player!.joursSemaine!;
                          int newSemaine = semaineActuelle + 1;
                          if(newSemaine <= maxSemaine){
                            setState(() {
                              semaineActuelle = newSemaine;
                            });
                          }


                        },
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              width: 150,
                              color: Color(0xFF52907E),
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child:
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xCDFFFFFF))),
                                  child:  Text(
                                    "Semaine suivante",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                      )




                        ),
                      )



                    ],
                  )
                  ,
                  SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50),child: Divider()),
                  SizedBox(height: 20,),
                  Text("Catalogue",style: TextStyle(fontSize: 30,fontFamily: "Valorant"),),
                  SizedBox(height: 20,),

                  Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Par catégories",style: TextStyle(fontSize: 20),)],))
                  ,


                  buildScrollItemByListCategory(),

                  SizedBox(height: 20,),

                  Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text("Par difficultés",style: TextStyle(fontSize: 20),)],))
                  ,

                  buildScrollItemByListDifficulty()


                ],
              ),



            ),
          )


      );
    }



  }


  Column buildSemaineEntrainement(Player player,int numeroSemaine){

    int maxSemaine = player.dayBeforeGoal! ~/ player.joursSemaine!;
    if(numeroSemaine > maxSemaine) numeroSemaine = 0;

    List<Widget> widgetTrain = [];
    try{
      for(int i = 0; i< player.joursSemaine!; i++) {
        int x = i + (numeroSemaine)*player.joursSemaine!;
        widgetTrain.add(buildJourEntrainement(x, trainingList[player.entrainement![x][0]]!, player));
      }
    }
    catch (e){
      print(e);
      print("rr");
      print(widgetTrain);
    }


    return Column(
      children: widgetTrain,
    );
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

  Column buildPointsForts(){

    List<Widget> widgetsColumn = [

      Text(
        'Points forts',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
    ];

    quality.forEach((element) {
      widgetsColumn.add(PointFortItem(text: element));
    });

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetsColumn,
    );
  }



Column buildPointsFaibles(){

    print("weak");
    print(weakness);
  List<Widget> widgetsColumn = [

    Text(
      'Points faibles',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10),
  ];

  weakness.forEach((element) {
    widgetsColumn.add(PointFaibleItem(text: element));
  });

  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: widgetsColumn,
  );
}

SingleChildScrollView buildScrollItemByListCategory(){

    List<List<String>> liste = typeList;

    List<Widget> elements = [];

    liste.asMap().forEach((index,element) {
      elements.add(

        GestureDetector(
          onTap: (){
            print("Vous avez appuyé sur l'élément à l'index $index");

            GlobalVariable.toolContext = context;

            Navigator.push(
              context,
              SlideFadePageRoute(page:TrainListePage("cat",liste[index][0])),
            ).then((value) => GlobalVariable.toolContext=null);

          },
          child:  Padding(padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 200,
              width: 160,
              decoration: BoxDecoration(
                  color: Color(0xFFF2994B),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(element[1],scale:3,),
                  Text(element[0],style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
        )


      );
    });


    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:
      Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:Row(
        children: elements
      ) ,)
      ,
    );
}


  SingleChildScrollView buildScrollItemByListDifficulty(){

    List<List<String>> liste = difficulyList;

    List<Widget> elements = [];

    liste.asMap().forEach((index,element) {
      elements.add(

        GestureDetector(
          onTap: (){

            print("Vous avez appuyé sur l'élément à l'index $index");
            GlobalVariable.toolContext = context;


            Navigator.of(context).push(SlideFadePageRoute(page:TrainListePage("dif",liste[index][0]))).then((value) => GlobalVariable.toolContext=null);


          },
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 200,
              width: 160,
              decoration: BoxDecoration(
                  color: Color(0xFFF27A5E),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(element[1],scale:3,),
                  Text(element[0],style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
        )


      );
    });


    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:
      Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:Row(
          children: elements
      ) ,)
      ,
    );
  }

}




class PointFortItem extends StatelessWidget {
  final String text;

  const PointFortItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 10),
      child:
      Container(
        width: 150,
        color: Color(0xFF52907E), //borderRadius: BorderRadius.circular(10)

        child: Padding(
            padding: EdgeInsets.all(4.0),
            child:
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xCDFFFFFF))),
              child:  Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )


        ),
      )
      ,)

      ;

  }
}

class PointFaibleItem extends StatelessWidget {
  final String text;

  const PointFaibleItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 10),
      child:
      Container(
        width: 150,
        color: Color(0xFFFD4554),
        child: Padding(
            padding: EdgeInsets.all(4.0),
            child:
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xCDFFFFFF))),
              child:  Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )


        ),
      )
      ,)

    ;
  }
}


