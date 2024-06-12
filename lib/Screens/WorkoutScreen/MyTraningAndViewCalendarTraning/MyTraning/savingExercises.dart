import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavingExercises extends StatefulWidget {
  SavingExercises(
    this.avatar,
    this.nameExercise,
    this.num
  );
  String avatar;
  String nameExercise;
  int num;

  @override
  State<SavingExercises> createState() => _SavingExercisesState();
}

final pov = TextEditingController();

class _SavingExercisesState extends State<SavingExercises> {
  String a = "";
  TextEditingController kg = TextEditingController();
  int j = 0;

  @override
  void initState() {
    setState(() {
      j += 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ThemeColorAndfont().backScreen(context),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: ListView.builder(
            itemCount: j,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(widget.avatar)
                                )
                              ),
                              Text(widget.nameExercise, style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              )),
                             IconButton(onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return _dialog(context);
                                  }
                                );
                              }, icon: const Icon(Icons.add))
                            ],
                          ),
                        ),
                      ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              height: 60,
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("кг " + a),
                                    Text("пов " + a)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  )
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Dialog _dialog(BuildContext con) {
    return Dialog(
        backgroundColor: Colors.white,
        child: Container(
          height: 400,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Подход №1", style: TextStyle(
                fontSize: 26
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("КГ"),
                  Container(
                    width: 150,
                    child: TextFormField(
                      controller: kg,
                      decoration: InputDecoration(),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.exposure_minus_1)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.plus_one)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ПОВ"),
                  Container(
                    width: 150,
                    child: TextFormField(
                      controller: pov,
                      decoration: InputDecoration(),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.exposure_minus_1)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.plus_one)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: (){
                      setState(() {
                        this.a = kg.text;
                        Navigator.of(con, rootNavigator: true).pop();
                      });
                    },
                    child: Text("Сохранить", style: TextStyle(
                      color: Colors.green,
                      fontSize: 18
                    ))
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text("Отмена", style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18
                      ))
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text("Удалить", style: TextStyle(
                        color: Colors.red,
                        fontSize: 18
                      ))
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
