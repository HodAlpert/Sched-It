import 'package:firebase_database/firebase_database.dart';

class Project{
  String ID;
  String Name;
  String Type;
  String Description;
  List<String> PossibleTherapyLocation;
  List<String> Patients;
  List<String> Managers;
  String ProjectMail;
  String ProjectPhone;
  String ProjectInstegram;
  String ProjectFacebook;


  Project(this.Name, this.Type, this.Description);

  Project.fromSnapshot(DataSnapshot snapshot) :
        ID = snapshot.key,
        Name = snapshot.value["Name"],
        Type = snapshot.value["Type"],
        Description = snapshot.value["Description"],
        PossibleTherapyLocation = snapshot.value["PossibleTherapyLocation"],
        Patients = snapshot.value["Patients"],
        Managers = snapshot.value["Managers"],
        ProjectMail = snapshot.value["ProjectMail"],
        ProjectPhone = snapshot.value["ProjectPhone"],
        ProjectInstegram = snapshot.value["ProjectInstegram"],
        ProjectFacebook = snapshot.value["ProjectFacebook"];

  toJson(){
    return {
      "ID":ID,
      "Name":Name,
      "Type": Type,
      "Description": Description,
      "PossibleTherapyLocation": PossibleTherapyLocation,
      "Patients": Patients,
      "Managers": Managers,
      "ProjectMail": ProjectMail,
      "ProjectPhone": ProjectPhone,
      "ProjectInstegram": ProjectInstegram,
      "ProjectFacebook": ProjectFacebook
    };
  }
  //TODO add geters and seters for project additional data
}