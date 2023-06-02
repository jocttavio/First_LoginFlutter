import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add items to cart
  
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
  //alert the user, item successfully added
  showDialog(context: context, builder: (context) => const AlertDialog(
    title: Text('Se agrego correctamente!'),
    content: Text('Revisa tu carrito de compras'),
  ));
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) =>  Column(
      children: [
        //  search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                'Buscar',
                style: TextStyle(color: Colors.grey)
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),
        //  message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'Si no puedes dejar de pensar en ellos... ¡CÓMPRALOS!',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        //  hot picks
       const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text(
                'Hot Sale🔥!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                   fontSize: 24,
                ),
              ),
              Text(
                'Ver todos',
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        //List of shoes for sale
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Shoe shoe = value.getShoeList()[index];
              return ShoeTile(
                shoe: shoe,
                onTap: () => addShoeToCart(shoe),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    ) );
  }
}
