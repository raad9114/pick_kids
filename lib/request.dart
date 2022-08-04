import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'model.dart';

Future<List<RequestedModel>> getNumber({int num = 20}) async {
  http.Response response = await http.get(
      Uri.parse('http://172.20.20.69/pick_kids/home_screen/get_pickup_request.php'));
  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

  return parsed
      .map<RequestedModel>((json) => RequestedModel.fromJson(json))
      .toList();
}

Stream<RequestedModel> getNumbers(Duration refreshTime) async* {
  while (true) {
    await Future.delayed(refreshTime);
    //yield await getNumber();
  }
}