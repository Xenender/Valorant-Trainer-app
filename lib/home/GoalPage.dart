import 'package:flutter/material.dart';
import 'package:valorant_trainer/animations/SlidePageRoute.dart';
import '../animations/SlideFadePageRoute.dart';
import '../statics/BoutonValorant.dart';
import '../statics/Player.dart';
import '../statics/Ranks.dart' as ranks;
import 'ValorantStatsPage.dart';

/*
recuperation rank OBJECTIF
 */

class GoalPage extends StatefulWidget {

  Player player;

  GoalPage(this.player);

  @override
  State<GoalPage> createState() => _GoalPageState(player);
}


class _GoalPageState extends State<GoalPage> {

  int indexChoose = 0;
  Player player;
  _GoalPageState(this.player);
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: indexChoose);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Map<int,ranks.ImageInfo> ranksSup = {};

    ranks.rankList.forEach((key, value) {
      if(key>player.rankActu!){
        ranksSup[key] = value;
      }
    });

    print(ranksSup);

    return Scaffold(

        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text("Quel est votre objectif ?",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),

                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: ranksSup.length,
                        itemBuilder: (context, index) {
                          return ImageView(ranksSup[index+player.rankActu!+1]!);
                        },
                        onPageChanged: (index) {
                          setState(() {
                            indexChoose = index+player.rankActu!+1;
                          });
                        },
                      ),
                      Positioned(
                        left: 20,
                        child: (indexChoose > player.rankActu!+1) ?
                        IconButton(
                          onPressed: () {
                            _pageController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          icon: Icon(Icons.arrow_left,size: 40,),
                        ):Container(),
                      ),
                      Positioned(
                        right: 20,
                        child: (indexChoose < ranks.rankList.length - 1) ?
                        IconButton(
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          icon: Icon(Icons.arrow_right,size: 40,),
                        ):Container(),
                      ),
                    ],
                  ),
                ),

                BoutonValorant(
                  onTap: () {

                    if(indexChoose == 0){
                      indexChoose = player.rankActu!+1;
                    }
                    player.rankGoal = indexChoose;

                    print("${player.rankActu} |  ${player.rankGoal}");
                    Navigator.push(context, SlideFadePageRoute(page: ValorantStatsPage(player)));

                  },
                  text: "Suivant",
                  width: MediaQuery.of(context).size.width,

                )

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

