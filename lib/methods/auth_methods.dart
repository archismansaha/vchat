import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";

import "package:firebase_auth/firebase_auth.dart";
import 'package:google_sign_in/google_sign_in.dart';


import "../utils/colors.dart";
import "../utils/utils.dart";
class AuthMethod {
 static FirebaseAuth auth = FirebaseAuth.instance;
 static FirebaseFirestore _firestore = FirebaseFirestore.instance;
 static User get user => auth.currentUser!;

 // creating user with google account
 Future<bool>signInWithGoogle( BuildContext context)async{
     bool res=false;
     try{
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken:googleAuth.idToken,
        );
        UserCredential userCredential = await auth.signInWithCredential(credential);
        User? user = userCredential.user;
       if(user != null){
        if(userCredential.additionalUserInfo!.isNewUser){
         await _firestore.collection("users").doc(user.uid).set({
            "email":user.email,
            "name":user.displayName,
            "profilePic":user.photoURL,
            "uid":user.uid,
            "searchKey":user.displayName![0].toUpperCase(),
          });
      
        }
       res=true;
        
       }
       
       
     }
     on FirebaseAuthException catch(e){
       showSnackBar(context, e.message!, errorSnackBarColor);
       res=false;
     }
     return res;


 }

}