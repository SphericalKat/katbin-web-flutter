import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:katbin/src/models/paste.dart';
import 'package:katbin/src/models/paste_response.dart';

class PasteController extends GetxController {
  static PasteController get to => Get.find();
  static Dio _dio = Dio()..options.baseUrl = 'http://localhost:8000/api';
  String content;

  Future<void> savePaste(PasteModel paste) async {
    try {
      Response<PasteResponse> response = await _dio.post('/paste', data: paste.toJson());
      print(response.data.toString());
      update();
      return;
    } catch (e) {
      print(e.toString());
      Get.snackbar('Oops, something went wrong', e.toString());
      return;
    }
  }
}