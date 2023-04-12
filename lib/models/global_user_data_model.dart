import 'package:chalenger/models/publications_model.dart';
import 'package:chalenger/models/stories_model.dart';


class GlobalUserData {
  GlobalUserData ({
    required this.profile,
    required this.publications,
    required this.stories,
    required this.stats
  });

  String profile;
  List <Publications> publications;
  List <Stories> stories;
  int stats;

  factory GlobalUserData.fromJson(Map<String, dynamic> json) => GlobalUserData(
    profile: json["profile"],
    publications: List<Publications>.from(json["publications"].map((x) => Publications.fromJson(x))),
    stories: List<Stories>.from(json["stories"].map((y) => Stories.fromJson(y))),
    stats: json["stats"],
  );

  Map<String, dynamic> toJson() => {
    "profile": profile,
    "publications": List<dynamic>.from(publications.map((x) => x.toJson())),
    "stories": List<dynamic>.from(stories.map((y) => y.toJson())),
    "stats": stats,
  };
}