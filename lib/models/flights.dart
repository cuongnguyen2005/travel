// ignore_for_file: public_member_api_docs, sort_constructors_first
class Flight {
  String dateTime;
  String departure;
  String arrive;
  int price;
  String noFlight;
  String imageFlight;
  Flight({
    required this.dateTime,
    required this.departure,
    required this.arrive,
    required this.price,
    required this.noFlight,
    required this.imageFlight,
  });
}

List<Flight> flights = [
  Flight(
    dateTime: "2023-10-31T00:00",
    departure: "2023-10-31T04:00",
    arrive: "2023-10-31T07:00",
    price: 245,
    noFlight: 'NNS24',
    imageFlight: 'assets/images/air_asia.png',
  ),
  Flight(
    dateTime: "2023-11-08T00:00",
    departure: "2023-10-31T04:00",
    arrive: "2023-10-31T07:00",
    price: 200,
    noFlight: 'NNS24',
    imageFlight: 'assets/images/air_aruda.png',
  ),
  Flight(
    dateTime: "2023-10-31T00:00",
    departure: "2023-10-31T04:00",
    arrive: "2023-10-31T07:00",
    price: 300,
    noFlight: 'NNS24',
    imageFlight: 'assets/images/air_batik.png',
  ),
  Flight(
    dateTime: "2023-11-08T00:00",
    departure: "2023-10-31T04:00",
    arrive: "2023-10-31T07:00",
    price: 220,
    noFlight: 'NNS24',
    imageFlight: 'assets/images/air_lion.png',
  ),
];
