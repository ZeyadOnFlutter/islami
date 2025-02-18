class Radios {
  Radios({
    required this.id,
    required this.name,
    required this.url,
    required this.recentDate,
  });

  final int? id;
  final String? name;
  final String? url;
  final DateTime? recentDate;

  factory Radios.fromJson(Map<String, dynamic> json) {
    return Radios(
      id: json["id"],
      name: json["name"],
      url: json["url"],
      recentDate: DateTime.tryParse(json["recent_date"] ?? ""),
    );
  }
}
