// // To parse this JSON data, do
// //
// //     final streamcheck = streamcheckFromJson(jsonString);
//
// import 'dart:convert';
//
// Streamcheck streamcheckFromJson(String str) => Streamcheck.fromJson(json.decode(str));
//
// String streamcheckToJson(Streamcheck data) => json.encode(data.toJson());
//
// class Streamcheck {
//   Streamcheck({
//     required required this.id,
//     required required this.cid,
//     required required this.bid,
//     required required this.amount,
//     required required this.point,
//     required required this.discount,
//   });
//
//   String id;
//   String cid;
//   String bid;
//   String amount;
//   String point;
//   String discount;
//
//   factory Streamcheck.fromJson(Map<String, dynamic> json) => Streamcheck(
//     id: json["id"],
//     cid: json["cid"],
//     bid: json["bid"],
//     amount: json["amount"],
//     point: json["point"],
//     discount: json["discount"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "cid": cid,
//     "bid": bid,
//     "amount": amount,
//     "point": point,
//     "discount": discount,
//   };
// }


// To parse this JSON data, do
//
//     final requestedModel = requestedModelFromJson(jsonString);

import 'dart:convert';

List<RequestedModel> requestedModelFromJson(String str) => List<RequestedModel>.from(json.decode(str).map((x) => RequestedModel.fromJson(x)));

String requestedModelToJson(List<RequestedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestedModel {
  RequestedModel({
    required this.pickupId,
    required this.childName,
    required this.childClass,
    required this.childRoll,
    required this.fatherName,
    required this.pickerName,
    required this.carNumPlate,
    required this.childImage,
    required this.fatherImage,
    required this.pickerImage,
    required this.carImage,
    required this.xstatus,
    required this.createdAt,
  });

  String pickupId;
  String childName;
  String childClass;
  String childRoll;
  String fatherName;
  String pickerName;
  String carNumPlate;
  String childImage;
  String fatherImage;
  String pickerImage;
  String carImage;
  String xstatus;
  DateTime createdAt;

  factory RequestedModel.fromJson(Map<String, dynamic> json) => RequestedModel(
    pickupId: json["pickup_id"],
    childName: json["child_name"],
    childClass: json["child_class"],
    childRoll: json["child_roll"],
    fatherName: json["father_name"],
    pickerName: json["picker_name"],
    carNumPlate: json["car_num_plate"],
    childImage: json["child_image"],
    fatherImage: json["father_image"],
    pickerImage: json["picker_image"],
    carImage: json["car_image"],
    xstatus: json["xstatus"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "pickup_id": pickupId,
    "child_name": childName,
    "child_class": childClass,
    "child_roll": childRoll,
    "father_name": fatherName,
    "picker_name": pickerName,
    "car_num_plate": carNumPlate,
    "child_image": childImage,
    "father_image": fatherImage,
    "picker_image": pickerImage,
    "car_image": carImage,
    "xstatus": xstatus,
    "created_at": createdAt.toIso8601String(),
  };
}
