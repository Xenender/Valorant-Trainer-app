class TrainingInfo {
  final String titre;
  final String lieu;
  final String description;
  final String type;
  final String image;
  final String dif;

  TrainingInfo({required this.titre, required this.lieu, required this.description, required this.type, required this.image,required this.dif });




}

String typeToShow(String type){
  List<String> typeSplit = type.split("/");

  String typereturn = "";

  switch(typeSplit[0]){
    case "Aim":
      typereturn = "aim";
      break;

    case "Tracking":
      typereturn = "tracking";
      break;

    case "Crosshair placement":
      typereturn = "crosshair";
      break;

    case "Reaction":
      typereturn = "reaction";
      break;

    case "Game Sense":
      typereturn = "gamesense";
      break;

    case "Positioning":
      typereturn = "positioning";
      break;

    case "Spray control":
      typereturn = "spray";
      break;

    default:
      typereturn = "aim";
      break;

  }

  return typereturn;
}

List<List<String>> typeList =
[
  ["Aim","assets/types/aim.png"],
  ["Tracking","assets/types/tracking.png"],
  ["Crosshair placement","assets/types/crosshair.png"],
  ["Reaction","assets/types/reaction.png"],
  ["Game Sense","assets/types/gamesense.png"],
  ["Positioning","assets/types/positioning.png"],
  ["Spray control","assets/types/spray.png"]
];

List<List<String>> difficulyList =
[
  ["Facile","assets/difficulty/facile.png"],
  ["Moyen","assets/difficulty/moyen.png"],
  ["Difficile","assets/difficulty/difficile.png"],
  ["Expert","assets/difficulty/expert.png"],
];

Map<int,TrainingInfo> trainingList =

{
  0: TrainingInfo(
      titre: "Aim basique 1",
      lieu:"Valorant",
      dif:"Difficile",
      description:"Rendez-vous dans le camp d'entrainement de Valorant, l'entrainement consiste à tuer des bots immobiles. Vous devez lancer l'entrainement en mode difficile(vous pouvez commencer par moyen pour vous habituer). Fixez vous un objectif de kill (Vous ne devrez tuer qu'avec un Headshot) et essayez de l'atteindre le plus de fois possible dans l'intervalle imparti. Bon courage !",
      type:"Aim/Reaction",
      image:"assets/gif/gif_test.gif")
  ,
  1: TrainingInfo(
      titre: "Tracking 1",
      lieu:"Valorant",
      dif:"Facile",
      description:"Cet entrainement peut s'effectuer dans n'importe quelle partie entre les manches. Suivez les mouvements de vos coéquipiers avec votre viseur tout en maintenant une précision maximale. Essayez de garder votre viseur sur les joueurs en mouvement constant et ajustez votre sensibilité si nécessaire. Améliorez votre capacité à suivre les ennemis et à maintenir votre visée pendant les combats. Bon tracking !",
      type:"Aim/Tracking",
      image:"assets/gif/gif_test.gif"
      )
  ,
  2: TrainingInfo(

      titre: "Crosshair placement 1",
      lieu:"Valorant",
      dif:"Moyen",
      description:"Rendez-vous dans le camp d'entrainement de Valorant dans la partie entrainement au désamorçage. Lancez l'entrainement en mode difficile, vous devrez avoir un bon crosshair placement pour détruire les bots sans vous faire tuer, vous pouvez pousser l'exercice en ne jouant les entrainements qu'au Sheriff. L'entrainement consiste à réussir plusieurs fois de suite cet exercice. Bonne chance !",
      type:"Crosshair placement/Aim",
      image:"assets/gif/gif_test.gif"

  )
  ,
  3: TrainingInfo(
      titre: "Positionnement 1",
      lieu:"Valorant",
      dif:"difficile",
      description:"Dans une partie personnalisée de Valorant, concentrez-vous sur votre positionnement et votre capacité à vous repositionner rapidement en fonction de la situation. Exercez-vous à choisir les bons angles de prise de vue, à utiliser les couvertures efficacement et à vous déplacer de manière stratégique pour éviter les lignes de tir ennemies. Pratiquez également à identifier les moments opportuns pour vous replacer et à communiquer efficacement avec votre équipe pour coordonner vos mouvements. Améliorez votre jeu en équipe et votre capacité à survivre dans des situations difficiles en perfectionnant votre positionnement et votre repositionnement. Bonne pratique !",
      type:"Game Sense/Positioning",
      image:"assets/gif/gif_test.gif"
  )
  ,
  4: TrainingInfo(
      titre: "Spray control 1",
      lieu:"Valorant",
      dif:"Moyen",
      description:"Rendez-vous dans le camp d'entrainement de Valorant devant la cible, l'entrainement consiste à contrôler le recul de votre arme lorsque vous tirez en rafale. Placez la cible et le bot à 20mètres, faites des sessions de rafale d'une dizaine de seconde maximum, arretez puis recommencez. Bon spray control !",
      type:"Aim/Spray control",
      image:"assets/gif/gif_test.gif"
  )

  ,

  5: TrainingInfo(
      titre: "Peak Control 1",
      lieu: "Valorant",
      dif: "Facile",
      description: "Pratiquez votre contrôle des pics en vous entraînant à exposer et à cacher rapidement votre avatar derrière les angles. Utilisez des cartes personnalisées pour simuler différentes situations de jeu et entraînez-vous à être prêt à tirer dès que vous faites un peek. Concentrez-vous sur la réduction du temps d'exposition tout en maintenant une précision maximale. Améliorez votre capacité à engager des duels de manière efficace et sûre. Bonne pratique !",
      type: "Game Sense/Positioning",
      image: "assets/gif/gif_test.gif"
  ),

  6: TrainingInfo(
      titre: "Crosshair Placement - Sheriff Only",
      lieu: "Valorant",
      dif: "Expert",
      description: "Participez à un Deathmatch en n'utilisant que le Sheriff, une arme à un seul coup. Concentrez-vous sur votre placement de crosshair afin de maximiser vos chances de réussir des tirs à la tête. Anticipez les mouvements des adversaires et pré-positionnez votre viseur là où vous pensez qu'ils vont apparaître. N'oubliez pas que vous n'avez qu'une seule chance de tuer, alors soyez précis et réactif. Améliorez votre crosshair placement pour toutes les armes en vous entraînant avec le Sheriff dans des situations de duel intenses. Bonne précision !",
      type: "Aim/Crosshair Placement",
      image: "assets/gif/gif_test.gif"
  ),

  7: TrainingInfo(
      titre: "Spike Rush Advantage",
      lieu: "Valorant",
      dif: "Moyen",
      description: "Entraînez-vous à capitaliser sur les premiers rounds de la partie Spike Rush pour obtenir un avantage décisif. Jouez chaque round comme si c'était une partie classée, en utilisant une variété d'armes et de stratégies pour dominer rapidement l'adversaire. Chaque round compte, alors assurez-vous de maintenir la pression sur vos adversaires dès le début. Améliorez votre capacité à prendre un avantage dès le départ et à le conserver jusqu'à la fin du match. Bonne compétition !",
      type: "Game Sense",
      image: "assets/gif/gif_test.gif"
  ),
  8: TrainingInfo(
      titre: "Test de points",
      lieu: "Valorant",
      dif: "Moyen",
      description: "Rendez vous dans le Training range de valorant|Lancez l'entrainement en mode difficile, pas d'armure, munitions illimitées|Vous ne devez tuer qu'avec un headshot|Objectif: 15kills",
      type: "Game Sense",
      image: "assets/gif/gif_test.gif"
  ),



};


    /*

{

    "titre": "Aim basique 1",
    "lieu":"Valorant",
    "description":"Rendez-vous dans le camp d'entrainement de Valorant, l'entrainement consiste à tuer des bots immobiles. Vous devez lancer l'entrainement en mode difficile(vous pouvez commencer par moyen pour vous habituer). Fixez vous un objectif de kill (Vous ne devrez tuer qu'avec un Headshot) et essayez de l'atteindre le plus de fois possible dans l'intervalle imparti. Bon courage !",
    "type":"Aim/Reaction",
    "image":""},
  {
    "titre": "Tracking 1",
    "lieu":"Valorant",
    "description":"Cet entrainement peut s'effectuer dans n'importe quelle partie entre les manches. Suivez les mouvements de vos coéquipiers avec votre viseur tout en maintenant une précision maximale. Essayez de garder votre viseur sur les joueurs en mouvement constant et ajustez votre sensibilité si nécessaire. Améliorez votre capacité à suivre les ennemis et à maintenir votre visée pendant les combats. Bon tracking !",
    "type":"Aim/Tracking",
    "image":""},

  {
    "titre": "Aim basique 1",
    "lieu":"Valorant",
    "description":"Rendez-vous dans le camp d'entrainement de Valorant dans la partie entrainement au désamorçage. Lancez l'entrainement en mode difficile, vous devrez avoir un bon crosshair placement pour détruire les bots sans vous faire tuer, vous pouvez pousser l'exercice en ne jouant les entrainements qu'au Sheriff. L'entrainement consiste à réussir plusieurs fois de suite cet exercice. Bonne chance !",
    "type":"Crosshair placement/Aim",
    "image":""}
*/