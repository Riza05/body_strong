//import 'dart:convert';

import 'package:body_strong/API_modul/remm.dart';
import 'package:flutter/material.dart';

import 'Post.dart';
//import 'package:http/http.dart' as http;

/*class Api_exercises {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;

  const Api_exercises({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions
  });

  factory Api_exercises.fromJson(Map<String, dynamic> json) {
    return Api_exercises(
        name: json["name"],
        type: json["type"],
        muscle: json["muscle"],
        equipment: json["equipment"],
        difficulty: json["difficulty"],
        instructions: json["instructions"]
    );
  }
}

class Fut{
  Future<Api_exercises> api() async {
    final response = await http.get(Uri.parse("https://api.api-ninjas.com/v1/exercises?muscle=biceps"),);
    if (response.statusCode == 200) {
      return Api_exercises.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}*/

class Qww extends StatelessWidget {
  const Qww({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pppa(),
      )
    );
  }
}


class pppa extends StatefulWidget {
  const pppa({super.key});

  @override
  State<pppa> createState() => _pppaState();
}

class _pppaState extends State<pppa> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     return Visibility(
       visible: isLoaded,
       child: ListView.builder(
          itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(posts![index].title)
              );
          }
        ),
       replacement: const Center(child: CircularProgressIndicator()),
     );
  }
}
