import 'dart:io';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  /*bool isImageSelected = false;
  File? imageFile;
  Image? image;

  _pickImagefromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
        });
        Uniti.saveImageToPreferences(Uniti.base64String(imageFile!.readAsBytesSync()));
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  loadImageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imageKeyValue = prefs.getString("IMAGE_KEY");
    if (imageKeyValue != null) {
      final imageString = await Uniti.getImageFromPreferences();
      setState(() {
        image = Uniti.imageFromBase64String(imageString!);
      });
    }
  }

  _pickImagefromCamera() async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
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
  }*/

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print("Ошибка: $e");
    }
  }

  /*Image? image;

  pickImage(ImageSource source) async {
    final _image = await ImagePicker().pickImage(source: source);

    if (_image != null) {
      setState(() {
        image = Image.file(_image as File);
      });
      Uniti.saveImageToPreferences(
          Uniti.base64String(_image.readAsBytes()));
    } else {
      print('Error picking image!');
    }
  }

  loadImageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imageKeyValue = prefs.getString("IMAGE_KEY");
    if (imageKeyValue != null) {
      final imageString = await Uniti.getImageFromPreferences();
      setState(() {
        image = Uniti.imageFromBase64String(imageString!);
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ThemeColorAndfont().backScreen(context),
      body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            child: const Text("Открыть галерею", textAlign: TextAlign.center),
                            onPressed: () async {
                              //await _pickImagefromGallery();
                              pickImage(ImageSource.gallery);
                            }),
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            child: const Text("Открыть камеру", textAlign: TextAlign.center),
                            onPressed: () async {
                              //await _pickImagefromCamera();
                              pickImage(ImageSource.camera);
                            }),
                      ),
                    ],
                  ), image == null ? Text("пусто") : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(image: FileImage(image!)),
                                  ElevatedButton(onPressed: (){
                                  },
                                    child: Text("Опубликовать"))
                                ],
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
