import 'package:eventomatic/data/constraints.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String avatar;
  final String gender;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.gender,
    this.role,
  })  : assert(Constraints.genders.contains(gender)),
        assert(Constraints.userRoles.contains(role));
}