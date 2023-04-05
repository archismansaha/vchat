
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:omni_jitsi_meet/jitsi_meet.dart';

import 'auth_methods.dart';


class JitsiMeetMethods {

void createMeeting( {required String roomName,
required bool isMuted,
required bool isVideo}) async {
 //final AuthMethod _authMethods = AuthMethod();
  try {
    
   
	  final featureFlags = {
      FeatureFlagEnum.RESOLUTION: FeatureFlagVideoResolution.MD_RESOLUTION,
       FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
     }; // Limit video resolution to 360p
	  final options = JitsiMeetingOptions(
      room: roomName,
      userDisplayName:AuthMethod.user.displayName,
      userEmail: AuthMethod.user.email,
      audioMuted: isMuted,
      videoMuted: isVideo,
    );
      await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onOpened: () {
            debugPrint("JitsiMeetingListener - onOpened");
          },
          onClosed: () {
            debugPrint("JitsiMeetingListener - onClosed");
          },
          onError: (error) {
            debugPrint("JitsiMeetingListener - onError: error: $error");
          },
          onConferenceWillJoin: (url) {
            debugPrint(
                "JitsiMeetingListener - onConferenceWillJoin: url: $url");
          },
          onConferenceJoined: (url) {
            debugPrint("JitsiMeetingListener - onConferenceJoined: url:$url");
          },
          onConferenceTerminated: (url, error) {
            debugPrint(
                "JitsiMeetingListener - onConferenceTerminated: url: $url, error: $error");
          },
          onParticipantLeft: (participantId) {
            debugPrint(
                "JitsiMeetingListener - onParticipantLeft: $participantId");
          },
          onParticipantJoined: (email, name, role, participantId) {
            debugPrint("JitsiMeetingListener - onParticipantJoined: "
                "email: $email, name: $name, role: $role, "
                "participantId: $participantId");
          },
          onAudioMutedChanged: (muted) {
            debugPrint(
                "JitsiMeetingListener - onAudioMutedChanged: muted: $muted");
          },
          onVideoMutedChanged: (muted) {
            debugPrint(
                "JitsiMeetingListener - onVideoMutedChanged: muted: $muted");
          },
          onScreenShareToggled: (participantId, isSharing) {
            debugPrint("JitsiMeetingListener - onScreenShareToggled: "
                "participantId: $participantId, isSharing: $isSharing");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("JitsiMeetingListener - readyToClose callback");
                }),
          ]),
    );
  }
  catch (error) {
      debugPrint("error: $error");
    }
}

}