import 'package:fitnessapp/components/exer_card.dart';
import 'package:fitnessapp/components/round_button.dart';
import 'package:fitnessapp/screens/nav_pages/beginner_plan_exr/big_abs_exr.dart';
import 'package:flutter/material.dart';

import '../../nav_drawer.dart';
import '../start_exer.dart';

class inter_abs_exr extends StatefulWidget {
  @override
  _inter_abs_exrState createState() => _inter_abs_exrState();
}

class _inter_abs_exrState extends State<inter_abs_exr> {
  String kcal = '146.2';
  String exrtime = '29 mins';
  String exrtitle = 'ABS INTERMEDIATE';

  var interabs = [
    // {
    //   'title': 'JUMPING JACKS',
    //   'req': '30',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    // {
    //   'title': 'HEEL TOUCH',
    //   'req': 'x26',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'CROSSOVER CRUNCH',
    //   'req': 'x20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'MOUNTAIN CLIMBER',
    //   'req': 'x20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'SIDE BRIDGES LEFT',
    //   'req': 'x12',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'SIDE BRIDGES RIGHT',
    //   'req': 'x12',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'BUTT BRIDGE',
    //   'req': 'x20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'BICYCLE CRUNCHES',
    //   'req': '20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    // {
    //   'title': 'V-UP',
    //   'req': 'x20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'HEEL TOUCH',
    //   'req': 'x26',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'ABDOMINAL CRUNCHES',
    //   'req': 'x20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'PLANK',
    //   'req': '30',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    // {
    //   'title': 'CROSSOVER CRUNCH',
    //   'req': 'x20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'LEG RAISES',
    //   'req': 'x16',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'BICYCLE CRUNCHES',
    //   'req': 'x20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'PUSH-UP & ROTATION',
    //   'req': 'x20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'sets'
    // },
    // {
    //   'title': 'SIDE PLANK RIGHT',
    //   'req': '20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    // {
    //   'title': 'SIDE PLANK LEFT',
    //   'req': '20',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    // {
    //   'title': 'COBRA STRETCH',
    //   'req': '30',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    // {
    //   'title': 'SPINE LUMBER TWIST STRETCH LEFT',
    //   'req': '30',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    // {
    //   'title': 'SPINE LUMBER TWIST STRETCH RIGHT',
    //   'req': '30',
    //   'anim': 'images/jumping_jack2.gif',
    //   'reqtype': 'time'
    // },
    {
      'title': 'JUMPING JACKS',
      'req': '20',
      'anim': 'images/gif/Jumping Jack.gif',
      'reqtype': 'time'
    },
    {
      'title': 'ABDOMINAL CRUNCHES',
      'req': 'x16',
      'anim': 'images/gif/Abdominal crunches.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'RUSSSIAN TWIST',
      'req': 'x20',
      'anim': 'images/gif/russian twist.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'MOUNTAIN CLIMBER',
      'req': 'x16',
      'anim': 'images/gif/mountain climber.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'HEEL TOUCH',
      'req': 'x20',
      'anim': 'images/gif/inchworms.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'LEG RAISES',
      'req': 'x16',
      'anim': 'images/gif/leg Rasises.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'PLANK',
      'req': '20',
      'anim': 'images/gif/plank.gif',
      'reqtype': 'time'
    },
    {
      'title': 'ABDOMINAL CRUNCHES',
      'req': 'x12',
      'anim': 'images/gif/Abdominal crunches.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'RUSSSIAN TWIST',
      'req': 'x32',
      'anim': 'images/gif/russian twist.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'MOUNTAIN CLIMBER',
      'req': 'x12',
      'anim': 'images/gif/mountain climber.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'HEEL TOUCH',
      'req': 'x20',
      'anim': 'images/gif/inchworms.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'LEG RAISES',
      'req': 'x14',
      'anim': 'images/gif/leg Rasises.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'PLANK',
      'req': '20',
      'anim': 'images/gif/plank.gif',
      'reqtype': 'time'
    },
    {
      'title': 'COBRA STRETCH',
      'req': '30',
      'anim': 'images/gif/chest strecth.gif',
      'reqtype': 'time'
    },
    {
      'title': 'SPINE LUMBER TWIST STRETCH LEFT',
      'req': 'x16',
      'anim': 'images/gif/Side Plank With Quad Stretch.gif',
      'reqtype': 'sets'
    },
    {
      'title': 'SPINE LUMBER TWIST STRETCH RIGHT',
      'req': 'x16',
      'anim': 'images/gif/Side Plank With Quad Stretch.gif',
      'reqtype': 'sets'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("ABS INTERMEDIATE"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/abs_ex.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  for (int i = 0; i < interabs.length; i++)
                    ExerCard(
                      title: interabs[i]['title'],
                      req: interabs[i]['reqtype'] == 'time'
                          ? "00:" + interabs[i]['req']!
                          : interabs[i]['req'],
                      gifpath: interabs[i]['anim'],
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  RoundButton(
                    textval: "START EXERCISE",
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartExer(
                                  interabs, kcal, exrtime, exrtitle)));
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
