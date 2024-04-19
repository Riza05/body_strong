import 'package:flutter/material.dart';

class TabataListOfExercisesTemplate extends StatefulWidget {
  String image;
  String name;

  TabataListOfExercisesTemplate(
    this.image,
    this.name
  );

  @override
  State<TabataListOfExercisesTemplate> createState() => _TabataListOfExercisesTemplateState();
}

class _TabataListOfExercisesTemplateState extends State<TabataListOfExercisesTemplate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Image(
                        image: AssetImage(widget.image)
                       ),
                      ElevatedButton(
                        onPressed: (){},
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 26
                          )
                        )
                      )
                    ],
                  );
                }
              )
            )
          ],
        )
      )
    );
  }
}
