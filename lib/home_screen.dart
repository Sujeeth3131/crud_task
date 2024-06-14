import 'package:crudtask/database_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final dbService = DatabaseService();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Firestore',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.person,
                    size: 25,
                    color: Colors.black,
                  ),
                  labelText: "Name",
                  labelStyle: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.mail,
                    size: 25,
                    color: Colors.black,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.phone,
                    size: 25,
                    color: Colors.black,
                  ),
                  labelText: "Phone",
                  labelStyle: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      final user=User(
                        name:name.text,
                        email:email.text,
                        phone:phone.text);
                      dbService.create(user);




                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(130, 40)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
                    ),
                    child: Text(
                      "Create",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    )),
                ElevatedButton(
                    onPressed: () {
                      dbService.read();
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(130, 40)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
                    ),
                    child: Text(
                      "Read",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      dbService.update();
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(130, 40)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
                    ),
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    )),
                ElevatedButton(
                    onPressed: () {
                      dbService.delete();
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(130, 40)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.grey,
                      ),
                    ),
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    )),
              ],
            ),
          ],
        ),
      ),
    );

  }

}
class User{
  final String name;
  final String email;
  final String phone;
  User({required this.name,required this.email,required this.phone});
  Map<String,dynamic> toMap()=>{"name":this.name,"email":this.email,"phone":this.phone};
}
