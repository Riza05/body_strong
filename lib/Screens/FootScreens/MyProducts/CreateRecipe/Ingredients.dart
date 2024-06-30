import 'dart:convert';
import 'dart:io';
import 'package:body_strong/Screens/FootScreens/MyProducts/CreateRecipe/ingredientsList.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Ингредиенты
class Ingredients extends StatefulWidget {
  const Ingredients({super.key});

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  File? image;
  bool isImageSelected = false;
  File? imageFile;

  final formKey = GlobalKey<FormState>();
  final ingredients = TextEditingController();
  final cookingMethod = TextEditingController();
  final cookingTime = TextEditingController();
  final typeOfDish = TextEditingController();
  final cookingTechnology = TextEditingController();

  List<Ingredientslist> list = [];
  late SharedPreferences sharedPreferences;

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? strList = sharedPreferences.getStringList("ingredientsList");
    if(strList != null) {
      list = strList.map((item) => Ingredientslist.fromJson(json.decode(item))).toList();
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
                                controller: ingredients,
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
                                controller: cookingMethod,
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
                                controller: cookingTime,
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
                              margin: const EdgeInsets.all(8),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.withOpacity(.2)),
                              child: TextFormField(
                                controller: typeOfDish,
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
                              margin: const EdgeInsets.all(8),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.withOpacity(.2)),
                              child: TextFormField(
                                controller: cookingTechnology,
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
                                      list.insert(0, Ingredientslist(
                                        ingredients: ingredients.text,
                                        cookingMethod: cookingMethod.text,
                                        cookingTime: cookingTime.text,
                                        typeOfDish: typeOfDish.text,
                                        cookingTechnology: cookingTechnology.text
                                      ));
                                      List<String> strList = list.map((item) => json.encode(item.toJson())).toList();
                                      sharedPreferences.setStringList("ingredientsList", strList);
                                      Navigator.pop(context,"loadData");
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
