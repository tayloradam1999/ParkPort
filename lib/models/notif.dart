class Notif {
  // Fields within Notif table
  String notifID;
  String type;
  String senderID;
  String senderName;
  String senderPic;
  List<String> recipientList;
  DateTime notifSent;
  String? stampID;

  // Constructor to initialize all fields
  Notif({
    required this.notifID,
    required this.type,
    required this.senderID,
    required this.senderName,
    required this.senderPic,
    required this.recipientList,
    required this.notifSent,
    this.stampID,
  });

  // Named constructor for when getting JSON object from firebase
  factory Notif.fromJson(Map<String, dynamic> map) => Notif(
        notifID: map['notifID'],
        type: map['type'],
        senderID: map['senderID'],
        senderName: map['senderName'],
        senderPic: map['senderPic'],
        recipientList: List<String>.from(map['recipientList']),
        notifSent: DateTime.fromMillisecondsSinceEpoch(
            map['notifSent'].millisecondsSinceEpoch),
        stampID: map['stampID'],
      );

  // Instance method that returns Map<String, dynamic> so can be stored in firestore
  Map<String, dynamic> toJson() => {
        "notifID": notifID,
        "type": type,
        "senderID": senderID,
        "senderName": senderName,
        "senderPic": senderPic,
        "recipientList": recipientList,
        "notifSent": notifSent,
        "stampID": stampID,
      };
}
