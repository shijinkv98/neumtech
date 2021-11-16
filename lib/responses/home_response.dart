class HomeResponse {
  String success;
  List<Data> data;

  HomeResponse({this.success, this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'].toString();
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String animeId;
  String animeName;
  String animeImg;

  Data({this.animeId, this.animeName, this.animeImg});

  Data.fromJson(Map<String, dynamic> json) {
    animeId = json['anime_id'].toString();
    animeName = json['anime_name'];
    animeImg = json['anime_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anime_id'] = this.animeId;
    data['anime_name'] = this.animeName;
    data['anime_img'] = this.animeImg;
    return data;
  }
}
