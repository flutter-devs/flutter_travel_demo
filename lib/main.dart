import 'package:carousel_slider/carousel_slider.dart';
import 'package:cooking_app/image_model.dart';
import 'package:cooking_app/placeholder_widget.dart';
import 'package:cooking_app/view/FirstScreen.dart';
import 'package:cooking_app/view/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:snaplist/snaplist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen());
  }
}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key,}) : super(key: key);
//
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  final List<String> numbers = ['Dubai', 'China ', 'Korea', 'India', 'Africa '];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Padding(
//        padding: const EdgeInsets.only(top: 50.0),
//        child: Column(
//            children: <Widget>[
//        Padding(
//        padding: const EdgeInsets.only(left: 25.0, right: 25),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Text(
//              'Asia',
//              style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.bold,
//                  fontSize: 35),
//            ),
//            IconButton(
//              icon: Icon(
//                Icons.memory,
//                size: 30,
//              ),
//            )
//          ],
//        ),
//      ),
//      Container(
//        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//        height: MediaQuery
//            .of(context)
//            .size
//            .height * 0.15,
//        child: ListView.builder(
//            scrollDirection: Axis.horizontal,
//            itemCount: numbers.length,
//            itemBuilder: (context, index) {
//              return Container(
//                width: MediaQuery
//                    .of(context)
//                    .size
//                    .width * 0.28,
//                child: Card(
//                  shape: RoundedRectangleBorder(
//                      borderRadius:
//                      BorderRadius.all(Radius.circular(20))),
//                  color: Colors.grey[300],
//                  child: Container(
//                    child: Center(
//                        child: Text(
//                          numbers[index].toString(),
//                          style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 18.0,
//                              fontWeight: FontWeight.bold),
//                        )),
//                  ),
//                ),
//              );
//            }),
//      ),
////      ClipRRect(borderRadius: BorderRadius.circular(20),
////        child: Container(
////          height: MediaQuery
////              .of(context)
////              .size
////              .height * 0.65,
////          width: MediaQuery
////              .of(context)
////              .size
////              .width * 0.7,
////              child: ListView.builder(
////          scrollDirection: Axis.horizontal,
////              itemCount: numbers.length,
////              itemBuilder: (context, index) {
////                return Card(
////                  child: Image.asset(
////                    'assets/1.jpg',
////                    fit: BoxFit.fill,
////                  ),
////
////                );
////              }),
////        ),
////      ),
//              CarouselSlider(
//                height: 400.0,
//                items: [1,2,3,4,5].map((i) {
//                  return Builder(
//                    builder: (BuildContext context) {
//                      return ClipRRect(borderRadius: BorderRadius.circular(30),
//                        child: Container(
//                            width: MediaQuery.of(context).size.width,
//                            margin: EdgeInsets.symmetric(horizontal: 5.0),
//                            decoration: BoxDecoration(
//                                color: Colors.amber
//                            ),
//                            child: Text('text $i', style: TextStyle(fontSize: 16.0),)
//                        ),
//                      );
//                    },
//                  );
//                }).toList(),
//              )
//    ],
//    )
//    ,
//    )
//    ,
//    );
//  }
//}



//

//  goToPrevious() {
//    carouselSlider.previousPage(
//        duration: Duration(milliseconds: 300), curve: Curves.ease);
//  }
//
//  goToNext() {
//    carouselSlider.nextPage(
//        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
//  }
//}
