import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'package:e_commerce_advance/viewmodelorcontoller/cart_provider.dart';

class CartPage extends StatelessWidget {
  final int id;
  const CartPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final provider =Provider.of<CartProvider>(context).getCartByIds(id);
    return Scaffold(
body: FutureBuilder(
  future: provider,
  builder: (context, snapshot) {
  return Column(
children: [
//Text(snapshot.data.products)
],
  );
},)

    );
  }
}
