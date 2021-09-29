import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oguaproject/core/model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.nameGradient,
    required this.size,
  }) : super(key: key);

  final Shader nameGradient;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child : Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15
          ),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "O'gua",
                    style : GoogleFonts.alata(
                      textStyle: TextStyle(
                        fontSize : 30,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = nameGradient
                      )
                    )
                  ),
                  Container(
                    height : size.height * .05,
                    width : size.width * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color : Colors.blue, width : 2),
                    ),
                    child : Center(
                      child : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child : TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search your item...",
                            hintStyle: GoogleFonts.alata(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey
                              )
                            )
                          ),
                        )
                      )
                    )
                  )
                ],
              ),
              SizedBox(height: 30,),
              Container(
                margin: const EdgeInsets.only(bottom:15),
                height : size.height * .45,
                width : size.width,
                child : Swiper(
                  itemCount : goods.length,
                  itemBuilder: (context, int index) {
                    return MainCard(size: size);
                  },
                  autoplay: true,
                  layout: SwiperLayout.STACK,
                  itemWidth: size.width * .8,
                )
              ),
              Text(
                "O'gua on the Earth",
                style : GoogleFonts.alata(
                  textStyle : TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:30,
                    color: Colors.blueGrey
                  )
                )
              ),
              Stack(
                children: [
                  Container(
                    margin : const EdgeInsets.only(
                      top : 15,
                      bottom : 15,
                    ),
                    width : size.width,
                    height : size.height * .25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        fit : BoxFit.cover,
                        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(.4), BlendMode.darken),
                        image : AssetImage(
                          'assets/images/sea.jpg'
                        )
                      )
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left : 20,
                    child : RichText(
                      text: TextSpan(
                        style : GoogleFonts.alata(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color : Colors.white,
                          )
                        ),
                        children: [
                          TextSpan(
                            text: "We, O'gua, You\n\n",
                            style: GoogleFonts.alata(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:40
                              )
                            )
                          ),
                          TextSpan(
                            text: "We aim for the coexistence of \nthe earth's \n environment and humankind.\n"
                          )
                        ]
                      ),
                    )
                  )
                ],
              )
            ],
          )
        )
      )
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height : size.height * .45,
      width : size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blueGrey
      ),
      child : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Container(
                        width : size.width * .35,
                        child : Column(
                          children: [
                            Center(
                              child : Text(
                                "Signature",
                                style : GoogleFonts.alata(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  )
                                )
                              )
                            ),
                            SizedBox(height : size.height * .02),
                            Container(
                              height: size.height * .2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width : 2,
                                  color: Colors.white
                                )
                              ),
                              child : ListView.builder(
                                itemCount: goods.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 15
                                    ),
                                    child : Row(
                                      children: [
                                        Text(
                                          goods[index].title,
                                          style : GoogleFonts.alata(
                                            textStyle : TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                            )
                                          )
                                        ),
                                        Text(
                                          goods[index].price,
                                          style : GoogleFonts.alata(
                                            textStyle: TextStyle(
                                              fontWeight : FontWeight.w300,
                                              color : Colors.grey[100]
                                            )
                                          )
                                        )
                                      ],
                                    )
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin : const EdgeInsets.only(top: 20),
                              height: size.height * .06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey[200],
                                border: Border.all(color: Colors.white, width:2)
                              ),
                              child : Center(
                                child : Text(
                                  "+Buy",
                                  style : GoogleFonts.alata(
                                    textStyle: TextStyle(
                                      fontWeight : FontWeight.bold,
                                      color: Colors.white,
                                      fontSize : 25
                                    )
                                  )
                                )
                              )
                            )
                          ],
                        )
                      )
                    ]
                  )
                ],
              )
            ),
            Container(
              height : size.height * .4,
              width : size.width * .3,
              decoration: BoxDecoration(
                image :DecorationImage(
                  image: AssetImage(
                    "assets/images/empty_bottle.png"
                  )
                )
              )
            )
          ],
        ),
      )
    );
  }
}