class PPUser {
  // Fields within User table
  String userID;
  String email;
  String userName;
  String status;
  String location;
  DateTime dateJoined;
  String profilePicUrl;
  int points;
  List<String> friendList;
  List<String> collectedStampList;

  // Constructor to initialize all fields
  PPUser({
    required this.userID,
    required this.email,
    required this.userName,
    required this.status,
    required this.location,
    required this.dateJoined,
    required this.profilePicUrl,
    required this.points,
    required this.friendList,
    required this.collectedStampList,
  });

  // named constructor for when get JSON object from firebase
  factory PPUser.fromJson(Map<String, dynamic> map) => PPUser(
        userID: map['userID'],
        email: map['email'],
        userName: map['userName'],
        status: map['status'],
        location: map['location'],
        // Firebase stores dates as "timestamp" so need to convert to DateTime
        dateJoined: DateTime.fromMillisecondsSinceEpoch(
            map['dateJoined'].millisecondsSinceEpoch),
        profilePicUrl: map['profilePicUrl'],
        points: map['points'],
        friendList: List<String>.from(map['friendList']),
        collectedStampList: List<String>.from(map['collectedStampList']),
      );

  // instance method that returns Map<String, dynamic> so can be stored in firestore
  Map<String, dynamic> toJson() => {
        "userID": userID,
        "email": email,
        "userName": userName,
        "status": status,
        "location": location,
        "dateJoined": dateJoined,
        "profilePicUrl": profilePicUrl,
        "points": points,
        "friendList": friendList,
        "collectedStampList": collectedStampList,
      };
}
