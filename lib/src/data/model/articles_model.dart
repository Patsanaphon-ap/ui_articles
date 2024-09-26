class ArticlesModel {
  String title;
  String snippet;
  String publisher;
  String timestamp;
  String newsUrl;
  ImagesThumbnail? images;
  bool? hasSubnews;
  List<ArticlesModel>? subnews;

  ArticlesModel({
    this.title = '',
    this.snippet = '',
    this.publisher = '',
    this.timestamp = '',
    this.newsUrl = '',
    this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory ArticlesModel.fromJson(Map<dynamic, dynamic> json) {
    return ArticlesModel(
      title: json['title'],
      snippet: json['snippet'],
      publisher: json['publisher'],
      timestamp: json['timestamp'],
      newsUrl: json['newsUrl'],
      images: (json['images'] != null)
          ? ImagesThumbnail.fromJson(json['images'])
          : null,
      hasSubnews: json['hasSubnews'],
      subnews: List<ArticlesModel>.from(
          (json['subnews'] ?? []).map((e) => ArticlesModel.fromJson(e))),
    );
  }

  // toJson
  Map<String, dynamic> toJson() => {
        "title": title,
        "snippet": snippet,
        "publisher": publisher,
        "timestamp": timestamp,
        "newsUrl": newsUrl,
        "images": images,
        "hasSubnews": hasSubnews,
        "subnews": subnews
      };
}

class ImagesThumbnail {
  String thumbnail;
  String thumbnailProxied;

  ImagesThumbnail({
    this.thumbnail = '',
    this.thumbnailProxied = '',
  });

  factory ImagesThumbnail.fromJson(Map<String, dynamic> json) {
    return ImagesThumbnail(
      thumbnail: json['thumbnail'],
      thumbnailProxied: json['thumbnailProxied'],
    );
  }
  // toJson
  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "thumbnailProxied": thumbnailProxied,
      };
}
