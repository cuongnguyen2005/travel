// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'package:travel/features/screens/checkout_flight.dart';
// import 'package:travel/features/widgets/appbar.dart';
// import 'package:travel/features/widgets/content_appbar_1.dart';
// import 'package:travel/models/flights.dart';
// import 'package:travel/models/hotels.dart';
// import 'package:travel/resource/color.dart';
// import 'package:travel/resource/constant.dart';
// import 'package:travel/resource/typo.dart';

// class ResultFlightArg {
//   final DateTime dateTimeFlight;
//   final int passenger;
//   final String uid;
//   final Hotels hotels;
//   ResultFlightArg({
//     required this.dateTimeFlight,
//     required this.passenger,
//     required this.uid,
//     required this.hotels,
//   });
// }

// class ResultFlight extends StatefulWidget {
//   const ResultFlight({super.key, required this.arg});
//   final ResultFlightArg arg;
//   static String routeName = '/result_flight';

//   @override
//   State<ResultFlight> createState() => _ResultFlightState();
// }

// class _ResultFlightState extends State<ResultFlight> {
//   @override
//   void initState() {
//     getListFlight();
//     super.initState();
//   }

//   List<Flight> checkFlights = [];

//   void getListFlight() {
//     // int dayFlight = widget.dateTimeFlight.day;
//     // int monthFlight = widget.dateTimeFlight.month;
//     // int yearFlight = widget.dateTimeFlight.year;
//     // for (var element in flights) {
//     //   int dayFlightDataBase = DateTime.parse(element.dateTime).day;
//     //   int monthFlightDataBase = DateTime.parse(element.dateTime).month;
//     //   int yearFlightDataBase = DateTime.parse(element.dateTime).year;
//     //   if (dayFlight == dayFlightDataBase &&
//     //       monthFlight == monthFlightDataBase &&
//     //       yearFlightDataBase == yearFlight) {
//     //     setState(() {
//     //       checkFlights.add(element);
//     //     });
//     //   }
//     // }
//     // print(checkFlights);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           const AppBarWidget(),
//           ContentAppBar1(
//             isFull: false,
//             onTap: onTapBack,
//           ),
//           Container(
//             padding: const EdgeInsets.only(top: 120),
//             child: Column(
//               children: [
//                 //head result
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Hà Nội', style: tStyle.HS18W()),
//                     SizedBox(width: smallestPadding),
//                     Container(height: 1, width: 20, color: white),
//                     SizedBox(width: smallestPadding),
//                     const RotatedBox(
//                       quarterTurns: 1,
//                       child: Icon(Icons.flight, color: Colors.white),
//                     ),
//                     SizedBox(width: smallestPadding),
//                     Container(height: 1, width: 20, color: white),
//                   ],
//                 ),
//                 SizedBox(height: mediumPadding),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       DateFormat('EEEE, MMM d, yyyy')
//                           .format(widget.arg.dateTimeFlight),
//                       style: tStyle.HS12W(),
//                     ),
//                     SizedBox(width: smallPadding),
//                     Container(
//                       height: 8,
//                       width: 8,
//                       decoration: BoxDecoration(
//                         color: white,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     SizedBox(width: smallPadding),
//                     Text(
//                       '${widget.arg.passenger} người',
//                       style: tStyle.HS12W(),
//                     ),
//                     SizedBox(width: smallPadding),
//                   ],
//                 ),
//                 SizedBox(height: biggerPadding),
//                 Flexible(
//                   child: ListView.builder(
//                     padding: EdgeInsets.zero,
//                     itemCount: flights.length,
//                     itemBuilder: (context, index) {
//                       DateTime departure =
//                           DateTime.parse(flights[index].departure);
//                       DateTime arrive = DateTime.parse(flights[index].arrive);
//                       return InkWell(
//                         onTap: () => onTapInfoFlight(index),
//                         child: Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: bigPadding, vertical: smallPadding),
//                           padding: EdgeInsets.all(bigPadding),
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.circular(mediumBorderRadius),
//                             color: white,
//                           ),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 1,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       border: Border(
//                                     right: BorderSide(width: 0.5, color: grey),
//                                   )),
//                                   child: Image.asset(
//                                     flights[index].imageFlight,
//                                     height: 80,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: bigPadding),
//                               Expanded(
//                                 flex: 2,
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text('Khởi hành',
//                                                 style: tStyle.HS12LB()),
//                                             Text(
//                                                 DateFormat.jm()
//                                                     .format(departure),
//                                                 style: tStyle.HS14Bold()),
//                                           ],
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text('Đến', style: tStyle.HS12LB()),
//                                             Text(DateFormat.jm().format(arrive),
//                                                 style: tStyle.HS14Bold()),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: bigPadding),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Số chuyến bay',
//                                               style: tStyle.HS12LB(),
//                                             ),
//                                             Text(
//                                               flights[index].noFlight,
//                                               style: tStyle.HS14Bold(),
//                                             ),
//                                           ],
//                                         ),
//                                         Text(
//                                           '\$${flights[index].price}',
//                                           style: tStyle.HS20(),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void onTapBack() {
//     Navigator.pop(context);
//   }

//   void onTapInfoFlight(index) {
//     Navigator.pushNamed(
//       context,
//       CheckoutFlight.routeName,
//       arguments: CheckoutFlightArg(
//         flight: flights[index],
//         dateTimeFlight: widget.arg.dateTimeFlight,
//         passenger: widget.arg.passenger,
//         uid: widget.arg.uid,
//         hotels: widget.arg.hotels,
//       ),
//     );
//   }
// }
