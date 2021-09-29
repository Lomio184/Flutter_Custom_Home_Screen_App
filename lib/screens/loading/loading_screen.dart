import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oguaproject/core/common.dart';
import 'package:oguaproject/screens/signform/signIn_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int currentIndex = 0;

  final List<Map<Icon, String> > loadingItem = 
  [
    {Icon(CommunityMaterialIcons.water_check) : "Clean"},
    {Icon(CommunityMaterialIcons.wave) : "Deep Ocean"},
    {Icon(CommunityMaterialIcons.coolant_temperature) : "Ice!"}
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body : Column(
        children: [
          MainBackGround(size: size, backgroundHeight: 550,),
          Expanded(
            flex : 3,
            child : PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Container(
                    height : 150,
                    width  : 250,
                    child:  Column(
                      children: [
                        Icon(
                          loadingItem[index].entries.first.key.icon,
                          size : 80,
                          color: Colors.blue,
                        ),
                        SizedBox(height : 5),
                        Text(
                          loadingItem[index].entries.first.value,
                          style : GoogleFonts.alata(
                            textStyle : TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.lightBlue
                            )
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
          Expanded(
            flex : 2,
            child: Container(
              width : double.infinity * .75,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(loadingItem.length, (index) => 
                      dotAnimateContainer(index: index)
                    ),
                  ),
                  SizedBox(height : 25),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder : (context) => SignInScreen(),
                        fullscreenDialog: true,
                      ));
                    },
                    child : Container(
                      height : size.height * .06,
                      width : size.width * .8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.lightBlueAccent
                      ),
                      child : Center(
                        child : Text(
                          "Continue",
                          style : GoogleFonts.alata(
                            textStyle : TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30
                            )
                          )
                        )
                      )
                    )
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
  AnimatedContainer dotAnimateContainer({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right : 7),
      height : 5,
      width : currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.lightBlueAccent : Colors.blueGrey,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}