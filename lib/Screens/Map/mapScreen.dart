import 'dart:async';
import 'package:body_strong/Screens/MainScreens/HomeScreen/home.dart';
import 'package:body_strong/Screens/Map/clusterizedIconPainter.dart';
import 'package:body_strong/Screens/Map/mapPoint.dart';
import 'package:body_strong/themeColorAndfont.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;
  var _mapZoom = 0.0;
  CameraPosition? _userLocation;

  @override
  void dispose() {
    _mapController.dispose();
    _initLocationLayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (contetx) => Home()));
          }, icon: Icon(Icons.backspace),
        ),
      ),
      body: YandexMap(
        onMapCreated: (controller) async {
          _mapController = controller;
          await _initLocationLayer();
        },
        onCameraPositionChanged: (cameraPosition, _, __) {
          setState(() {
            _mapZoom = cameraPosition.zoom;
          });
        },
        mapObjects: [
          _getClusterizedCollection(
            placemarks: _getPlacemarkObjects(context),
          ),
        ],
        onUserLocationAdded: (view) async {
          // получаем местоположение пользователя
          _userLocation = await _mapController.getUserCameraPosition();
          // если местоположение найдено, центрируем карту относительно этой точки
          if (_userLocation != null) {
            await _mapController.moveCamera(
              CameraUpdate.newCameraPosition(
                _userLocation!.copyWith(zoom: 14),
              ),
              animation: const MapAnimation(
                type: MapAnimationType.linear,
                duration: 0.3,
              ),
            );
          }
          // меняем внешний вид маркера - делаем его непрозрачным
          return view.copyWith(
            pin: view.pin.copyWith(
              opacity: 1,
            ),
          );
        },
      ),
    );
  }


  /// Метод для получения коллекции кластеризованных маркеров
  ClusterizedPlacemarkCollection _getClusterizedCollection({
    required List<PlacemarkMapObject> placemarks,
  }) {
    return ClusterizedPlacemarkCollection(
        mapId: const MapObjectId('clusterized-1'),
        placemarks: placemarks,
        radius: 50,
        minZoom: 15,
        onClusterAdded: (self, cluster) async {
          return cluster.copyWith(
            appearance: cluster.appearance.copyWith(
              opacity: 1.0,
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  image: BitmapDescriptor.fromBytes(
                    await ClusterIconPainter(cluster.size)
                        .getClusterIconBytes(),
                  ),
                ),
              ),
            ),
          );
        },
        onClusterTap: (self, cluster) async {
          await _mapController.moveCamera(
            animation: const MapAnimation(
                type: MapAnimationType.linear, duration: 0.3),
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: cluster.placemarks.first.point,
                zoom: _mapZoom + 1,
              ),
            ),
          );
        });
  }


  @override
  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) =>
    value == LocationPermission.always ||
        value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  /// Метод, который включает слой местоположения пользователя на карте
  /// Выполняется проверка на доступ к местоположению, в случае отсутствия
  /// разрешения - выводит сообщение
  Future<void> _initLocationLayer() async {
    final locationPermissionIsGranted =
    await Permission.location.request().isGranted;

    if (locationPermissionIsGranted) {
      await _mapController.toggleUserLayer(visible: true);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Нет доступа к местоположению пользователя'),
          ),
        );
      });
    }
  }
}


/// Метод для генерации точек на карте
List<MapPoint> _getMapPoints() {
  return [
    MapPoint(name: 'Москва', latitude: 55.755864, longitude: 37.617698),
    MapPoint(name: 'Лондон', latitude: 51.507351, longitude: -0.127696),
    MapPoint(name: 'Рим', latitude: 41.887064, longitude: 12.504809),
    MapPoint(name: 'Париж', latitude: 48.856663, longitude: 2.351556),
    MapPoint(name: 'Стокгольм', latitude: 59.347360, longitude: 18.341573),
  ];
}


/// Метод для генерации объектов маркеров для отображения на карте
List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
  return _getMapPoints()
      .map(
        (point) => PlacemarkMapObject(
      mapId: MapObjectId('MapObject $point'),
      point: Point(latitude: point.latitude, longitude: point.longitude),
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            'assets/icons/map_point.png',
          ),
          scale: 2,
        ),
      ),
      onTap: (_, __) => showModalBottomSheet(
        context: context,
        builder: (context) => _ModalBodyView(
          point: point,
        ),
      ),
    ),
  )
      .toList();
}


/// Содержимое модального окна с информацией о точке на карте
class _ModalBodyView extends StatelessWidget {
  const _ModalBodyView({required this.point});


  final MapPoint point;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(point.name, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Text(
            '${point.latitude}, ${point.longitude}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}