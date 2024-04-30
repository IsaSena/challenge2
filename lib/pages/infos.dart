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
}