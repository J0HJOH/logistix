class Parcel{
  late final int itemNumber;
  late final String packageDescription;
  late final String category;
  late int image;

  Parcel(this.image,
      {required this.itemNumber,
        required this.category,
        required this.packageDescription
      });
}