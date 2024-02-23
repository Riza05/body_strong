import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

class Human_model_screen extends StatelessWidget {
  const Human_model_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: _Human_model_screen(),
        )
      )
    );
  }
}

class _Human_model_screen extends StatefulWidget {
  const _Human_model_screen({super.key,});

  @override
  State<_Human_model_screen> createState() => _Human_model_screenState();
}

class _Human_model_screenState extends State<_Human_model_screen> {
  bool imageP = false;
  List<AssetImage> imageList = <AssetImage>[];

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (imageP == true) ? ImageView360(
      key: UniqueKey(),
      imageList: imageList,
      autoRotate: true,
      rotationCount: 2,
      rotationDirection: RotationDirection.anticlockwise,
      frameChangeDuration: Duration(milliseconds: 50),
      swipeSensitivity: 2,
      allowSwipeToRotate: true,
    ) : const Text("djdkkkkd");
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 52; i++) {
      imageList.add(AssetImage('assets/aerial-drone-panorama-view-village-located-near-river-hills-fields-godrays-clouds-moldova.jpg'));
// To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/aerial-drone-panorama-view-village-located-near-river-hills-fields-godrays-clouds-moldova.jpg'), context);
    }
    setState(() {
      imageP = true;
    });
  }
}


