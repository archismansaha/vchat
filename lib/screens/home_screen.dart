import 'package:flutter/material.dart';


import '../main.dart';
import '../utils/colors.dart';
import 'history_meeting_screen.dart';
import 'meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int _page = 0;
   String name="Arjun";
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    //CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut()),
  ];
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: footerColor,
        elevation: 7,
        flexibleSpace: Container(
          width: double.infinity,
        
           
        
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                 ClipRRect(
                      borderRadius: BorderRadius.circular(mq.height * .02),
                     
                      child: Container(


                        
                        margin: EdgeInsets.only(left: mq.width * .05),
                        child: Image.asset(
                          'images/icon.png',
                          width: mq.width * .08,
                          height: mq.height * .08,
                          
                          
                        ),
                      ),
                    ),
                Container(
                  margin: EdgeInsets.only(right: mq.width * .05),
                  child: Text("Vchat",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color:  Color.fromRGBO(3, 253, 199, 0.94),))),
               
                
                    ],
               ),
        )
      ),
      body: pages[_page],
       
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
              
      
        unselectedFontSize: 14,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        
      )

    );
  }
}