import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do_list/const/colors.dart';
import 'package:to_do_list/data/firestore.dart';
import 'package:to_do_list/screen/add_note_screen.dart';

import '../widgets/task_widgets.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => Add_Screen())));
          },
          backgroundColor: custom_green,
          child: Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                setState(() {
                  show = true;
                });
              }
              if (notification.direction == ScrollDirection.reverse) {
                setState(() {
                  show = false;
                });
              }
              return true;
            },
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore_Datasource().stream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print(
                        'current user : ${FirebaseAuth.instance.currentUser}');
                    return CircularProgressIndicator();
                  }
                  final noteslist = Firestore_Datasource().getNotes(snapshot);
                  return ListView.builder(
                    itemBuilder: ((context, index) {
                      final note = noteslist[index];
                      print('number of notes ${noteslist.length}');
                      return Task_Widget(note);
                    }),
                    itemCount: noteslist.length,
                  );
                })),
      ),
    );
  }
}
