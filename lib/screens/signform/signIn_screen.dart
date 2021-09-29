import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oguaproject/core/common.dart';
import 'package:oguaproject/screens/Main/main_screen.dart';
import 'package:oguaproject/screens/loading/loading_screen.dart';
import 'package:oguaproject/screens/signform/signUp_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController idEditingController = new TextEditingController();
  TextEditingController pwEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainBackGround(size: size, backgroundHeight: 500,),
          InputContainer(
            size: size,
            textEditingController: idEditingController,
            hintText: "Email",
            obsecure: false,
            loginOption: "Email",
          ),
          InputContainer(
            size: size,
            textEditingController: pwEditingController,
            hintText: "Password",
            obsecure: true,
            loginOption: "Password",
          ),
          SizedBox(height : 15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder : (context) => SignUpScreen(),
                    ));
                  },
                  child : Text(
                    "Don't you have account?",
                    style : GoogleFonts.alata(
                      textStyle : TextStyle(
                        fontWeight: FontWeight.w300,
                        textBaseline : TextBaseline.alphabetic,
                        fontSize : 15,
                        color: Colors.blueGrey
                      )
                    )
                  )
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder : (context) => MainScreen(),
                      fullscreenDialog: true
                    ));
                  },
                  child : DefaultButton(size: size, text : "Login")
                )
              ],
            ),
          ),
          Spacer(),
          Center(
            child : Text(
              "O'gua Industry",
              style : GoogleFonts.alata(
                textStyle : TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.grey[500],
                  fontSize: 13
                )
              )
            )
          ),
          Spacer(),
        ],
      )
    );
  }
}