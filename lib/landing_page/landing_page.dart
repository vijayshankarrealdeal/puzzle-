import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../board/board.dart';
import '../platform/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(PuzzlePlatform.getImagePath()),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: double.infinity),
                Text(
                  'Puzzle',
                  style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: PuzzlePlatform.getFontSize(context),
                      fontFamily: 'MyFonts'),
                ),
                kIsWeb
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05)
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2),
                CupertinoButton(
                    child: const Text(
                      "Press Start Button",
                      style: TextStyle(
                        fontFamily: 'MyFonts',
                        color: CupertinoColors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            curve: Curves.fastOutSlowIn,
                            duration: const Duration(milliseconds: 2000),
                            type: PageTransitionType.fade,
                            alignment: Alignment.center,
                            child: const Board(),
                            inheritTheme: true,
                            ctx: context),
                      );
                    }),
                const Spacer(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: 1,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/sm1.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
