import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oguaproject/core/model.dart';
import 'package:oguaproject/screens/Main/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final List<Object> cardlist = [

  ];

  final List<BottomBarItem> items = [
    BottomBarItem(
      Icon(CommunityMaterialIcons.home), 
      Text(
        "home",
        style : GoogleFonts.alata(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color : Colors.white
          )
        )
      ), 
      Colors.white, 
      Colors.grey
    ),
    BottomBarItem(
      Icon(CommunityMaterialIcons.cart), 
      Text(
        "Cart",
        style : GoogleFonts.alata(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color : Colors.white
          )
        )
      ), 
      Colors.white, 
      Colors.grey
    ),
    BottomBarItem(
      Icon(CommunityMaterialIcons.human), 
      Text(
        "Profile",
        style : GoogleFonts.alata(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color : Colors.white
          )
        )
      ), 
      Colors.white, 
      Colors.grey
    ),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body : buildBody(size),
      bottomNavigationBar: buildBottomBar(context, size)
    );
  }
  Widget buildBody(Size size) {
  final Shader nameGradient = new LinearGradient(
    colors : [Colors.blue, Colors.red]
  ).createShader(Rect.fromLTWH(0, 0, 100, 40));

  List<Widget> pages = [
    HomeScreen(nameGradient: nameGradient, size: size),
    Container(color: Colors.white,),
    Container(color: Colors.white,)
  ];

  return IndexedStack(
    index : _currentIndex,
    children: pages,
    );
  }

  Widget buildBottomBar(BuildContext context, Size size) {
    return Container(
      height : size.height * .085,
      padding : const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.8),
            spreadRadius: 5,
            blurRadius: 15,
            offset: Offset(0,3)
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        gradient: new LinearGradient(
          colors: [Colors.blue, Colors.red],
          begin : const FractionalOffset(0,0),
          end : const FractionalOffset(1.0, 0),
          stops : [0.4, 1.0],
          tileMode: TileMode.clamp,
        )
      ),
      child: SafeArea(
        child : Container(
          width : double.infinity,
          height : size.height * .05,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 7,
          ),
          child : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var idx = items.indexOf(item);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = idx;
                  });
                },
                child: BarContainer(
                  item: item,
                  isSelected: idx == _currentIndex,
                  curve: Curves.bounceInOut
                )
              );
            }).toList(),
          )
        )
      )
    );
  }
}

class BarContainer extends StatelessWidget {
  final bool isSelected;
  final BottomBarItem item;
  final Curve curve;

  const BarContainer({Key? key, 
  required this.isSelected, 
  required this.item, 
  required this.curve}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child : AnimatedContainer(
        width : isSelected ? 120 : 50,
        curve : curve,
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child : Container(
            width : isSelected ? 120 : 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconTheme(
                  data : IconThemeData(
                    size : 25,
                    color: isSelected ?item.activeColor : item.defaultColor!.withOpacity(.4) == null ? 
                      item.activeColor : item.defaultColor!.withOpacity(.4)
                  ),
                  child: item.icon,
                ),
                isSelected ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    padding : EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey
                    ),
                    child : Center(child : item.title)
                  )
                ) : Container()
              ],
            )
          )
        )
      )
    );
  }
}