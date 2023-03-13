import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/Screen/Controller/QuoteController.dart';
import 'package:share_plus/share_plus.dart';

class ShowQuotesPage extends StatefulWidget {
  const ShowQuotesPage({Key? key}) : super(key: key);

  @override
  State<ShowQuotesPage> createState() => _ShowQuotesPageState();
}

class _ShowQuotesPageState extends State<ShowQuotesPage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.network(
                    "${homeController.colorList[homeController.inde.value].image}",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black38,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${homeController.colorList[homeController.inde.value].quote}",
                        textAlign: TextAlign.center,
                        style: homeController.text.value == 0
                            ? GoogleFonts.satisfy(
                                color: Colors.white, fontSize: 25)
                            : GoogleFonts.permanentMarker(
                                color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- ${homeController.colorList[homeController.inde.value].name}",
                        style: homeController.text.value == 0
                            ? GoogleFonts.satisfy(
                                color: Colors.white, fontSize: 25)
                            : GoogleFonts.permanentMarker(
                                color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 700),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (homeController.inde.value > 0) {
                            homeController.inde.value =
                                homeController.inde.value - 1;
                          }
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (homeController.text.value == 0) {
                            homeController.text.value = 1;
                          } else {
                            homeController.text.value = 0;
                          }
                        },
                        icon: homeController.text.value == 0
                            ? Icon(
                                Icons.text_format,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.text_format,
                                color: Colors.white70,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(
                                text: homeController
                                    .colorList[homeController.inde.value]
                                    .quote),
                          );
                        },
                        icon: Icon(
                          Icons.copy,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Share.share(
                              "${homeController.colorList[homeController.inde.value].quote}");
                        },
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (homeController.inde.value < 3) {
                            homeController.inde.value =
                                homeController.inde.value + 1;
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
