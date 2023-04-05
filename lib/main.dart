import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';
import 'screens/splash_scree.dart';
import 'utils/colors.dart';

// ...

late Size mq;
void main() {
 

  WidgetsFlutterBinding.ensureInitialized();
    //enter full-screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
   _intialize_firebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData.dark().copyWith(
     
       scaffoldBackgroundColor: backgroundColor,
      ),
      home:SplashScreen(),
    );
  }
}
_intialize_firebase()async{
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}



