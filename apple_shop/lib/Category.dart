
class Category{
  int category_id;
  String category_name;
  String category_images_name;



  Category(this.category_id, this.category_name, this.category_images_name);


  bool compare(Category other){
    return category_name == other.category_name;
  }


}