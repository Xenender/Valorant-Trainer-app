import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valorant_trainer/home/HomePage.dart';

import '../statics/Player.dart';

import '../statics/Ranks.dart';

/*
Bouton reinitialiser le profil : supprime sharedpref + renvoie sur la premiere page
privacy policy
term of uses
contact

 */

class ToolsPage extends StatefulWidget {
  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 100,horizontal: 20),
          child: Column(
            children: [

              Padding(padding: EdgeInsets.all(10)
                ,child:  Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {

                          return Color(0xFF52907E); // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () async {

                      final Uri url = Uri.https(
                        "privacy-policy-d508b.web.app",
                      );
                      try{
                        await launchUrl(url);
                      }
                      catch(e){
                        print("erreur ed lancement du site !!!!");
                        print(e);
                      }


                    }, child: Text("politique de confidentialité"),

                  ),
                ),)
              ,

              Padding(padding: EdgeInsets.all(10)
                ,child:  Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                  child: ElevatedButton(

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {

                          return Color(0xFF52907E); // Use the component's default.
                        },
                      ),
                    ),

                    onPressed: (){

                      final snackBar = SnackBar(
                        content: Text('Non implémenté'),
                        duration: Duration(seconds: 2), // Durée du message
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }, child: Text("Suivez-nous"),

                  ),
                ),)

              ,

              Padding(padding: EdgeInsets.all(10)
                ,child:  Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                  child: ElevatedButton(onPressed: () {

                    _showDeleteConfirmationDialog(context);


                  }, child: Text("Réinitialiser le programme d'entrainement",textAlign: TextAlign.center,),

                  ),
                ),)

            ],
          ),
        )


    );


  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context2) async {
    return showDialog(
      context: context2,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Êtes-vous sûr de vouloir réinitialiser le programme d'entrainement ?"),
          actions: <Widget>[
            TextButton(
              child: Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
            ),
            TextButton(
              child: Text("Réinitialiser"),
              onPressed: () async {

                SharedPreferences.getInstance().then((prefs) {
                  prefs.remove("playerKey");

                  Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  );

                });


              },
            ),
          ],
        );
      },
    );
  }

  _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Impossible de lancer le site $url';
    }
  }

}
