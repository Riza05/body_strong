import 'dart:ui';

import 'package:body_strong/Screens/Pedometer/Music/music.dart';
import 'package:body_strong/textFormFieldTemplate.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePedometer extends StatefulWidget {
  @override
  _HomePedometerState createState() => _HomePedometerState();
}

class _HomePedometerState extends State<HomePedometer> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';
  bool isSection = true;
  bool isStartAndStop = true;
  var geo = Geolocator.getPositionStream();
  double _speed = 0;
  bool isBtns = true;
  List titlePages = [
    "Упражнения для бега",
    "Локации"
  ];

  void _getCurrentSpeed() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _speed = (3600 * position.speed) / 1000;
    });
  }

  final Stopwatch _stopwatch = Stopwatch();

  // Timer
  late Timer _timer;

  // The result which will be displayed on the screen
  String _result = '00:00:00';

  // This function will be called when the user presses the Start button
  void _start() {
    // Timer.periodic() will call the callback function every 100 milliseconds
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      // Update the UI
      setState(() {
        // result in hh:mm:ss format
        _result =
        '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
      });
    });
    // Start the stopwatch
    _stopwatch.start();
  }

  // This function will be called when the user presses the Stop button
  void _stop() {
    _timer.cancel();
    _stopwatch.stop();
  }

  // This function will be called when the user presses the Reset button
  void _reset() {
    _stop();
    _stopwatch.reset();
    // Update the UI
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getCurrentSpeed();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeColorAndfont().themeColorAndfont(context),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            color: const Color(0xFFFAFF00),
            icon: const BackButtonIcon(),
          ),
          title: Text(
              "Бег и ходьба",
              style: const TextStyle(
                  color: Color(0xFFFAFF00)
              )
          ),
          actions: [
            isSection == true ? _appBarDialog()
              : IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AudioPlayerPage()));
                },
                icon: Icon(Icons.my_library_music_rounded)
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF144771), Color(0xFF071A2C)]
              )
            ),
            child: isSection == true ? Stack(children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Пройдено шагов\n${_steps}",
                      style: ThemeColorAndfont().themeColorAndfont(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                   ElevatedButton(
                          onPressed: (){
                              setState(() {
                                isSection = false;
                              });
                            },
                            child: const Text("Начать бегать")
                        ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 1,
                builder: (context, _controller) {
                    return ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Container(
                                      height: 5,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50)
                                        )
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      controller: _controller,
                                      itemCount: titlePages.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 40),
                                          child: SizedBox(
                                            height: 50,
                                            width: 300,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(titlePages[index],
                                                    style: const TextStyle(fontSize: 26)
                                                )
                                            ),
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    );
                  }
              )
            ]
          ) : Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /*CircularPercentIndicator(
                        radius: 100,
                        center: Text("Подсчет шагов\n${_steps}", textAlign: TextAlign.center),
                        percent: double.parse(_steps) * 100 / 5000 / 100,
                        progressColor: Colors.red,
                      ),*/
                      _gridView(),
                      _btns(),
                      btn((){
                        showDialog(context: context, builder: (context) =>
                            AlertDialog(
                              title: const Text("Закончить бег?"),
                              actions: [
                                TextButton(
                                    onPressed: (){
                                      setState(() {
                                        isSection = true;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Да")
                                ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Нет")
                                ),
                              ],
                            )
                        );
                      },
                        "Закончить",
                      ),
                    ]
                )
              )
          ),
        ),
      ),
    )
  );
}

  IconButton _appBarDialog() {
    return IconButton(
      onPressed: (){
        showDialog(context: context, builder: (context) =>
          SimpleDialog(
            title: Text("Цели"),
            children: [
              SimpleDialogOption(
                child:Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.2)
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Неверное имя";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        icon: const Icon(
                            Icons.person,
                            color: Color(0xFFFAFF00)
                        ),
                        border: InputBorder.none,
                        hintText: "Дистанция",
                        hintStyle: const TextStyle(color: Colors.black, fontSize: 18)
                    ),
                  ),
                )
              ),

                  SimpleDialogOption(
                      child:Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Неверное имя";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              icon: const Icon(
                                  Icons.person,
                                  color: Color(0xFFFAFF00)
                              ),
                              border: InputBorder.none,
                              hintText: "Дистанция",
                              hintStyle: const TextStyle(color: Colors.black, fontSize: 18)
                          ),
                        ),
                      )
                  ),
                  SimpleDialogOption(
                      child:Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white.withOpacity(0.2)
                        ),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Неверное имя";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              icon: const Icon(
                                  Icons.person,
                                  color: Color(0xFFFAFF00)
                              ),
                              border: InputBorder.none,
                              hintText: "Дистанция",
                              hintStyle: const TextStyle(color: Colors.black, fontSize: 18)
                          ),
                        ),
                      )
                  ),
              ]
            )
          );
        },
      icon: const Icon(Icons.add)
    );
  }

  ClipRRect _gridView() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width - 40,
          child: Card(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_steps),
                    Text(_result),
                    Text(_steps),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("ss"),
                    Text("ss"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _btns() {
         return Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             btn((){
               _start();
               setState(() {
                 isBtns = false;
               });
             }, "Старт"),
             btn((){
               _stop();
               setState(() {
                 isBtns = true;
               });
             }, "Стоп"),
             btn((){
               _reset();
               setState(() {
                 isBtns = true;
               });
        }, "Рестарт")
      ]
    );
  }

  Widget btn(VoidCallback vc, String text) {
    return ElevatedButton(
      onPressed: vc,
      child: Text(text)
    );
  }
}