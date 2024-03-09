
import 'package:flutter/material.dart';
import 'package:valorant_trainer/statics/Training.dart';

import '../statics/Player.dart';

class TrainDescription extends StatefulWidget {

  Player? player;
  TrainingInfo? trainingInfo;
  int? numeroTraining;

  TrainDescription(this.trainingInfo,this.player,this.numeroTraining);



  @override
  _TrainDescriptionState createState() => _TrainDescriptionState(trainingInfo,player,numeroTraining);

}

class _TrainDescriptionState extends State<TrainDescription> {

  Player? player;
  TrainingInfo? trainingInfo;
  int? numeroTraining;

  _TrainDescriptionState(this.trainingInfo,this.player,this.numeroTraining);

  @override
  void initState() {
    super.initState();
  }

  Column buildPointsDescription(TrainingInfo trainingInfo){

    List<Widget> pointsListe = [];
    List<String> descSplit = trainingInfo.description.split("|");
    descSplit.forEach((texte) {
      pointsListe.add(
        Padding(padding: EdgeInsets.symmetric(vertical: 5),
        child:  Row(
          children: [
            Icon(

              Icons.fiber_manual_record, // Remplacez ceci par l'icône de votre choix
              color: Colors.white,
              size: 12,
            ),
            SizedBox(width: 10), // Espacement entre l'icône et le texte

            Expanded(child:  Container(
                child: Text(texte,style: TextStyle(fontSize: 14),
                )
            ),)

          ],
        ),
        )

      );
    });

    return Column(children: pointsListe,);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.1,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          color: Color(0xFF0F1923),
          child: SingleChildScrollView(
            child:
                Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 80,left: 15,right: 15),
                  child: Column(
                    children: <Widget>[

                      Text("${trainingInfo!.titre}",style: TextStyle(fontSize: 22,fontFamily: "Valorant"),textAlign: TextAlign.center,),
                      SizedBox(height: 10,),
                      numeroTraining!=null ? Text("Durée - ${player!.entrainement![numeroTraining!][1]}min",style: TextStyle(fontSize: 19)) : Container(),
                      SizedBox(height: 10,),
                      Text("Lieu - ${trainingInfo!.lieu}",style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset("${trainingInfo!.image}"),
                        )
                        ),


                      SizedBox(height: 20,),
                      buildPointsDescription(trainingInfo!)
                      /*
                      Text("${trainingInfo!.description}",textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),

                       */

                    ],
                  ),
                )


          ),
        );
      },
    );
  }

}