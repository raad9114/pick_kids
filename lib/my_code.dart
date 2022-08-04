import 'dart:async';
import 'package:auto_reload/auto_reload.dart';
import 'package:flutter/material.dart';

class Stream_Builder_own extends StatefulWidget {
  const Stream_Builder_own({Key? key}) : super(key: key);

  @override
  State<Stream_Builder_own> createState() => _Stream_Builder_ownState();
}

class _Stream_Builder_ownState extends State<Stream_Builder_own> {
  int counter = 0;

  StreamController<int> countcontroller = StreamController<int>();
  int _countOfReload = 0;

  @override
  void initState() {
    super.initState();
    //  startAutoReload();
  }

  @override
  void autoReload() {
    setState(() {
      _countOfReload = _countOfReload + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        const Text(
          'auto reload example:',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('count of reload $_countOfReload'),
        const Spacer(),
      ],
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: StreamBuilder(
//             stream: countcontroller.stream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data.toString(),
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 40,
//                   ),);
//               } else {
//                 return Text(
//                   '0',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 40,
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//
//         onPressed: () {
//           counter++;
//           print(counter);
//           countcontroller.sink.add(counter);
//         },
//         child: Icon(
//             Icons.refresh,size: 40,
//
//         ),
//       ),
//     );
//   }
// }
