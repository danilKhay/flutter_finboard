class CompanyNews {
  String category;
  int datetime;
  String headline;
  int id;
  String image;
  String related;
  String source;
  String summary;
  String url;

  CompanyNews(
      {this.category,
        this.datetime,
        this.headline,
        this.id,
        this.image,
        this.related,
        this.source,
        this.summary,
        this.url});

  CompanyNews.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    datetime = json['datetime'];
    headline = json['headline'];
    id = json['id'];
    image = json['image'];
    related = json['related'];
    source = json['source'];
    summary = json['summary'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['datetime'] = this.datetime;
    data['headline'] = this.headline;
    data['id'] = this.id;
    data['image'] = this.image;
    data['related'] = this.related;
    data['source'] = this.source;
    data['summary'] = this.summary;
    data['url'] = this.url;
    return data;
  }
}