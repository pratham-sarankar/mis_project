class Client {
  final String id;
  String name;

  Client({required this.id, required this.name});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
    );
  }

  factory Client.empty() {
    return Client(id: "", name: "");
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
