class BaseDataEntity {
  bool error;
  List<BaseDataResult> results;

  BaseDataEntity({this.error, this.results});

  BaseDataEntity.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['results'] != null) {
      results = new List<BaseDataResult>();
      (json['results'] as List).forEach((v) {
        results.add(new BaseDataResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BaseDataResult {
  String createdAt;
  List<String> images;
  String publishedAt;
  String sId;
  String source;
  bool used;
  String type;
  String url;
  String desc;
  String who;

  BaseDataResult(
      {this.createdAt,
      this.images,
      this.publishedAt,
      this.sId,
      this.source,
      this.used,
      this.type,
      this.url,
      this.desc,
      this.who});

  BaseDataResult.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    images = json['images']?.cast<String>();
    publishedAt = json['publishedAt'];
    sId = json['_id'];
    source = json['source'];
    used = json['used'];
    type = json['type'];
    url = json['url'];
    desc = json['desc'];
    who = json['who'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['images'] = this.images;
    data['publishedAt'] = this.publishedAt;
    data['_id'] = this.sId;
    data['source'] = this.source;
    data['used'] = this.used;
    data['type'] = this.type;
    data['url'] = this.url;
    data['desc'] = this.desc;
    data['who'] = this.who;
    return data;
  }
}
