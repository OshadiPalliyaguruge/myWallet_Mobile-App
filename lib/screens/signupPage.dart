import 'dart:io';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/screens/forgotPassword.dart';
import 'package:my_wallet/screens/signupPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../reusables/reusable.dart';
import 'loginPage.dart';
import 'options.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _conformpasswordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isRememberMe = false;
   String profilePictureUrl = "";
   File? _image;
   final ImagePicker _imagePicker = ImagePicker();

  Widget buildUserName() {
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
              controller: _userNameTextController,
              keyboardType: TextInputType.text,
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
                  hintText: 'UserName',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  )),
            ),
          ),
        )
      ],
    );
  }

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

  Widget buildPassword(TextEditingController controlTxt) {
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
          //     .height * 0.55,
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
              controller: controlTxt,
              obscureText: true,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  suffixIcon: Icon(
                    Icons.key_outlined,
                    color: Colors.black54,
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  )),
            ),
          ),
        )
      ],
    );
  }

Widget buildProfilePicture() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: _pickImage,
        child: CircleAvatar(
          radius: 50,
          backgroundColor:Colors.blueGrey,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? Icon(
                  Icons.camera_alt,
                  size: 40,
                )
              : null,
        ),
      ),
    ],
  );
}
// Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
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
                      height: MediaQuery.of(context).size.height * 0.1,
                     ),
                      SingleChildScrollView(
                         physics: AlwaysScrollableScrollPhysics(),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xf7b0aeae),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                height: MediaQuery.of(context).size.height * 0.001,
                              ),
                              buildUserName(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.001,
                              ),
                              buildEmail(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.001,
                              ),
                              buildPassword(_passwordTextController),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.001,
                              ),
                              buildPassword(_conformpasswordTextController),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const LoginPage()));
                                    },
                                    child: const Text(
                                      "   Login",
                                      style: TextStyle(
                                        //decoration: TextDecoration.underline,
                                          decorationColor: Colors.black54,
                                          // Customize underline color
                                          decorationThickness: 2.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                              GestureDetector(
                                onTap: () async {
                                  String email = _emailTextController.text;
                                   String userName = _userNameTextController.text;
                                  String domain = email.substring(email.indexOf('@') + 1);

                                   if (_userNameTextController.text == "") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    errorMessage("Enter Your User Name"));
                                   } else if (_passwordTextController.text == "") {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                        errorMessage("Enter Your Password"));
                                  } else if (_emailTextController.text == "") {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                        errorMessage("Enter Your Email"));
                                  } else if (_passwordTextController.text!=_conformpasswordTextController.text){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                        errorMessage("Passwords are different"));
                                  }
                                  try {
                                      final credential = await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text,
                                      );
                                       // Upload the profile picture to Firebase Storage
                                      if (_image != null) {
                                        Reference storageRef = FirebaseStorage.instance.ref().child('profile_pictures/${credential.user!.uid}/${userName}.jpg');
                                        await storageRef.putFile(_image!);
                                        profilePictureUrl = await storageRef.getDownloadURL();
                                      }
                                      print(_image);
                                      // You can save other user information to Firestore or other databases if needed
                                      // Navigate to the home screen or do any other necessary actions
                                      print('User signed up successfully!');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Options(),
                                        ),
                                      );
                                    
                                  }
                                  on FirebaseAuthException catch (e) {
                                     ScaffoldMessenger.of(context).showSnackBar(
                                          errorMessage(
                                              "SignUp Process Failed."));
                                  }
                                  catch (e) {
                                      print('Error during image upload: $e');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          errorMessage("An error occurred during image upload."));
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
                                        child: Text(
                                          'SignUp',
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.w500),
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
              
              // Positioned(
              //   top: MediaQuery.of(context).size.height * 0.05,
              //   left: MediaQuery.of(context).size.height * 0.17,
              //   right: MediaQuery.of(context).size.height * 0.17,
              //   child: Container(
              //     height: MediaQuery.of(context).size.height * 0.07, // Adjust the height as needed
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       // color: Color(0xa50f6d8b),
              //       color: Colors.blueGrey,
              //     ),// Background color of the container
              //     child: Center(
              //       child: Text(
              //         'SignUp',
              //         style: TextStyle(
              //             fontSize: 25, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // ),

            Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.height * 0.17,
                right: MediaQuery.of(context).size.height * 0.17,
                child: Container(
                  child: buildProfilePicture(),// Adjust the height as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


