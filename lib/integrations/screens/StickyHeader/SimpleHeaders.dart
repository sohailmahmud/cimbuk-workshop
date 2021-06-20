import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/sticky_header/sticky_headers/widget.dart';

class SimpleHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF8998FF),
          title: Text('Headers and Content'),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return StickyHeader(
              header: Container(
                height: 50.0,
                color: Colors.blueGrey[700],
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #$index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              content: Container(
                child: Image.network(
                    'https://killerattitudestatus.in/wp-content/uploads/2019/12/gud-night-images.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
