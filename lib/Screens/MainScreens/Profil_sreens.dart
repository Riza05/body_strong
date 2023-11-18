import 'package:flutter/material.dart';

class Article_screens extends StatelessWidget {
  const Article_screens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
        )),
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                  fit: BoxFit.cover)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){},
                      icon: const Icon(Icons.add_box_outlined, size: 45),
                        color: Colors.yellow),
                    IconButton(onPressed: (){},
                      icon: const Icon(Icons.arrow_back_rounded, size: 45),
                        color: Colors.yellow,)
                  ]
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                const SizedBox(
                  width: 250,
                  height: 250,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/na-avy-parni-44.jpg")
                  ),
                ),
                const Text("Риза Мисриханов", style: TextStyle(
                  fontSize: 38
                )),
                const Padding(padding: EdgeInsets.only(top: 35),
                  child: Text("Статус", style: TextStyle(
                      fontSize: 26
                  ))
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Icon(),
                    _Icon(),
                    _Icon(),
                    _Icon(),
                  ]
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 35),
                      child: Text("Посты", style: TextStyle(
                        fontSize: 26
                      ))
                    ),
                    Padding(padding: EdgeInsets.only(top: 35),
                        child: Text("Вас отметили", style: TextStyle(
                          fontSize: 26
                        ))
                    ),
                  ],
                ),
              ]
            )
          ),
        ),
      )
    );
  }
}


class _Icon extends StatelessWidget {
  const _Icon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: 60,
        height: 60,
        child: CircleAvatar(
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
