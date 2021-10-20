class HealthResponse {
  bool error;
  String message;
  List<HealthData> data;

  HealthResponse({this.error, this.message, this.data});

  HealthResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<HealthData>();
      json['data'].forEach((v) {
        data.add(new HealthData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HealthData {
  String itemName;
  List<Tips> tips;

  HealthData({this.itemName, this.tips});

  HealthData.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    if (json['tips'] != null) {
      tips = new List<Tips>();
      json['tips'].forEach((v) {
        tips.add(new Tips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    if (this.tips != null) {
      data['tips'] = this.tips.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tips {
  String sId;
  String description;
  String image;
  String title;
  String postedOn;
  String readTime;
  String likeCount;
  int isLiked;
  String type;
  String id;
  String name;
  List<HealthTips> healthTips;

  Tips(
      {this.sId,
        this.description,
        this.image,
        this.title,
        this.postedOn,
        this.readTime,
        this.likeCount,
        this.isLiked,
        this.type,
        this.id,
        this.name,
        this.healthTips});

  Tips.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    image = json['image'];
    title = json['title'];
    postedOn = json['posted_on'];
    readTime = json['read_time'];
    likeCount = json['like_count'].toString();
    isLiked = json['is_liked'];
    type = json['type'];
    id = json['id'];
    name = json['name'];
    if (json['health_tips'] != null) {
      healthTips = new List<HealthTips>();
      json['health_tips'].forEach((v) {
        healthTips.add(new HealthTips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['title'] = this.title;
    data['posted_on'] = this.postedOn;
    data['read_time'] = this.readTime;
    data['like_count'] = this.likeCount;
    data['is_liked'] = this.isLiked;
    data['type'] = this.type;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.healthTips != null) {
      data['health_tips'] = this.healthTips.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HealthTips {
  String sId;
  String description;
  String image;
  String title;
  String postedOn;
  String readTime;
  int likeCount;
  int isLiked;
  String type;

  HealthTips(
      {this.sId,
        this.description,
        this.image,
        this.title,
        this.postedOn,
        this.readTime,
        this.likeCount,
        this.isLiked,
        this.type});

  HealthTips.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    image = json['image'];
    title = json['title'];
    postedOn = json['posted_on'];
    readTime = json['read_time'];
    likeCount = json['like_count'];
    isLiked = json['is_liked'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['title'] = this.title;
    data['posted_on'] = this.postedOn;
    data['read_time'] = this.readTime;
    data['like_count'] = this.likeCount;
    data['is_liked'] = this.isLiked;
    data['type'] = this.type;
    return data;
  }
}
