import 'dart:math';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
  late TextEditingController newUserController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   List<String> selectedUsers = []; // List to store selected user image URLs
   List<String> newUserNames = []; // List to store names of newly added users

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

    // Split the imageUrl by '/'
    List<String> parts = imageUrl.split('/');
    // Get the last part which contains the user's name
    String userFileName = parts.last;
    // Remove ".png" or ".jpeg" from the filename
    String userNameWithExtension = userFileName.substring(0, userFileName.lastIndexOf('.'));
    // Split the userNameWithExtension by '%2F' to extract the user's name
    List<String> userNameParts = userNameWithExtension.split('%2F');
    // Get the last part which is the user's name
    String userName = userNameParts.last;
    // print(userName);

    bool isSelected = selectedUsers.contains(userName);


  // Check if the imageUrl corresponds to profile2 (imageUrl10)
  if (imageUrl == imageUrl10) {
    return Positioned(
      top: buttonY - MediaQuery.of(context).size.height * 0.12,
      left: buttonX - MediaQuery.of(context).size.height * 0.04,
      child: GestureDetector(
        onTap: () {
          // Display a dialog or navigate to a screen to add new users
          // For example:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add New User'),
                content: TextField(
                  controller: newUserController,
                  decoration: InputDecoration(hintText: 'Enter new user name'),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      addUser();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.height * 0.09,
          height: MediaQuery.of(context).size.height * 0.09,
          child: ClipOval(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } else {
    return Positioned(
      top: buttonY - MediaQuery.of(context).size.height * 0.12,
      left: buttonX - MediaQuery.of(context).size.height * 0.04,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected) {
              selectedUsers.remove(userName);
            } else {
              selectedUsers.add(userName);
            }
          });
          
          // print('Image Clicked: $imageUrl');
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.height * 0.09,
          height: MediaQuery.of(context).size.height * 0.09,
          child: ClipOval(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
                if (isSelected)
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.5),
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

void addUser() {
    String newName = newUserController.text.trim();
    if (newName.isNotEmpty && !selectedUsers.contains(newName) && !newUserNames.contains(newName)) {
      setState(() {
        newUserNames.add(newName);
        selectedUsers.add(newName);
        newUserController.clear();
      });
    }
  }


  void handleButtonClick() {
    // 1. Retrieve amount entered by the user
    double amount = double.tryParse(amountController.text) ?? 0.0;
    print(amount);
    // 2. Calculate share per user
    double sharePerUser = amount / selectedUsers.length;
    print(sharePerUser);
    print(selectedUsers);
    // 3. Update Firebase Storage for each selected user
    for (String imageUrl in selectedUsers) {
      updateUserDataInFirebase(imageUrl, sharePerUser);
    }

    // 4. Show selected users in a dialog box
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Payables'),
        content: Container(
          width: double.minPositive,
          constraints: BoxConstraints(maxHeight: 300),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: selectedUsers.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(selectedUsers[index]),
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );

  // 5. Show success message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Amount divided among selected users.'),
    ),
  );
}

  void updateUserDataInFirebase(String imageUrl, double share) {
    // Update user data in Firebase Storage
    // For example:
    // final userRef = storage.ref().child('users/$userId');
    // userRef.update({'share': share});
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
              child: GestureDetector(
                onTap: () {
                 showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Payables'),
        content: Container(
          width: double.minPositive,
          constraints: BoxConstraints(maxHeight: 300),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: selectedUsers.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(selectedUsers[index]),
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
                },
                child: Text(
                  'Payables ',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

             // Button to move to another page
          
           Positioned(
              bottom: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.4,
              child: GestureDetector(
                onTap: () {
                  handleButtonClick();
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
                        'Done',
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


// import 'package:firebase_database/firebase_database.dart';

// final databaseReference = FirebaseDatabase.instance.reference();

// void updateColumnValue(String tableName, String columnName, int additionalValue) async {
//   // Retrieve the current value of the column from the database
//   DataSnapshot snapshot = await databaseReference.child(tableName).child(columnName).once();

//   // Get the current value from the snapshot
//   int currentValue = snapshot.value ?? 0;

//   // Perform the operation to update the value (e.g., addition)
//   int updatedValue = currentValue + additionalValue;

//   // Update the value in the database with the updated value
//   await databaseReference.child(tableName).child(columnName).set(updatedValue);
// }

// void main() {
//   // Example of how to use updateColumnValue function
//   String tableName = 'your_table_name';
//   String columnName = 'your_column_name';
//   int additionalValue = 10; // Value to be added to the current value

//   updateColumnValue(tableName, columnName, additionalValue);
// }
