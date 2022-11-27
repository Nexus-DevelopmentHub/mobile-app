import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier,DiagnosticableTreeMixin{
   bool _isLoggedIn=false;
   bool get isLoggedIn =>_isLoggedIn;

  /// TODO :: sign with email and password
  /// login menggunakan email dan password kemudian mengembalikan callback
  /// @return {
  ///   success:boolean,
  ///   message:string
  /// }
  /// **/
  void signInWithEmailAndPassword(
      String email,
      String password,
      Function(bool success,String message) callback
  ){

  }

  /// TODO :: sign with google
  /// login menggunakan akun google
  /// @return {
  ///   success:boolean,
  ///   message:string
  /// }
  /// **/
  void signInWithGoogle(
      Function(bool success,String message) callback
      ){

  }

}