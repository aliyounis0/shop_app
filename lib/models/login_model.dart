

   class loginUser {
  bool status;
  String message;
  userData data;

  loginUser.Formjson(Map<String,dynamic> json){
    status=json["status"];
    message=json["message"];
    data=json["data"] !=null? userData.FormJson(json["data"]) : null ;
  }
   }



   class userData {
  int id ;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  userData.FormJson(Map<String,dynamic> json){
    id=json["id"];
    name=json["name"];
    email=json["email"];
    phone=json["phone"];
    image=json["image"];
    points=json["points"];
    credit=json["credit"];
    token=json["token"];

  }
  }
