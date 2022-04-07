import 'package:dartists/priviews/contrsted_image.dart';
import 'package:dartists/priviews/exapanded.dart';
import 'package:dartists/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> categories = [
  "Motivation",
  "Adventure",
  "Manga",
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'hanuman',
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  var index = 0.obs;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.redAccent[200],
        child: Stack(
          children: [
            tiles(),
          ],
        ),
      ),
      appBar: AppBar(
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
      body: Column(children: [
        SingleChildScrollView(
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${categories[index.value]}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'hanuman',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Image From source code",
                      style: TextStyle(fontFamily: 'hanuman', fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: InkWell(
                      onTap: () {
                        Get.to(expanded_image(
                            "assets/images/${categories[controller!.index]}/${index + 1}.jpg"));
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => ImageCard(
                            "assets/images/${categories[controller!.index]}/${index + 1}.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Image from internet url",
                      style: TextStyle(fontFamily: 'hanuman', fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: InkWell(
                      onTap: () {
                        Get.to(expanded_image(
                            "assets/images/${categories[controller!.index]}/${index + 1}.jpg"));
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => ImageCard(
                            "assets/images/${categories[controller!.index]}/${index + 1}.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Spacer(),
        Positioned(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                    unselectedLabelColor: Colors.black38,
                    onTap: (tabIndex) {
                      index.value = tabIndex;
                    },
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Colors.green,
                    ),
                    controller: controller,
                    tabs: [
                      Tab(
                          child: Text(categories[0],
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 11))),
                      Tab(
                          child: Text(categories[1],
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 11))),
                      Tab(
                          child: Text(categories[2],
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 11))),
                      // Tab(
                      //     child: Text(categories[3],
                      //         style: TextStyle(
                      //             color: Colors.white60, fontSize: 11))),
                    ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class ImageCard extends StatelessWidget {
  String path;
  ImageCard(this.path);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
