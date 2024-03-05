import 'package:flutter/material.dart';
import 'package:valorant_trainer/statics/Training.dart';

import '../animations/ScrollBehavior1.dart';
import '../global/GlobalVariable.dart';
import 'TrainDescription.dart';

class TrainListePage extends StatefulWidget {
  final String filter;
  final String filterValue;

  TrainListePage(this.filter, this.filterValue);

  @override
  _TrainListePageState createState() => _TrainListePageState(filter,filterValue);
}

class _TrainListePageState extends State<TrainListePage> {

  final String filter;
  final String filterValue;

  List<int> trainToShow=[];

  _TrainListePageState(this.filter, this.filterValue);

  @override
  void initState() {
    super.initState();

    if(filter == "dif"){

      trainingList.forEach((key, value) {

        if(value.dif == filterValue){
          trainToShow.add(key);
        }

      });

    }
    else if(filter == "cat"){

      trainingList.forEach((key, value) {

        List<String> splitCat = value.type.split("/");
        bool present = false;
        splitCat.forEach((element) {
          if(element==filterValue){
            present = true;
          }

        });

        if(present){
          trainToShow.add(key);
        }

      });

    }




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.filter}: ${widget.filterValue}'),
      ),
      body: ListView.builder(
        itemCount: trainToShow.length, // Nombre d'entrainements à afficher
        itemBuilder: (context, index) {
          return TrainingListItem(
            trainingInfo: trainingList[trainToShow[index]]!,
          );
        },
      ),
    );
  }
}

class TrainingListItem extends StatelessWidget {
  final TrainingInfo trainingInfo;


  TrainingListItem({
    required this.trainingInfo,

  });

  @override
  Widget build(BuildContext context) {
    return

      GestureDetector(
        onTap: (){

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
              GlobalVariable.toolContext2 = context;
              return ScrollConfiguration(
                behavior: ScrollBehavior1(),
                child: TrainDescription(trainingInfo,null,null),
              );
            },
          ).then((value) => GlobalVariable.toolContext2=null);

        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                trainingInfo.image, // Chemin vers l'image de l'entrainement
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trainingInfo.titre,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(trainingInfo.lieu),
                    Text(trainingInfo.dif),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
      ;
  }
}