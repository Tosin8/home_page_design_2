import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      title: 'Landing Page',
      debugShowCheckedModeBanner: false,
      home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                searchBar(),
                SizedBox(height: w / 20),
                groupOfCards(
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo(),
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo()),
                groupOfCards(
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo(),
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo()),
                groupOfCards(
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo(),
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo()),
                groupOfCards(
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo(),
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo()),
                groupOfCards(
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo(),
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo()),
                groupOfCards(
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo(),
                    'Example Text',
                    'Example Text',
                    'assets/images/file_name.png',
                    RouteWhereYouGo()),
              ],
            ),
            settingIcon(),
          ],
        ));
  }

  Widget settingIcon() {
    double w = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.fromLTRB(0, w / 10, w / 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: w / 8.5,
                width: w / 8.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  tooltip: 'Settings',
                  icon: Icon(Icons.settings,
                      size: w / 17, color: Colors.black.withOpacity(.6)),
                  onPressed: () {
                    Navigator.of(context).push(MyFadeRoute(
                      route: RouteWhereYouGo(),
                    ));
                  },
                ))
          ],
        ));
  }

  Widget searchBar() {
    double w = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.fromLTRB(w / 20, w / 25, w / 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                height: w / 8.5,
                width: w / 1.36,
                padding: EdgeInsets.symmetric(horizontal: w / 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(99),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(.4),
                          fontWeight: FontWeight.w600,
                          fontSize: w / 22),
                      prefixIcon: Icon(Icons.search,
                          color: Colors.black.withOpacity(.6)),
                      hintText: 'Search anything .....',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.zero,
                    ))),
            SizedBox(height: w / 14),
            SizedBox(
                width: w / 1.15,
                child: Text('Example Text',
                    textScaleFactor: 1.4,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.7),
                    ))),
          ],
        ));
  }

  Widget groupOfCards(
      String title1,
      String subtitle1,
      String image1,
      Widget route1,
      String title2,
      String subtitle2,
      String image2,
      Widget route2) {
    double w = MediaQuery.of(context).size.width; 
    return Padding (
      padding: EdgeInsets.fromLTRB(w/20, 0, w/20, w/20), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          card(title1, subtitle1, image1, route1), 
          card(title2, subtitle2, image2, route2), 
        ], 
      ), 
    ); 
  }

  Widget card(String title, String subtitle, String image, Widget route) {
    double w = MediaQuery.of(context).size.width; 
    return Opacity(
      opacity: _animation.value, 
      child: InkWell(
        highlightColor: Colors.transparent, 
        splashColor: Colors.transparent,
onTap: () {
  Navigator.of(context).push(MyFadeRoute(route: route)); 
},  
child: Container(
  width: w/2.36,
height: w/1.8, 
decoration: BoxDecoration(
  color: Colors.white, 
  borderRadius: BorderRadius.circular(20),
 boxShadow:[
  BoxShadow(
    color: Colors.black.withOpacity(.05),
     blurRadius: 50), 
]), 
child: Column(
  children: [
    Container(
      width: w/2.36, 
      height: w/2.6,
      decoration: const BoxDecoration(
        color: Color(0xff5c71F3), 
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20), 
      ))
    )
  ],
),
    )
  }
}
