import 'package:flutter/material.dart';
import 'package:get/get.dart';

class expanded_image extends StatelessWidget {
  expanded_image(this.path);
  String path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.redAccent[200],
          toolbarHeight: 60,
          elevation: 14,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          title: Text(
            'Dartists',
          ),
        ),
        body: Hero(
          tag: "profile-image",
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              child: Container(
                width: MediaQuery.of(context).size.height / 2,
                height: MediaQuery.of(context).size.height / 2,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(path), fit: BoxFit.cover)),
              ),
            ),
          ),
        ));
  }
}
