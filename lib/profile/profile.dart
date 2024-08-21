import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnow/profile/editprofile.dart';
import 'package:shopnow/shopingpage/homepage.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                'Profile',
                style: GoogleFonts.poppins(),
              ),
            ),
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          body: Column(
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
                        'images/user.jpg',
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
              Text(
                'paxton07@gmail.com',
                style: GoogleFonts.poppins(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: SizedBox(
                  height: 50,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Editprofile(),
                        ),
                      );
                      FocusScope.of(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 27, 137, 97),
                      shadowColor: Colors.black,
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(39),
                      ),
                    ),
                    child: Text(
                      'Edit',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(
                      'Settings',
                      style: GoogleFonts.poppins(),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: const Icon(Icons.blinds_closed_rounded),
                    title: Text(
                      'Billing Details',
                      style: GoogleFonts.poppins(),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: const Icon(Icons.portrait_outlined),
                    title: Text(
                      'Login Management',
                      style: GoogleFonts.poppins(),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
              const Divider(
                color: Colors.black12,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: const Icon(Icons.info_rounded),
                    title: Text(
                      'Information',
                      style: GoogleFonts.poppins(),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  InkWell(
                    child: ListTile(
                      leading: const Icon(Icons.logout_rounded),
                      title: Text(
                        'LogOut',
                        style: GoogleFonts.poppins(),
                      ),
                      textColor: Colors.red,
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            'Log Out',
                            style: GoogleFonts.poppins(),
                          ),
                          content: Text(
                            'If You Want To Log Out!!!',
                            style: GoogleFonts.poppins(),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(14),
                                child: InkWell(
                                  child: Text(
                                    'Yes!',
                                    style: GoogleFonts.poppins(),
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Homepage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
