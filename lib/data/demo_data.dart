import 'dart:math';

import 'package:eventomatic/models/event.dart';
import 'package:eventomatic/models/session.dart';
import 'package:eventomatic/models/user.dart';

import 'constraints.dart';



class DemoData {
  static final random = Random();

  static User loggedInUser = allUsers[0];

  static List<User> allUsers = List.generate(
    100,
    (index) => User(
      id: "U$index",
      name: "User $index",
      gender: Constraints.genders[random.nextInt(Constraints.genders.length)],
      role: Constraints.userRoles[random.nextInt(Constraints.userRoles.length)],
      phone: "85470450$index",
      email: "user$index@demo.com",
      avatar:
          "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80",
    ),
  );

  static List<Event> eventsShubh = List.generate(
    5,
    (index) => Event(
        id: "E$index",
        title: "Event $index",
        description: "Amazinf description fro event $index.",
        attendees: List.generate(
          5,
          (i) => allUsers[random.nextInt(4)],
        ),
        volunteers: List.generate(
          5,
          (i) => allUsers[random.nextInt(4)],
        ),
        thumbnailImage:
            "https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
        schedule: List.generate(
          25,
          (index) => Session(
              title: "The $index th session",
              description: "amazing session description",
              isConsumable: index.isEven,
              time: DateTime(2020, 1, 1),
              venue: "HERE"),
        )),
  );

  List<Event> events = [
    Event(
        id: "e1",
        title: "Auto-Cart",
        description:
            "Showcase your automobile cartfing skills, let the designer in you flowerish and make it happen! ",
        schedule: [
          Session(
              title: "introduction speech",
              description:
                  "The speaker will greet and acknowledge about the event details with complete description.",
              isConsumable: false,
              venue: "Auditorium"),
          Session(
              title: "Speech by event head",
              description:
                  "You will be ackonwledeged by a brief introduction to speakers and important events",
              isConsumable: false,
              venue: "Auditorium"),
          Session(
              title: "Model-displaly",
              description: "Costume made cart and dirt bake will be displayed",
              isConsumable: false,
              venue: "ground floor ots"),
          Session(
              title: "Lunch-break",
              description: "Afternoon lunch ",
              isConsumable: true,
              venue: "4th floor"),
          Session(
              title: "Conclusion",
              description:
                  "Final workshop and closing speech by the auto cart team",
              isConsumable: false,
              venue: "Auditorium"),
        ]),
    Event(
        id: "e2",
        title: "Robo-battle",
        description:
            "Build the beast out  of a machine and let the robotic war begin  ",
        schedule: [
          Session(
              title: "introduction speech",
              description:
                  "The speaker will greet and acknowledge about the event details with complete description.",
              isConsumable: false,
              venue: "Auditorium"),
          Session(
              title: "Speech by event head",
              description:
                  "You will be ackonwledeged by a brief introduction to speakers and important events",
              isConsumable: false,
              venue: "Auditorium"),
          Session(
              title: "Model-displaly",
              description: "Costume made cart and dirt bake will be displayed",
              isConsumable: false,
              venue: "ground floor ots"),
          Session(
              title: "Lunch-break",
              description: "Afternoon lunch ",
              isConsumable: true,
              venue: "4th floor"),
          Session(
              title: "Conclusion",
              description:
                  "Final workshop and closing speech by the auto cart team",
              isConsumable: false,
              venue: "Auditorium"),
        ]),
    Event(
      id: "e3",
      title: "Talent hunt",
      description:
          "Showcase the artist in you be it be singing, dancing or open-mic present your art with huge audience at your step ",
      schedule: [
        Session(
            title: "introduction speech",
            description:
                "The speaker will greet and acknowledge about the event details with complete description.",
            isConsumable: false,
            venue: "Auditorium"),
        Session(
            title: "Speech by event head",
            description:
                "You will be ackonwledeged by a brief introduction to speakers and important events",
            isConsumable: false,
            venue: "Auditorium"),
        Session(
            title: "Model-displaly",
            description: "Costume made cart and dirt bake will be displayed",
            isConsumable: false,
            venue: "ground floor ots"),
        Session(
            title: "Lunch-break",
            description: "Afternoon lunch ",
            isConsumable: true,
            venue: "4th floor"),
        Session(
            title: "Conclusion",
            description:
                "Final workshop and closing speech by the auto cart team",
            isConsumable: false,
            venue: "Auditorium")
      ],
    ),
    Event(
        id: "e4",
        title: "Business talks",
        description:
            "Understand the latest trends of market from the best of coporate masters ",
        schedule: [
          Session(
              title: "introduction speech",
              description:
                  "The speaker will greet and acknowledge about the event details with complete description.",
              isConsumable: false,
              venue: "Auditorium"),
          Session(
              title: "Speech by event head",
              description:
                  "You will be ackonwledeged by a brief introduction to speakers and important events",
              isConsumable: false,
              venue: "Auditorium"),
          Session(
              title: "Model-displaly",
              description: "Costume made cart and dirt bake will be displayed",
              isConsumable: false,
              venue: "ground floor ots"),
          Session(
              title: "Lunch-break",
              description: "Afternoon lunch ",
              isConsumable: true,
              venue: "4th floor"),
          Session(
              title: "Conclusion",
              description:
                  "Final workshop and closing speech by the auto cart team",
              isConsumable: false,
              venue: "Auditorium"),
        ]),
    Event(
        id: "e5",
        title: "Ciber-Security",
        description:
            "Security is the primary need of the hour when you are completely vulnerable to the internet understand its rising need",
        schedule: [
          Session(
              title: "introduction speech",
              description:
                  "The speaker will greet and acknowledge about the event details with complete description.",
              isConsumable: false,
              venue: "Auditorium"),
          Session(
              title: "Speech by event head",
              description:
                  "You will be ackonwledeged by a brief introduction to speakers and important events",
              isConsumable: false,
              venue: "Auditorium"),
          Session(
              title: "Model-displaly",
              description: "Costume made cart and dirt bake will be displayed",
              isConsumable: false,
              venue: "ground floor ots"),
          Session(
              title: "Lunch-break",
              description: "Afternoon lunch ",
              isConsumable: true,
              venue: "4th floor"),
          Session(
              title: "Conclusion",
              description:
                  "Final workshop and closing speech by the auto cart team",
              isConsumable: false,
              venue: "Auditorium"),
        ])
  ];
}
