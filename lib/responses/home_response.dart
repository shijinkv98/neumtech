class HomeResponse {
  String message;
  bool error;
  Data data;

  HomeResponse({this.message, this.error, this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int bookmarkCount;
  List<Banners> banner;
  List<Articles> articles;
  List<HealthVideos> healthVideos;
  List<Category> category;
  LiveUpdates liveUpdates;

  Data(
      {this.bookmarkCount,
        this.banner,
        this.articles,
        this.healthVideos,
        this.category,
        this.liveUpdates});

  Data.fromJson(Map<String, dynamic> json) {
    bookmarkCount = json['bookmark_count'];
    if (json['banner'] != null) {
      banner = new List<Banners>();
      json['banner'].forEach((v) {
        banner.add(new Banners.fromJson(v));
      });
    }
    if (json['articles'] != null) {
      articles = new List<Articles>();
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
    if (json['health_videos'] != null) {
      healthVideos = new List<HealthVideos>();
      json['health_videos'].forEach((v) {
        healthVideos.add(new HealthVideos.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
    liveUpdates = json['live_updates'] != null
        ? new LiveUpdates.fromJson(json['live_updates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookmark_count'] = this.bookmarkCount;
    if (this.banner != null) {
      data['banner'] = this.banner.map((v) => v.toJson()).toList();
    }
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    if (this.healthVideos != null) {
      data['health_videos'] = this.healthVideos.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    if (this.liveUpdates != null) {
      data['live_updates'] = this.liveUpdates.toJson();
    }
    return data;
  }
}

class Banners {
  String sId;
  String redirectType;
  String image;

  Banners({this.sId, this.redirectType, this.image});

  Banners.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    redirectType = json['redirect_type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['redirect_type'] = this.redirectType;
    data['image'] = this.image;
    return data;
  }
}

class Articles {
  String sId;
  String name;
  String maincategoryId;
  String maincategoryName;
  List<ArticleList> articleList;

  Articles(
      {this.sId,
        this.name,
        this.maincategoryId,
        this.maincategoryName,
        this.articleList});

  Articles.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    maincategoryId = json['maincategory_id'];
    maincategoryName = json['maincategory_name'];
    if (json['article_list'] != null) {
      articleList = new List<ArticleList>();
      json['article_list'].forEach((v) {
        articleList.add(new ArticleList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['maincategory_id'] = this.maincategoryId;
    data['maincategory_name'] = this.maincategoryName;
    if (this.articleList != null) {
      data['article_list'] = this.articleList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArticleList {
  String sId;
  String readTime;
  String image;
  String createdAt;
  int likeCount;
  int isSaved;
  int isLiked;
  String title;
  String type;

  ArticleList(
      {this.sId,
        this.readTime,
        this.image,
        this.createdAt,
        this.likeCount,
        this.isSaved,
        this.isLiked,
        this.title,
        this.type});

  ArticleList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    readTime = json['readTime'];
    image = json['image'];
    createdAt = json['createdAt'];
    likeCount = json['like_count'];
    isSaved = json['is_saved'];
    isLiked = json['is_liked'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['readTime'] = this.readTime;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['like_count'] = this.likeCount;
    data['is_saved'] = this.isSaved;
    data['is_liked'] = this.isLiked;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}

class HealthVideos {
  String sId;
  String name;
  String maincategoryId;
  String maincategoryName;
  List<VideosList> videosList;

  HealthVideos(
      {this.sId,
        this.name,
        this.maincategoryId,
        this.maincategoryName,
        this.videosList});

  HealthVideos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    maincategoryId = json['maincategory_id'];
    maincategoryName = json['maincategory_name'];
    if (json['videos_list'] != null) {
      videosList = new List<VideosList>();
      json['videos_list'].forEach((v) {
        videosList.add(new VideosList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['maincategory_id'] = this.maincategoryId;
    data['maincategory_name'] = this.maincategoryName;
    if (this.videosList != null) {
      data['videos_list'] = this.videosList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideosList {
  String sId;
  String video;
  String thumbnail;
  String duration;
  String createdAt;
  int likeCount;
  int isSaved;
  int isLiked;
  String type;
  String title;

  VideosList(
      {this.sId,
        this.video,
        this.thumbnail,
        this.duration,
        this.createdAt,
        this.likeCount,
        this.isSaved,
        this.isLiked,
        this.type,
        this.title});

  VideosList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    video = json['video'];
    thumbnail = json['thumbnail'];
    duration = json['duration'];
    createdAt = json['createdAt'];
    likeCount = json['like_count'];
    isSaved = json['is_saved'];
    isLiked = json['is_liked'];
    type = json['type'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['video'] = this.video;
    data['thumbnail'] = this.thumbnail;
    data['duration'] = this.duration;
    data['createdAt'] = this.createdAt;
    data['like_count'] = this.likeCount;
    data['is_saved'] = this.isSaved;
    data['is_liked'] = this.isLiked;
    data['type'] = this.type;
    data['title'] = this.title;
    return data;
  }
}

class Category {
  String image;
  String name;

  Category({this.image, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class LiveUpdates {
  String sId;
  String name;

  LiveUpdates({this.sId, this.name});

  LiveUpdates.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
