class HomeModel {
  final bool status;
  final String? message;
  final DataModel? data;

  HomeModel({
    required this.status,
    this.message,
    required this.data,
  });


  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      message: json['message'],
      data: DataModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }


}

class DataModel {
  final List<BannerModel>? banners;
  final List<ProductModel>? products;
  final String? ad;

  DataModel({
    required this.banners,
    required this.products,
    required this.ad,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    var bannersList = json['banners'] as List;
    var productsList = json['products'] as List;

    return DataModel(
      banners: bannersList.map((i) => BannerModel.fromJson(i)).toList(),
      products: productsList.map((i) => ProductModel.fromJson(i)).toList(),
      ad: json['ad'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banners': banners?.map((b) => b.toJson()).toList(),
      'products': products?.map((p) => p.toJson()).toList(),
      'ad': ad,
    };
  }
}

class BannerModel {
  final int id;
  final String image;
  final dynamic category;
  final dynamic product;

  BannerModel({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
      category: json['category'],
      product: json['product'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'category': category,
      'product': product,
    };
  }
}

class ProductModel {
  final int? id;
  final int? price;
  final int? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;
  final bool? inFavorites;
  final bool? inCart;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'] as List;
    List<String> imagesList = imagesFromJson.cast<String>();

    return ProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: imagesList,
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'old_price': oldPrice,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
      'images': images,
      'in_favorites': inFavorites,
      'in_cart': inCart,
    };
  }
}
