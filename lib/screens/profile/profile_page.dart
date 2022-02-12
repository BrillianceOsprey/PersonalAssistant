import 'package:assist_queen/constant/note_theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double side = height * 0.10;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: NoteTheme.mainTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 200,
              ),
            ],
          ),
        ),
        Positioned(
            top: height * 0.234,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: height / 1.45,
              decoration: BoxDecoration(
                  color: NoteTheme.mainBgColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User name',
                        style: TextStyle(
                            fontFamily: 'RobotoMono',
                            color: NoteTheme.hovertextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Tester John',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.blacktextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        margin: const EdgeInsets.only(top: 10.0),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Email Address',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.hovertextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'tester@gmail.com',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.blacktextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        margin: const EdgeInsets.only(top: 10.0),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Tasks',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.hovertextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '2 Tasks done in 3 Tasks',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.blacktextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        margin: const EdgeInsets.only(top: 10.0),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Total Net Income',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.hovertextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '200000',
                          style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: NoteTheme.blacktextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        margin: const EdgeInsets.only(top: 10.0),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      InkWell(
                        onTap: () {
                          print('CLicked sign out');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Sign Out',
                            style: TextStyle(
                                fontFamily: 'RobotoMono',
                                color: NoteTheme.blacktextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: height / 5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image:
                                    AssetImage('assets/images/profilebg.png'))),
                      )
                    ],
                  ),
                ),
              ),
            )),
        Positioned(
          top: height * 0.13,
          left: width * 0.06,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/inman.jpg'))),
          ),
        ),
        Positioned(
          top: height * 0.14,
          left: width * 0.26,
          child: Container(
            width: 100,
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style:
                      TextStyle(fontSize: 17, color: NoteTheme.mainTextColor),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'Mr, Jone',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: NoteTheme.mainTextColor),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: height * 0.15,
            right: width * 0.06,
            child: InkWell(
                onTap: () {
                  print('Clicked Edit Profile');
                },
                child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: NoteTheme.mainBgColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Icon(
                      Icons.edit,
                      color: NoteTheme.purpleAccentColor,
                    )))),
      ],
    );
  }
}
