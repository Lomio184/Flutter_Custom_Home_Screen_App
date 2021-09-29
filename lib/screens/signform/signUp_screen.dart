import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oguaproject/core/common.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController pwEditingController    = new TextEditingController();
  TextEditingController nickEditingController  = new TextEditingController();

  bool ischk = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> state = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused
      };
      if (states.any(state.contains))
        return Colors.lightBlueAccent;
      return Colors.blueGrey;
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child : Icon(
            Icons.arrow_back_ios,
            color: Colors.lightBlueAccent,
          )
        )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              RichText(
                text : TextSpan(
                  children: [
                    TextSpan(
                      text : "Welcome\n",
                      style : GoogleFonts.alata(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color : Colors.blueGrey
                      ) 
                    ),
                    TextSpan(
                      text : "O'gua Membership",
                      style : GoogleFonts.alata(
                        fontWeight: FontWeight.w200,
                        color: Colors.lightBlueAccent,
                        fontSize: 30
                      )
                    )
                  ]
                )
              ),
              SizedBox(height : 30),
              Expanded(
                flex : 8,
                child: Column(
                  children: [
                    InputContainer(size: size, textEditingController: emailEditingController, hintText: "Email", obsecure: false, loginOption: "Email"),
                    SizedBox(height : 5),
                    InputContainer(size: size, textEditingController: pwEditingController, hintText: "Password", obsecure: true, loginOption: "Password"),
                    SizedBox(height : 5),
                    InputContainer(size: size, textEditingController: nickEditingController, hintText: "Nickname", obsecure: false, loginOption: "Nickname"),
                    SizedBox(height : 5),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value : ischk,
                          onChanged: (bool? value) {
                            setState(() {
                              ischk = value!;
                            });
                          },
                        ),
                        RichText(
                          text : TextSpan(
                            children : [
                              TextSpan(
                                text  : "Read and agree to",
                                style : GoogleFonts.alata(
                                  textStyle : TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color : Colors.blueGrey,
                                    fontSize: 15
                                  )
                                )
                              ),
                              TextSpan(
                                text  : " Terms & Conditions",
                                style : GoogleFonts.alata(
                                  textStyle : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color : Colors.lightBlueAccent,
                                    fontSize: 15
                                  )
                                )
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child : InkWell(
                        onTap : () {

                        },
                        child : DefaultButton(size: size, text : "SignUp")
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}