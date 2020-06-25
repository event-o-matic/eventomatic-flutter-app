import 'package:eventomatic/data/constraints.dart';
import 'package:eventomatic/data/demo_data.dart';
import 'package:eventomatic/models/user.dart';
import 'package:eventomatic/profile.dart';
import 'package:eventomatic/utils/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AllUserScreen extends StatefulWidget {
  @override
  _AllUserScreenState createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {

  TextStyle userTextStyle = TextStyle(
    color: ThemeColors.primary
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Constraints.userRoles.length + 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.primary,
          title: Text("User Data"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Text("All Users"),
              ...Constraints.userRoles.map((ur) => Text(ur)).toList(),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildUserList(DemoData.allUsers),
            ...Constraints.userRoles
                .map((ur) => _buildUserList(DemoData.allUsers
                    .where((user) => user.role == ur)
                    .toList()))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList(List<User> users) {
    return ListView(
      children: users
          .map(
            (user) => ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => UserProfilePage(user: user),
                fullscreenDialog: true));
              },
              title: Text(user.name,style: userTextStyle,),
              subtitle: Text(user.role,style: userTextStyle),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),

              ),
              trailing: Text(user.gender,style: userTextStyle),
            ),
          )
          .toList(),
    );
  }
}
