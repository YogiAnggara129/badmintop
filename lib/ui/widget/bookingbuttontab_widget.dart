import 'package:badmintop/helper/currency_format.dart';
import 'package:badmintop/model/gor.dart';
import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/ui/widget/showtoast_widget.dart';
import 'package:flutter/material.dart';

class BookingButtonTabWidget extends StatelessWidget {
  const BookingButtonTabWidget({ Key? key, required this.gor }) : super(key: key);

  final Gor gor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height - 100,
      width: MediaQuery.of(context).size.width,
      left: 0,
      height:100,
      // width: ,
      child: InkWell(
        onTap: () => showToast(context, "Booking tidak tersedia pada versi demo"),
        child: Card(
          elevation: 10,
          margin: const EdgeInsets.all(0),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CurrencyFormat.convertToIdr(gor.hourlyPrice, 2),
                      style: h1ItemStyle,
                    ),
                    Text(
                      "per jam lapangan",
                      style: itemContentStyle,
                    )
                  ],
                ),
                Card(
                  margin: const EdgeInsets.all(0),
                  color: blueColorFirst,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Booking Sekarang",
                      style: h3HeaderStyle,
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}