import 'package:eventomatic/base/base_view_model.dart';
import 'package:eventomatic/data/demo_data.dart';
import 'package:eventomatic/models/user.dart';

class AuthViewModel extends BaseViewModel{
  User _user;
  User get user => _user;
  bool get isUserLoggedIn => _user != null;

  Future logIn(String email, String password) async {
    await performTryOrFailure(()async{
      await Future.delayed(Duration(seconds: 2));
      _user = DemoData.allUsers.firstWhere((user)
      => user.email == email && password == "demo@123",orElse: () => null
      );
      if(_user == null){
        throw Exception("Invalid Email or Password!");
      }
    });

  }

  Future signOut() async {
    await performTryOrFailure(()async{
      await Future.delayed(Duration(seconds: 2));
      _user = null;
    });

  }
}

