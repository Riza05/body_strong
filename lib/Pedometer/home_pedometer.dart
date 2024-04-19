import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pedometer/pedometer.dart';

class HomePedometer extends StatefulWidget {
  const HomePedometer({super.key});

  @override
  State<HomePedometer> createState() => _HomePedometerState();
}

class _HomePedometerState extends State<HomePedometer> {
  Color indicatorRed = Colors.red;
  Color indicatorGreen = Colors.green;
  bool ss = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.red,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Шаги",
                    style: TextStyle(
                      fontSize: 38,
                      color: ss ? indicatorRed : indicatorGreen
                    )
                  ),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.access_time, size: 30,)
                  ),
                  Text("Шаги",
                      style: TextStyle(
                          fontSize: 38,
                          color: indicatorGreen
                      )
                  ),
                  Pedo()
                ],
              )
            ],
          )
        )
      ),
    );
  }
}


class Pedo extends StatefulWidget {
  const Pedo({super.key});

  @override
  State<Pedo> createState() => _Pedo();
}

class _Pedo extends State<Pedo> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
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
      _steps = 'S';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Status: $_status')
          ],
        ),
      ),
    );
  }
}

  /*String _stepCountValue = '0';
  String _status = '';
  late StreamSubscription<int> _subscription;

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  void _initPlatformState() {
    Pedometer().initialize();
    _subscription = Pedometer.stepCountStream.listen(_onData, onError: _onError) as StreamSubscription<int>;
  }

  void _onData(int stepCountValue) {
    setState(() {
      _stepCountValue = '$stepCountValue';
    });
  }

  void _onError(error) {
    setState(() {
      _status = 'Failed to get step count';
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Step count: $_stepCountValue'),
            Text('Status: $_status')
          ],
        ),
      ),
    );
  }*/
  /*String muestrePasos = "";
  String _km = "Unknown";
  String _calories = "Unknown";
  String _stepCountValue = "Unknown";
  late StreamSubscription<int> _subscription;

  late double _numerox;
  late double _kmx;
  late double burnedx;

  @override
  void initState() {
    super.initState();
    setUpPedometer();
  }

  void setUpPedometer() {
    _subscription = Pedometer.stepCountStream.listen(_onData as void Function(StepCount event)?,
        onError: _onError,
        onDone: _onDone,
        cancelOnError: true
    ) as StreamSubscription<int>;
  }

  void _onDone() {

  }

  void _onError(error) {
    print("Flutter $error");
  }

  void _onData(int stepCountValue) async {
    print(stepCountValue);
    setState(() {
      _stepCountValue = "$stepCountValue";
      print(_stepCountValue);
    });

    var distance = stepCountValue;
    double y = (distance + .0);

    setState(() {
      _numerox = y;
    });

    num long3 = (_numerox / 100);
    long3 = num.parse(y.toStringAsFixed(4));
    long3 = (long3 / 1000);
    getDistanceRun(_numerox);
  }

  void getDistanceRun(double _numerox) {
    num distance = ((_numerox * 78) / 100000);
    distance = num.parse(distance.toString());
    setState(() {
      _km = "$distance";
      print(_km);
    });
    setState(() {
      _kmx = distance * 30;
    });
  }

  void getBurnedRun() {
    setState(() {
      _calories = "$_km";
      print(_calories);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 150,
      lineWidth: 13,
      animation: true,
      center: Row(
        children: [
          Container(
            child: Text("$_stepCountValue"),
          )
        ],
      ),
    );
  }*/
