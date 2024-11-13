class News {
  final String title;
  final String date;
  final String imgUrl;
  final String newsLink;

  News(this.title, this.date, this.imgUrl, this.newsLink);

  factory News.fromJson(Map<String, dynamic> parsedJson) {
    final title = parsedJson['title'] as String;
    final date = parsedJson['pubDate'] as String;
    final imgUrl = parsedJson['image_url'] as String;
    final newsLink = parsedJson['link'] as String;

    return News(title, date, imgUrl, newsLink);
  }
}
