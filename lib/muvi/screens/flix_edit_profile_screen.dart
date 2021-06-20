import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_localizations.dart';
import 'package:prokit_flutter/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/muvi/utils/flix_widget_extensions.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_images.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_size.dart';
import 'package:prokit_flutter/muvi/utils/resources/flix_strings.dart';

class EditProfileScreen extends StatefulWidget {
  static String tag = '/ProfileScreen';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool passwordVisible = false;
  bool isRemember = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController dummycontroller = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _contactController = new TextEditingController();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _userNameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _contactFocusNode = FocusNode();
  bool _autoValidate = false;
  var contact;
  var name;
  var userProfile;
  var userName;
  var userEmail;
  var userId;
  File imageFile;
  bool isLoading = false;
  bool loadFromFile = false;
  var selectedGender;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    setState(() {
      userProfile = "images/muvi/items/oval_ek1.png";
      userName = "Vicotria Becks";
      userEmail = "vicotriabecks@gmail.com";
      contact = "";
/*
      userId = pref.getInt(USER_ID);
      userProfile = pref.getString(USER_PROFILE) ?? '';
      userName = pref.getString(USERNAME) ?? '';
      userEmail = pref.getString(USER_EMAIL) ?? '';
      name = pref.getString(NAME) ?? '';
      contact = pref.getString(USER_CONTACT_NO) ?? '';
*/
      _nameController.text = userName;
      dummycontroller.text = "userName";
      _emailController.text = userEmail;
      _contactController.text = contact;
    });
  }

  showLoading(bool show) {
    setState(() {
      isLoading = show;
    });
  }

  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(
        Icons.add,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );
    if (image != null) {
      setState(() {
        imageFile = image;
        loadFromFile = true;
      });
    }
  }

/*
  saveProfile(context) async {
    if(isLoading){
      return;
    }
    isNetworkAvailable().then((bool) {
      if (bool) {
        var request = {
          "id": userId,
          "username": userName,
          "name": name,
          "email": userEmail,
          "dob": "",
          "contact_number": contact
        };
        showLoading(true);
        updateUser(request, imageFile).then((result) {
          print(result);
          showLoading(false);

        }).catchError((error) {
          toast(error.toString());
          showLoading(false);

        });
      } else {
        toast(keyString(context,"error_network_no_internet"));
      }
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    setState(() {
      selectedGender = getGenders(context).first;
    });
    final profilePhoto = Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: spacing_standard_new,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: loadFromFile
                  ? Image.file(
                      imageFile,
                      height: 95,
                      width: 95,
                      fit: BoxFit.cover,
                    )
                  : userProfile != null && userProfile.toString().isNotEmpty
                      ? networkImage(
                          userProfile,
                          aHeight: 95,
                          aWidth: 95,
                        )
                      : Image.asset(ic_profile, width: 95, height: 95),
            ).onTap(() {
              getImage(ImgSource.Both);
            }),
            text(context, keyString(context, "change_photo"), textColor: muvi_textColorPrimary, fontFamily: font_bold, fontSize: ts_medium).paddingTop(spacing_standard_new).onTap(() {})
          ],
        ).paddingOnly(top: 16));

    final fields = Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          formField(
            context,
            "hint_email",
            controller: _emailController,
            focusNode: _emailFocusNode,
            nextFocus: _nameFocusNode,
            validator: (value) {
              return value.validateEMail(context);
            },
            onSaved: (String value) {
              userEmail = value;
            },
            suffixIcon: Icons.mail_outline,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "name",
            controller: _nameController,
            focusNode: _nameFocusNode,
            nextFocus: _contactFocusNode,
            validator: (value) {
              return value.isEmpty ? keyString(context, "error_name_required") : null;
            },
            onSaved: (String value) {
              name = value;
            },
            suffixIcon: Icons.person_outline,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "phone_no",
            controller: _contactController,
            focusNode: _contactFocusNode,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            validator: (value) {
              return value.isEmpty ? keyString(context, "error_phone_requires") : null;
            },
            onSaved: (String value) {
              contact = value;
            },
            suffixIcon: Icons.phone,
          ).paddingBottom(spacing_standard_new),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                keyString(context, "gender"),
                style: TextStyle(fontSize: ts_medium_small, fontFamily: font_regular, color: muvi_textColorPrimary),
              ),
              Theme(
                data: ThemeData(canvasColor: muvi_navigationBackground),
                child: DropdownButton(
                  value: selectedGender,
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                  items: getGenders(context).map((value) {
                    return DropdownMenuItem(
                      child: text(context, value, fontSize: ts_normal, textColor: muvi_textColorPrimary),
                      value: value,
                    );
                  }).toList(),
                ),
              )
            ],
          ).paddingBottom(spacing_standard_new),
        ],
      ),
    ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, top: 36);

    return Scaffold(
      backgroundColor: muvi_appBackground,
      appBar: appBarLayout(context, keyString(context, "edit_profile")),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                profilePhoto,
                fields,
                SizedBox(
                  width: double.infinity,
                  child: button(
                    context,
                    keyString(context, "save"),
                    () {
                      if (isLoading) {
                        return;
                      }
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
//                      saveProfile(context);
                      } else {
                        setState(() => _autoValidate = true);
                      }
                    },
                  ).paddingOnly(top: 30, left: 18, right: 18, bottom: 30),
                )
              ],
            ),
          ),
          loadingWidgetMaker().visible(isLoading)
        ],
      ),
    );
  }
}
