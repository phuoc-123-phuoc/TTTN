import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_store_app/core.dart';
import 'package:multi_store_app/galleries/shoes_gallery.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({Key? key}) : super(key: key);

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  Timer? countDowntimer;
  int seconds = 3;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startTimer() {
    countDowntimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds--;
      });
      if (seconds < 0) {
        stopTimer();
        Navigator.pushReplacementNamed(context, '/customer_home');
      }
      print(timer.tick);
      print(seconds);
    });
  }

  void stopTimer() {
    countDowntimer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
              onTap: () {
                stopTimer();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const ShoesGalleryScreen(
                              fromOnBoarding: true,
                            )),
                    (Route route) => false);

                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(
                //         builder: (context) => const SubCategProducts(
                //             fromOnBoarding: true,
                //             subcategName: 'smart watch',
                //             maincategName: 'electronics')),
                //     (Route route) => false);
              },
              child: Image.asset('images/onboard/shoes.JPEG')),
          Positioned(
            top: 60,
            right: 30,
            child: Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.shade600.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25)),
              child: MaterialButton(
                onPressed: () {
                  stopTimer();
                  Navigator.pushReplacementNamed(context, '/customer_home');
                },
                child:
                    seconds < 1 ? const Text('Skip') : Text('Skip | $seconds'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
