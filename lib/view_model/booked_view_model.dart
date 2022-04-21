import 'package:badmintop/model/booked.dart';

// booked dummy
class BookedViewModel {
  final List<Booked> _bookedList = [Booked(id: 0, gorId: 0, date: "4 April 2022", time: "09.00 - 12.00 WIB")];
  Booked getBookedNewest() => _bookedList[0];
}