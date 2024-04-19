import 'package:flutter/material.dart';

class Scroll_menu_items extends StatelessWidget {
  int index;
  List<String> titles = [];

  Scroll_menu_items({
    super.key,
    required this.index,
    required this.titles,
  });


  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        builder: (context, controller){
          return Container(
              color: Colors.white,
              child: ListView.builder(
                  controller: controller,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, index){
                    return Container(
                      child: Text("slpslpls"),
                    );
                  }
              )
          );

        }
    );
  }
}




