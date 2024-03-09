import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_trainer/home/HomePage.dart';
import 'package:valorant_trainer/themes/ThemeValo.dart';
import 'package:flutter/services.dart';


import 'hub/Hub.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Valorant Trainer',
      theme: AppTheme.themeValo,
      home:

          DoubleBack(
            message: "Appuyez à nouveau pour quitter l'application",
            textStyle: TextStyle(fontSize: 17,color: Colors.white),
            child:  FutureBuilder<Widget>(
              future: chooseFirstPage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // En attendant la résolution de la future
                } else if (snapshot.hasError) {
                  print('Erreur : ${snapshot.error}');
                  return Center(child: Text("Erreur, veuillez relancer l'application"),);
                } else {
                  return snapshot.data??Center(child: Text("Erreur, veuillez relancer l'application"));
                }
              },
            ),
          )

     ,
    );
  }


  Future<Widget> chooseFirstPage() async {
    bool isconnected = await userConnected();
    if(isconnected){

      return Hub();
    }
    else{
      return HomePage();
    }
  }


  Future<bool> userConnected() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getString("playerKey") != null){
        return true;
    }
    else{
      return false;
    }

  }

}
