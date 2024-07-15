import 'dart:convert';
import 'dart:io';
import 'package:body_strong/Screens/Profil/Uniti.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Страница "Профиль"
class Profil extends StatefulWidget {
  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  //Icons.add_box_outlined
  List listImg = [];
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;

      final imageTemporary = File(_image.path);
      setState(() => this.image = imageTemporary);
      Uniti.saveImageToPreferences(
          Uniti.base64String(image!.readAsBytesSync()));
    } on PlatformException catch (e) {
      print("Ошибка: $e");
    }
  }

  Future<File> writeImageToFile(String base64Image, String filename) async {
    Uint8List bytes = base64Decode(base64Image);

    // Получение временной директории для сохранения файла
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    // Создание файла
    File file = File('$tempPath/$filename');

    // Запись байтов в файл
    await file.writeAsBytes(bytes);

    return file;
  }

  loadImageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imageKeyValue = prefs.getString("IMAGE_KEY");
    if (imageKeyValue != null) {
      final imageString = await Uniti.getImageFromPreferences();
      final imageFile = await writeImageToFile(imageString!, 'saved_image.jpg');
      setState(() {
        image = imageFile;
      });
    }
  }

  @override
  void initState() {
    loadImageFromPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeColorAndfont().themeColorAndfont(context),
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Color(0xFFFAFF00),
                  )
                ),
                actions: [
                  IconButton(
                    onPressed: (){
                      showDialog(context: context, builder: (context) =>
                        SimpleDialog(
                          title: Text("Выберите способ"),
                          children: [
                            SimpleDialogOption(
                              onPressed: (){
                                pickImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              child: Text("Галерея"),
                            ),
                            SimpleDialogOption(
                              onPressed: (){
                                pickImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              child: Text("Камера"),
                            )
                          ],
                        )
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 25,
                      color: Color(0xFFFAFF00),
                    )
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
            ),
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
                    Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: image == null ? const CircleAvatar(
                          backgroundImage: AssetImage("assets/na-avy-parni-44.jpg"))
                          : CircleAvatar(backgroundImage: FileImage(image!)) ,
                    ),
                  ),
                  Text("Риза Мисриханов", style: ThemeColorAndfont().themeColorAndfont(context).textTheme.titleMedium),
                   image == null ? Text("У вас пока нету опубликованных фотографий")
                     : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10
                          ),
                          itemCount: listImg.length,
                          itemBuilder: (context, index) {
                            return Image(
                              image: FileImage(image!),
                              height: 200,
                              width: 200,
                            );
                          }
                        ),
                      ),
                    )
                ]
              )
            ),
        ),
    );
  }
}