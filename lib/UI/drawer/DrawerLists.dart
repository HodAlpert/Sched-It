import 'package:flutter/material.dart';
import 'package:my_therapy_app/UI/common/login_screen.dart';
import 'package:my_therapy_app/UI/drawer/drawer_botton.dart';
import 'package:my_therapy_app/services/Authantication.dart';


class MyList{
  MyList(this.auth);
  final BaseAuth auth;
  ListView make_list(BuildContext context){}
}

class LoggedOutList extends MyList{
  LoggedOutList(Auth auth, this.on_sign_in) : super(auth);
  VoidCallback on_sign_in;
  @override
  make_list(BuildContext context){
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        Button("login / register",
                (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      // builder methods always take context!
                      builder: (context) {
                        return LoginSignUpPage(auth: auth, context: context, onSignedIn: on_sign_in);
                      },
                    ),
                  );
                },
            Icons.supervisor_account).make_button(context)
      ],
    );
  }
}

class LoggedInMember extends MyList{
  LoggedInMember(Auth auth, this.on_sign_out) : super(auth);
  VoidCallback on_sign_out;

  @override
  make_list(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Button("schedule a new meeting", () {}, Icons.calendar_today)
              .make_button(context),
          Button("cancel a meeting", () {}, Icons.cancel).make_button(context),
          Button("switch project", () {}, Icons.open_in_new).make_button(
              context),
          Button("find a project", () {}, Icons.find_in_page).make_button(
              context),
          Button("open a new project", () {}, Icons.note_add).make_button(
              context),
          Button("update your accont", () {}, Icons.system_update_alt)
              .make_button(context),
          Button("logout", on_sign_out, Icons.exit_to_app).make_button(context)
        ]
    );
  }
}

class LoggedInAdmin extends MyList {
  LoggedInAdmin(Auth auth, this.on_sign_out) : super(auth);
  VoidCallback on_sign_out;
  @override
  make_list(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Button("update project", () {}, Icons.update).make_button(context),
          Button("invite a new patient", () {}, Icons.insert_invitation)
              .make_button(context),
          Button("switch project", () {}, Icons.open_in_new).make_button(
              context),
          Button("find a project", () {}, Icons.find_in_page).make_button(
              context),
          Button("open a new project", () {}, Icons.note_add).make_button(
              context),
          Button("update your accont", () {}, Icons.system_update_alt)
              .make_button(context),
          Button("logout", on_sign_out, Icons.exit_to_app).make_button(context)
        ]
    );
  }
}

class LoggedInNewUser extends MyList {
  LoggedInNewUser(Auth auth, this.on_sign_out) : super(auth);
  VoidCallback on_sign_out;

  @override
  make_list(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Button("find a project", () {}, Icons.find_in_page).make_button(
              context),
          Button("open a new project", () {}, Icons.note_add).make_button(
              context),
          Button("logout", on_sign_out, Icons.exit_to_app).make_button(context)
        ]
    );
  }
}
