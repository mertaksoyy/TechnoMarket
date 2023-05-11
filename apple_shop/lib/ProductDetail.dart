import 'package:apple_shop/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Buy.dart';
import 'Products.dart';


class ProductDetail extends StatefulWidget {
   ProductDetail({super.key , required this.category});

  //bu kısıma category gelicek bu yüzden Category sınıfından category nesnesi geliyor.
  Category category;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {


    Future<List<Products>> products() async {

      var productList = <Products>[];


      var mac = Category(1, "Macbook", "macbookair.jpeg");
      var iphone = Category(2, "İphone", "iphone.jpeg");
      var watch = Category(3, "Watch", "watch.jpeg");
      var ipad = Category(4, "Ipad", "ipadpro.jpeg");

      productList = [
        Products(product_id: 1,product_name: "MacBook Air", product_images_name: "macbookair.jpeg", product_cost: 22.999,product_category: mac),
        Products(product_id: 2, product_name :"MacBook Pro", product_images_name:"macbookpro.jpg", product_cost:39.999,product_category: mac),
        Products(product_id: 3, product_name : "İphone 13",   product_images_name: "iphone.jpeg", product_cost:33.999,product_category: iphone),
        Products(product_id: 4, product_name :"İphone 11", product_images_name:"iphone11.jpg", product_cost:15.779,product_category: iphone),
        Products(product_id: 5, product_name :"İpad Pro", product_images_name:"ipadpro.jpeg",product_cost: 7.999,product_category: ipad),
        Products(product_id: 6, product_name :"Apple Watch", product_images_name:"watch.jpeg",product_cost: 5.999,product_category: watch)
      ];

      productList = productList.where((product) => product.product_category!.compare(widget.category)).toList();

      //bu da olur ==> productList = productList.where((product) => product.product_category!.category_name == (widget.category.category_name)).toList();


      return productList;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body:FutureBuilder<List<Products>>(
        future: products(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            var getProductsList = snapshot.data;

            return ListView.builder(
              itemCount: getProductsList!.length,
              itemBuilder: (context,indeks){
                var product = getProductsList[indeks];

                return GestureDetector(
                  onTap:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyProduct(product: product)));
                  },
                  child: Card(
                    shadowColor: Colors.red,
                    child: Row(
                      children: [
                        SizedBox(width:150,height: 150,child: Image.asset("images/${product.product_images_name}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              (product.product_name != null) ? product.product_name! : "Hata",
                              style: TextStyle(fontSize: 25),
                            ),

                            SizedBox(height: 20,),
                            Text("${product.product_cost}\u{20BA}",style: TextStyle(fontSize: 20,color: Colors.blueAccent),)
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,15,0),
                          child: Icon(Icons.shopping_basket),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const Center();
          }
        },
      ),
    );
  }
}
