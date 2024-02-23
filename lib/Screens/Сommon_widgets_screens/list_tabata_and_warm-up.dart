import 'package:flutter/material.dart';

class List_tabata_and_warm extends StatefulWidget {
  List_tabata_and_warm(
      this.containerBackground,
      this.text,
      this.count
      );

  String containerBackground;
  List<String> text;
  int count;

  @override
  State<List_tabata_and_warm> createState() => _List_tabata_and_warmState();
}

class _List_tabata_and_warmState extends State<List_tabata_and_warm> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 30),
      itemCount: widget.count,
      itemBuilder: (context, indedx) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.containerBackground),
                      fit: BoxFit.cover
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 200,
                    child: InkWell(
                        onTap: () {

                        },
                        child: Center(
                          child: Text(widget.text[indedx], style: TextStyle(
                              fontSize: 50,
                              color: Colors.white
                          )),
                        )
                    ),
                  ),
                ),
          ),
        );
      }
    );
  }
}

