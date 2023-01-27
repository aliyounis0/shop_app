


class homeModel
  {
    bool state;
    homeDataModel data;

    homeModel.fromJson(Map<String,dynamic> json){
      state=json["state"];
      data= homeDataModel.fromJson(json["data"]);
    }

  }


  class homeDataModel {
    List<bannermodel> banners=[];
    List<productModel> products=[];
    homeDataModel.fromJson(Map<String,dynamic> json){
     json["banners"].forEach((element){
       banners.add(bannermodel.fromJson(element));
     });
     json["products"].forEach((element){
       products.add(productModel.fromJson(element));
     });
    }
  }


  class bannermodel {
  int id;
  String image;
    bannermodel.fromJson(Map<String,dynamic>json){
      id=json["id"];
      image=json["image"];
    }
  }

  class productModel {
  int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String image;
  String name;
  bool in_favorites;
  bool in_cart;

  productModel.fromJson(Map<String,dynamic> json){
    id=json["id"];
    price=json["price"];
    old_price=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    in_favorites=json["in_favorites"];
    in_cart=json["in_cart"];

  }
  }