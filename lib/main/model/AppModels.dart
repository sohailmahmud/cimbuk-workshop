/*
class AppContent {
  List<AppKit> main;

  List<AppKit> themes;

  List<AppKit> list;

  AppContent({this.list, this.main, this.themes});

  factory AppContent.fromJson(Map<String, dynamic> json) {
    return AppContent(
      list: json['list'] != null ? (json['list'] as List).map((i) => SubKit.fromJson(i)).toList() : null,
      main: json['main'] != null ? (json['main'] as List).map((i) => Main.fromJson(i)).toList() : null,
      themes: json['themes'] != null ? (json['themes'] as List).map((i) => Theme.fromJson(i)).toList() : null,
    );
  }

}

class AppKit {
  var name = "";
  var type = "";
  List<AppKit> subAppKits = List<AppKit>();
  var titleName = "";
  var showCover = false;
  var isTheme = false;
  var icon = "";
}
class AppContent {
    List<X> list;
    List<Main> main;
    List<Theme> themes;

    AppContent({this.list, this.main, this.themes});


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.list != null) {
            data['list'] = this.list.map((v) => v.toJson()).toList();
        }
        if (this.main != null) {
            data['main'] = this.main.map((v) => v.toJson()).toList();
        }
        if (this.themes != null) {
            data['themes'] = this.themes.map((v) => v.toJson()).toList();
        }
        return data;
    }
}


class SubKit {
    String icon;
    bool isTheme;
    String name;
    String tag;
    String type;
    List<SubKit> subKits;
    var showCover = false;
    var titleName = "";

    SubKit({this.icon, this.isTheme, this.name, this.tag, this.type,this.subKits,this.showCover,this.titleName});

    factory SubKit.fromJson(Map<String, dynamic> json) {

        return SubKit(
            icon: json['icon'],
            isTheme: json['is_theme'],
            name: json['name'],
            tag: json['tag'],
            type: json['type'],
            subKits: json['sub_kits'] != null ? (json['sub_kits'] as List).map((i) => SubKit.fromJson(i)).toList() : null,
            showCover: json['show_cover'],
            titleName: json['title_name']
        );
    }
}


*/
