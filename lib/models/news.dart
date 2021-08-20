// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

part of 'models.dart';
// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);
class News {
  String id;
  String createdAt;
  String contributorName;
  String contributorAvatar;
  String title;
  String content;
  String contentThumbnail;
  List<String> slideshow;

  News(
      {this.id,
      this.createdAt,
      this.contributorName,
      this.contributorAvatar,
      this.title,
      this.content,
      this.contentThumbnail,
      this.slideshow});

factory  News.fromJson(Map<String, dynamic> parsedJson) {

    return News(
      id: parsedJson['id'],
      createdAt: parsedJson['createdAt'],
      contributorName: parsedJson['contributorName'],
      contributorAvatar: parsedJson['contributorAvatar'],
      title: parsedJson['title'],
      content: parsedJson['content'],
      contentThumbnail:  parsedJson['contentThumbnail'],
      slideshow: parsedJson['slideshow'].cast<String>()
    );
 
    // id = parsedJson['id'];
    // createdAt = json['createdAt'];
    // contributorName = json['contributorName'];
    // contributorAvatar = json['contributorAvatar'];
    // title = json['title'];
    // content = json['content'];
    // contentThumbnail = json['contentThumbnail'];
    // slideshow = json['slideshow'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['contributorName'] = this.contributorName;
    data['contributorAvatar'] = this.contributorAvatar;
    data['title'] = this.title;
    data['content'] = this.content;
    data['contentThumbnail'] = this.contentThumbnail;
    data['slideshow'] = this.slideshow;
    return data;
  }

  // @override
  // // TODO: implement props
  // List<Object> get props => [id, createdAt, contributorName, contributorAvatar, contentThumbnail, content, slideshow, title];
}
