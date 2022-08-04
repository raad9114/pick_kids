import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class Pick_request_List extends StatefulWidget {



  @override
  State<Pick_request_List> createState() => _Pick_request_ListState();
}

class _Pick_request_ListState extends State<Pick_request_List> {



  late StreamController _postsController;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  int count = 1;

  Future fetchPost([howMany = 5]) async {
    final response = await http.get(
        Uri.parse('http://172.20.20.69/pick_kids/home_screen/get_pickup_request.php')
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  loadPosts() async {
    fetchPost().then((res) async {
      _postsController.add(res);
      return res;
    });
  }

  showSnack() {
    return scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text('New content loaded'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    count++;
    print(count);
    fetchPost(count * 5).then((res) async {
      _postsController.add(res);
      showSnack();
      return null;
    });
  }

  @override
  void initState() {
    _postsController = new StreamController();
    Timer.periodic(Duration(seconds: 5), (_) => loadPosts());
    //loadPosts();
    super.initState();
  }


  //
  // String msg = '';
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _postsController = new StreamController();
  //   loadPosts();
  // }
  //
  // @override
  // void dispose()async{
  //   super.dispose();
  //   //await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }
  //
  // late StreamController _postsController;
  // final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  //
  // int count = 1;
  //
  // Future fetchPost([howMany = 5]) async {
  //   final response = await http.get(
  //       Uri.parse('http://172.20.20.69/pick_kids/home_screen/get_pickup_request.php')
  //   );
  //
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }
  //
  // loadPosts() async {
  //   fetchPost().then((res) async {
  //     _postsController.add(res);
  //     return res;
  //   });
  // }
  //
  // showSnack() {
  //   return scaffoldKey.currentState!.showSnackBar(
  //     SnackBar(
  //       content: Text('New content loaded'),
  //     ),
  //   );
  // }
  //
  // Future<Null> _handleRefresh() async {
  //   count++;
  //   print(count);
  //   fetchPost(count * 5).then((res) async {
  //     _postsController.add(res);
  //     showSnack();
  //     return null;
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pick Up Request"),
          automaticallyImplyLeading: false,


        ),
        body:  Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black12,
                child: StreamBuilder(
                  stream: _postsController.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    print('Has error: ${snapshot.hasError}');
                    print('Has data: ${snapshot.hasData}');
                    print('Snapshot Data ${snapshot.data}');

                    if (snapshot.hasError) {
                      return Text((snapshot.error).toString());
                    }

                    if (!snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      return Text('No Posts');
                    }

                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          Expanded(
                            child: Scrollbar(
                              child: RefreshIndicator(
                                onRefresh: _handleRefresh,
                                child:  ListView.builder(
                                  shrinkWrap: true,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    var post = snapshot.data[index];
                                    return Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              //border: Border.all(color: Colors.grey),

                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff064A76).withOpacity(0.5),
                                                  spreadRadius: .5,
                                                  blurRadius: 0.5,
                                                  offset:
                                                  Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              //    crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children:  [
                                                Expanded(
                                                  child: Text(
                                                    "Child Name",
                                                    //Text('${snapshot.data![index].xdate.date}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  //child: Text("${snapshot.data![index].xintime}",
                                                  child: Text(
                                                    "Class",
                                                    //Text("${snapshot.data![index].xintime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Roll",
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Father Name",
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Picker Name",
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Car No",
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Child Picture",
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Father Picture",
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Picker Picture",
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                // Expanded(
                                                //   child: Text(
                                                //     "Car Picture",
                                                //     //Text("${snapshot.data![index].xouttime.date}",
                                                //     textAlign: TextAlign.center,
                                                //     style: TextStyle(
                                                //         fontSize: 18,
                                                //         fontWeight: FontWeight.bold,
                                                //         color: Colors.black),
                                                //   ),
                                                // ),
                                                Expanded(
                                                  child: Text(
                                                    "Status",
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              //border: Border.all(color: Colors.grey),

                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff064A76).withOpacity(0.5),
                                                  spreadRadius: .5,
                                                  blurRadius: 0.5,
                                                  offset:
                                                  Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    post['child_name'],
                                                    //Text('${snapshot.data![index].xdate.date}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  //child: Text("${snapshot.data![index].xintime}",
                                                  child: Text(
                                                    post['child_class'],
                                                    //Text("${snapshot.data![index].xintime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    post['child_roll'],
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    post['father_name'],
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 14, color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    post['picker_name'],
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 14, color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    post['car_num_plate'],
                                                    //Text("${snapshot.data![index].xouttime.date}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 14, color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  //   Text(
                                                  //     "Child Picture",
                                                  //     //Text("${snapshot.data![index].xouttime.date}",
                                                  //     textAlign: TextAlign.center,
                                                  //     style: TextStyle(
                                                  //         fontSize: 14,
                                                  //         color: Colors.black
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20.0),
                                                    child: Container(
                                                      height: 200,
                                                      child: Image(
                                                          image: NetworkImage(
                                                              'http://172.20.20.69/pick_kids/create_account/images/${post['child_image']}')
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20.0),
                                                  child: Container(
                                                    height: 200,
                                                    child: Image(
                                                        image: NetworkImage(
                                                            'http://172.20.20.69/pick_kids/create_account/images/${post['father_image']}')),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20.0),
                                                  child: Container(
                                                    height: 200,
                                                    child: Image(
                                                        image: NetworkImage(
                                                            'http://172.20.20.69/pick_kids/create_account/images/${post['picker_image']}')),
                                                  ),
                                                ),

                                                // Expanded(
                                                //   child: Image(
                                                //       image: NetworkImage(
                                                //           'http://172.20.20.69/pick_kids/create_account/images/${post['car_image']}')),
                                                // ),

                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 20.0, right: 20),
                                                      child: Text(
                                                        "Waiting for pickup",
                                                        //Text("${snapshot.data![index].xouttime.date}",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 14, color: Colors.black),
                                                      ),
                                                    ),

                                                    // RaisedButton(
                                                    //   onPressed: () {
                                                    //     print("Picked");
                                                    //   },
                                                    //   shape: RoundedRectangleBorder(
                                                    //       borderRadius: BorderRadius.circular(80.0)),
                                                    //   textColor: Colors.white,
                                                    //   padding: const EdgeInsets.all(0),
                                                    //   child:
                                                    //   Container(
                                                    //     alignment: Alignment.center,
                                                    //     height: 30.0,
                                                    //     width: 80,
                                                    //     decoration: BoxDecoration(
                                                    //         borderRadius: BorderRadius.circular(80.0),
                                                    //         gradient: LinearGradient(colors: [
                                                    //           Color(0xff499C54),
                                                    //           Color(0xff499C54),
                                                    //           //  Colors.white
                                                    //         ])),
                                                    //     padding: EdgeInsets.all(0),
                                                    //     child: Expanded(
                                                    //       child: Text(
                                                    //         "Picked",
                                                    //         textAlign: TextAlign.center,
                                                    //         style: TextStyle(
                                                    //           fontSize: 14,
                                                    //           color: Colors.white,
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // ),

                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),

                                          // Container(
                                          //   decoration: BoxDecoration(
                                          //     color: Colors.white,
                                          //     //border: Border.all(color: Colors.grey),
                                          //
                                          //     boxShadow: [
                                          //       BoxShadow(
                                          //         color: Color(0xff064A76)
                                          //             .withOpacity(0.5),
                                          //         spreadRadius: .5,
                                          //         blurRadius: 0.5,
                                          //         offset: Offset(0,
                                          //             3), // changes position of shadow
                                          //       ),
                                          //     ],
                                          //   ),
                                          //   child: Row(
                                          //     mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          //     children: const [
                                          //       Expanded(
                                          //         child: Text(
                                          //           "Child Name",
                                          //           //Text('${snapshot.data![index].xdate.date}',
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //             fontSize: 15,
                                          //             color: Colors.black,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //       Expanded(
                                          //         //child: Text("${snapshot.data![index].xintime}",
                                          //         child: Text(
                                          //           "Class",
                                          //           //Text("${snapshot.data![index].xintime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //             fontSize: 15,
                                          //             color: Colors.black,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //       Expanded(
                                          //         child: Text(
                                          //           "Roll",
                                          //           //Text("${snapshot.data![index].xouttime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //             fontSize: 14,
                                          //             color: Colors.black,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //
                                          //       Expanded(
                                          //         child: Text(
                                          //           "Father Name",
                                          //           //Text("${snapshot.data![index].xouttime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color: Colors.black
                                          //           ),
                                          //         ),
                                          //       ),
                                          //
                                          //       Expanded(
                                          //         child: Text(
                                          //           "Picker Name",
                                          //           //Text("${snapshot.data![index].xouttime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color: Colors.black
                                          //           ),
                                          //         ),
                                          //       ),
                                          //
                                          //       Expanded(
                                          //         child: Text(
                                          //           "Car No",
                                          //           //Text("${snapshot.data![index].xouttime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color: Colors.black
                                          //           ),
                                          //         ),
                                          //       ),
                                          //
                                          //       Expanded(
                                          //         child: Text(
                                          //           "Child Picture",
                                          //           //Text("${snapshot.data![index].xouttime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color: Colors.black
                                          //           ),
                                          //         ),
                                          //       ),
                                          //
                                          //       Expanded(
                                          //         child: Text(
                                          //           "Father Picture",
                                          //           //Text("${snapshot.data![index].xouttime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color: Colors.black
                                          //           ),
                                          //         ),
                                          //       ),
                                          //       Expanded(
                                          //         child: Text(
                                          //           "Picker Picture",
                                          //           //Text("${snapshot.data![index].xouttime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color: Colors.black
                                          //           ),
                                          //         ),
                                          //       ),
                                          //       Expanded(
                                          //         child: Text(
                                          //           "Car Picture",
                                          //           //Text("${snapshot.data![index].xouttime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color: Colors.black
                                          //           ),
                                          //         ),
                                          //       ), Expanded(
                                          //         child: Text(
                                          //           "Status",
                                          //           //Text("${snapshot.data![index].xouttime.date}",
                                          //           textAlign: TextAlign.center,
                                          //           style: TextStyle(
                                          //               fontSize: 14,
                                          //               color: Colors.black
                                          //           ),
                                          //         ),
                                          //       ),
                                          //
                                          //     ],
                                          //   ),
                                          // ),
                                          // SizedBox(
                                          //   height: 10,
                                          // ),
                                        ],
                                      ),
                                    );
                                  } ,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    if (snapshot.connectionState != ConnectionState.done) {
                      return Center(
                        //child: CircularProgressIndicator(),
                        child: Text("No Request"),
                      );
                    }


                    return Text("Monyeem");
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
