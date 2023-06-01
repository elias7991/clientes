List<Client> clientsFromJson(dynamic str) => List<Client>.from(str.map((e) => Client.fromJson(e)));

class Client {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Client({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}
