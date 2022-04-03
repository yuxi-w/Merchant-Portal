class MessageList {
  int? id;
  String? name;
  String? content;
  String? date;

  MessageList(this.id, this.name, this.content, this.date);

  factory MessageList.fromJson(Map<String, dynamic> json) {
    return MessageList(
      json['id'],
      json['name'],
      json['content'],
      json['date'],
    );
  }

  static List<MessageList> fromListJson(List<dynamic> json) {
    List<MessageList> result = <MessageList>[];
    for (Map<String, dynamic> d in json) {
      result.add(MessageList.fromJson(d));
    }
    return result;
  }
}
