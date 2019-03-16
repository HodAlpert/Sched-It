import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:my_therapy_app/UI/common/common.dart';
import 'package:my_therapy_app/UI/drawer/DrawerLists.dart';
import 'package:my_therapy_app/resources/Meetings/MeetingCard.dart';
import 'package:my_therapy_app/resources/Meetings/meetings.dart';
import 'package:my_therapy_app/resources/Projects/ProjectCard.dart';
import 'package:my_therapy_app/resources/Projects/projects.dart';
import 'package:my_therapy_app/resources/Users//users.dart';
import 'package:my_therapy_app/resources/Users/UserCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_therapy_app/services/Authantication.dart';
import 'package:my_therapy_app/services/DataBase.dart';

class HomePage extends StatefulWidget{

  HomePage(this.auth, {Key key}) : super(key: key);
  final BaseAuth auth;
  final DataBase _database = new DataBase();
  Project current_project;
  User current_user;

  _HomePageState _create_state() {
    return _HomePageState();
  }

  @override
  _HomePageState createState() => _create_state();
}


class _HomePageState extends State<HomePage>{
  AuthStatus authStatus =  AuthStatus.LOGGED_IN_ADMIN;
  Project project = Project("hod111", "hod22", "description");
  _HomePageState();

  @override
  void initState() {
    super.initState();
    debugPrint("executing init _HomePageState");
    widget._database.create_Project(project);
    widget.current_user = get_current_user;
    widget.current_project = get_current_project;
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          print(1); // TODO support getting user
        }
        //TODO support login state
        authStatus =
        user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN_ADMIN;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    //TODO support users and projects
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue
        ,
        title: Text('Sched-It',
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20.0)),
      ),
      drawer: Drawer(
        child: drawer,
      ),
      body: new Container(
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
    color: Colors.blueGrey[900],
    ),

    child: new SingleChildScrollView(
    child: new Column(
    children: <Widget>[
//      ProjectCard(widget.example_project),
      ExpansionTile(
        initiallyExpanded:true,
        leading: Icon(GroovinMaterialIcons.cloud_circle, color: Colors.indigoAccent,),
        title: Text(
          "Current Project",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        children: <Widget>[
          ProjectCard(widget.current_project),
        ],
      ),
      Divider(color: Colors.white,),
      ExpansionTile(
        initiallyExpanded:true,
        leading: Icon(GroovinMaterialIcons.account, color: Colors.indigoAccent,),
        title: Text(
          "My Account",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        children: <Widget>[
          UserCard(widget.current_user),
        ],
      ),
      Divider(color: Colors.white,),
      ExpansionTile(
        initiallyExpanded:true,
        leading: Icon(GroovinMaterialIcons.calendar, color: Colors.indigoAccent,),
        title: Text(
          "My Meetings",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        children: meetings
      ),
      Divider(color: Colors.white,),
      ExpansionTile(
        leading: Icon(Icons.alternate_email, color: Colors.indigoAccent,),
        title: Text(
          "Contact Manager",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        children: <Widget>[

          ListTile(
            leading: Icon(GroovinMaterialIcons.gmail, color: Colors.orange,),
            title: Text("lielleg22@gmail.com",
              style: TextStyle(color: Colors.white),),
            onTap: () {
              launch("mailto:lielleg22@gmail.com");
            },
          ),
          ListTile(
            leading: Icon(GroovinMaterialIcons.cellphone_android, color: Colors.green,),
            title: Text("0547444367",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              launch("tel:0547444367");
            },
          ),
          ListTile(
            leading: Icon(GroovinMaterialIcons.facebook, color: Colors.indigo,),
            title: Text("See me on facebook",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              launch("https://discord.gg/3wEfggg");
            },
          ),
          ListTile(
            leading: Icon(GroovinMaterialIcons.instagram, color: Colors.red,),
            title: Text("See me on Instegram",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              launch("https://www.youtube.com/channel/UCqRA9X1SF1AyCNYkFp7gLTw?view_as=subscriber");
            },
          ),
        ],
      ),
      Divider(color: Colors.white,),

    ]
    ),
    ),
      ),
    );
  }
  Widget get drawer {
    print(authStatus.toString());
    if (authStatus==AuthStatus.LOGGED_IN_ADMIN) {
      return LoggedInAdmin(widget.auth, on_sign_out).make_list(context);
    }
    else if (authStatus==AuthStatus.LOGGED_IN_MEMBER) {
      return LoggedInMember(widget.auth, on_sign_out).make_list(context);
      }
    else if (authStatus==AuthStatus.LOGGED_IN_NEW_USER) {
      return LoggedInNewUser(widget.auth, on_sign_out).make_list(context);
    }
    else {
      return LoggedOutList(widget.auth, on_sign_in).make_list(context);
    }
  }
  List<MeetingCard> get meetings {
    //TODO implement
    DateTime beggining = DateTime.parse("2019-03-09 12:15:00Z");
    List<MeetingCard> meeting_card_list = []
      ..add(MeetingCard(Meeting(beggining, 60, "Jerusalem")));
    return meeting_card_list;
  }
  User get get_current_user {
    debugPrint("getting user");
    return User("Hod Alpert", "alperthod@gmail.com", 28, "gMale", "Jerusalem");
  }
  Project get get_current_project {
    return Project("Lielle Therapy",
        "Phisycal Therapy",
        "Hey, my name is lielle and I'm going to be your phisycal therapist. hope you'll enjoy it as I will");
  }
  void set_auth_status(AuthStatus status){
    setState(() {
      authStatus = status;
    });
  }
  VoidCallback on_sign_in(){
    set_auth_status(AuthStatus.LOGGED_IN_ADMIN);
    Navigator.of(context).pop();
  }
  VoidCallback on_sign_out(){
    set_auth_status(AuthStatus.NOT_LOGGED_IN);
    widget.auth.signOut();
  }
}

