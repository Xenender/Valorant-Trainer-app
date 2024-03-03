import 'package:flutter/material.dart';
import 'package:valorant_trainer/home/GoalPage.dart';
import '../animations/SlidePageRoute.dart';
import '../statics/Player.dart';
import '../statics/Ranks.dart' as ranks;

/*
recuperation rank actuel
 */

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int indexChoose = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text("Quel est votre rank ?",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
                Expanded(
                  child: PageView.builder(
                    itemCount: ranks.rankList.length-1,
                    itemBuilder: (context, index) {
                      return ImageView(ranks.rankList[index]!);
                    },
                    onPageChanged: (index){
                      indexChoose = index;
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)
                ,child:  Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                    child: ElevatedButton(onPressed: (){

                      print(indexChoose);

                      Player player = Player(rankActu: indexChoose);

                      Navigator.push(
                        context,
                        SlidePageRoute(page:GoalPage(player)),
                      );

                    }, child: Text("Suivant"),

                    ),
                  ),)



              ],
            ),
          )

        ),
      );

  }
}


class ImageView extends StatelessWidget {
  final ranks.ImageInfo imageInfo;

  ImageView(this.imageInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Image.asset(
            imageInfo.imagePath,
            fit: BoxFit.cover,
          ),
          height: 300,
          width: 300,
        ),
        SizedBox(height: 20),
        Text(
          imageInfo.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

