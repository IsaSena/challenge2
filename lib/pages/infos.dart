class Infos {
  int id;
  String name;
  String email;
  String contact;
  String profileImage;
  bool favorito;

  Infos({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    this.profileImage = 'assets/image/img2.jpg',
    required this.favorito,
  });

  factory Infos.init() {
    return Infos(
      id: -99,
      name: "",
      email: "",
      contact: "",
      favorito: false,
    );
  }

  Infos copyWith({
    int? id,
    String? name,
    String? email,
    String? contact,
    String? profileImage,
    bool? favorito,
  }) {
    final newInfo =  Infos(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      contact: contact ?? this.contact,
      favorito: favorito ?? this.favorito,
    );
    return newInfo;
  }
}
