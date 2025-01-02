import 'package:imperio_das_frutas/models/item_model.dart';

class CartItemModel {

  ItemModel item;
  int quantity;

  CartItemModel({
   required this.item,
   required this.quantity,
  });

  double totalPrice() => item.price * quantity;

}