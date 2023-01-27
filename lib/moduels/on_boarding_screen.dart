import 'package:flutter/material.dart';
import 'package:shop_app/moduels/login.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/components/components.dart';
class boardingModel {
  final String image;
  final String title;
  final String body;
  boardingModel({
      @required this.image,
      @required this.title,
      @required this.body,
}
      );
}

class  onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var boardControler= PageController();

List<boardingModel> bording=[
  boardingModel(
      image: "https://www.quasa.io/storage/photos/%D0%A4%D0%BE%D1%82%D0%BE%2014/aaabaec%2011.png",
      title: "On Board 1 Title ",
      body: "On Board 1 Body "),
  boardingModel(
      image: "https://www.quasa.io/storage/photos/%D0%A4%D0%BE%D1%82%D0%BE%2014/aaabaec%2011.png",
      title: "On Board 2 Title ",
      body: "On Board 2 Body "),
  boardingModel(
      image: "https://www.quasa.io/storage/photos/%D0%A4%D0%BE%D1%82%D0%BE%2014/aaabaec%2011.png",
      title: "On Board 3 Title ",
      body: "On Board 3 Body "),
];

bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed:()
          {
            skip();
          },
              child:Text("Skip")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardControler,
                onPageChanged: (index)
                {
                  if(index==bording.length-1)
                  {
                  setState(() {
                    isLast=true;
                  });
                  }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                itemBuilder: (context , index)=>buildBoardingItem(bording[index]),
                itemCount: bording.length,
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardControler,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      spacing: 5.0,
                      expansionFactor: 4.0,
                      activeDotColor: Colors.blue,
                    ),
                    count: bording.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed:() {
                    if (isLast) {
                  skip();
                    } else {
                      boardControler.nextPage(
                          duration: Duration(
                            microseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn
                      );
                    }
                  },
                child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  void skip (){
    cacheHelper.saveData(key: "onBoarding", value: true).then((value)
    {
      if(value){
        navigateAndFinish(context, loginScreen());
      }
    });
  }
}
