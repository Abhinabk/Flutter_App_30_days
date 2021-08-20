import 'package:flutter_catelog/models/catelog.dart';

class CartModel{
  
  // singleton class 
  
  static final cartModel = CartModel._internal();
  CartModel._internal();

  factory CartModel() => cartModel;

  late CatelogModel _catelog;

  // collection of ids
  final List<int>_itemids = [];

  // ignore: unnecessary_getters_setters
  CatelogModel get catelog => _catelog;

  // ignore: unnecessary_getters_setters
  set catelog( CatelogModel  newCatelog)=> _catelog = newCatelog;
  
  //get items in the cart
  List<Item> get items =>_itemids.map((id)=>_catelog.getById(id)).toList();

  // total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item){
    _itemids.add(item.id);
  }

  // remove item
  void remove(Item item){
    _itemids.remove(item.id);
  }
}

