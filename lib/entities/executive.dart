class Executives {
  List<Executive> executive;

  Executives({this.executive});

  Executives.fromJson(Map<String, dynamic> json) {
    if (json['executive'] != null) {
      executive = new List<Executive>();
      json['executive'].forEach((v) {
        executive.add(new Executive.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.executive != null) {
      data['executive'] = this.executive.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Executive {
  int age;
  int compensation;
  String currency;
  String name;
  String position;
  String sex;
  String since;

  Executive(
      {this.age,
        this.compensation,
        this.currency,
        this.name,
        this.position,
        this.sex,
        this.since});

  Executive.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    compensation = json['compensation'];
    currency = json['currency'];
    name = json['name'];
    position = json['position'];
    sex = json['sex'];
    since = json['since'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['compensation'] = this.compensation;
    data['currency'] = this.currency;
    data['name'] = this.name;
    data['position'] = this.position;
    data['sex'] = this.sex;
    data['since'] = this.since;
    return data;
  }
}