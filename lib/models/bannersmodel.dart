class BannersModel {
  String image;

  BannersModel(this.image);
}

List<BannersModel> banners =
    bannerslist.map((item) => BannersModel(item['image'])).toList();

var bannerslist = [
  {"image": "asset/images/carousel_covid_discount.png"},
  {"image": "asset/images/carousel_covid_discount.png"},
  {"image": "asset/images/carousel_covid_discount.png"},
  {"image": "asset/images/carousel_covid_discount.png"},
];
