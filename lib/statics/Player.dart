import 'dart:convert';

class Player {
   int? rankActu;
   int? rankGoal;
   List<List<dynamic>>? kdRatio; // [[0.2, '12/02/2024'],...]
   List<List<dynamic>>? headShot;
   List<List<dynamic>>? win;
   List<List<dynamic>>? damageRound;
   List<int>? agents;
   int? joursSemaine;
   double? heureJours;

   List<String>? quality;
   List<String>? weakness;

   int? dayBeforeGoal;
   int? dayActu;

   List<List<dynamic>>? entrainement;

   List<bool?>? defiValide;

   Player({
      this.rankActu,
      this.rankGoal,
      this.kdRatio,
      this.headShot,
      this.win,
      this.damageRound,
      this.agents,
      this.joursSemaine,
      this.heureJours,
      this.quality,
      this.weakness,
      this.dayBeforeGoal,
      this.dayActu,
      this.entrainement,
      this.defiValide

   });

   // Méthode toJson pour convertir l'objet en Map JSON
   Map<String, dynamic> toJson() {
      return {
         'rankActu': rankActu,
         'rankGoal': rankGoal,
         'kdRatio': kdRatio,
         'headShot': headShot,
         'win': win,
         'damageRound': damageRound,
         'agents': agents,
         'joursSemaine': joursSemaine,
         'heureJours': heureJours,
         'quality':quality,
         'weakness':weakness,
         'dayBeforeGoal':dayBeforeGoal,
         'dayActu':dayActu,
         'entrainement':entrainement,
         'defiValide':defiValide
      };
   }

   // Constructeur nommé pour créer un objet Player à partir d'un Map JSON
   factory Player.fromJson(Map<String, dynamic> json) {
      return Player(
         rankActu: json['rankActu'],
         rankGoal: json['rankGoal'],
         kdRatio: json['kdRatio']!= null ? List<List<dynamic>>.from(json['kdRatio']) : null,
         headShot: json['headShot']!= null ? List<List<dynamic>>.from(json['headShot']) : null,
         win: json['win']!= null ? List<List<dynamic>>.from(json['win']) : null,
         damageRound: json['damageRound'] != null ? List<List<dynamic>>.from(json['damageRound']) : null,
         agents: json['agents'] != null ? List<int>.from(json['agents']) : null,
         joursSemaine: json['joursSemaine'],
         heureJours: json['heureJours'],
         quality: json['quality']!= null ? List<String>.from(json['quality']) : null,
         weakness: json['weakness']!= null ? List<String>.from(json['weakness']) : null,
          dayBeforeGoal: json['dayBeforeGoal'],
          dayActu: json['dayActu'],
         entrainement: json['entrainement']!= null ? List<List<dynamic>>.from(json['entrainement']) : null,
         defiValide: json['defiValide']!= null ? List<bool?>.from(json['defiValide']) : null,

      );
   }

   // Méthode pour créer un objet Player à partir d'un rang actuel spécifié
   factory Player.rankActu(int rankActu) {
      return Player(rankActu: rankActu);
   }

   // Méthode pour sérialiser l'objet Player en une chaîne JSON
   String toJsonString() {
      return json.encode(toJson());
   }

   // Méthode pour désérialiser une chaîne JSON en un objet Player
   static Player fromJsonString(String jsonString) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      print(3);
      return Player.fromJson(jsonMap);
   }
}
