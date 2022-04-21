import 'package:badmintop/model/booked.dart';
import 'package:badmintop/model/gor.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';

class NewestBookingWidget extends StatelessWidget {
  const NewestBookingWidget({Key? key, required this.gorBooked, required this.booked}) : super(key: key);

  final Gor gorBooked;
  final Booked booked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Booking Terbaru',
              style: h1ItemStyle,
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gorBooked.name!,
                    style: h2ItemStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    gorBooked.address!,
                    style: itemContentStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: <Widget> [
                            Icon(
                              Icons.calendar_today,
                              color: blueColorThird,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              booked.date!,
                              style: itemContentStyle,
                            ),
                          ],
                        )
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget> [
                            Icon(
                              Icons.access_time,
                              color: blueColorThird,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              booked.time!,
                              style: itemContentStyle,
                            ),
                          ],
                        )
                      )
                    ],
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }
}