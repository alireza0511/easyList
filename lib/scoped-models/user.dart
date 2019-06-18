import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import './connected_products.dart';
/* 164.2 cut/ past to connected_products.dart
// 158.2
mixin UserModel on ConnectedProducts { //162.8 on Model {
  
  
  /* 162.6 cut/past
  User _authenticationUser; 162.6 */

// 158.3
  void login(String email, String password) {
    authenticationUser = User(id: 'asdadad', email: email, password: password);
  }
} 164.2*/

// 162.13 change _authenticationUser to authenticationUser it's not private here