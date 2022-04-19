import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';

class BookingWidget extends StatelessWidget {
  const BookingWidget({Key? key}) : super(key: key);

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
                    'Barokah Bandminton Cikarang',
                    style: h2ItemStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Sukasari, Kec. Serang Baru, Kabupaten Bekasi, Jawa Barat 17330',
                    style: itemContentStyle,
                  ),
                  SizedBox(
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
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '4 April 2022',
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
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '9.00 - 12.00',
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