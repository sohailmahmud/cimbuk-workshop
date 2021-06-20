import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/theme2/utils/T2Constant.dart';
import 'package:prokit_flutter/theme2/utils/T2Extension.dart';
import 'package:prokit_flutter/theme2/utils/T2Images.dart';
import 'package:prokit_flutter/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/theme2/utils/T2Widgets.dart';

class T2Profile extends StatefulWidget {
  static var tag = "/T2Profile";

  @override
  T2ProfileState createState() => T2ProfileState();
}

class T2ProfileState extends State<T2Profile> {
  String _selectedLocation = 'Male';
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = t2_user_name;
    addressController.text = t2_profile_address;
    contactController.text = t2_profile_contactNo;
    emailController.text = t2_user_email;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: t2_profile_cover_page_54,
            width: width,
            height: height / 2.5,
            fit: BoxFit.cover,
          ),
          /*Image.asset(
            t2_profile_cover_page_54,
            width: width,
            height: height / 2.5,
            fit: BoxFit.cover,
          ),*/
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: height / 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.camera_alt, size: 16, color: t2_white),
                      SizedBox(
                        width: 10,
                      ),
                      text(t2_edit_cover_photo, textColor: t2_white),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                        color: t2_colorPrimary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 16,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        imageUrl: t2_profile,
                                        width: 80,
                                        height: 80,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          text(t2_user_name,
                                              textColor: t2_white,
                                              fontFamily: fontBold,
                                              fontSize: textSizeNormal),
                                          SizedBox(height: 8),
                                          text(t2_user_email,
                                              textColor: t2_white,
                                              fontSize: textSizeMedium),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 35,
                                  height: 35,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.edit,
                                        color: t2TextColorPrimary),
                                    backgroundColor: t2_white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                              color: t2_white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          child: Container(
                            width: width,
                            height: height,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(t2_lbl_personal,
                                    textColor: t2TextColorPrimary,
                                    fontFamily: fontMedium,
                                    fontSize: 21.0),
                                EditText(
                                  isPassword: false,
                                  mController: nameController,
                                  fontSize: textSizeLargeMedium,
                                ),
                                DropdownButton<String>(
                                  value: _selectedLocation,
                                  items: <String>['Female', 'Male']
                                      .map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: text(value,
                                          fontSize: textSizeLargeMedium,
                                          textColor: t2TextColorPrimary),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedLocation = newValue;
                                    });
                                  },
                                ),
                                EditText(
                                  isPassword: false,
                                  mController: addressController,
                                  maxLine: 2,
                                  fontSize: textSizeLargeMedium,
                                ),
                                SizedBox(height: 30),
                                text(t2_lbl_contacts,
                                    textColor: t2TextColorPrimary,
                                    fontFamily: fontMedium,
                                    fontSize: 21.0),
                                EditText(
                                  isPassword: false,
                                  mController: contactController,
                                  fontSize: textSizeLargeMedium,
                                ),
                                EditText(
                                  isPassword: false,
                                  mController: emailController,
                                  fontSize: textSizeLargeMedium,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TopBar(t2_lbl_profile, bgColor: null),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              width: width,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[t2_colorPrimary, t2_colorPrimaryDark]),
              ),
              child: text(t2_lbl_save,
                  textColor: t2_white, fontFamily: fontMedium),
            ),
          )
        ],
      ),
    );
  }
}
