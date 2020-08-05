class SavedPasteResponse {
  String belongsTo;
  String content;
  String id;
  bool isUrl;

  SavedPasteResponse({this.belongsTo, this.content, this.id, this.isUrl});

  SavedPasteResponse.fromJson(Map<String, dynamic> json) {
    belongsTo = json['belongs_to'];
    content = json['content'];
    id = json['id'];
    isUrl = json['is_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['belongs_to'] = this.belongsTo;
    data['content'] = this.content;
    data['id'] = this.id;
    data['is_url'] = this.isUrl;
    return data;
  }
}
