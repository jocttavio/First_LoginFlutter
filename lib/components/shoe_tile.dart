import 'package:flutter/material.dart';
import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          //  shoe pic
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.imagePath,),

          ),
const SizedBox(height: 10,),
          const SizedBox(height: 5),
          //  price + details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                  //  Shoe name
                    Text(
                       shoe.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,

                    ),
                    ),

                  const SizedBox(height: 5),

                  //  price
                    Text(
                      '\$' + shoe.price,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

              //  plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration:  const BoxDecoration(
                    color: Colors.pink,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
          //  button to add to cart
        ],
      ),
    );
  }
}
