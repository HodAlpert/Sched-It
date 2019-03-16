import 'package:my_therapy_app/resources/Projects/projects.dart';
import 'package:my_therapy_app/UI/common/common.dart';
import 'package:firebase_database/firebase_database.dart';

class User{
  String ID;
  String Name;
  String Email;
  int Age;
  String Gender;
  String Address;
  Project CurrentProject;
  ProjectRole CorrentProjectRole;
  List<String> ManagedProjects;
  List<String> TherapyProjects;

  User(this.Name, this.Email, this.Age, this.Gender, this.Address);

  User.fromSnapshot(DataSnapshot snapshot) :
        ID = snapshot.key,
        Name = snapshot.value["Name"],
        Email = snapshot.value["Email"],
        Age = snapshot.value["Age"],
        Gender = snapshot.value["Gender"],
        Address = snapshot.value["Address"],
        CurrentProject=snapshot.value["CurrentProject"],
        CorrentProjectRole=snapshot.value["CorrentProjectRole"],
        ManagedProjects = get_managed_projects_from_snapshot(snapshot),
        TherapyProjects=get_therapy_projects_from_snapshot(snapshot);

  toJson(){
    return {
      "ID": ID,
      "Name":Name,
      "Email":Email,
      "Age":Age,
      "Gender": Gender,
      "Address":Address,
      "CurrentProject": CurrentProject,
      "CorrentProjectRole":CorrentProjectRole,
      "ManagedProjects":ManagedProjects,
      "TherapyProjects":TherapyProjects
    };
  }
  static List<String> get_managed_projects_from_snapshot(DataSnapshot snapshot){
    List<String> managed_projects = [];
    for (var project in snapshot.value["ManagedProjects"]){
      managed_projects.add(project);
    }
    return managed_projects;
  }

  static List<String> get_therapy_projects_from_snapshot(DataSnapshot snapshot){
    List<String> therapy_projects = [];
    for (var project in snapshot.value["TherapyProjects"]){
      therapy_projects.add(project);
    }
    return therapy_projects;
  }

}
