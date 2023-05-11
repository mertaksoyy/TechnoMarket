import 'package:apple_shop/Category.dart';


class Products{
  int? product_id;
  String? product_name;
  String? product_images_name;
  double? product_cost;
  Category?  product_category;


  Products({
      this.product_id,
      this.product_name,
      this.product_images_name,
      this.product_cost,
      this.product_category
  });


}

  enum Categories{
  Mac,
  Watch,
  Ipad,
  Iphone,
}