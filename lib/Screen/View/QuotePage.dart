import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:quotes_app/Screen/Controller/QuoteController.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:quotes_app/Utils/DBhandler.dart';

import 'AddPage.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    homeController.dataList.value = await DbHandler.dbHandler.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFDEDEDE),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text(
            "Amazing Quotes",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 230,
                  child: Stack(
                    children: [
                      CarouselSlider.builder(
                        itemCount: homeController.imageList.length,
                        itemBuilder: (context, index, realIndex) {
                          return Image.network(
                            "${homeController.imageList[index]}",
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: 250,
                          );
                        },
                        options: CarouselOptions(
                          onPageChanged: (inde, reason) {
                            homeController.index.value = inde;
                          },
                          height: 250,
                          viewportFraction: 1,
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Obx(
                              () =>
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: homeController.imageList
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) =>
                                      Container(
                                        margin:
                                        EdgeInsets.only(bottom: 15, right: 5),
                                        height: homeController.index.value ==
                                            e.key
                                            ? 15
                                            : 9,
                                        width: homeController.index.value ==
                                            e.key
                                            ? 15
                                            : 9,
                                        decoration: BoxDecoration(
                                            color:
                                            homeController.index.value == e.key
                                                ? Colors.red
                                                : Colors.white,
                                            shape: BoxShape.circle),
                                      ),
                                )
                                    .toList(),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 330,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            "Most Popular",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Obx(
                            () =>
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.colorList.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                          2 -
                                          30,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        homeController.inde.value = index;
                                        Get.toNamed('Q');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: homeController
                                                .colorList[index].color,
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        height: 100,
                                        child: Text(
                                          "${homeController.colorList[index]
                                              .name}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                      () =>
                  homeController.dataList.isNotEmpty
                      ? Container(
                    height: 170,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Quotes By Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Container(
                          height: 130,
                          color: Colors.white,
                          child: Obx(
                                () =>
                                ListView.builder(
                                  itemCount: homeController.dataList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FocusedMenuHolder(
                                        menuWidth: 110,
                                        onPressed: () {},
                                        menuItems: [
                                          FocusedMenuItem(
                                            title: Text("Delete"),
                                            trailingIcon: Icon(Icons.delete),
                                            onPressed: () {
                                              DbHandler.dbHandler.deleteData(
                                                  id: homeController
                                                      .dataList[index]['id']);
                                              getData();
                                            },
                                          ),
                                        ],
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed('Custom');
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                gradient:
                                                LinearGradient(colors: [
                                                  Color(0xffec1fc8),
                                                  Color(0xffec84f6),
                                                  Color(0xf596107b),
                                                ]),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            width: 185,
                                            child: Text(
                                              "${homeController
                                                  .dataList[index]['category']}",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                          ),
                        ),
                      ],
                    ),
                  )
                      : Container(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 330,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            "Quotes By Author",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Obx(
                            () =>
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.colorList2.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width /
                                          2 -
                                          30,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        homeController.inde.value = index;
                                        Get.toNamed('A');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: homeController
                                                .colorList2[index].color,
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        height: 100,
                                        child: Text(
                                          "${homeController.colorList2[index]
                                              .name}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddPage());
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
