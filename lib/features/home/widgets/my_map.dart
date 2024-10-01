import 'package:bretify_mvp/features/home/widgets/custom_marker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    // Solicitar permisos de ubicación
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // Manejar el caso donde el usuario no otorgó permisos
      return;
    }

    // Obtener la ubicación actual
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentLocation == null
        ? const Center(child: CircularProgressIndicator())
        : FlutterMap(
            options: MapOptions(
              initialCenter: currentLocation!,
              initialZoom: 11,
              interactionOptions: const InteractionOptions(
                flags: ~InteractiveFlag.doubleTapZoom,
              ),
            ),
            children: [
              openStreetMapTileLayer,
              MarkerLayer(
                markers: [
                  Marker(
                    width: 120,
                    height: 120,
                    point: currentLocation!,
                    child: const CustomMarker(
                      showAlways: false,
                      imgPath:
                          "https://instagram.fmga3-2.fna.fbcdn.net/v/t51.2885-19/459248735_1221688755773911_3283451154994673730_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fmga3-2.fna.fbcdn.net&_nc_cat=107&_nc_ohc=hXiBNThqTQQQ7kNvgFUHYGe&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_AYAEnfb35yD3h0s5FuUIRhFw790_gtx4vNrQNwMhzWsk8w&oe=6701467B&_nc_sid=7a9f4b",
                    ),
                  ),
                  const Marker(
                    width: 120,
                    height: 120,
                    point: LatLng(13.6339, -86.4753),
                    child: CustomMarker(
                      showAlways: true,
                      imgPath:
                          "https://i.pinimg.com/564x/0e/53/46/0e534664ece4a126870682017dec4679.jpg",
                    ),
                  ),
                  const Marker(
                    width: 120,
                    height: 120,
                    point: LatLng(13.0519, -85.4575),
                    child: CustomMarker(
                      showAlways: true,
                      imgPath:
                          "https://i.pinimg.com/564x/51/82/a4/5182a45c1fa324dc6a833d6b4c983372.jpg",
                    ),
                  )
                ],
              ),
            ],
          );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
      userAgentPackageName: "dev.fleaflet.flutter_map.example",
    );
