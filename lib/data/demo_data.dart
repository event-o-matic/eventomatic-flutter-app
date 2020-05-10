import 'package:eventomatic/data/constraints.dart';
import 'package:eventomatic/models/event.dart';
import 'package:eventomatic/models/session.dart';
import 'package:eventomatic/models/user.dart';

User loggedInUser = allUsers[0];

List<User> allUsers = List.generate(
  100,
  (index) => User(
    id: "U$index",
    name: "User $index",
    gender: Constraints.genders[index % (Constraints.genders.length - 1)],
    role: Constraints.userRoles[index % (Constraints.userRoles.length - 1)],
    phone: "4570$index",
    email: "user$index@demo.com",
    avatar:
        "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80",
  ),
);

List<Event> events = List.generate(
  5,
  (index) => Event(
      id: "E$index",
      title: "Event $index",
      description: "Amazinf description fro event $index.",
      attendees: List.generate(
        5,
        (i) => allUsers[i % 4],
      ),
      volunteers: List.generate(
        5,
        (i) => allUsers[i % 4],
      ),
      thumbnailImage:
          "https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
      schedule: List.generate(25, (index) => Session(
          title: "The $index th session",
          description: "amazing session description",
          isConsumable: index.isEven,
          time: DateTime(2020, 1, 1),
          venue: "HERE"
      ),)),
);
