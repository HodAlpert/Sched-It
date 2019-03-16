import 'package:my_therapy_app/resources/Users//users.dart';
import 'package:my_therapy_app/resources/Projects/projects.dart';
import 'package:my_therapy_app/resources/Meetings/meetings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

abstract class BaseDataBase {

  User get_user(String user_id);

  Future<User> create_user(User user);

  Future<User> update_user(User user);

  Project get_project(String project_id);

  Future<Project> create_Project(Project project);

  Future<Project> update_project(Project project);

  Meeting get_meeting(String meeting_id);

  Future<Meeting> create_meeting(Meeting meeting);
}

class DataBase implements BaseDataBase{
  final _database = FirebaseDatabase.instance;

  Map<String, Project> Projects = new Map();
  Map<String, User> Users = new Map();
  Map<String, Meeting> Meetings = new Map();

  DatabaseReference ProjectReference;
  DatabaseReference UserReference;
  DatabaseReference MeetingsReference;

  DataBase() {
    _database.setPersistenceEnabled(true);
    ProjectReference = _database.reference().child('Projects');
    UserReference = _database.reference().child('Users');
    MeetingsReference = _database.reference().child('Events');
    ProjectReference.keepSynced(true);
    ProjectReference.onChildAdded.listen(_onProjectAdded);
    UserReference.onChildAdded.listen(_onUsersAdded);
    MeetingsReference.onChildAdded.listen(_onMeetingAdded);
  }

  @override
  Future<Project> create_Project(Project project) {
    ProjectReference.push().set(project.toJson());
    debugPrint("created project ${project.Name} in DB");
  }

  @override
  Future<Meeting> create_meeting(Meeting meeting) {
    MeetingsReference.push().set(meeting.toJson());
    debugPrint("created meeting ${meeting.ID} in DB");

  }

  @override
  Future<User> create_user(User user) {
    UserReference.push().set(user.toJson());
    debugPrint("created user ${user.ID} in DB");
  }

  @override
  Meeting get_meeting(String meeting_id) {
    debugPrint("getting meeting ${meeting_id} from DB");
    if (Meetings.containsKey(meeting_id)){
      return Meetings[meeting_id];
    }
    return null;
  }

  @override
  Project get_project(String project_id) {
    debugPrint("getting project ${project_id} from DB");
    if (Projects.containsKey(project_id)){
      return Projects[project_id];
    }
    return null;
  }

  @override
  User get_user(String user_id) {
    debugPrint("getting user ${user_id} from DB");
    if (Users.containsKey(user_id)){
      return Users[user_id];
    }
    return null;
  }

  @override
  Future<Project> update_project(Project project) {
    // TODO: implement update_project
    return null;
  }

  @override
  Future<User> update_user(User user) {
    // TODO: implement update_user
    return null;
  }
  _onMeetingAdded(Event event) {
    debugPrint("Adding Meeting ${event.snapshot.value["ID"]} to Meetings Map");
    Meetings.putIfAbsent(event.snapshot.value["ID"], () {Meeting.fromSnapshot(event.snapshot);});
  }
  _onProjectAdded(Event event) {
    debugPrint("Adding Project ${event.snapshot.value["ID"]} to Projects Map");
    Projects.putIfAbsent(event.snapshot.value["ID"], () {Project.fromSnapshot(event.snapshot);});
  }
  _onUsersAdded(Event event) {
    debugPrint("Adding User ${event.snapshot.value["ID"]} to Users Map");
    Users.putIfAbsent(event.snapshot.value["ID"], () {User.fromSnapshot(event.snapshot);});
  }
}