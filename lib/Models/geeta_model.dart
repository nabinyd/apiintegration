
class GeetaModel {
  int? chapterNumber;
  int? versesCount;
  String? name;
  String? translation;
  String? transliteration;
  Meaning? meaning;
  Summary? summary;

  GeetaModel({this.chapterNumber, this.versesCount, this.name, this.translation, this.transliteration, this.meaning, this.summary});

  GeetaModel.fromJson(Map<String, dynamic> json) {
    if(json["chapter_number"] is int) {
      chapterNumber = json["chapter_number"];
    }
    if(json["verses_count"] is int) {
      versesCount = json["verses_count"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["translation"] is String) {
      translation = json["translation"];
    }
    if(json["transliteration"] is String) {
      transliteration = json["transliteration"];
    }
    if(json["meaning"] is Map) {
      meaning = json["meaning"] == null ? null : Meaning.fromJson(json["meaning"]);
    }
    if(json["summary"] is Map) {
      summary = json["summary"] == null ? null : Summary.fromJson(json["summary"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["chapter_number"] = chapterNumber;
    _data["verses_count"] = versesCount;
    _data["name"] = name;
    _data["translation"] = translation;
    _data["transliteration"] = transliteration;
    if(meaning != null) {
      _data["meaning"] = meaning?.toJson();
    }
    if(summary != null) {
      _data["summary"] = summary?.toJson();
    }
    return _data;
  }
}

class Summary {
  String? en;
  String? hi;

  Summary({this.en, this.hi});

  Summary.fromJson(Map<String, dynamic> json) {
    if(json["en"] is String) {
      en = json["en"];
    }
    if(json["hi"] is String) {
      hi = json["hi"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["en"] = en;
    _data["hi"] = hi;
    return _data;
  }
}

class Meaning {
  String? en;
  String? hi;

  Meaning({this.en, this.hi});

  Meaning.fromJson(Map<String, dynamic> json) {
    if(json["en"] is String) {
      en = json["en"];
    }
    if(json["hi"] is String) {
      hi = json["hi"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["en"] = en;
    _data["hi"] = hi;
    return _data;
  }
}