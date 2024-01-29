
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/1wall.jpg"),
                  fit: BoxFit.cover,
                ),
              ),

             ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.2), // Adjust the opacity as needed
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), // Adjust the sigma values for the blur effect
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),

            SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.0375,
                  vertical: MediaQuery.of(context).size.height * 0.0475,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: Text(
                          'Start Manage Your \n Expenses Now',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize:
                            MediaQuery.of(context).size.height * 0.03,
                          ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15),
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0x35f65454),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              'My Wallet',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                MediaQuery.of(context).size.height * 0.05,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

            // Button on top of the page
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5 - 220, // Adjust based on the button's height
              right: MediaQuery.of(context).size.width * 0.5 - 140,
              child: Container(
                width: 80, // Adjust the size of the circular button
                height: 80, // Adjust the size of the circular button
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x35f65454), // Adjust the color of the circular button
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                    size:MediaQuery.of(context).size.height*0.06// Adjust the color of the arrow
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
