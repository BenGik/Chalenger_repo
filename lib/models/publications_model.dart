class Publications {
  Publications ({
    required this.video,
    required this.description,
    required this.views,
    required this.likes,
    required this.comments,
    required this.share
  });

  String video;
  String description;
  int views;
  int likes;
  int comments;
  int share;

  factory Publications.fromJson(Map<String, dynamic> json) => Publications(
    video: json["video"],
    description: json["description"],
    views: json["views"],
    likes: json["likes"],
    comments: json["comments"],
    share: json["share"]
  );

  Map<String, dynamic> toJson() => {
    "video": video,
    "description": description,
    "views": views,
    "likes": likes,
    "comments": comments,
    "share": share
  };
}