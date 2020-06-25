//class AuthService {
//  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
//  final UserService _userService = locator<UserService>();
//
//  Future<User> signInWithEmailAndPassword(String email, String password) async {
//    try {
//      final result = await _firebaseAuth.signInWithEmailAndPassword(
//        email: email,
//        password: password,
//      );
//      return _userService.getUser(result.user.uid);
//    } on PlatformException catch (e) {
//      print("PlatformException[FirebaseAuthError]: ${e.code}");
//      switch (e.code) {
//        case FirebaseAuthErrorCode.INVALID_EMAIL:
//          throw InputError(message: "Invalid email address!");
//        case FirebaseAuthErrorCode.WRONG_PASSWORD:
//          throw InputError(message: "Invalid password!");
//        case FirebaseAuthErrorCode.USER_NOT_ALLOWED:
//          throw InputError(message: "User is not allowed!");
//        case FirebaseAuthErrorCode.NO_USER_FOUND:
//          throw InputError(message: "No user found, try sign up insted!");
//        case FirebaseAuthErrorCode.NETWORK_ERROR:
//          throw NetworkFailure(
//            message: "Make sure you connected with the internet!",
//          );
//        default:
//          throw Failure(message: ErrorMessages.unknownError);
//      }
//    } on Failure {
//      rethrow;
//    }
//  }
//
//  Future<User> signUpWithEmailAndPassword(User user, password) async {
//    try {
//      final result = await _firebaseAuth.createUserWithEmailAndPassword(
//        email: user.email,
//        password: password,
//      );
//      await _userService.createUser(result.user.uid, user);
//      return currentUser;
//    } on PlatformException catch (e) {
//      print("PlatformException[FirebaseAuthError]: ${e.code}");
//      switch (e.code) {
//        case FirebaseAuthErrorCode.INVALID_EMAIL:
//          throw InputError(message: "Invalid Email Address!");
//        case FirebaseAuthErrorCode.WEAK_PASSWORD:
//          throw InputError(
//              message: "Password must be atleast of 6 characters!");
//        case FirebaseAuthErrorCode.EMAIL_ALREADY_IN_USE:
//          throw InputError(
//              message: "User is already exists, please try to sign in!");
//        case FirebaseAuthErrorCode.NETWORK_ERROR:
//          throw NetworkFailure(
//            message: "Make sure you connected with the internet!",
//          );
//        default:
//          throw Failure(message: ErrorMessages.unknownError);
//      }
//    } on Failure {
//      await _deleteCurrentAuthUser();
//      rethrow;
//    }
//  }
//
//  Future<void> sendForgotPasswordEmail(String email) async {
//    try {
//      await _firebaseAuth.sendPasswordResetEmail(email: email);
//    } on PlatformException catch (e) {
//      print("PlatformException[FirebaseAuthError]: ${e.code}");
//      switch (e.code) {
//        case FirebaseAuthErrorCode.INVALID_EMAIL:
//          throw InputError(message: "Invalid Email Address!");
//        case FirebaseAuthErrorCode.NO_USER_FOUND:
//          throw InputError(message: "No user found, try sign up insted!");
//        case FirebaseAuthErrorCode.NETWORK_ERROR:
//          throw NetworkFailure(
//            message: "Make sure you connected with the internet!",
//          );
//        default:
//          throw Failure(message: ErrorMessages.unknownError);
//      }
//    } catch (e) {
//      print(e.toString());
//      throw Failure(message: ErrorMessages.unknownError);
//    }
//  }
//
//  Future<User> get currentUser async {
//    FirebaseUser user = await _firebaseAuth.currentUser();
//    return user == null ? null : _userService.getUser(user.uid);
//  }
//
//  Future<void> _deleteCurrentAuthUser() async {
//    try {
//      final user = await _firebaseAuth.currentUser();
//      await user.delete();
//    } catch (e) {
//      print(e.toString());
//      throw Failure(
//        message: "Can not delete current auth user, please try again later!",
//      );
//    }
//  }
//
//  Future<void> signOut() async {
//    await _firebaseAuth.signOut();
//  }
//
//  Future<bool> isUserLoggedIn() async {
//    return (await currentUser) != null;
//  }
//
//  Future<bool> changePassword(String newPassword) async {
//    try {
//      FirebaseUser currentFirebaseUser = await _firebaseAuth.currentUser();
//      await currentFirebaseUser.updatePassword(newPassword);
//      return true;
//    } catch (e) {
//      print("ERROR:");
//      print("$e");
//      return false;
//    }
//  }
//}