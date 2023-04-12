class Stories {
  Stories ({
    required this.asset,
    required this.description,
    required this.views,
    required this.likes,
    required this.comments,
    required this.share
  });

  String asset;
  String description;
  int views;
  int likes;
  int comments;
  int share;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
    asset: json["video"],
    description: json["description"],
    views: json["views"],
    likes: json["likes"],
    comments: json["comments"],
    share: json["share"]
  );

  Map<String, dynamic> toJson() => {
    "video": asset,
    "description": description,
    "views": views,
    "likes": likes,
    "comments": comments,
    "share": share
  };
}