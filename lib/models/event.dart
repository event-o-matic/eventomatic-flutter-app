import 'package:eventomatic/models/session.dart';
import 'package:eventomatic/models/user.dart';

class Event{
  String id;
  String title;
  String description;
  String thumbnailImage;
  List<Session> schedule;
  List<User> volunteers;
  List<User> attendees;

  Event({this.id, this.title, this.description, this.thumbnailImage,
    this.schedule, this.volunteers, this.attendees});
}