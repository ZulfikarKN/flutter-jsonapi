class Album {
  final int userId;
  final int id;
  final String title;

  Album(
    this.userId,
    this.id,
    this.title
  );

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      json['userId'],
      json['id'],
      json['title']
    );
  }
}