import 'package:flutter/material.dart';


import '../main.dart';
import '../methods/auth_methods.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethod _authMethod = AuthMethod();
  double opacityLevel = 0;

  void initState() {
   
  super.initState();
Future.delayed(Duration(milliseconds: 1400), () {
    setState(() {
       setState(() => opacityLevel = opacityLevel == 0 ? 1.0 :1.0);
    });
    });
    
  }
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(child:Column(
         
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height:mq.height*0.15),
          Text("Join or Create a meeting",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: Colors.white),),
          SizedBox(height:mq.height*0.1),
          Stack(children:  <Widget> [
       AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 10),
          child: Column( children: <Widget> [
            Image.asset('images/icon.png',width: mq.width*.5,),
             SizedBox(height:mq.height*0.05),
             Text(
                   "VChat",style:TextStyle(fontSize: 30,fontWeight: FontWeight.w200,color:  Color.fromRGBO(3, 253, 199, 0.94)),
                ),
        SizedBox(height:mq.height*0.15),
      CustomButton(text: "Google Sign in", onPressed: (){

        _authMethod.signInWithGoogle(context).then((value){
          if(value){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }
        });
      },
      ),
      ])
        )
       
      ]
        
        
      
      ),
      
        ],
      )
    )
    );
  }
}