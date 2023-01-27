class FavouriteDataModel {
  bool status;
  Null message;
  Data data;

  FavouriteDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int currentPage;
  List<Data1> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data1>[];
      json['data'].forEach((v) {
        data.add(new Data1.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class Data1 {
  int id;
  Product product;

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  String description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}


























//
//
//
// class GetFavouriteModel
//   {
//     bool status;
//     FavData data;
//
//     GetFavouriteModel.fromjson(Map<String,dynamic> json){
//       status=json["status"];
//     }
//
//   }
//   class FavData {
//   int current_page;
//   List<data>dataa=[];
//   FavData.fromjson(Map<String,dynamic> json){
//     current_page=json["current_page"];
//     json["data"].forEach((element){
//       dataa.addAll(data.fromJson(element));
//     });
//   }
//   }
//
//   class data {
//   int id;
//   productt product;
//
//   data.fromJson(Map<String,dynamic> json){
//     id=json["id"];
//     product.id=json["product"]["id"];
//     product.price=json["product"]["price"];
//     product.old_price=json["product"]["old_price"];
//     product.discount=json["product"]["discount"];
//     product.image=json["product"]["image"];
//     product.name=json["product"]["name"];
//
//   }
//
//   }
//
//   class  productt{
//   int id;
//   dynamic price;
//   dynamic old_price;
//   dynamic discount;
//   String image;
//   String name;
//   productt.fromJson(Map<String,dynamic> json){
//     id=json["id"];
//     price=json["price"];
//     old_price=json["old_price"];
//     discount=json["discount"];
//     image=json["image"];
//     name=json["name"];
//   }
//   }