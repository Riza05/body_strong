import 'package:body_strong/Screens/FootScreens/SportsNutrition/individualPageSportNutrition.dart';
import 'package:body_strong/Screens/FootScreens/SportsNutrition/sportsNutritionInfoList.dart';
import 'package:flutter/material.dart';

class SportsNutrition extends StatelessWidget {
  List titles= [
    "ПРОТЕИН",
    "ГЕЙНЕР",
    "КРЕАТИН",
    "ПРЕДТРЕНИРОВОЧНЫЙ КОМПЛЕКС",
    "ЖИРОСЖИГАТЕЛЬ",
    "БУСТЕР ТЕСТОСТЕРОНА",
    "АРГИНИН",
    "АМИНОКИСЛОТЫ",
    "ВИТАМИНЫ И МИНЕРАЛЫ",
    "L-КАРНИТИН",
    "ОМЕГА 3",
    "БЕТА-АЛАНИН",
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
              title: Text("Спортивное питание"),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0
          ),
        ],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              child: Card(
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndividualPageSportNutrition(titles[index], SportsNutritionInfoList().info[index])
                      )
                    );
                  },
                  child: ListTile(
                    leading: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(backgroundColor: Colors.red)),
                    title: Text(titles[index]),
                    subtitle: Text("оыооыоыоыоыолылы"),
                  )
                ),
              ),
            );
          }
        )
      )
      )
    );
  }
}
