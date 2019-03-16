import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'projects.dart';


class ProjectCard extends StatefulWidget {
  final Project project;

  ProjectCard(this.project);

  @override
  _ProjectCardState createState() => _ProjectCardState(project);
}

class _ProjectCardState extends State<ProjectCard> {
  Project project;

  _ProjectCardState(this.project);

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
                        padding: EdgeInsets.only(left: (60.0 - widget.project.Name.length/2)),
                        child: Text(widget.project.Name,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize:20.0)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 12.0, right: 12.0),
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        widget.project.Description,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton.icon(
                        icon: Icon(GroovinMaterialIcons.window_maximize),
                        label: Text("View Project"),
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



