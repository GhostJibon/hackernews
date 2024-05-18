class TopNews {
  String? by;
  int? descendants;
  int? id;
  List<dynamic>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  TopNews({
    required this.by,
    required this.descendants,
    required this.id,
    required this.kids,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
  });

  factory TopNews.fromJson(Map<String, dynamic> json) {
    return TopNews(
      by: json['by'],
      descendants: json['descendants'],
      id: json['id'],
      kids: json['kids'],
      score: json['score'],
      time: json['time'],
      title: json['title'],
      type: json['type'],
      url: json['url'],
    );
  }
}
