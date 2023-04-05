import 'package:flutter/material.dart';


import '../main.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  CustomButton({super.key,
  required this.text,
  required this.onPressed,});
  
  @override
  Widget build(BuildContext context) {
    
  mq=MediaQuery.of(context).size;
    return ElevatedButton(onPressed: onPressed, child: Text('${text}',style: TextStyle(color: Colors.white,fontSize: 16),),
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
       shadowColor: Color.fromRGBO(91, 27, 255, 0.984),
      elevation: 4,
      padding: EdgeInsets.symmetric(horizontal: mq.height*0.12, vertical: mq.height*0.002),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(mq.height*0.05),
        side: BorderSide(color:Color.fromRGBO(70, 3, 240, 0.987)) 
    ),
    ),
    );
  }
}