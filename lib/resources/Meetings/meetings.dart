import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

class Meeting{
  String ID = Uuid().v4();
  DateTime Beggining;
  int DurationInMinutes;
  String Location;

  Meeting(this.Beggining, this.DurationInMinutes, this.Location);

  Meeting.fromSnapshot(DataSnapshot snapshot) :
        ID = snapshot.value["ID"],
        Beggining = snapshot.value["Beggining"],
        DurationInMinutes = snapshot.value["DurationInMinutes"],
  //TODO how to parse date from database
        Location = snapshot.value["Location"];

  toJson(){
    return {
      "ID":ID,
      "Beggining":Beggining,
      "DurationInMinutes":DurationInMinutes,
      "Location":Location
    };
  }
}