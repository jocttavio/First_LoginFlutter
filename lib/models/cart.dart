import 'package:flutter/cupertino.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
//  list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'HIDDS Mochila',
        price: '443.98',
        description: 'Material impermeable y cierre suave',
        imagePath: 'lib/images/mochila1.png'),
    Shoe(
        name: 'Cosplay Sailor Moon',
        price: '201.80',
        description: 'Piel sintética superior.',
        imagePath: 'lib/images/bolsa2.png'),
    Shoe(
        name: 'Mochila estudiante',
        price: '429.00',
        description: 'Esta bella mochila está llena de un diseño casual',
        imagePath: 'lib/images/mochila3.png'),
    Shoe(
        name: 'Bolsa Crossbody Mujer',
        price: '226.99',
        description: 'Las bolsas de mujer están hechos de cuero vegano.',
        imagePath: 'lib/images/bolso1.png'),
    Shoe(
        name: 'Mochila Kawaii',
        price: '349.96',
        description:
            'La mochila está hecha de material de nailon de alta calidad.',
        imagePath: 'lib/images/mochila2.png'),
    Shoe(
        name: 'Sailor Moon',
        price: '596.60',
        description:
            'Piel sintética suave, forro de poliéster totalmente forrado. ',
        imagePath: 'lib/images/bolsa3.png'),
    Shoe(
        name: 'Nike Bag Sporting',
        price: '443.98',
        description: 'Material impermeable y cierre suave',
        imagePath: 'lib/images/mochila4.png'),
    Shoe(
        name: 'Louis Vuitton rojo',
        price: '12,596.60',
        description:
            'Piel sintética suave, forro de poliéster totalmente forrado. ',
        imagePath: 'lib/images/bolsa4.png'),
  ];

//list of items in user cart
  List<Shoe> userCart = [];

// get list of items for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

//get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

//add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

//remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
