import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class IndividualPageSportNutrition extends StatelessWidget {
  IndividualPageSportNutrition(this.title, this.subtitle);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ThemeColorAndfont().backScreen(context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                )
              ),
              ListTile(
                title: Text(title),
                subtitle: Text(subtitle),
              )
            ],
          ),
        ),
      )
    );
  }
}
