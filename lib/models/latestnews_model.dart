class LatestNews {
  String? by;
  int? descendants;
  int? id;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  LatestNews({
    required this.by,
    required this.descendants,
    required this.id,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
  });
  factory LatestNews.fromJson(Map<String, dynamic> json) {
    return LatestNews(
      by: json['by'],
      descendants: json['descendants'],
      id: json['id'],
      score: json['score'],
      time: json['time'],
      title: json['title'],
      type: json['type'],
      url: json['url'],
    );
  }
}
