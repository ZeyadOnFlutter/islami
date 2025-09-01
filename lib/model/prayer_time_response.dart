class PrayerTimeResponse {
  PrayerTimeResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  final int code;
  final String status;
  final Data? data;

  factory PrayerTimeResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimeResponse(
      code: json["code"] ?? 0,
      status: json["status"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.timings,
    required this.date,
    required this.meta,
  });

  final Timings? timings;
  final Date? date;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      timings: json["timings"] == null ? null : Timings.fromJson(json["timings"]),
      date: json["date"] == null ? null : Date.fromJson(json["date"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "timings": timings?.toJson(),
        "date": date?.toJson(),
        "meta": meta?.toJson(),
      };
}

class Date {
  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  final String readable;
  final String timestamp;
  final Hijri? hijri;
  final Gregorian? gregorian;

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      readable: json["readable"] ?? "",
      timestamp: json["timestamp"] ?? "",
      hijri: json["hijri"] == null ? null : Hijri.fromJson(json["hijri"]),
      gregorian: json["gregorian"] == null ? null : Gregorian.fromJson(json["gregorian"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "readable": readable,
        "timestamp": timestamp,
        "hijri": hijri?.toJson(),
        "gregorian": gregorian?.toJson(),
      };
}

class Gregorian {
  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.lunarSighting,
  });

  final String date;
  final String format;
  final String day;
  final GregorianWeekday? weekday;
  final GregorianMonth? month;
  final String year;
  final Designation? designation;
  final bool lunarSighting;

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(
      date: json["date"] ?? "",
      format: json["format"] ?? "",
      day: json["day"] ?? "",
      weekday: json["weekday"] == null ? null : GregorianWeekday.fromJson(json["weekday"]),
      month: json["month"] == null ? null : GregorianMonth.fromJson(json["month"]),
      year: json["year"] ?? "",
      designation: json["designation"] == null ? null : Designation.fromJson(json["designation"]),
      lunarSighting: json["lunarSighting"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday?.toJson(),
        "month": month?.toJson(),
        "year": year,
        "designation": designation?.toJson(),
        "lunarSighting": lunarSighting,
      };
}

class Designation {
  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  final String abbreviated;
  final String expanded;

  factory Designation.fromJson(Map<String, dynamic> json) {
    return Designation(
      abbreviated: json["abbreviated"] ?? "",
      expanded: json["expanded"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "abbreviated": abbreviated,
        "expanded": expanded,
      };
}

class GregorianMonth {
  GregorianMonth({
    required this.number,
    required this.en,
  });

  final int number;
  final String en;

  factory GregorianMonth.fromJson(Map<String, dynamic> json) {
    return GregorianMonth(
      number: json["number"] ?? 0,
      en: json["en"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
      };
}

class GregorianWeekday {
  GregorianWeekday({
    required this.en,
  });

  final String en;

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) {
    return GregorianWeekday(
      en: json["en"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class Hijri {
  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
    required this.adjustedHolidays,
    required this.method,
  });

  final String date;
  final String format;
  final String day;
  final HijriWeekday? weekday;
  final HijriMonth? month;
  final String year;
  final Designation? designation;
  final List<String> holidays;
  final List<dynamic> adjustedHolidays;
  final String method;

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json["date"] ?? "",
      format: json["format"] ?? "",
      day: json["day"] ?? "",
      weekday: json["weekday"] == null ? null : HijriWeekday.fromJson(json["weekday"]),
      month: json["month"] == null ? null : HijriMonth.fromJson(json["month"]),
      year: json["year"] ?? "",
      designation: json["designation"] == null ? null : Designation.fromJson(json["designation"]),
      holidays: json["holidays"] == null ? [] : List<String>.from(json["holidays"]!.map((x) => x)),
      adjustedHolidays: json["adjustedHolidays"] == null
          ? []
          : List<dynamic>.from(json["adjustedHolidays"]!.map((x) => x)),
      method: json["method"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday?.toJson(),
        "month": month?.toJson(),
        "year": year,
        "designation": designation?.toJson(),
        "holidays": holidays.map((x) => x).toList(),
        "adjustedHolidays": adjustedHolidays.map((x) => x).toList(),
        "method": method,
      };
}

class HijriMonth {
  HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
    required this.days,
  });

  final int number;
  final String en;
  final String ar;
  final int days;

  factory HijriMonth.fromJson(Map<String, dynamic> json) {
    return HijriMonth(
      number: json["number"] ?? 0,
      en: json["en"] ?? "",
      ar: json["ar"] ?? "",
      days: json["days"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
        "ar": ar,
        "days": days,
      };
}

class HijriWeekday {
  HijriWeekday({
    required this.en,
    required this.ar,
  });

  final String en;
  final String ar;

  factory HijriWeekday.fromJson(Map<String, dynamic> json) {
    return HijriWeekday(
      en: json["en"] ?? "",
      ar: json["ar"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

class Meta {
  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  final double latitude;
  final double longitude;
  final String timezone;
  final Method? method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Map<String, int> offset;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      latitude: json["latitude"] ?? 0.0,
      longitude: json["longitude"] ?? 0.0,
      timezone: json["timezone"] ?? "",
      method: json["method"] == null ? null : Method.fromJson(json["method"]),
      latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"] ?? "",
      midnightMode: json["midnightMode"] ?? "",
      school: json["school"] ?? "",
      offset: Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
    );
  }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "method": method?.toJson(),
        "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
        "midnightMode": midnightMode,
        "school": school,
        "offset": Map.from(offset).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Method {
  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  final int id;
  final String name;
  final Params? params;
  final Location? location;

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      params: json["params"] == null ? null : Params.fromJson(json["params"]),
      location: json["location"] == null ? null : Location.fromJson(json["location"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "params": params?.toJson(),
        "location": location?.toJson(),
      };
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json["latitude"] ?? 0.0,
      longitude: json["longitude"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Params {
  Params({
    required this.fajr,
    required this.isha,
  });

  final double fajr;
  final double isha;

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      fajr: json["Fajr"] ?? 0.0,
      isha: json["Isha"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Isha": isha,
      };
}

class Timings {
  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;

  final String maghrib;
  final String isha;

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json["Fajr"] ?? "",
      sunrise: json["Sunrise"] ?? "",
      dhuhr: json["Dhuhr"] ?? "",
      asr: json["Asr"] ?? "",
      maghrib: json["Maghrib"] ?? "",
      isha: json["Isha"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Maghrib": maghrib,
        "Isha": isha,
      };
}
