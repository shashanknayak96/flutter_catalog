class AdvertisementItem {
  final int id;
  final String name;
  final String toLink;
  final String image;

  AdvertisementItem({
    required this.id,
    required this.name,
    required this.toLink,
    required this.image,
  });

  factory AdvertisementItem.fromMap(Map<String, dynamic> map) {
    return AdvertisementItem(
      id: map["id"],
      name: map["name"],
      toLink: map["toLink"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "toLink": toLink,
        "image": image,
      };
}
