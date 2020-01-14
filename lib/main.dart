import 'package:carousel_slider/carousel_slider.dart';
import 'package:cooking_app/image_model.dart';
import 'package:cooking_app/placeholder_widget.dart';
import 'package:cooking_app/view/FirstScreen.dart';
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
        home: CarouselDemo());
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

class CarouselDemo extends StatefulWidget {

  @override
  CarouselDemoState createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo>
    with TickerProviderStateMixin {
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.green)
  ];
  TabController _controller;
  int _currentIndexes = 0;
  AnimationController _animationControllerOn;
  AnimationController _animationControllerOff;
  Animation _colorTweenBackgroundOn;
  Animation _colorTweenBackgroundOff;
  Animation _colorTweenForegroundOn;
  Animation _colorTweenForegroundOff;
  int _currentIndex = 0;
  int _prevControllerIndex = 0;
  double _aniValue = 0.0;
  var rating = 0.0;
  double _prevAniValue = 0.0;

  List<String> _icons = ['Dubai', 'China', 'Korea', 'Chile', 'Delhi'];
  Color _foregroundOn = Colors.white;
  Color _foregroundOff = Colors.black;
  Color _backgroundOn = Colors.blue[800];
  Color _backgroundOff = Colors.grey[200];
  ScrollController _scrollController = new ScrollController();
  List _keys = [];
  bool _buttonTap = false;
  CarouselSlider courselView;
  @override
  void initState() {
    super.initState();

    for (int index = 0; index < _icons.length; index++) {
      _keys.add(new GlobalKey());
    }

    _controller = TabController(vsync: this, length: _icons.length);
    _controller.animation.addListener(_handleTabAnimation);
    _controller.addListener(_handleTabChange);

    _animationControllerOff =
        AnimationController(vsync: this, duration: Duration(milliseconds: 75));
    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  CarouselSlider carouselSlider;
  int _current = 0;
  int _currents=0;
  List<ImageModel> imgList = [
    ImageModel(id: "1", image: 'assets/1.jpg'),
    ImageModel(id: "2", image: 'assets/2.jpg'),
    ImageModel(id: "3", image: 'assets/3.jpg'),
    ImageModel(id: "4", image: 'assets/4.jpg'),
    ImageModel(id: "5", image: 'assets/5.jpg'),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndexes,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _currentIndexes != 0
                ? Icon(
                    Icons.home,
                    color: Colors.grey,
                  )
                : SizedBox(),
            title: _currentIndexes != 0
                ? SizedBox()
                : Column(
                    children: <Widget>[
                      Text(
                        'Word',
                        style: TextStyle(fontFamily: 'Roboto Bold',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CircleButton()
                    ],
                  ),
          ),
          BottomNavigationBarItem(
            icon: _currentIndexes != 1
                ? new Icon(
                    Icons.adjust,
                    color: Colors.grey,
                  )
                : SizedBox(),
            title: _currentIndexes != 1
                ? SizedBox()
                : Column(
                    children: <Widget>[
                      Text(
                        'Adjust',
                        style: TextStyle(fontFamily: 'Roboto Bold',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CircleButton()
                    ],
                  ),
          ),
          BottomNavigationBarItem(
            icon: _currentIndexes != 2
                ? new Icon(
                    Icons.shop,
                    color: Colors.grey,
                  )
                : SizedBox(),
            title: _currentIndexes != 2
                ? SizedBox()
                : Column(
                    children: <Widget>[
                      Text(
                        'Shop',
                        style: TextStyle(fontFamily: 'Roboto Bold',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CircleButton()
                    ],
                  ),
          ),
          BottomNavigationBarItem(
            icon: _currentIndexes != 3
                ? new Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  )
                : SizedBox(),
            title: _currentIndexes != 3
                ? SizedBox()
                : Column(
                    children: <Widget>[
                      Text(
                        'Setting',
                        style: TextStyle(fontFamily: 'Roboto Bold',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CircleButton()
                    ],
                  ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Asia',
                    style: TextStyle(fontFamily: 'Roboto Bold',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
               Image.asset('assets/menu.png',scale: 25,color: Colors.black87)
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Container(
                  height: 50.0,
                  // this generates our tabs buttons
                  child: ListView.builder(
                      // this gives the TabBar a bounce effect when scrolling farther than it's size
                      physics: BouncingScrollPhysics(),
                      controller: _scrollController,
                      // make the list horizontal
                      scrollDirection: Axis.horizontal,
                      // number of tabs
                      itemCount: _icons.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            // each button's key
                            key: _keys[index],
                            // padding for the buttons
                            padding: EdgeInsets.all(6.0),
                            child: ButtonTheme(
                                child: AnimatedBuilder(
                              animation: _colorTweenBackgroundOn,
                              builder: (context, child) => FlatButton(
                                  // get the color of the button's background (dependent of its state)
                                  color: _getBackgroundColor(index),
                                  // make the button a rectangle with round corners
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0)),
                                  onPressed: () {
                                    courselView.jumpToPage(index);
                                    setState(() {
                                      _buttonTap = true;
                                      // trigger the controller to change between Tab Views
                                      _controller.animateTo(index);
//                                      // set the current index
//                                      _setCurrentIndex(index);
                                      _currents=index;
                                      _current=index;
                                      print('index is : ${_current}');
                                      print('indexes is : ${_currents}');


//                                      // scroll to the tapped button (needed if we tap the active button and it's not on its position)
                                      _scrollTo(index);
                                    });
                                  },

                                  child: Text(
                                      // get the icon
                                      _icons[index],
                                      // get the color of the icon (dependent of its state)
                                      style: TextStyle(fontFamily: 'Roboto Bold',
                                        color: _getForegroundColor(index),
                                      ))),
                            )));
                      })),
            ),
            SizedBox(
              height: 1,
            ),
            Expanded(
              child: Container(
                child: corsurelView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

//        ]));

  corsurelView(){
     courselView= CarouselSlider(
      height: MediaQuery.of(context).size.height / 1.6,
      initialPage: 0,
      enlargeCenterPage: true,
//              autoPlay: true,
//              reverse: false,
      enableInfiniteScroll: true,
      autoPlayInterval: Duration(seconds: 2),
      autoPlayAnimationDuration: Duration(milliseconds: 2000),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      scrollDirection: Axis.horizontal,
      items: imgList.map((imgUrl) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height /
                        1.6,
                    width:
                    MediaQuery.of(context).size.width * .7,
                    margin:
                    EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Hero(
                      tag: "image" + imgUrl.id.toString(),
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      return FirstScreen(imgUrl);
                                    }));
                          },
                          child: Image.asset(
                            imgUrl.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: -45,
                      right: -35,
                      child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(40),
                          child: Container(
                              height: 100,
                              color: Colors.black38,
                              width: 100,
                              child:Column(children: <Widget>[
                                SizedBox(height:60),
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 25,),
                                    SmoothStarRating(
                                      allowHalfRating: true,
                                      color: Colors.white,
                                      borderColor: Colors.white,
                                      rating: rating,
                                      size: 25,
                                      starCount: 1,
                                      spacing: 0.0,
                                      onRatingChanged: (value) {
                                        setState(() {
                                          rating = value;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],

                              )
                          ))),
                  Positioned(
                    top: 390,
                    right: 65,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Maldives',
                          style: TextStyle(fontFamily: 'Roboto Bold',
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                        SmoothStarRating(
                          allowHalfRating: true,
                          color: Colors.white,
                          borderColor: Colors.white,
                          rating: rating,
                          size: 25,
                          starCount: 5,
                          spacing: 2.0,
                          onRatingChanged: (value) {
                            setState(() {
                              rating = value;
                            });
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );

     return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
         /*CarouselSlider(
                      height: MediaQuery.of(context).size.height / 1.6,
                      initialPage: _current,
                      enlargeCenterPage: true,
//              autoPlay: true,
//              reverse: false,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      pauseAutoPlayOnTouch: Duration(seconds: 10),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      items: imgList.map((imgUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.6,
                                    width:
                                        MediaQuery.of(context).size.width * .7,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                    ),
                                    child: Hero(
                                      tag: "image" + imgUrl.id.toString(),
                                      child: Material(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return FirstScreen(imgUrl);
                                            }));
                                          },
                                          child: Image.asset(
                                            imgUrl.image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: -45,
                                      right: -35,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Container(
                                            height: 100,
                                            color: Colors.black38,
                                            width: 100,
                                            child:Column(children: <Widget>[
                                              SizedBox(height:60),
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(width: 25,),
                                                  SmoothStarRating(
                                                    allowHalfRating: true,
                                                    color: Colors.white,
                                                    borderColor: Colors.white,
                                                    rating: rating,
                                                    size: 25,
                                                    starCount: 1,
                                                    spacing: 0.0,
                                                    onRatingChanged: (value) {
                                                      setState(() {
                                                        rating = value;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],

                                            )
                                          ))),
                                  Positioned(
                                    top: 390,
                                    right: 65,
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Maldives',
                                          style: TextStyle(fontFamily: 'Roboto Bold',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20),
                                        ),
                                        SmoothStarRating(
                                          allowHalfRating: true,
                                          color: Colors.white,
                                          borderColor: Colors.white,
                                          rating: rating,
                                          size: 25,
                                          starCount: 5,
                                          spacing: 2.0,
                                          onRatingChanged: (value) {
                                            setState(() {
                                              rating = value;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )*/
//                    Container()
       courselView
       ],
     );
  }

  _handleTabAnimation() {
    // gets the value of the animation. For example, if one is between the 1st and the 2nd tab, this value will be 0.5
    _aniValue = _controller.animation.value;

    // if the button wasn't pressed, which means the user is swiping, and the amount swipped is less than 1 (this means that we're swiping through neighbor Tab Views)
    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      // set the current tab index
      _setCurrentIndex(_aniValue.round());
    }

    // save the previous Animation Value
    _prevAniValue = _aniValue;
  }

  _handleTabChange() {
    // if a button was tapped, change the current index
    if (_buttonTap) _setCurrentIndex(_controller.index);

    // this resets the button tap
    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;

    // save the previous controller index
    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    // if we're actually changing the index
    if (index != _currentIndex) {
      setState(() {
        // change the index
        _currentIndex = index;
      });

      // trigger the button animation
      _triggerAnimation();
      // scroll the TabBar to the correct position (if we have a scrollable bar)
      _scrollTo(index);
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndexes = index;
    });
  }

  _triggerAnimation() {
    // reset the animations so they're ready to go
    _animationControllerOn.reset();
    _animationControllerOff.reset();

    // run the animations!
    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    // get the screen width. This is used to check if we have an element off screen
    double screenWidth = MediaQuery.of(context).size.width;

    // get the button we want to scroll to
    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    // get its size
    double size = renderBox.size.width;
    // and position
    double position = renderBox.localToGlobal(Offset.zero).dx;

    // this is how much the button is away from the center of the screen and how much we must scroll to get it into place
    double offset = (position + size / 2) - screenWidth / 2;

    // if the button is to the left of the middle
    if (offset < 0) {
      // get the first button
      renderBox = _keys[0].currentContext.findRenderObject();
      // get the position of the first button of the TabBar
      position = renderBox.localToGlobal(Offset.zero).dx;

      // if the offset pulls the first button away from the left side, we limit that movement so the first button is stuck to the left side
      if (position > offset) offset = position;
    } else {
      // if the button is to the right of the middle

      // get the last button
      renderBox = _keys[_icons.length - 1].currentContext.findRenderObject();
      // get its position
      position = renderBox.localToGlobal(Offset.zero).dx;
      // and size
      size = renderBox.size.width;

      // if the last button doesn't reach the right side, use it's right side as the limit of the screen for the TabBar
      if (position + size < screenWidth) screenWidth = position + size;

      // if the offset pulls the last button away from the right side limit, we reduce that movement so the last button is stuck to the right side limit
      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    // scroll the calculated ammount
    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      // if it's the previous active button
      return _colorTweenBackgroundOff.value;
    } else {
      // if the button is inactive
      return _backgroundOff;
    }
  }

  _getForegroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 1.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: 6,
        height: 6,
        decoration: new BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

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
