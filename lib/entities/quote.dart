class Quote {
  double c;
  double h;
  double l;
  double o;
  double pc;
  int t;

  Quote({this.c, this.h, this.l, this.o, this.pc, this.t});

  Quote.fromJson(Map<String, dynamic> json) {
    c = json['c'];
    h = json['h'];
    l = json['l'];
    o = json['o'];
    pc = json['pc'];
    t = json['t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c'] = this.c;
    data['h'] = this.h;
    data['l'] = this.l;
    data['o'] = this.o;
    data['pc'] = this.pc;
    data['t'] = this.t;
    return data;
  }
}