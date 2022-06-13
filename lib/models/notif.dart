class Notif {
  // Fields within Notif table
  String notifID;
  String type;
  String senderID;
  String senderName;
  String senderPic;
  List<String> recipientList;
  String? otherInfo;

  // Constructor to initialize all fields
  Notif({
    required this.notifID,
    required this.type,
    required this.senderID,
    required this.senderName,
    required this.senderPic,
    required this.recipientList,
    this.otherInfo,
  });

  // Named constructor for when getting JSON object from firebase
  factory Notif.fromJson(Map<String, dynamic> map) => Notif(
        notifID: map['notifID'],
        type: map['type'],
        senderID: map['senderID'],
        senderName: map['senderName'],
        senderPic: map['senderPic'],
        recipientList: List<String>.from(map['recipientList']),
        otherInfo: map['otherInfo'],
      );

  // Instance method that returns Map<String, dynamic> so can be stored in firestore
  Map<String, dynamic> toJson() => {
        "notifID": notifID,
        "type": type,
        "senderID": senderID,
        "senderName": senderName,
        "senderPic": senderPic,
        "recipientList": List<dynamic>.from(recipientList),
        "otherInfo": otherInfo,
      };
}
