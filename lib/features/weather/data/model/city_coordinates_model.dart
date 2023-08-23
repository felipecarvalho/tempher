class CityCoordinatesModel {
  final double lat;
  final double lon;
  final String name;
  final Map? localNames;

  CityCoordinatesModel({
    required this.lat,
    required this.lon,
    required this.name,
    required this.localNames,
  });

  factory CityCoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CityCoordinatesModel(
      lat: json['lat'],
      lon: json['lon'],
      localNames: json['local_names'] ?? {},
      name: json['name'],
    );
  }
}
