

import 'Agents.dart';
import 'Player.dart';
import 'Training.dart';
import 'dart:math';


class TrainBuilder {



  Map<int,Map<String,double>> valuesByRank = {};


  Player? player;

  TrainBuilder(this.player){
    valuesByRank = {

      0:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7

      },
      1:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      2:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      3:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      4:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      5:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      6:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      7:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      8:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      9:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      10:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      11:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      12:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      13:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      14:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      15:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      16:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      17:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      18:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      19:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      20:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      21:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },
      22:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7

      },
      23:{
        "kdRatio":1,
        "headShot":20,
        "win":50,
        "damageRound":135,
        "heureJours":2,
        "joursSemaine":3,
        "tpsDispo": 7
      },

    };

  }



  List<List<String>> createQualityWeakness(){

    int rankActu = player!.rankActu!;
    List<String> quality = [];
    List<String> weakness = [];


    if(player!.headShot![player!.headShot!.length-1][0] <= valuesByRank[rankActu]!["headShot"]){

      if(weakness.length<3) weakness.add("Crosshair placement");
    }
    else{
      if(quality.length<3) quality.add("Crosshair placement");
    }

    if(player!.damageRound![player!.damageRound!.length-1][0] <= valuesByRank[rankActu]!["damageRound"]){
      if(weakness.length<3) weakness.add("Aim/Tracking");

    }
    else{

      if(quality.length<3) quality.add("Aim/Tracking");
      
    }

    if(player!.win![player!.win!.length-1][0] <= valuesByRank[rankActu]!["win"]){
      if(weakness.length<3) weakness.add("Inconstance de statistiques");

    }
    else{

      if(quality.length<3) quality.add("Constance de statistiques");
      
    }

    if(player!.kdRatio![player!.kdRatio!.length-1][0] <= valuesByRank[rankActu]!["kdRatio"]){
      if(weakness.length<3) weakness.add("Mauvais positionnement");

    }
    else{

      if(quality.length<3) quality.add("Bon positionnement");
      
    }

    double tpsDispoCalcul = player!.heureJours! * player!.joursSemaine!;

    if(tpsDispoCalcul <= valuesByRank[rankActu]!["tpsDispo"]!){
      if(weakness.length<3) weakness.add("Temps disponible");

    }
    else{

      if(quality.length<3) quality.add("Temps disponible");

    }

    List<int> agents = player!.agents!;
    List<String> agentsType = [];
    bool flex = false;
    agents.forEach((element) {
      agentsType.add(AgentList[element]!.type);
    });
    String first = agentsType.first;

    agentsType.forEach((element) {
      if(element != first){
        flex = true;
      }
    });

    if(!flex){
      if(weakness.length<3) weakness.add("non flexibilité d'agents");
    }
    else{
      if(quality.length<3) quality.add("Flexibilité d'agents");
    }


    //remplir si il y a pas 3
    List<String> qualityPlus = ["Motivation", "Détermination", "Passion"];
    List<String> weakNessPlus = ["Concentration", "Impatience","Trop fort"];

    int i =0;
    while(weakness.length < 3){
      weakness.add(weakNessPlus[i]);
      i=i+1;
    }
    i=0;
    while(quality.length < 3){
      quality.add(qualityPlus[i]);
      i=i+1;
    }

    return [quality,weakness];
  }

  List<int> createEntrainement(){

    List<int> entrainement = [];
    Random random = Random();
    for(int i=0;i<player!.dayBeforeGoal!;i++){


      int indexAleatoire = random.nextInt(trainingList.length);
      entrainement.add(indexAleatoire);

    }

    return entrainement;
  }




}