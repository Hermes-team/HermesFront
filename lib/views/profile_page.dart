import 'package:flutter/material.dart';
import 'package:front/views/new_message_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF223239),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF182226),
        // toolbarHeight: 65,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 22, color: Color(0xffEBEBEB), fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/imgs/p3.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 20,),
                      Text("Mia",
                        style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w100),
                        ),
                      SizedBox(height: 20,),
                      Opacity(
                        opacity: 0.6,
                        child: Text("mia_123@gmail.com",
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w100),
                          ),
                        ),

                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return NewMessagePage();
                      }));
                    },
                    child: Row(
                      children: const [
                        Image(
                          image: AssetImage("assets/icons/email.png"),
                          height: 28,
                        ),
                        SizedBox(
                          width: 17,
                        ),
                        Text(
                          'New Message',
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return const ProfileScreen();
                      // }));
                    },
                    child: Row(
                      children: const [
                        Image(
                          image: AssetImage("assets/icons/add-group.png"),
                          height: 28,
                        ),
                        SizedBox(
                          width: 17,
                        ),
                        Text(
                          'New Group',
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return const ProfileScreen();
                      // }));
                    },
                    child: Row(
                      children: const [
                        Image(
                          image: AssetImage("assets/icons/add-user.png"),
                          height: 28,
                        ),
                        SizedBox(
                          width: 17,
                        ),
                        Text(
                          'Add Contact',
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return const ProfileScreen();
                      // }));
                    },
                    child: Row(
                      children: const [
                        Image(
                          image: AssetImage("assets/icons/phone-book.png"),
                          height: 28,
                        ),
                        SizedBox(
                          width: 17,
                        ),
                        Text(
                          'Contacts',
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return const ProfileScreen();
                      // }));
                    },
                    child: Row(
                      children: const [
                        Image(
                          image: AssetImage("assets/icons/invite.png"),
                          height: 28,
                        ),
                        SizedBox(
                          width: 17,
                        ),
                        Text(
                          'Invite friends',
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
