class TrainingInfo {
  final String titre;
  final String lieu;
  final String description;
  final String type;
  final String image;
  final String dif;

  TrainingInfo({required this.titre, required this.lieu, required this.description, required this.type, required this.image,required this.dif });
}

List<List<String>> typeList =
[
  ["Aim","assets/ranks/plat.png"],
  ["Tracking","assets/ranks/plat.png"],
  ["Crosshair placement","assets/ranks/plat.png"],
  ["Reaction","assets/ranks/plat.png"],
  ["Game Sense","assets/ranks/plat.png"],
  ["Positioning","assets/ranks/plat.png"]
];

List<List<String>> difficulyList =
[
  ["Facile","assets/ranks/plat.png"],
  ["Moyen","assets/ranks/plat.png"],
  ["Difficile","assets/ranks/plat.png"],
  ["Expert","assets/ranks/plat.png"],
];

Map<int,TrainingInfo> trainingList =

{
  0: TrainingInfo(
      titre: "Aim basique 1",
      lieu:"Valorant",
      dif:"Difficile",
      description:"Rendez-vous dans le camp d'entrainement de Valorant, l'entrainement consiste à tuer des bots immobiles. Vous devez lancer l'entrainement en mode difficile(vous pouvez commencer par moyen pour vous habituer). Fixez vous un objectif de kill (Vous ne devrez tuer qu'avec un Headshot) et essayez de l'atteindre le plus de fois possible dans l'intervalle imparti. Bon courage !",
      type:"Aim/Reaction",
      image:"assets/ranks/plat.png")
  ,
  1: TrainingInfo(
      titre: "Tracking 1",
      lieu:"Valorant",
      dif:"Facile",
      description:"Cet entrainement peut s'effectuer dans n'importe quelle partie entre les manches. Suivez les mouvements de vos coéquipiers avec votre viseur tout en maintenant une précision maximale. Essayez de garder votre viseur sur les joueurs en mouvement constant et ajustez votre sensibilité si nécessaire. Améliorez votre capacité à suivre les ennemis et à maintenir votre visée pendant les combats. Bon tracking !",
      type:"Aim/Tracking",
      image:"assets/ranks/plat.png"
      )
  ,
  2: TrainingInfo(

      titre: "Crosshair placement 1",
      lieu:"Valorant",
      dif:"Moyen",
      description:"Rendez-vous dans le camp d'entrainement de Valorant dans la partie entrainement au désamorçage. Lancez l'entrainement en mode difficile, vous devrez avoir un bon crosshair placement pour détruire les bots sans vous faire tuer, vous pouvez pousser l'exercice en ne jouant les entrainements qu'au Sheriff. L'entrainement consiste à réussir plusieurs fois de suite cet exercice. Bonne chance !",
      type:"Crosshair placement/Aim",
      image:"assets/ranks/plat.png"

  )
  ,
  3: TrainingInfo(
      titre: "Positionnement 1",
      lieu:"Valorant",
      dif:"difficile",
      description:"Dans une partie personnalisée de Valorant, concentrez-vous sur votre positionnement et votre capacité à vous repositionner rapidement en fonction de la situation. Exercez-vous à choisir les bons angles de prise de vue, à utiliser les couvertures efficacement et à vous déplacer de manière stratégique pour éviter les lignes de tir ennemies. Pratiquez également à identifier les moments opportuns pour vous replacer et à communiquer efficacement avec votre équipe pour coordonner vos mouvements. Améliorez votre jeu en équipe et votre capacité à survivre dans des situations difficiles en perfectionnant votre positionnement et votre repositionnement. Bonne pratique !",
      type:"Game Sense/Positioning",
      image:"assets/ranks/plat.png"
  )




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