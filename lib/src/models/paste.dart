import 'package:flutter/cupertino.dart';

class PasteModel {
  bool isUrl;
  String content;

  PasteModel({@required this.isUrl, @required this.content});

  PasteModel.fromJson(Map<String, dynamic> json) {
    isUrl = json['is_url'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_url'] = this.isUrl;
    data['content'] = this.content;
    return data;
  }
}