import 'package:body_strong/Screens/FootScreens/My_products/products_screen.dart';
import 'package:body_strong/Screens/FootScreens/My_products/products_screen.dart';
import 'package:flutter/material.dart';

class Product_template extends StatefulWidget {
  /*Product_template({
    required this.name,
    required this.asset,
    required this.namePage
  });

  String namePage;
  String asset;
  String name;*/


  @override
  State<Product_template> createState() => _Product_templateState();
}

class _Product_templateState extends State<Product_template> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
          ),
        ),
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
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 80)),
              Text("ss", style: TextStyle(
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
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 80,
                                height: 80,
                                child: CircleAvatar(
                                    backgroundImage: AssetImage("assets")
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const Product_screen(),
                                      ),
                                    );
                                  },
                                  child: const Text("Яблоко", style: TextStyle(
                                      fontSize: 26
                                  )),
                                ),
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
                )
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                        backgroundImage: AssetImage("assets")
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Product_screen(),
                          ),
                        );
                      },
                      child: const Text("Яблоко", style: TextStyle(
                        fontSize: 26
                      )),
                    ),
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
