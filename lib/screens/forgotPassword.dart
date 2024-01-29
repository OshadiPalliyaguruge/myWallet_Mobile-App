import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/screens/forgotPassword.dart';
import 'package:my_wallet/screens/signupPage.dart';

import '../reusables/reusable.dart';
import 'loginPage.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final TextEditingController _emailTextController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isRememberMe = false;

   Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015,
          ),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 0.5),
            borderRadius: BorderRadius.circular(0),
          ),
          // width: MediaQuery
          //     .of(context)
          //     .size
          //     .height,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.06,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery
                .of(context)
                .size
                .height * 0.04,),
            child: TextField(
              controller: _emailTextController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.black54,
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  )),
            ),
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170), // Adjust the height as needed
        child: AppBar(
          iconTheme: IconThemeData(size: 30.0), // Adjust the size of the forward arrow
          flexibleSpace: Stack(
            children: [
               Positioned.fill(
                child: Image.asset(
                  'assets/accounting.png', // Replace with your asset image path
                  fit: BoxFit.cover,
                ),
              ),
              
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              
              Positioned(
                bottom: 16.0,
                left: 16.0,
                child: Text(
                  'Your Title',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          
          // Add leading icon for drawer or back
           actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                 _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
           
           leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back), // Use Icons.menu for drawer icon
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back
              },
            ),
          ),
        ),
      ),

      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0x8922584e).withOpacity(0.6),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Navigate to a different screen or execute other logic
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Navigate to a different screen or execute other logic
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      
         body: Stack(
           children: [
            Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   begin: Alignment.topLeft,
                   end: Alignment.bottomCenter,
                   colors: [
                     // Color(0x35f65454),
                     //   Color.fromARGB(53, 44, 35, 35),
                      Color.fromARGB(141, 56, 9, 9), // The starting color with opacity
                      Colors.black.withOpacity(1), // The ending color with opacity
                   ],
                 ),
               ),
               child: Column(
                 children: [
                   SizedBox(
                     height: MediaQuery.of(context).size.height * 0.15,
                    ),
                     SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                       child: Container(
                         width: MediaQuery.of(context).size.width * 0.9,
                         height: MediaQuery.of(context).size.height * 0.26,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                           color: Color(0xf7b0aeae),
                         ),
                         child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               buildEmail(),
                             SizedBox(
                               height: MediaQuery.of(context).size.height * 0.001,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                             GestureDetector(
                             onTap: () async {
                             if (_emailTextController.text == "") {
                               ScaffoldMessenger.of(context)
                                   .showSnackBar(errorMessage("Enter Your Email"));
                             } else {
                               await FirebaseAuth.instance.sendPasswordResetEmail(
                                   email: _emailTextController.text);
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => const LoginPage(),
                                 ),
                               );
                             }
                           },
                           child: Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   Container(
                                     width: MediaQuery.of(context).size.width * 0.25,
                                     height: MediaQuery.of(context).size.height * 0.07,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(50),
                                       color: Colors.blueGrey,
                                     ),
                             
                                     child: Center(
                                       child: const Text(
                                       "  Reset ",
                                       style: TextStyle(
                                         //decoration: TextDecoration.underline,
                                           decorationColor: Colors.black54,
                                           // Customize underline color
                                           decorationThickness: 2.0,
                                           color: Colors.black54,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 20),
                                                                         ),
                                     ),
                                   ),
                                 ],
                               ),
                         ),
                               ],
                             ),
                           ]
                       ),
                     ),
                   ),
                 ],
                 )
             ),
             
             Positioned(
               top: MediaQuery.of(context).size.height * 0.1,
               left: MediaQuery.of(context).size.height * 0.09,
               right: MediaQuery.of(context).size.height * 0.09,
               child: Container(
                 height: MediaQuery.of(context).size.height * 0.07, // Adjust the height as needed
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.blueGrey,
                 ),// Background color of the container
                 child: Center(
                   child: Text(
                     'Reset Password',
                     style: TextStyle(
                         fontSize: 25, fontWeight: FontWeight.bold),
                   ),
                 ),
               ),
             ),
           ],
         ),
      ),
    );
  }
}
