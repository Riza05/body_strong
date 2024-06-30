import 'dart:convert';
import 'dart:io';
import 'package:body_strong/Screens/WorkoutScreen/MyExercises/exercisesList.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatingAnExercise extends StatefulWidget {
  const CreatingAnExercise({super.key});

  @override
  State<CreatingAnExercise> createState() => _CreatingAnExerciseState();
}

class _CreatingAnExerciseState extends State<CreatingAnExercise>{
  File? image;
  bool isImageSelected = false;
  File? imageFile;

  final formKey = GlobalKey<FormState>();
  final img = TextEditingController();
  final title = TextEditingController();
  final description = TextEditingController();
  final warning = TextEditingController();

  List<Exerciseslist> list = [];
  late SharedPreferences sharedPreferences;

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? strList = sharedPreferences.getStringList("exercisesList");
    if(strList != null) {
      list = strList.map((item) => Exerciseslist.fromJson(json.decode(item))).toList();
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  _pickImagefromGallery() async {
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
        });
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  _pickImagefromCamera() async {
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
        });
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Ошибка долбарик: $e");
    }
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: InkWell(
                  onTap: (){
                    _showSimpleDialog();
                  },
                  child: isImageSelected
                    ? CircleAvatar(
                        backgroundImage: FileImage(imageFile!),
                    ) : CircleAvatar(
                      child: Text("Загрузите фото")
                  ),
                ),
              ),
            Form(
            key: formKey,
            child: Column(
                children: [
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.withOpacity(.2)),
                    child: TextFormField(
                      controller: title,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Поле не должно быть пустым";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Название",
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.withOpacity(.2)),
                    child: TextFormField(
                      controller: description,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Поле не должно быть пустым";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Описание",
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.withOpacity(.2)),
                    child: TextFormField(
                      controller: warning,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Поле не должно быть пустым";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Предупреждени",
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ),

                  Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8)),
                      child: ElevatedButton(
                          onPressed: () {
                              list.insert(0, Exerciseslist(
                              title: title.text,
                              description: description.text,
                              warning: warning.text,
                              ));
                              List<String> strList = list.map((item) => json.encode(item.toJson())).toList();
                              sharedPreferences.setStringList("exercisesList", strList);
                              Navigator.pop(context,"Data");
                          },
                          child: const Text("Войти", style: TextStyle(
                              fontSize: 20
                          )))),
            ]
          )
        )
            ]
      ),
      ),
      )
    );
  }

  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("Выберите способ"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () async {
                  await _pickImagefromCamera();
                },
                child: const Text('Камера'),
              ),
              SimpleDialogOption(
                onPressed: () async {
                  await _pickImagefromGallery();
                },
                child: const Text('Галерея'),
              ),
            ],
          );
        }
      );
  }
}
