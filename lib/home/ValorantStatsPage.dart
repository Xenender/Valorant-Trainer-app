import 'package:flutter/material.dart';
import 'package:valorant_trainer/home/AgentChoosePage.dart';

import '../animations/SlidePageRoute.dart';
import '../statics/Player.dart';

class ValorantStatsPage extends StatefulWidget {
  final Player player;

  ValorantStatsPage(this.player);

  @override
  _ValorantStatsPageState createState() => _ValorantStatsPageState(player);
}

class _ValorantStatsPageState extends State<ValorantStatsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double kdRatio = 0.0;
  double headshotPercentage = 0.0;
  double winPercentage = 0.0;
  double damagesPerRound = 0.0;
  Player player;

  _ValorantStatsPageState(this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Entrez vos statistiques:',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Vous pouvez trouver ces informations sur des sites tiers tel que "tracker.gg".',
                  style: TextStyle(fontSize: 13.0),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'K/D Ratio'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    setState(() {
                      kdRatio = double.tryParse(value) ?? 0.0;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer une valeur';
                    }
                    else if ((double.tryParse(value)??0.0) < 0 || (double.tryParse(value)??0.0) > 3){
                      return 'valeur non valide (entre 0 et 3)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Headshot %'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    setState(() {
                      headshotPercentage = double.tryParse(value) ?? 0.0;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer une valeur';
                    }
                    else if ((double.tryParse(value)??0.0) < 0 || (double.tryParse(value)??0.0) > 100){
                      return 'valeur non valide (entre 0 et 100)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Win %'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    setState(() {
                      winPercentage = double.tryParse(value) ?? 0.0;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer une valeur';
                    }
                    else if ((double.tryParse(value)??0.0) < 0 || (double.tryParse(value)??0.0) > 100){
                      return 'valeur non valide (entre 0 et 100)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Damages Per Round'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    setState(() {
                      damagesPerRound = double.tryParse(value) ?? 0.0;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer une valeur';
                    }
                    else if ((double.tryParse(value)??0.0) < 0 || (double.tryParse(value)??0.0) > 300){
                      return 'valeur non valide (entre 0 et 300)';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Si le formulaire est valide, naviguez vers la page suivante

                          player.kdRatio = [[kdRatio,DateTime.now().toString()]];
                          player.headShot = [[headshotPercentage,DateTime.now().toString()]];
                          player.win = [[winPercentage,DateTime.now().toString()]];
                          player.damageRound = [[damagesPerRound,DateTime.now().toString()]];

                          Navigator.push(
                            context,
                            SlidePageRoute(page: AgentSelectionPage(player)),
                          );
                        }
                      },
                      child: Text("Suivant"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )


    );
  }
}
