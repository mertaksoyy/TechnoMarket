import 'package:apple_shop/Products.dart';
import 'package:flutter/material.dart';

class BuyProduct extends StatefulWidget {
  BuyProduct({super.key, required this.product});

  Products product;

  @override
  State<BuyProduct> createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy Page"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.product.product_images_name}"),
             Text("${widget.product.product_cost} \u{20BA}",style: TextStyle(fontSize: 35,color: Colors.blueAccent),),
            SizedBox(
              width: 200,height: 50,
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  textStyle: const TextStyle(fontSize:30,fontWeight: FontWeight.bold)
                ),
                child: const Text("Buy"),
                onPressed: (){
                  showDialog(
                      context: context,
                    builder:(BuildContext context){
                        return AlertDialog(
                          title:Text("Buy ${widget.product.product_name}"),
                          content: const Text("You really want to buy this product"),
                          actions: [
                            FloatingActionButton(
                              child: const Text("No"),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                            FloatingActionButton(
                              child: const Text("Yes"),
                              onPressed: (){
                                print("${widget.product.product_name} Purchased");
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                    }
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
