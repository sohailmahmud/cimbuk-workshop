import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/theme7/utils/T7Colors.dart';
import 'package:prokit_flutter/theme7/utils/T7Constant.dart';
import 'package:prokit_flutter/theme7/utils/T7Extension.dart';
import 'package:prokit_flutter/theme7/utils/T7Strings.dart';
import 'package:prokit_flutter/theme7/utils/T7Widget.dart';

class T7SignIn extends StatefulWidget {
  static String tag = '/T7SignIn';

  @override
  T7SignInState createState() => T7SignInState();
}

class T7SignInState extends State<T7SignIn> with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(t7white);
    return Scaffold(
      backgroundColor: t7white,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: new PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: new Container(
                color: Colors.white,
                child: new SafeArea(
                  child: Column(
                    children: <Widget>[
                      new Expanded(child: new Container()),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.58,
                        child: new TabBar(
                          indicatorColor: t7colorPrimary,
                          tabs: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text(
                                t7_login,
                                style: TextStyle(fontSize: 16.0, color: t7textColorPrimary, fontFamily: fontRegular),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text(
                                t7_sign_up,
                                style: TextStyle(fontSize: 16.0, color: t7textColorPrimary, fontFamily: fontRegular),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      T7EditTextStyle(t7_email, t7_email),
                      TextFormField(
                        autofocus: false,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: t7_password,
                          labelText: t7_password,
                          contentPadding: EdgeInsets.fromLTRB(26, 20, 4, 20),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: t7view_color, width: 0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: t7view_color, width: 0.0),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                              semanticLabel: _obscureText ? 'show password' : 'hide password',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      text(t7_forgot_password, textColor: t7textColorSecondary),
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            width: MediaQuery.of(context).size.width,
                            child: T7Button(
                              textContent: t7_login,
                              onPressed: () {},
                              bgColor: t7view_color,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, left: 16),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      T7EditTextStyle(t7_name, t7_name),
                      T7EditTextStyle(t7_email, t7_email),
                      TextFormField(
                        autofocus: false,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: t7_password,
                          labelText: t7_password,
                          contentPadding: EdgeInsets.fromLTRB(26, 20, 4, 20),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: t7view_color, width: 0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: t7view_color, width: 0.0),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                              semanticLabel: _obscureText ? 'show password' : 'hide password',
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        autofocus: false,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: t7_confirm_password,
                          labelText: t7_confirm_password,
                          contentPadding: EdgeInsets.fromLTRB(26, 20, 4, 20),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: t7view_color, width: 0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: t7view_color, width: 0.0),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                              semanticLabel: _obscureText ? 'show password' : 'hide password',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            width: MediaQuery.of(context).size.width,
                            child: T7Button(
                              textContent: t7_sign_up,
                              onPressed: () {},
                              bgColor: t7view_color,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
