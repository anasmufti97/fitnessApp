import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/components/round_button_white.dart';
import 'package:fitnessapp/components/constants.dart';
import 'package:fitnessapp/screens/nav_pages/exer_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartExer extends StatefulWidget {
  List getexerlist;
  String getexerKcal;
  String getexrtime;
  String getexrtitle;

  StartExer(
      this.getexerlist, this.getexerKcal, this.getexrtime, this.getexrtitle);

  @override
  _StartExerState createState() =>
      _StartExerState(getexerlist, getexerKcal, getexrtime, getexrtitle);
}

class _StartExerState extends State<StartExer> {
  List exerlist;
  String exerKcal;
  String exrtime;
  String exrtitle;
  int totalkal=0;

  int  totalminutes=0;
  int totalexersice=0;
  final box = GetStorage();


  _StartExerState(this.exerlist, this.exerKcal, this.exrtime, this.exrtitle);

  int index = 0;
  int endTime = 0;
  bool check = false;
  late FirebaseAuth auth;
  String userid = "id";

  Future<void> getCurrentUser() async {
    auth = FirebaseAuth.instance;
    try {
      final user = await auth.currentUser;
      if (user != null) {
        setState(() {
          userid = user.email.toString().trim();
        });
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<void> addUser_WorkoutData(
      {String? title, String? exrtime, String? kcal, String? date}) async {
    final users = await FirebaseFirestore.instance
        .collection('userexer')
        .doc(userid)
        .collection("workouts")
        .doc()
        .set({
          'title': title,
          'exrtime': exrtime,
          'kcal': kcal,
          'date': date,
        })
        .then((value) => print("workout data added to database"))
        .catchError((error) => print("Failed to add user: $error"));

    return users;
  }

  @override
  void initState() {
    checktotalkalValue();
    checktotalminutes();
    checktotalworkoutsValue();
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }


  /// total KAL ???????///

  checktotalkalValue() async {
    int count = await gettotalkalData() ?? 0;
    totalkal = count;
    box.write("getkal", totalkal);

  }
  gettotalkalData() async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    int? count = sprefs.getInt('totalkal1');
    return count;
  }
  settotalkalData() async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    sprefs.setInt('totalkal1', totalkal);
  }

  /// total minutes

  checktotalminutes() async {
    int count = await getminutesData() ?? 0;
    totalminutes = count;
    box.write("gettotalminutes", totalminutes);

  }
  getminutesData() async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    int? count = sprefs.getInt('totaltotalminutes');
    return count;
  }
  setminutesData() async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    sprefs.setInt('totaltotalminutes', totalminutes);
  }

  /// total workouts

  checktotalworkoutsValue() async {
    int count = await gettotalworkoutsData() ?? 0;
    totalexersice = count;
    box.write("getworkouts", totalexersice);

  }
  gettotalworkoutsData() async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    int? count = sprefs.getInt('totalworkouts');
    return count;
  }
  settotalworkoutsData() async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    sprefs.setInt('totalworkouts', totalexersice);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel)),
        backgroundColor: mainaccent,
        elevation: 0,
      ),
      body: check ? exerrest() : exerui(),
    );
  }

  Container exerrest() {
    setState(() {
      if (index == exerlist.length - 1) {
        index = 0;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          var now = new DateTime.now();
          var formatter = new DateFormat('yyyy-MM-dd hh:mm a');
          String formattedDate = formatter.format(now);
          addUser_WorkoutData(
              title: exrtitle,
              exrtime: exrtime,
              kcal: exerKcal,
              date: formattedDate);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ExesiceReresult(exerKcal, exerlist.length.toString())));
        });
      }
      index += 1;
    });
    return Container(
      color: mainaccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Take Rest',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Next Exercise will start after',
              style: TextStyleHeading,
            ),
            SizedBox(
              height: 30,
            ),
            CountdownTimer(
              onEnd: () {
                setState(() {
                  check = false;
                });
              },
              endTime: endTime =
                  DateTime.now().millisecondsSinceEpoch + 1000 * 11,
              textStyle: TextStyle(fontSize: 40, color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButtonWhite(
              textval: 'Skip',
              width: 100,
              onpress: () {
                setState(() {
                  check = false;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Container exerui() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Center(
                child: Image.asset(exerlist[index]['anim']),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              color: mainaccent,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      exerlist[index]['title'],
                      style: TextStyleHeading,
                      textAlign: TextAlign.center,
                    ),
                    if (exerlist[index]['reqtype'].toString() ==
                        'time') // to check time  or sets
                      CountdownTimer(
                        onEnd: () {
                          setState(() {
                            check = true;
                          });
                        },
                        endTime: endTime = DateTime.now()
                                .millisecondsSinceEpoch +
                            1000 * int.parse(exerlist[index]['req'].toString()),
                        textStyle: TextStyleHeading,
                      ),
                      if (exerlist[index]['reqtype'].toString() ==
                          'sets') // to check time  or sets
                        Text(
                          exerlist[index]['req'].toString(),
                          style: TextStyleHeading,
                          textAlign: TextAlign.center,
                        ),
                    Container(
                        child: RoundButtonWhite(
                      textval: "✔ Next",
                      width: 100,
                      onpress: () {
                        setState(() {
                          totalkal= totalkal+14;
                          totalminutes=totalminutes+1;
                          totalexersice= totalexersice+1;
                          settotalkalData();
                          settotalworkoutsData();
                          setminutesData();
                          check = true;
                        });
                      },
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
