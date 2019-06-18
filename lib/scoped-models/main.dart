import 'package:scoped_model/scoped_model.dart';
import './products.dart';
import './connected_products.dart';
import './user.dart';


// 160.2 & 160.3
class MainModel extends Model with ConnectedProductsModel,UserModel, ProductsModel {

}

/** 160.3 'with' syntax means now, and also merge the functionalities of whichever 
 * classes I'm going to list here into this class, so it doesn't inherit from 
 * these classes, it doesn't use all their base functionalities and extends 
 * their types, it can't call their super constructors, it just merges their 
 * properties and methods into this one class */