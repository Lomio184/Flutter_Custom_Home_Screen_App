import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height / 1.25);
    var firstControlPoint = new Offset(size.width / 5.25, size.height / 1.25);
    var firstEndPoint     = new Offset(size.width / 1.75, size.height / 1.25 - 65);
    var secondControlPoint= new Offset(
      size.width - (size.width / 5.75), size.height / 1.35 - 65
    );
    var secondEndPoint    = new Offset(size.width, size.height / 1.25 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, 
    firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(
      secondControlPoint.dx, secondControlPoint.dy, 
      secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height/3);
    path.lineTo(size.width, 0);
    path.close();
    return path; 
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MainBackGround extends StatelessWidget {
  const MainBackGround({
    Key? key,
    required this.size,
    required this.backgroundHeight
  }) : super(key: key);

  final Size size;
  final double backgroundHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Stack(
        children: [
          ClipPath(
            clipper: LoadingCliper(),
            child : Container(
              decoration: BoxDecoration(
                gradient : new LinearGradient(colors: [
                  Colors.blue, Colors.red
                  ],
                begin : const FractionalOffset(0, 0),
                end : const FractionalOffset(1.0, 0),
                stops : [0.4, 1.0],
                tileMode: TileMode.clamp
                ),
              ),
              height: backgroundHeight
            )
          ),
          Positioned(
            top : size.height * .155,
            left : size.width * .125,
            child : Column(
              children: [
                Text(
                  "O'gua",
                  style : GoogleFonts.alata(
                    textStyle : TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize : 75,
                      color : Colors.white,
                    )
                  )
                ),
                Text(
                  "Deep Water on the Earth",
                  style : GoogleFonts.alata(
                    textStyle : TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
                      color: Colors.white,
                    )
                  )
                )
              ],
            )
          )
        ],
      )
    );
  }
}

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key? key,
    required this.size, 
    required this.textEditingController, 
    required this.hintText, 
    required this.obsecure, 
    required this.loginOption,
  }) : super(key: key);

  final Size size;
  final TextEditingController textEditingController;
  final String hintText;
  final bool obsecure;
  final String loginOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.symmetric(
        horizontal: 15
      ),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loginOption,
            style : GoogleFonts.alata(
              textStyle : TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.lightBlueAccent,
                fontSize : 20
              )
            )
          ),
          SizedBox(height : 10),
          Container(
            height: size.height * .08,
            width : double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border : Border.all(width : 2, color: Colors.lightBlueAccent),
            ),
            child : Padding(
              padding : const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5
              ),
              child : TextFormField(
                obscureText: obsecure,
                controller: textEditingController,
                style: GoogleFonts.alata(
                  textStyle : TextStyle(
                    fontWeight: FontWeight.w400,
                  )
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  border : InputBorder.none,
                  hintStyle: GoogleFonts.alata(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.lightBlueAccent
                    )
                  )
                ),
              )
            )
          )
        ],
      )
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.size,
    required this.text
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height : size.height * .055,
      width : size.width * .2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: new LinearGradient(
          colors: [
            Colors.blue, Colors.red
          ],
          begin : const FractionalOffset(0, 0),
          end   : const FractionalOffset(1.0, 0),
          stops : const [0.3, 1.0],
          tileMode: TileMode.clamp
        )
      ),
      child : Center(
        child: Text(
          text,
          style : GoogleFonts.alata(
            textStyle : TextStyle(
              fontWeight: FontWeight.bold,
              fontSize : 20,
              color: Colors.white,
            )
          )
        ),
      )
    );
  }
}

