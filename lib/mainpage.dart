import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class MainPageApi extends StatefulWidget {
  const MainPageApi({super.key});

  @override
  State<MainPageApi> createState() => _MainPageApiState();
}

class _MainPageApiState extends State<MainPageApi> {
  List userList = [];
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllTaskApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
        actions: [
          ElevatedButton(
              onPressed: () {
                print("${Get.isDarkMode}");
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                /* if(Get.isDarkMode){
              AppColor.greencolor = Colors.deepOrange;
              color = Colors.deepOrange;
            };*/
              },
              child: Text("theme"))
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(30),
        scrollDirection: Axis.vertical,
        itemCount: userList.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2,
            //  crossAxisCount: 2,
            mainAxisExtent: 350),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(child: Container(height: 400,width: 400,color: Colors.deepOrange,),);
                  });
            },
            child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                        height: 200,
                        width: 300,
                        child: Image.network(
                          "${userList[index]['image']}",
                          fit: BoxFit.fill,
                        )),
                    // Text("${userList[index]['id']}"),
                    Text("Name:-${userList[index]['title']}"),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Price:-${userList[index]['price']}"),
                    ),
                  ],
                )),
          );
        },
      ),
      /* Container(height: 200,width: 200,color: Colors.green,)*/
    );
  }

  void getAllTaskApi() async {
    http.Response response = await http.get(
      Uri.parse(
        'https://fakestoreapi.com/products',
      ),
    );
    debugPrint('statuscode ${response.statusCode}');
    debugPrint('body ${response.body}');
    debugPrint('body ${response.body.runtimeType}');

    if (response.statusCode == 200) {
      String jsonsDataString = response.body
          .toString(); // toString of Response's body is assigned to jsonDataString
      userList = jsonDecode(jsonsDataString);
      print(userList.toString());
      // userList = jsonDecode(response.body)['body'];
      print("=-=--==11=-=-=-=-${userList}");
      setState(() {});
      Fluttertoast.showToast(msg: "sucssesfull");
      //sucsses
    } else {
      Fluttertoast.showToast(msg: "not sucssesfull");
      debugPrint('message ${json.decode(response.body)['message']} ');
      // show massange
      // error
    }
  }
}
