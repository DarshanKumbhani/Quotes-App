import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/QuoteModel.dart';

class HomeController extends GetxController {
  RxInt text = 0.obs;
  RxInt inde = 0.obs;
  RxList<Map> dataList = <Map>[].obs;
  RxList<String> imageList = [
    "https://wallpaperaccess.com/full/915915.jpg",
    "https://wallpapercave.com/dwp1x/wp2321549.jpg",
    "https://wallpapercave.com/dwp1x/wp2321569.jpg",
    "https://wallpapercave.com/dwp1x/wp2321633.jpg",
    "https://wallpapercave.com/dwp1x/wp5713527.jpg",
    "https://wallpaperaccess.com/full/1924843.jpg",
    "https://c4.wallpaperflare.com/wallpaper/511/667/626/albert-einstein-hd-wallpaper-wallpaper-preview.jpg",
    "https://wallpapercave.com/dwp1x/wp6251601.jpg",
    "https://wallpaperaccess.com/full/1188437.jpg",
    "https://c4.wallpaperflare.com/wallpaper/443/511/736/quote-albert-einstein-wallpaper-preview.jpg",
    "https://wallpaperaccess.com/full/1924844.jpg",
  ].obs;
  RxInt index = 0.obs;
  RxInt changeQuotes = 0.obs;
  RxInt changefonts = 0.obs;
  RxList<QuoteModel> colorList = <QuoteModel>[
    QuoteModel(
      color: Color(0xff0ba1ce),
      name: "Love Quotes",
      image: "https://wallpaperaccess.com/full/6694659.jpg",
      quote: "You call it madness, but I call it love.",
    ),
    QuoteModel(
      color: Color(0xffbea310),
      name: "Albert Eienstein Quotes",
      image:
          "https://c4.wallpaperflare.com/wallpaper/304/787/797/albert-einstein-monochrome-wallpaper-preview.jpg",
      quote:
          "Learn from yesterday, live for today, hope for tomorrow. The important thing is not to stop questioning.",
    ),
    QuoteModel(
      color: Color(0xff3e8a18),
      name: "Swami Vivekananda Quotes",
      image: "https://wallpaperaccess.com/full/4823283.jpg",
      quote:
          "We are what our thoughts have made us; so take care about what you think.",
    ),
    QuoteModel(
      color: Color(0xff0ba1ce),
      name: "Motivational Quotes",
      image:
          "https://w0.peakpx.com/wallpaper/634/617/HD-wallpaper-portgas-d-ace-anime-battlefield-cross-fire-luffy-monkey-d-luffy-naruto-naruto-shippuden-one-piece-thumbnail.jpg",
      quote: "Somebody told me I'm a failure, I'll prove them wrong.",
    ),
  ].obs;
  RxList<QuoteModel> colorList2 = <QuoteModel>[
    QuoteModel(
      color: Color(0xff0ba1ce),
      name: "Albert Einstein Quotes",
      image:
          "https://c4.wallpaperflare.com/wallpaper/304/787/797/albert-einstein-monochrome-wallpaper-preview.jpg",
      quote:
          "Learn from yesterday, live for today, hope for tomorrow. The important thing is not to stop questioning.",
    ),
    QuoteModel(
      color: Color(0xffbea310),
      name: "Swami Vivekananda Quotes",
      image: "https://wallpaperaccess.com/full/4823283.jpg",
      quote:
          "We are what our thoughts have made us; so take care about what you think.",
    ),
    QuoteModel(
      color: Color(0xff3e8a18),
      name: "Helen Keller Quotes",
      image: "https://wallpaperaccess.com/full/7526243.jpg",
      quote:
          "The best and most beautiful things in the world cannot be seen or even touched-they must be felt with the heart.",
    ),
    QuoteModel(
      color: Color(0xff0ba1ce),
      name: " William Shakespeare Quotes",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrQnt_a3ETRiFHE4jJzlnmv3A87fTwLTCoCQ&usqp=CAU",
      quote:
          "And all the men and women merely players; They have their exits and their entrances, And one man in his time plays many parts, His acts being seven ages.",
    ),
  ].obs;
}
