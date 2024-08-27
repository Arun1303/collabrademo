import 'package:collabrademo/models/productData.dart';
import 'package:flutter/material.dart';

import 'productdetailscreen.dart';

class ShopItemListing extends StatelessWidget {
  final List<Product> items;

   ShopItemListing({required this.items});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemBuilder: (BuildContext context, int index) {
          return ItemView(
            item: items[index],
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class ItemView extends StatelessWidget {
  final Product item;

  ItemView({required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkResponse(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: item),
              ),
            );
          },
          child: Material(
            child: Container(
                height: 380.0,
                padding:  const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8.0)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 120.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Image.network(
                                  item.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            // Container(
                            //   child: item.
                            //       ? Icon(
                            //           Icons.favorite,
                            //           size: 20.0,
                            //           color: Colors.red,
                            //         )
                            //       : Icon(
                            //           Icons.favorite_border,
                            //           size: 20.0,
                            //         ),
                            // )
                          ],
                        ),
                      ),
                    ),
                   const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              "₹${item.price.toString()}",
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
