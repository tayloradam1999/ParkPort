class Stamp {
  // Fields within User table
  String stampID;
  String parkName;

  // Constructor to initialize all fields
  Stamp({
    required this.stampID,
    required this.parkName,
  });

  // Named constructor for when getting JSON object from firebase
  factory Stamp.fromJson(Map<String, dynamic> map) => Stamp(
        stampID: map['stampID'],
        parkName: map['parkName'],
      );

  // Instance method that returns Map<String, dynamic> so can be stored in firestore
  Map<String, dynamic> toJson() => {
        "stampID": stampID,
        "parkName": parkName,
      };
}
