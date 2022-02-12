class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl
  );

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      json['albumId'],
      json['id'],
      json['title'],
      json['url'],
      json['thumbnailUrl']
    );
  }  
}