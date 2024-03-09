import 'package:flutter/material.dart';
import 'package:valorant_trainer/home/TimeChoosePage.dart';
import '../animations/SlideFadePageRoute.dart';
import '../animations/SlidePageRoute.dart';
import '../statics/Agents.dart';
import '../statics/BoutonValorant.dart';
import '../statics/Player.dart';

/*
recuperation champions préférés
 */

class AgentSelectionPage extends StatefulWidget {

  Player player;

  AgentSelectionPage(this.player);

  @override
  _AgentSelectionPageState createState() => _AgentSelectionPageState(player);
}

class _AgentSelectionPageState extends State<AgentSelectionPage> {
  List<int> selectedAgents = [];
  Player player;

  _AgentSelectionPageState(this.player);

  void _toggleAgentSelection(int agent) {
    setState(() {
      if (selectedAgents.contains(agent)) {
        selectedAgents.remove(agent);
      } else {
        if (selectedAgents.length < 3) {
          selectedAgents.add(agent);
        } else {
          // Vous pouvez ajouter une alerte ici pour informer l'utilisateur qu'il ne peut sélectionner que 3 agents.
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 50)

        ,
          Text("Vos trois agents préférés",style: TextStyle(fontSize: 20),),

          Expanded(
            child: ListView.builder(
              itemCount: AgentList.length,
              itemBuilder: (context, index) {
                final agent = index;
                return CheckboxListTile(
                  title: Text(AgentList[agent]!.name),
                  subtitle: Text(AgentList[agent]!.type),
                  value: selectedAgents.contains(agent),
                  onChanged: (value) {
                    _toggleAgentSelection(agent);
                  },
                );
              },
            ),
          ),

          BoutonValorant(
            onTap: () {

              if(selectedAgents.length >0){

                print(selectedAgents);

                player.agents = selectedAgents;

                Navigator.push(
                  context,
                  SlideFadePageRoute(page:TimeChoosePage(player)),
                );
              }
              else{

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Veuillez sélectionner au moins un agent.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }

            },
            text: "Suivant",
            width: MediaQuery.of(context).size.width,

          )
        ],
      ),
    );
  }
}
