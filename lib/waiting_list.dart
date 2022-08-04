import 'package:flutter/material.dart';

class Waiting_List extends StatefulWidget {
  const Waiting_List({Key? key}) : super(key: key);

  @override
  State<Waiting_List> createState() => _Waiting_ListState();
}

class _Waiting_ListState extends State<Waiting_List> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: const Text(
                "Waiting List",
                //Text("${snapshot.data![index].xouttime.date}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (_, index) => Container(
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
                              Expanded(
                                child: Text(
                                  "Car Picture",
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
                                  "Raad Khan",
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
                                  "Masters",
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
                                  "2243",
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
                                  "Khan Zahid Hossain",
                                  //Text("${snapshot.data![index].xouttime.date}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Captain",
                                  //Text("${snapshot.data![index].xouttime.date}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "11-2826",
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
                                    Image(
                                        image: NetworkImage(
                                            'https://www.pngitem.com/pimgs/m/157-1575361_cartoon-school-kid-png-cartoon-school-student-png.png')),
                              ),
                              Expanded(
                                child: Image(
                                    image: NetworkImage(
                                        'https://previews.123rf.com/images/jemastock/jemastock1806/jemastock180602274/102900663-cute-father-cartoon-vector-illustration-graphic-design.jpg')),
                              ),
                              Expanded(
                                child: Image(
                                    image: NetworkImage(
                                        'https://static.vecteezy.com/system/resources/thumbnails/005/605/324/small_2x/male-character-sitting-in-a-new-car-the-man-took-the-driving-test-and-got-his-driver-s-license-driving-school-concept-and-learning-to-drive-trendy-flat-illustration-free-vector.jpg')),
                              ),
                              Expanded(
                                child: Image(
                                    image: NetworkImage(
                                        'https://static.vecteezy.com/system/resources/thumbnails/005/484/216/small/super-car-graphic-resource-free-vector.jpg')),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Waiting for pickup",
                                    //Text("${snapshot.data![index].xouttime.date}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      print("Picked");
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(80.0)),
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(0),
                                    child:
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30.0,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(80.0),
                                          gradient: LinearGradient(colors: [
                                            Color(0xff499C54),
                                            Color(0xff499C54),
                                          //  Colors.white
                                          ])),
                                      padding: EdgeInsets.all(0),
                                      child: Expanded(
                                        child: Text(
                                          "Picked",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
