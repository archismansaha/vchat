import 'dart:math';

import 'package:flutter/material.dart';


import '../main.dart';
import '../methods/jitsi_meet_methods.dart';
import '../widgets/gradient_card.dart';
import 'video_call_screen.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
    createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isMuted: true, isVideo: true);
  }
  joinMeeting(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoScreen()));
  }

  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Container(
       
       child: Column(
        children: [
           // Name of the person
          Row(children: [
              
          GradientCard(icon:const Icon(Icons.videocam),text:"New Meeting",onpressed: createNewMeeting),

          GradientCard(icon:Icon(Icons.add_box_rounded),text:"Join Meeting",onpressed:() => joinMeeting(context)
            
      ),
          ],),
          
            
          ]

              )

          



    
       
       );

    
  }
}