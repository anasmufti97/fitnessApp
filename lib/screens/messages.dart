import 'package:fitnessapp/screens/nav_pages/friends.dart';
import 'package:fitnessapp/screens/nav_pages/instructor_page.dart';
import 'package:fitnessapp/utills/colors.dart';
import 'package:flutter/material.dart';

import 'nav_pages/friendchat.dart';
import 'nav_pages/instructorchat.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation:1
          ,

          backgroundColor: mainaccent,

          title: const Text("Messages"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Instructor",
              ),
              Tab(
                text: "Friends",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InstructorChat2(),
            FriendChat2(),
          ],
        ),
      ),
    );
  }
}
