import 'package:body_strong/Screens/WorkoutScreen/Measurements/measurements_screen.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/material.dart';

class HomeMeasurements extends StatefulWidget {
  const HomeMeasurements({super.key});

  @override
  State<HomeMeasurements> createState() => _HomeMeasurementsState();
}

class _HomeMeasurementsState extends State<HomeMeasurements> {
  /*bool isVisible = true;
  var title = "";
  var description = "";
  var warning = "";

  @override
  void initState() {
    getSaveData();
    super.initState();
  }

  getSaveData() async {
    final prefs = await SharedPreferences.getInstance();
    title = prefs.getString("title")!;
    description = prefs.getString("description")!;
    warning = prefs.getString("warning")!;
    setState(() {

    });
  }

  clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    setState(() {
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeColorAndfont().themeColorAndfont(context),
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: ThemeColorAndfont().backScreen(context),
            body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                         image: AssetImage("assets/iPhone-13-Pro-Max-13.jpg"),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Замеры", style: TextStyle(
                            fontSize: 38
                        )),
                        SizedBox(height: 40),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Text("Записывайте и сохраняйте ваши данные, они будут всегда под рукой", style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),textAlign: TextAlign.center,),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Measurements()));
                            },
                            child: Text("Создать", style: TextStyle(
                                fontSize: 20
                            )
                            )
                        ),
                      ],
                    )
                )
            )
    );
  }
}
