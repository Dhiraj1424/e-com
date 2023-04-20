import 'package:e_commerce_advance/utils/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:e_commerce_advance/viewmodelorcontoller/product_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('data ${productList.productList.length}'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            SingleChildScrollView(
                child: Row(
              children: [
                Flexible(
                  child: Container(
                    width: 500,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
                Spacer(),
                Flexible(
                  child: Container(
                    width: 500,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
                const Spacer(),
                Flexible(
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
                const Spacer(),
                Flexible(
                  child: Container(
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 20.h,
            ),
            Consumer<ProductProvider>(
              builder: (context, value, child) {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  physics: const ScrollPhysics(),
                  itemCount: value.productList.length,
                  itemBuilder: (context, index) {
                    return CardWidget(
                      function: () {
                        Navigator.pushNamed(
                          context,
                          RouteConstant.descriptionPage,
    arguments: productList.productList[index].id,
                        );
                      },
                      centerItem: value.productList[index].title,
                      price: value.productList[index].price,
                      imageUrl: value.productList[index].image,
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final double? price;
  final String? centerItem;
  final String? imageUrl;
  final VoidCallback function;
  const CardWidget({
    Key? key,
    this.price,
    this.centerItem,
    this.imageUrl,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.amber,
            title: Text(centerItem.toString()),
            leading: Text('\$ $price'),
          ),
          child: Image.network(
            imageUrl.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
// / class ProductRating extends StatelessWidget {
// //   const ProductRating({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //   }
// // }