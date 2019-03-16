import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'meetings.dart';


class MeetingCard extends StatefulWidget {
  final Meeting meeting;

  MeetingCard(this.meeting);

  @override
  _MeetingCardState createState() => _MeetingCardState();
}

class _MeetingCardState extends State<MeetingCard> {

  _MeetingCardState();

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
                        padding: EdgeInsets.only(left: 80.0),
                        child: Text("Meeting",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize:20.0)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, right: 12.0),
                  child: Column(
                    children: <Widget>[
                      Text("Day: ${meeting_date_text}" ,
                        style: TextStyle(fontSize:17.0)),
                      Text("From: ${widget.meeting.Beggining.hour.toString().padLeft(2,"0")}:${widget.meeting.Beggining.minute.toString().padLeft(2,"0")}",
                          style: TextStyle(fontSize:17.0)),
                      Text(meeting_end,
                          style: TextStyle(fontSize:17.0)),
                      Text("Duration: ${widget.meeting.DurationInMinutes} minutes",
                          style: TextStyle(fontSize:17.0))
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
                        label: Text("Cancel Meeting"),
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
  String get meeting_date_text {
    var now = DateTime.now();
    String day = "${widget.meeting.Beggining.day}/${widget.meeting.Beggining.month}/${widget.meeting.Beggining.year}";
    Duration difference = now.difference(widget.meeting.Beggining);
    if (difference.inDays == 1){
      return "${day} (Tomorrow)";
    }
    else if ( difference.inDays >=7 && difference.inDays <=14) {
      return "${day} (Next week)";
    }
    else {
      return day;
    }
  }
  String get meeting_end{
    int meetings_hours = ((widget.meeting.Beggining.minute + widget.meeting.DurationInMinutes) / 60).floor();
    int meeting_minutes =  (widget.meeting.Beggining.minute + widget.meeting.DurationInMinutes) % 60;
    return "Until: ${(widget.meeting.Beggining.hour + meetings_hours).toString().padLeft(2,"0")}:${meeting_minutes.toString().padLeft(2,"0")}";
  }
}



