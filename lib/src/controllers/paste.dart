import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:katbin/src/models/paste.dart';
import 'package:katbin/src/models/paste_response.dart';
import 'package:katbin/src/models/saved_paste_response.dart';

class PasteController extends GetxController {
  static PasteController get to => Get.find();
  static Dio _dio = Dio()
    ..options.baseUrl = 'http://localhost:8000/api';
  String content;

  Future<String> savePaste(PasteModel paste) async {
    try {
      Response response =
          await _dio.post('/paste', data: paste.toJson());
      var data = PasteResponse.fromJson(response.data);
      return data.pasteId;
    } catch (e) {
      print(e.toString());
      Get.snackbar('Oops, something went wrong', e.toString());
      return null;
    }
  }

  Future<SavedPasteResponse> getSavedPaste(String pasteID) async {
    try {
      Response response = await _dio.get('/paste/$pasteID');
      return SavedPasteResponse.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      Get.snackbar('Oops, something went wront', e.toString());
      return null;
    }
  }
}
