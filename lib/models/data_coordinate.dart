class DataLonLatDate {
  double lat;
  double lon;
  String dateTime;
  int durationInSec;
  double accuracy;

  DataLonLatDate({
    this.lat = 0.0,
    this.lon = 0.0,
    this.dateTime = '-',
    this.durationInSec = 0,
    this.accuracy = 0.0,
  });

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "dateTime": dateTime,
        "durationInSec": durationInSec,
        "accuracy": accuracy,
      };

  factory DataLonLatDate.fromJson(Map<String, dynamic> json) => DataLonLatDate(
      lat: json["lat"],
      lon: json["lon"],
      dateTime: json["dateTime"],
      durationInSec: json["durationInSec"],
      accuracy: json["accuracy"]);
}
