class PPUser {
  // Fields within User table
  String userID;
  String email;
  String userName;
  String status;
  String lowercaseName;
  DateTime dateJoined;
  String profilePicUrl;
  int points;
  List<String> friendNotifs;
  List<String> friendList;
  List<String> collectedStampList;
  List<String> stampNotifs;

  // Constructor to initialize all fields
  PPUser({
    required this.userID,
    required this.email,
    required this.userName,
    required this.lowercaseName,
    required this.status,
    required this.dateJoined,
    required this.profilePicUrl,
    required this.points,
    required this.friendList,
    required this.friendNotifs,
    required this.collectedStampList,
    required this.stampNotifs,
  });

  // named constructor for when get JSON object from firebase
  factory PPUser.fromJson(Map<String, dynamic> map) => PPUser(
        userID: map['userID'],
        email: map['email'],
        userName: map['userName'],
        lowercaseName: map['lowercaseName'],
        status: map['status'],
        // Firebase stores dates as "timestamp" so need to convert to DateTime
        dateJoined: DateTime.fromMillisecondsSinceEpoch(
            map['dateJoined'].millisecondsSinceEpoch),
        profilePicUrl: map['profilePicUrl'],
        points: map['points'],
        friendList: List<String>.from(map['friendList']),
        friendNotifs: List<String>.from(map['friendNotifs']),
        collectedStampList: List<String>.from(map['collectedStampList']),
        stampNotifs: List<String>.from(map['stampNotifs']),
      );

  // instance method that returns Map<String, dynamic> so can be stored in firestore
  Map<String, dynamic> toJson() => {
        "userID": userID,
        "email": email,
        "userName": userName,
        "lowercaseName": lowercaseName,
        "status": status,
        "dateJoined": dateJoined,
        "profilePicUrl": profilePicUrl,
        "points": points,
        "friendList": friendList,
        "friendNotifs": friendNotifs,
        "collectedStampList": collectedStampList,
        "stampNotifs": stampNotifs,
      };
}
