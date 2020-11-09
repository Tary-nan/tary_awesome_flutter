class Message {
  String title;
  String body;

  Message({this.title, this.body});

  factory Message.fromJson(Map<String, dynamic>json){
    return Message(
      title: json['title'],
      body: json['body']
    );
  }

}
