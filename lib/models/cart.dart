import 'package:flutter_catelog/core/store.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{
  
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
  // void add(Item item){
  //   _itemids.add(item.id);
  // }

  // remove item
  void remove(Item item){
    _itemids.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);

  @override 
  perform() {
    store!.cart._itemids.add(item.id);
  }
}

