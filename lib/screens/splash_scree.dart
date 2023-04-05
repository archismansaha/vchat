import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../methods/auth_methods.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 1800),(){
    // full screen
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent));
          if(AuthMethod.auth.currentUser!=null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen(),),);
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen(),),);
        }
         SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);  
  }
    );
  }
  Widget build(BuildContext context) {
     mq=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
        body:Column(
          children: [
            SizedBox(height: mq.height*0.15,),
            Center(child: Image.asset('images/icon.png',width: mq.width*.5,)),
            SizedBox(height: mq.height*0.15,),
            Center(child: 
            RichText(text: TextSpan(
              text: "Welcome to ",
              style: TextStyle(fontSize: 40,fontWeight: FontWeight.w200,color: Colors.white),
              children: [
                TextSpan(
                  text: "VChat",
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.w200,color:  Color.fromRGBO(3, 253, 199, 0.94)),
                )
              ]
            )
            )
            ),
            SizedBox(height: mq.height*0.16,),
            Center(child: Text("Made with love by Archisman ❤️",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white))),
          ],
        )

    );
  }
}