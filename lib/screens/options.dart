import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_wallet/screens/addPage.dart';
import 'package:my_wallet/screens/payPage.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

Widget buildClickableButton(Color colour, String txt1, Widget Function () page) {
  return GestureDetector(
    onTap: () {
      // Add your navigation logic here
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page(), // Replace YourNextPage with the desired page
        ),
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: colour,
          ),
          child: Center(
            child: Text(
              txt1,
              style: TextStyle(
                //decoration: TextDecoration.underline,
                decorationColor: Colors.black54,
                // Customize underline color
                decorationThickness: 2.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ),
      ],
    ),
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
      
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromARGB(53, 56, 18, 18).withOpacity(0.55),
                ),
                child:Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.13,
                             decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.white12,
                            ),
                            child: Center(
                              child: const Text(
                              "Hi Oshadi ",
                              style: TextStyle(
                                //decoration: TextDecoration.underline,
                                  decorationColor: Colors.black54,
                                  // Customize underline color
                                  decorationThickness: 2.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45),
                            ),
                            ),
                          ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  buildClickableButton(const Color.fromARGB(221, 15, 15, 15), "Add", () => AddPage()),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  buildClickableButton(const Color.fromARGB(221, 15, 15, 15),"Pay",() => PayPage()),
                ],
              ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}