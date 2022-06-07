class Stamp {
  // Fields within User table
  String stampID;
  String parkName;
  String imageURL;

  // Constructor to initialize all fields
  Stamp({
    required this.stampID,
    required this.parkName,
    required this.imageURL,
  });

  // named constructor for when get JSON object from firebase
  factory Stamp.fromJson(Map<String, dynamic> map) => Stamp(
        stampID: map['stampID'],
        parkName: map['parkName'],
        imageURL: map['imageURL'],
      );

  // instance method that returns Map<String, dynamic> so can be stored in firestore
  Map<String, dynamic> toJson() => {
        "stampID": stampID,
        "parkName": parkName,
        "imageURL": imageURL,
      };
}
