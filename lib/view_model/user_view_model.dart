import 'package:badmintop/model/user.dart';

// user dummy
class UserViewModel {
  final User _user = User(name: "Budi Susanto", img: "assets/images/user.png");
  User get user => _user;
}