class AppTheme {
  List<ProTheme> themes;
  List<ProTheme> screenList;
  ProTheme dashboard;
  ProTheme fullapp;
  ProTheme widgets;
  ProTheme defaultTheme;

  AppTheme({this.themes, this.screenList, this.dashboard, this.fullapp, this.widgets, this.defaultTheme});

  factory AppTheme.fromJson(Map<String, dynamic> json) {
    return AppTheme(
      themes: json['themes'] != null ? (json['themes'] as List).map((i) => ProTheme.fromJson(i)).toList() : null,
      screenList: json['screen_list'] != null ? (json['screen_list'] as List).map((i) => ProTheme.fromJson(i)).toList() : null,
      dashboard: json['dashboard'] != null ? ProTheme.fromJson(json['dashboard']) : null,
      fullapp: json['fullapp'] != null ? ProTheme.fromJson(json['fullapp']) : null,
      widgets: json['widgets'] != null ? ProTheme.fromJson(json['widgets']) : null,
      defaultTheme: json['defaultTheme'] != null ? ProTheme.fromJson(json['defaultTheme']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.themes != null) {
      data['themes'] = this.themes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProTheme {
  String name;
  bool show_cover;
  List<ProTheme> sub_kits;
  String title_name;
  String type;
  String icon;
  bool is_theme;
  String tag;

  ProTheme({this.name, this.icon, this.is_theme, this.tag, this.type, this.show_cover, this.sub_kits, this.title_name});

  factory ProTheme.fromJson(Map<String, dynamic> json) {
    return ProTheme(
      name: json['name'],
      icon: json['icon'],
      is_theme: json['is_theme'],
      tag: json['tag'],
      type: json['type'],
      show_cover: json['show_cover'],
      sub_kits: json['sub_kits'] != null ? (json['sub_kits'] as List).map((i) => ProTheme.fromJson(i)).toList() : null,
      title_name: json['title_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['show_cover'] = this.show_cover;
    data['title_name'] = this.title_name;
    data['type'] = this.type;
    if (this.sub_kits != null) {
      data['sub_kits'] = this.sub_kits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/*
class SubKit {
    String icon;
    bool is_theme;
    String name;
    String tag;
    String type;
    SubKit({});

    factory SubKit.fromJson(Map<String, dynamic> json) {
        return SubKit(
            icon: json['icon'],
            is_theme: json['is_theme'],
            name: json['name'],
            tag: json['tag'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['icon'] = this.icon;
        data['is_theme'] = this.is_theme;
        data['name'] = this.name;
        data['tag'] = this.tag;
        data['type'] = this.type;
        return data;
    }
}*/
