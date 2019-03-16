import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:my_therapy_app/resources/Users//users.dart';
import 'package:url_launcher/url_launcher.dart';


class UserCard extends StatefulWidget {
  final User user;

  UserCard(this.user);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  _UserCardState();

  @override
  Widget build(BuildContext context) {
    // InkWell is a special Material widget that makes its children tappable
    // and adds Material Design ink ripple when tapped.
    return
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: (80.0 - widget.user.Name.length/2)),
                        child: Text(widget.user.Name,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                             fontSize:20.0)),
                      ),
                      Divider(
                        color: Colors.black12,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 12.0, right: 12.0),
                  child: Column(
                    children: <Widget>[
                      Text("Email: ${widget.user.Email}",
                          style: TextStyle(fontSize:17.0)
                      ),
                      Divider(height: 5.0,),
                      Text("Age: ${widget.user.Age.toString()}",
                          style: TextStyle(fontSize:17.0)),
                      Divider(height: 5.0,),
                      Text("City: ${widget.user.Address.toString()}",
                          style: TextStyle(fontSize:17.0)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(
                        icon: Icon(GroovinMaterialIcons.window_maximize),
                        label: Text("Update My User"),
                        onPressed: () {
                          launch(
                              "https://github.com/GroovinChip/Flutter-Community-Challenges");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}



