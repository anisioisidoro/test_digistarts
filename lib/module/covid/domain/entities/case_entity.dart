
class CaseEntity {
  CaseEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Result>? results;

  factory CaseEntity.fromJson(Map<String, dynamic> json) => CaseEntity(
        count: json["count"] == null ? null : json["count"],
        next: json["next"] == null ? null : json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.city,
    required this.cityIbgeCode,
    required this.confirmed,
    required this.confirmedPer100KInhabitants,
    required this.date,
    required this.deathRate,
    required this.deaths,
    required this.estimatedPopulation,
    required this.estimatedPopulation2019,
    required this.isLast,
    required this.orderForPlace,
    required this.placeType,
    required this.state,
  });

  dynamic city;
  String cityIbgeCode;
  int confirmed;
  double confirmedPer100KInhabitants;
  DateTime? date;
  double deathRate;
  int deaths;
  int estimatedPopulation;
  int estimatedPopulation2019;
  bool isLast;
  int orderForPlace;
  String placeType;
  String state;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        city: json["city"],
        cityIbgeCode:
            json["city_ibge_code"] == null ? null : json["city_ibge_code"],
        confirmed: json["confirmed"] == null ? null : json["confirmed"],
        confirmedPer100KInhabitants:
            json["confirmed_per_100k_inhabitants"] == null
                ? null
                : json["confirmed_per_100k_inhabitants"].toDouble(),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        deathRate:
            json["death_rate"] == null ? null : json["death_rate"].toDouble(),
        deaths: json["deaths"] == null ? null : json["deaths"],
        estimatedPopulation: json["estimated_population"] == null
            ? null
            : json["estimated_population"],
        estimatedPopulation2019: json["estimated_population_2019"] == null
            ? null
            : json["estimated_population_2019"],
        isLast: json["is_last"] == null ? null : json["is_last"],
        orderForPlace:
            json["order_for_place"] == null ? null : json["order_for_place"],
        placeType: json["place_type"] == null ? null : json["place_type"],
        state: json["state"] == null ? null : json["state"],
      );
}
