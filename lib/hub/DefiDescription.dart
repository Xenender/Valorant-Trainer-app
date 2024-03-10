
import 'package:flutter/material.dart';
import 'package:valorant_trainer/statics/BoutonValorant.dart';
import 'package:valorant_trainer/statics/Training.dart';

import '../animations/SlideFadePageRoute.dart';
import '../global/GlobalVariable.dart';
import '../reactionTime/ReactionTest.dart';
import '../statics/Player.dart';

class DefiDescription extends StatefulWidget {

  Player? player;
  int? numeroDefi;

  DefiDescription(this.player,this.numeroDefi);



  @override
  _DefiDescriptionState createState() => _DefiDescriptionState(player,numeroDefi);

}

class _DefiDescriptionState extends State<DefiDescription> {

  Player? player;
  int? numeroDefi;

  _DefiDescriptionState(this.player,this.numeroDefi);

  @override
  void initState() {
    super.initState();
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

                    Text("${defiQuotidienList[numeroDefi!].titre}",style: TextStyle(fontSize: 22,fontFamily: "Valorant"),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Text("Durée - 5min",style: TextStyle(fontSize: 19)),
                    SizedBox(height: 10,),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset("${defiQuotidienList[numeroDefi!].image}",color: Colors.white,scale: 6,),
                        )
                    ),


                    SizedBox(height: 20,),
                    Container(
                      child: Text(
                        "Vous pourrez vous entrainer autant que vous voulez avant de lancer le defi, au moment de le lancer vous n'aurez plus qu'un essais pour le valider. Bonne chance!"
                      ,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20,),
                    BoutonValorant(text: "Lancer le defi", onTap: (){
                      GlobalVariable.toolContext2 = context;
                      Navigator.push(context, SlideFadePageRoute(page: defiQuotidienList[numeroDefi!].page)).then((value) => GlobalVariable.toolContext2=null);
                    })
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