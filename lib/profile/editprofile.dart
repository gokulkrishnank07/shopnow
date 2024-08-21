import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnow/profile/usertext.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          Icon(Icons.settings),
          SizedBox(
            width: 15,
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 57),
          child: Text(
            'Edit Profile',
            style: GoogleFonts.poppins(),
          ),
        ),
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 100, right: 100),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 27, 137, 97),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/userphoto.jpg',
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Paxton CT',
              style: GoogleFonts.pacifico(
                fontSize: 23,
              ),
            ),
            const Text(
              'paxton07@gmail.com',
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextField(
                style: const TextStyle(),
                focusNode: FocusNode(),
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_rounded),
                  labelText: 'Change Name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextField(
                style: const TextStyle(),
                focusNode: FocusNode(),
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_rounded),
                  labelText: 'Email',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextField(
                style: const TextStyle(),
                focusNode: FocusNode(),
                decoration: const InputDecoration(
                  icon: Icon(Icons.call),
                  labelText: 'Change Number',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Usertexts()
          ],
        ),
      ),
    );
  }
}
