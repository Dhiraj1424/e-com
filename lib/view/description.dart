import 'package:badges/badges.dart' as bd;
import 'package:e_commerce_advance/viewmodelorcontoller/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:e_commerce_advance/viewmodelorcontoller/single_product.dart';

import '../widget/button.dart';

class DescriptionPage extends StatelessWidget {
  final int id;
  const DescriptionPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<SingleProvider>(context, listen: false)
        .fetchSingleProduct(id);
    final colors = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            onPressed: () {},
            icon: bd.Badge(
              shape: bd.BadgeShape.square,
              badgeContent: Text('3'),
              badgeColor: Colors.green,
              animationType: bd.BadgeAnimationType.slide,
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: product,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 10,
                        left: 50,
                        child: Text(
                          '${snapshot.data.title}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 60,
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(snapshot.data.image),
                        ),
                      ),
                      Positioned(
                        top: 400,
                        left: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Text(
                            '${snapshot.data.description}',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 20,
                          bottom: 200,
                          child: RichText(
                            text: TextSpan(
                                text: '\$',
                                style: colors.textTheme.headlineLarge,
                                children: [
                                  TextSpan(
                                    text: '${snapshot.data.price}',
                                    style: colors.textTheme.headlineMedium,
                                  )
                                ]),
                          )),
                      Positioned(
                          height: 50,
                          width: 400,
                          // top: 40,
                          bottom: 100,
                          child: SummitButton(
                            onTap: () {
                              Map data = {'id': snapshot.data.id.toString()};
                              Provider.of<CartProvider>(context, listen: false)
                                  .addToCart(data);
                            },
                            text: 'Add to Cart',
                          ))
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
