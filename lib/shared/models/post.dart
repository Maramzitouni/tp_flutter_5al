class Post {
  final String id;
  final String title;
  final String description;

  const Post({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Post copyWith({String? title, String? description}) {
    return Post(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
