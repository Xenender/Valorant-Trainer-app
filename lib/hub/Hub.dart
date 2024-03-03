
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:valorant_trainer/home/HomePage.dart';
import 'package:valorant_trainer/hub/HubMain.dart';
import 'package:valorant_trainer/hub/StatsPage.dart';
import 'package:valorant_trainer/hub/ToolsPage.dart';
import 'package:valorant_trainer/hub/TrainPage.dart';




class Hub extends StatefulWidget {
  @override
  State<Hub> createState() => _HubState();
}


class _HubState extends State<Hub>{


  int _nav_selected_index = 0;
  List<Widget> _widgetOptions = <Widget>[
    HubMain(),
    TrainPage(),
    StatsPage(),
    ToolsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {

      _nav_selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:

      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(

              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.fitness_center),label: "Entrainement"),
                BottomNavigationBarItem(icon: Icon(Icons.trending_up),label: "Statistiques"),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Paramètres")
              ],
              currentIndex: _nav_selected_index,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              unselectedItemColor: Colors.white,
              onTap: _onItemTapped,
            ),
          )
      )

      ,


      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => _widgetOptions[_nav_selected_index],
          );
        },
      ),


    );
  }
}