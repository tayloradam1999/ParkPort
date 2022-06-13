class PPUser {
  // Fields within User table
  String userID;
  String email;
  String userName;
  String lowercaseName;
  String status;
  String location;
  String profilePicUrl;
  DateTime dateJoined;
  int points;
  List<String> friendList;
  List<String> friendNotifs;
  List<String> collectedStampList;
  List<String> stampNotifs;
  List<String> notifs;

  // Constructor to initialize all fields
  PPUser({
    required this.userID,
    required this.email,
    required this.userName,
    required this.lowercaseName,
    required this.status,
    required this.location,
    required this.profilePicUrl,
    required this.dateJoined,
    required this.points,
    required this.friendNotifs,
    required this.collectedStampList,
    required this.friendList,
    required this.stampNotifs,
    required this.notifs,
  });

  // Named constructor for when getting JSON object from firebase
  factory PPUser.fromJson(Map<String, dynamic> map) => PPUser(
        userID: map['userID'],
        email: map['email'],
        userName: map['userName'],
        lowercaseName: map['lowercaseName'],
        status: map['status'],
        location: map['location'],
        profilePicUrl: map['profilePicUrl'],
        // Firebase stores dates as "timestamp" so need to convert to DateTime
        dateJoined: DateTime.fromMillisecondsSinceEpoch(
            map['dateJoined'].millisecondsSinceEpoch),
        points: map['points'],
        friendList: List<String>.from(map['friendList']),
        friendNotifs: List<String>.from(map['friendNotifs']),
        collectedStampList: List<String>.from(map['collectedStampList']),
        stampNotifs: List<String>.from(map['stampNotifs']),
        notifs: List<String>.from(map['notifs']),
      );

  // Instance method that returns Map<String, dynamic> so can be stored in firestore
  Map<String, dynamic> toJson() => {
        "userID": userID,
        "email": email,
        "userName": userName,
        "lowercaseName": lowercaseName,
        "status": status,
        "location": location,
        "profilePicUrl": profilePicUrl,
        "dateJoined": dateJoined,
        "points": points,
        "friendList": friendList,
        "friendNotifs": friendNotifs,
        "collectedStampList": collectedStampList,
        "stampNotifs": stampNotifs,
        "notifs": notifs,
      };
}
