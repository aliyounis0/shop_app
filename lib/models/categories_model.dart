
  class categoriesModel
  {
    bool status ;
    categoriesDataModel data;

    categoriesModel.fromJason(Map<String,dynamic> json){
      status=json["status"];
      data= categoriesDataModel.fromJson(json["data"]);
  }

  }


  class categoriesDataModel
  {
   int current_page;
   List<dataModel>data=[];
    categoriesDataModel.fromJson(Map<String,dynamic> json){
      current_page=json["current_page"];
      json["data"].forEach((element){
        data.add(dataModel.fromJson(element));
      });
    }
  }

  class dataModel{
  int id;
  String name;
  String image;

  dataModel.fromJson(Map<String,dynamic> json){
    id=json["id"];
    name=json["name"];
    image=json["image"];
  }
  }