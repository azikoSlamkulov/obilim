// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// import 'package:rent_car/models/driver_model.dart';




// // Get
// Future<DriversList> getDriverModel() async {
//   String url = 'http://37.143.15.243:6139/api2/user/user.drivers_list/';
//   Uri uri = Uri.parse(url);
//   var _data = convert.json.encode({});
//   http.Response response = await http.post(uri, 
//     headers: {"Content-Type": "application/json"},
//     body: _data,
//   );

//   if (response.statusCode == 200 || response.statusCode == 201) {
//     final body = response.body;
//     final _data = convert.jsonDecode(body) as Map<String, dynamic>;
//     final DriversList driverModel = DriversList.fromJson(_data);
//     return driverModel;
//   } else {
//     throw Exception('Error: ${response.reasonPhrase}');
//   }
// }
  
// // Post
// Future<DriversList> postDriverModel(String firstName, String lastName, String phoneNumber) async {
//   String url = 'http://37.143.15.243:6139/api2/user/user.save_driver/';
//   Uri uri = Uri.parse(url);
//   var _data = convert.json.encode({
//     'first_name' : firstName,
//     'last_name' : lastName,
//     'phone_number' : phoneNumber,
//     });
//   http.Response response = await http.post(uri, 
//     headers: {"Content-Type": "application/json"},
//     body: _data,
//   );
// }

// // Delete
// Future<DriversList> deleteDriverModel(int id) async {
//   String url = 'http://37.143.15.243:6139/api2/user/user.delete_driver/';
//   Uri uri = Uri.parse(url);
//   var _data = convert.json.encode({
//     'id': id 
//   });
//   http.Response response = await http.post(uri, 
//     headers: {"Content-Type": "application/json"},
//     body: _data,
//   );
// }

// // Put
// Future<DriversList> putDriverModel(String firstName, String lastName, String phoneNumber, int id) async {
//   String url = 'http://37.143.15.243:6139/api2/user/user.save_driver/';
//   Uri uri = Uri.parse(url);
//   var _data = convert.json.encode({
//     'id' : id,
//     'first_name' : firstName,
//     'last_name' : lastName,
//     'phone_number' : phoneNumber,
//     });
//   http.Response response = await http.post(uri, 
//     headers: {"Content-Type": "application/json"},
//     body: _data,
//   );
// }

 