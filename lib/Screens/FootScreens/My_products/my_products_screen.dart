import 'package:flutter/material.dart';

class My_products_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: const Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 80)),
              Text("Мои продукты", style: TextStyle(
                fontSize: 38,
                color: Color(0xFFFAFF00)
              )),
              Padding(padding: EdgeInsets.only(top: 60)),
              Text("Избранные", style: TextStyle(
                fontSize: 38,
                color: Color(0xFFFAFF00)
              )),
              Padding(padding: EdgeInsets.only(top: 60)),
              Expanded(
                  child: _List_products()
              )
            ]
          )
        )
      )
    );
  }
}

class _List_products extends StatefulWidget {
  const _List_products({super.key});

  @override
  State<_List_products> createState() => _List_productsState();
}

class _List_productsState extends State<_List_products> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                        backgroundImage: AssetImage("assets/na-avy-parni-44.jpg")
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Яблоко", style: TextStyle(
                      fontSize: 26
                    )),
                  ),
                  Checkbox(
                    activeColor: Color(0xFFFAFF00),
                    checkColor: Colors.black,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ]
            ),
          );
        }
    );
  }
}
