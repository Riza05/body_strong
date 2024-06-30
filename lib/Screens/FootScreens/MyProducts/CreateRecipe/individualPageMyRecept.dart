import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndividualPagemyRecept extends StatefulWidget {
  IndividualPagemyRecept({required this.data});
  List data;

  @override
  State<IndividualPagemyRecept> createState() => _IndividualPagemyReceptState();
}

class _IndividualPagemyReceptState extends State<IndividualPagemyRecept> {
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
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              const SizedBox(
                height: 250,
                width: 250,
                child: CircleAvatar(
                  backgroundColor: Colors.red
                ),
              ),
              Text("sllslsl"),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index){
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Card(
                          color: Colors.black.withOpacity(0.1),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Text(widget.data[index]))
                      ),
                    );
                  }
                ),
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
                color: Colors.black.withOpacity(0.1),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text("kksksssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"))
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
