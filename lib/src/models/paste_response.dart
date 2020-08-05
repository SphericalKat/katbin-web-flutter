class PasteResponse {
  String msg;
  String pasteId;

  PasteResponse({this.msg, this.pasteId});

  PasteResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    pasteId = json['paste_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['paste_id'] = this.pasteId;
    return data;
  }
}
