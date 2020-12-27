import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/infoProvider.dart';
import '../style.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final globalKey = GlobalKey<FormState>();
  bool eror = false;

  @override
  Widget build(BuildContext context) {
    var heigh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Consumer<Edit>(
        builder: (context, state, widget) {
          return Form(
            key: globalKey,
            child: SingleChildScrollView(
              child: Container(
                height: heigh,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                    SizedBox(height: heigh * .1),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: rock,
                        fontSize: 24,
                        color: white,
                      ),
                    ),
                    SizedBox(height: heigh * .06),
                    Container(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      height: 70,
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset('assets/username_icon.png'),
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 14),
                          Consumer<Edit>(
                            builder: (context, state, widget) {
                              return Expanded(
                                child: TextFormField(
                                  style:
                                      TextStyle(color: white, fontFamily: rock),
                                  onChanged: state.userNameOnchange(),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: state.userName,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        eror = true;
                                      });
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: rock,
                                        fontSize: 18,
                                      )),
                                ),
                              );
                            },
                          ),
                          Icon(
                            Icons.info,
                            color: eror ? Colors.red : Colors.transparent,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 1),
                          bottom: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      height: 70,
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset('assets/password_icon.png'),
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: white, fontFamily: rock),
                              controller: state.userPassword,
                              validator: (value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    eror = true;
                                  });
                                }
                                return null;
                              },
                              onChanged: state.userPassowrdOnchange(),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: rock,
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                          Icon(
                            Icons.info,
                            color: eror ? Colors.red : Colors.transparent,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: heigh * .035),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Consumer<Edit>(
                          builder: (context, state, widget) {
                            return InkWell(
                              onTap: () {
                                state.check();
                              },
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: white,
                                  width: 2,
                                )),
                                child: (state.ckecked == true)
                                    ? Center(
                                        child: Icon(
                                        Icons.check,
                                        size: 14,
                                        color: white,
                                      ))
                                    : Container(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Text(
                            'Remember Me',
                            style: TextStyle(
                              fontFamily: rock,
                              color: white,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: heigh * .035),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: SizedBox(
                        width: 180,
                        child: FlatButton(
                          color: white,
                          padding: EdgeInsets.all(20),
                          onPressed: () {
                            if (globalKey.currentState.validate()) {
                              state.logInfetch(context);
                            } else {
                              return print('no');
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontFamily: rock,
                                color: Colors.black54.withOpacity(.4),
                                fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
