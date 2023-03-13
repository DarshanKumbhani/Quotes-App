import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/Screen/Controller/QuoteController.dart';
import 'package:quotes_app/Utils/DBhandler.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  GlobalKey<FormState> QAdd = GlobalKey<FormState>();
  HomeController homeController = Get.put(HomeController());
  TextEditingController txtCate = TextEditingController();
  TextEditingController txtQuotes = TextEditingController();
  TextEditingController txtauthor = TextEditingController();
  TextEditingController txtdCate = TextEditingController();
  TextEditingController txtdQuotes = TextEditingController();
  TextEditingController txtdauthor = TextEditingController();

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
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Add New Quotes"),
        ),
        body: Form(
          key: QAdd,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: txtCate,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Category Name";
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Category Name",
                      helperStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtQuotes,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Quotes Name";
                    }
                  },
                  maxLines: 5,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "Add Quotes",
                    helperStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtauthor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Author Name";
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Author Name",
                      helperStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    if (QAdd.currentState!.validate()) {
                      DbHandler.dbHandler.insertData(
                          category: txtCate.text,
                          quote: txtQuotes.text,
                          author: txtauthor.text);
                      getData();
                      Get.back();
                    }
                  },
                  child: Text("Insert"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
