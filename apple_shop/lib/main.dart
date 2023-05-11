import 'package:apple_shop/Category.dart';
import 'package:apple_shop/ProductDetail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Category>> category() async{
    var categoryList = <Category>[];

    var c1 = Category(1, "Macbook", "macbookair.jpeg");
    var c2 = Category(2, "İphone", "iphone.jpeg");
    var c3 = Category(3, "Watch", "watch.jpeg");
    var c4 = Category(4, "Ipad", "ipadpro.jpeg");


    categoryList.add(c1);
    categoryList.add(c2);
    categoryList.add(c3);
    categoryList.add(c4);

    return categoryList;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Apple Technology Shop"),
      ),
      body:FutureBuilder<List<Category>>(
        future: category(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            var getCategoryList = snapshot.data;

            return GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               childAspectRatio:2/3.5
             ),
              itemCount: getCategoryList!.length,
              itemBuilder: (context,indeks){
               var category = getCategoryList[indeks];
               return GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(category: category)));
               },
                 child: Card(
                   shadowColor: Colors.lightGreen,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SizedBox(width:150,height: 150,child: Image.asset("images/${category.category_images_name}")),
                       Text(category.category_name,style: TextStyle(fontSize: 20),)
                     ],
                   ),
                 ),
               );
              },
            );

            /*return ListView.builder(
              itemCount: getCategoryList!.length,
              itemBuilder: (context,indeks){
                var product = getCategoryList[indeks];

                return GestureDetector(
                  onTap:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(products: products)));
                  },
                  child: Card(
                    shadowColor: Colors.red,
                    child: Row(
                      children: [
                        SizedBox(width:150,height: 150,child: Image.asset("images/${product.product_images_name}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.product_name,style: TextStyle(fontSize: 25),),
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
             */
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
