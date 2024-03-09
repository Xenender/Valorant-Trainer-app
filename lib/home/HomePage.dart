import 'package:flutter/material.dart';
import 'package:valorant_trainer/home/GoalPage.dart';
import '../animations/SlideFadePageRoute.dart';
import '../animations/SlidePageRoute.dart';
import '../statics/BoutonValorant.dart';
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
    return Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(height: 30),
            Text(
              "Quel est votre rank ?",
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                  PageView.builder(
                  controller: _pageController,
                  itemCount: ranks.rankList.length - 1,
                  itemBuilder: (context, index) {
                    return ImageView(ranks.rankList[index]!);
                  },
                  onPageChanged: (index) {
                    setState(() {
                      indexChoose = index;
                    });
                  },
                ),
                Positioned(
                    left: 20,
                    child: (indexChoose > 0) ?
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
            child: (indexChoose < ranks.rankList.length - 2) ?
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

                      print(indexChoose);
                      Player player = Player(rankActu: indexChoose);
                      Navigator.push(
                        context,
                        SlideFadePageRoute(page: GoalPage(player)),
                      );

                    },
                    text: "Suivant",
                    width: MediaQuery.of(context).size.width,

                  )
    ],
    ),
    ),
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

