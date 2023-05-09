import 'package:flutter/material.dart';
import 'package:ssd_frontend/Empresas/appbar_main_two.dart';
import 'package:ssd_frontend/Empresas/body_main_two.dart';
import 'body_main_two.dart';
import 'appbar_main_two.dart';

class homeScreentwo extends StatelessWidget {
  const homeScreentwo ({super.key});

  @override
  Widget build (BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main_images/alojamento_modified.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomAppBar2(),
            Spacer(),
            Body2(),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}