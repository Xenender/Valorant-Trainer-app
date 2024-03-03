class AgentInfo {
  final String name;
  final String type;
  final String? imagePath;

  AgentInfo({required this.name, required this.type, this.imagePath});
}

Map<int,AgentInfo> AgentList = {
  0:AgentInfo(name: "Brimstone",type: "Controller"),
  1:AgentInfo(name: "Viper",type: "Controller"),
  2:AgentInfo(name: "Astra",type: "Controller"),
  3:AgentInfo(name: "Harbor",type: "Controller"),
  4:AgentInfo(name: "Omen",type: "Controller"),

  5:AgentInfo(name: "Phoenix",type: "Duelist"),
  6:AgentInfo(name: "Jett",type: "Duelist"),
  7:AgentInfo(name: "Reyna",type: "Duelist"),
  8:AgentInfo(name: "Raze",type: "Duelist"),
  9:AgentInfo(name: "Yoru",type: "Duelist"),
  10:AgentInfo(name: "Neon",type: "Duelist"),
  11:AgentInfo(name: "Iso",type: "Duelist"),

  12:AgentInfo(name: "Sova",type: "Initiator"),
  13:AgentInfo(name: "Breach",type: "Initiator"),
  14:AgentInfo(name: "Skye",type: "Initiator"),
  15:AgentInfo(name: "KAY/O",type: "Initiator"),
  16:AgentInfo(name: "Fade",type: "Initiator"),
  17:AgentInfo(name: "Gekko",type: "Initiator"),

  18:AgentInfo(name: "Killjoy",type: "Sentinel"),
  19:AgentInfo(name: "Cypher",type: "Sentinel"),
  20:AgentInfo(name: "Sage",type: "Sentinel"),
  21:AgentInfo(name: "Chamber",type: "Sentinel"),
  22:AgentInfo(name: "Deadlock",type: "Sentinel"),


};