import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter_heatmap/google_maps_flutter_heatmap.dart';

class HeatMap extends StatefulWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(50.935173, 6.953101),
    zoom: 14.4746,
  );

  @override
  _HeatMapState createState() => _HeatMapState();
}

class _HeatMapState extends State<HeatMap> {
  Completer<GoogleMapController> _controller = Completer();

  final Set<Heatmap> _heatmaps = {};

  LatLng _heatmapLocation = LatLng(50.935173, 6.953101);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /* body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Comming soon",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900
                ),
            )),
          ],
        ), */

        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: HeatMap._kGooglePlex,
          heatmaps: _heatmaps,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _addHeatmap,
          label: Text('Add Heatmap'),
          icon: Icon(Icons.add_box),
        ),
      ),
    );
  }

  void _addHeatmap() {
    setState(() {
      _heatmaps.add(Heatmap(
          heatmapId: HeatmapId(_heatmapLocation.toString()),
          points: _createPoints(_heatmapLocation),
          radius: 50,
          visible: true,
          gradient: HeatmapGradient(
              colors: <Color>[Colors.green, Colors.red],
              startPoints: <double>[0.2, 0.8])));
    });
  }

  List<WeightedLatLng> _createPoints(LatLng location) {
    final List<WeightedLatLng> points = <WeightedLatLng>[];
    //Can create multiple points here
    points.add(_createWeightedLatLng(location.latitude, location.longitude, 1));
    points.add(
        _createWeightedLatLng(location.latitude - 1, location.longitude, 1));
    return points;
  }

  WeightedLatLng _createWeightedLatLng(double lat, double lng, int weight) {
    return WeightedLatLng(point: LatLng(lat, lng), intensity: weight);
  }
}
