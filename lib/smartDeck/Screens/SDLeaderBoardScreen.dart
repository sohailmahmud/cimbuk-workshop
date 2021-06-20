import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/smartDeck/ModelClass/SDLeaderboardModel.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/smartDeck/SDUtils/SDStyle.dart';

import 'SDLeaderInfoScreen.dart';

List<SDLeaderBoardModel> students = [
  SDLeaderBoardModel(
    image:
        'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24E953B920A9CD0FF2E1D587742A2472/1-intro-photo-final.jpg?w=800&q=70',
    name: 'Karnia Oktavia',
    message: 'Excellent work',
    score: 100,
  ),
  SDLeaderBoardModel(
    image:
        'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
    name: 'Kamaludin Abdul',
    message: 'Good work',
    score: 97,
  ),
  SDLeaderBoardModel(
    image: 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
    name: 'Mark Paul',
    message: 'Nice work',
    score: 96,
  ),
  SDLeaderBoardModel(
    image:
        'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
    name: 'Jeck',
    message: 'Nice work',
    score: 92,
  ),
  SDLeaderBoardModel(
    image:
        'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24E953B920A9CD0FF2E1D587742A2472/1-intro-photo-final.jpg?w=800&q=70',
    name: 'John Smith',
    message: 'Nice',
    score: 50,
  ),
  SDLeaderBoardModel(
    image:
        'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
    name: 'Paul',
    message: 'Good',
    score: 97,
  ),
  SDLeaderBoardModel(
    image: 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
    name: 'Smith',
    message: 'Nice work',
    score: 96,
  ),
  SDLeaderBoardModel(
    image:
        'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
    name: 'Lee',
    message: 'Nice work',
    score: 92,
  ),
];

Widget SDLeaderboardScreen([BuildContext context, Size size]) {
  return Column(
    children: <Widget>[
      Container(
          padding: EdgeInsets.only(top: 25, left: 16, bottom: 16),
          width: size.width,
          color: sdPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Leaderboard',
                style: boldTextStyle(
                    size: 18, textColor: Colors.white, letterSpacing: 0.5),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'Senior High School - 12th Grade',
                  style: secondaryTextStyle(
                    size: 12,
                    textColor: Colors.white.withOpacity(0.7),
                  ),
                ),
              )
            ],
          )),
      Expanded(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 16),
          scrollDirection: Axis.vertical,
          itemCount: students == null ? 0 : students.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SDLeaderInfoScreen(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                width: size.width,
                decoration: boxDecorations(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: (index + 1) == 1
                          ? Color(0xFFFFD700)
                          : (index + 1) == 2
                              ? Colors.grey.withOpacity(0.5)
                              : (index + 1) == 3
                                  ? Colors.red.withOpacity(0.5)
                                  : Colors.transparent,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: (index + 1) == 1
                            ? Color(0xFFD4AF37)
                            : (index + 1) == 2
                                ? Colors.grey.withOpacity(0.5)
                                : (index + 1) == 3
                                    ? Colors.red.withOpacity(0.5)
                                    : Colors.transparent,
                        child: Text(
                          (index + 1).toString(),
                          style: secondaryTextStyle(
                              size: 14,
                              textColor: (index + 1) == 1 ||
                                      (index + 1) == 2 ||
                                      (index + 1) == 3
                                  ? Colors.white
                                  : Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      height: 45,
                      width: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: AssetImage(
                            'Loading',
                          ),
                          image: Image.network(
                            students[index].image,
                            height: 35,
                            width: 10,
                          ).image,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            students[index].name,
                            style: boldTextStyle(size: 16),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              students[index].message,
                              style: secondaryTextStyle(size: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      students[index].score.toString(),
                      style: boldTextStyle(),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
