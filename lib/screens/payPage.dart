import 'dart:math';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  late String imageUrl1;
  late String imageUrl2;
  late String imageUrl3;
  late String imageUrl4;
  late String imageUrl5;
  late String imageUrl6;
  late String imageUrl7;
  late String imageUrl8;
  late String imageUrl9;
  late String imageUrl10;
  final storage = FirebaseStorage.instance;
  late TextEditingController amountController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    initializeImageUrls();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  Future<void> initializeImageUrls() async {
    final ref1 = storage.ref().child('users/bakka.png');
    final ref2 = storage.ref().child('users/kauma.jpeg');
    final ref3 = storage.ref().child('users/ino.jpeg');
    final ref4 = storage.ref().child('users/judy.jpeg');
    final ref5 = storage.ref().child('users/madus.jpeg');
    final ref6 = storage.ref().child('users/seno.jpeg');
    final ref7 = storage.ref().child('users/thila.jpg');
    final ref8 = storage.ref().child('users/tima.jpeg');
    final ref9 = storage.ref().child('users/oshadi.jpeg');
    final ref10 = storage.ref().child('users/profile2.png');
    final url1 = await ref1.getDownloadURL();
    final url2 = await ref2.getDownloadURL();
    final url3 = await ref3.getDownloadURL();
    final url4 = await ref4.getDownloadURL();
    final url5 = await ref5.getDownloadURL();
    final url6 = await ref6.getDownloadURL();
    final url7 = await ref7.getDownloadURL();
    final url8 = await ref8.getDownloadURL();
    final url9 = await ref9.getDownloadURL();
    final url10 = await ref10.getDownloadURL();

    setState(() {
      imageUrl1 = url1;
      imageUrl2 = url2;
      imageUrl3 = url3;
      imageUrl4 = url4;
      imageUrl5 = url5;
      imageUrl6 = url6;
      imageUrl7 = url7;
      imageUrl8 = url8;
      imageUrl9 = url9;
      imageUrl10 = url10;
    });
  }

  Widget buildCircularImage(double angle, String imageUrl) {
    double radius = MediaQuery.of(context).size.height * 0.18;

    double centerX = MediaQuery.of(context).size.width / 2;
    double centerY = MediaQuery.of(context).size.height / 2;

    double buttonX = centerX + radius * cos(angle);
    double buttonY = centerY + radius * sin(angle);

    return Positioned(
      top: buttonY - MediaQuery.of(context).size.height * 0.12,
      left: buttonX - MediaQuery.of(context).size.height * 0.04,
      child: GestureDetector(
        onTap: () {
          // Handle image click here
          print('Image Clicked: $imageUrl');
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.height * 0.09,
          height: MediaQuery.of(context).size.height * 0.09,
          child: ClipOval(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.2), // Adjust the height as needed
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
        physics:  MediaQuery.of(context).size.height <=
          MediaQuery.of(context).size.height
      ? AlwaysScrollableScrollPhysics()
      : NeverScrollableScrollPhysics(),
        child: Stack(
          children: [    
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromARGB(53, 56, 18, 18).withOpacity(0.55),
              ),
            
            

            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Enter Amount',
                            border: InputBorder.none,
                          ),
                        ),
                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),

            // Place additional images around the center image
            buildCircularImage(0, imageUrl2),
            buildCircularImage(1 * pi / 5, imageUrl3),
            buildCircularImage(2 * pi / 5, imageUrl4),
            buildCircularImage(3 * pi / 5, imageUrl5),
            buildCircularImage(4 * pi / 5, imageUrl6),
            buildCircularImage(5 * pi / 5, imageUrl7),
            buildCircularImage(6 * pi / 5, imageUrl8),
            buildCircularImage(7 * pi / 5, imageUrl1),
            buildCircularImage(8 * pi / 5, imageUrl10),
            buildCircularImage(9 * pi / 5, imageUrl9),
            // Centered text
           
            Positioned(
              top: MediaQuery.of(context).size.height * 0.38,
              left: MediaQuery.of(context).size.width * 0.35,
              child: Column(
                children: [
                  Text(
                    'Recievables ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

             // Button to move to another page
          
           Positioned(
              bottom: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.4,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const LoginPage()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueGrey,
                    ),
                    child: Center(
                      child: Text(
                        'Pay',
                        style: TextStyle(
                            fontSize:20, fontWeight: FontWeight.w500),
                      ),
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
