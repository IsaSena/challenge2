class Infos {
  String name;
  String email;
  String contact;
  String profileImage;
  bool favorito;

  Infos({
    required this.name,
    required this.email,
    required this.contact,
    this.profileImage = 'assets/image/img2.jpg',
    required this.favorito,
  });
}