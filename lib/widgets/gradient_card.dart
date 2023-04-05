import 'package:flutter/material.dart';


import '../main.dart';

class GradientCard extends StatefulWidget {
  final Icon icon;
  final String text;
  final VoidCallback onpressed;
  const GradientCard({super.key,
  required this.icon,
  required this.text,
  required this.onpressed});

  @override
  State<GradientCard> createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard> {
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return  InkWell(
      onTap: widget.onpressed,
      child: Container(
        margin: EdgeInsets.only(left: mq.height * .03,top: mq.height * .03),
        height: mq.height * .1,
        width: mq.width * .38,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mq.height * .02),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  
                ],
                colors: [
                  Color.fromARGB(255, 139, 148, 253),
                  Color.fromARGB(255, 64, 14, 246),
                  Color.fromARGB(255, 67, 30, 200),
                  
                ],
              ),),
      child: Center(
      child: Container(
              
                margin: EdgeInsets.only(top: mq.height * .02),
                      child: Column(
                        children: [
                          Container(
                           
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(mq.height * .03),
                              child: Icon(widget.icon.icon,
                                  size: 30, color: Color.fromARGB(255, 255, 254, 254)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: mq.width * .02),
                            child: Text(
                              "${widget.text}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
      ),
                ),
    );
  }
}