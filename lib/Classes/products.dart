class products{
  late final String product_name;
  late final int product_price;
  late final String product_img;
  late final String category;
  late bool fav;
  late bool cart;
  int amount=1;

  products(this.product_name, this.product_price, this.product_img, this.category,this.fav,this.cart);
}