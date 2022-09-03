import 'package:fitnessapp/screens/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DietPage extends StatefulWidget {
  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: NavDrawer(),
          body: ModalProgressHUD(
            inAsyncCall: isloading,
            child: WebView(
              initialUrl: 'https://www.myfitnesspal.com/food/search',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isloading = false;
                });
              },
            ),
          )),
    );
  }
}
