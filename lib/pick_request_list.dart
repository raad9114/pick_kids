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
    final response = await http.get(Uri.parse(
        'http://172.20.20.69/pick_kids/home_screen/get_pickup_request.php'));

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Pickup Request",
            style: TextStyle(fontSize: 30),
          )),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
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
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              //  border: Border.all(color: Colors.grey),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: .2,
                                  blurRadius: 0.5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              //    crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: Text(
                                    "Child Name",
                                    //Text('${snapshot.data![index].xdate.date}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 40,
                                  child: Text(
                                    "Class",
                                    //Text("${snapshot.data![index].xintime.date}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 40,
                                  child: Text(
                                    "Roll",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: Text(
                                    "Father Name",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: Text(
                                    "Picker Name",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: Text(
                                    "Car No",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: Text(
                                    "Child Picture",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: Text(
                                    "Father Picture",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: Text(
                                    "Picker Picture",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: Text(
                                    "Status",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Expanded(
                            child: Scrollbar(
                              child: RefreshIndicator(
                                onRefresh: _handleRefresh,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    var post = snapshot.data[index];
                                    return Container(
                                      //padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              //border: Border.all(color: Colors.grey),

                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xff064A76)
                                                      .withOpacity(0.5),
                                                  spreadRadius: .5,
                                                  blurRadius: 0.5,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  child: Center(
                                                    child: Text(
                                                      post['child_name'],
                                                      //Text('${snapshot.data![index].xdate.date}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 100,
                                                  width: 40,
                                                  child: Center(
                                                    child: Text(
                                                      post['child_class'],
                                                      //Text("${snapshot.data![index].xintime.date}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 100,
                                                  width: 40,
                                                  child: Center(
                                                    child: Text(
                                                      post['child_roll'],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  child: Center(
                                                    child: Text(
                                                      post['father_name'],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  child: Center(
                                                    child: Text(
                                                      post['picker_name'],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  child: Center(
                                                    child: Text(
                                                      post['car_num_plate'],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  height: 100,
                                                  width: 100,
                                                  child: Image(
                                                      image: NetworkImage(
                                                          'http://172.20.20.69/pick_kids/create_account/images/${post['child_image']}')),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  height: 100,
                                                  width: 100,
                                                  child: Image(
                                                      image: NetworkImage(
                                                          'http://172.20.20.69/pick_kids/create_account/images/${post['father_image']}')),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  height: 100,
                                                  width: 100,
                                                  child: Image(
                                                      image: NetworkImage(
                                                          'http://172.20.20.69/pick_kids/create_account/images/${post['picker_image']}')),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  child: Center(
                                                    child: Text(
                                                      "Waiting for Pickup",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    if (snapshot.connectionState != ConnectionState.done) {
                      return Center(
                        child: CircularProgressIndicator(),
                        //child: Text("Loading........"),
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
