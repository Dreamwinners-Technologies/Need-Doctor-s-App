class BannersModel {
  String image;

  BannersModel(this.image);
}

List<BannersModel> banners =
    bannerslist.map((item) => BannersModel(item['image'])).toList();

var bannerslist = [
  {"image": "asset/images/slider-1.jpg"},
  {"image": "asset/images/slider-2.jpg"},
  {"image": "asset/images/slider-3.jpg"},
];
