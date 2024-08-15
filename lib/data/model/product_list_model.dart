import 'package:json_annotation/json_annotation.dart';

part 'product_list_model.g.dart';

@JsonSerializable()
class ProductListModel {
  @JsonKey(name: "products")
  List<ProductListData>? productListData;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "skip")
  int? skip;
  @JsonKey(name: "limit")
  int? limit;

  ProductListModel({this.productListData, this.total, this.skip, this.limit});

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);
}

@JsonSerializable()
class ProductListData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "discountPercentage")
  double? discountPercentage;
  @JsonKey(name: "rating")
  double? rating;
  @JsonKey(name: "stock")
  int? stock;
  @JsonKey(name: "tags")
  List<String>? tags;
  @JsonKey(name: "brand")
  String? brand;
  @JsonKey(name: "sku")
  String? sku;
  @JsonKey(name: "weight")
  int? weight;
  @JsonKey(name: "dimensions")
  Dimensions? dimensions;
  @JsonKey(name: "warrantyInformation")
  String? warrantyInformation;
  @JsonKey(name: "shippingInformation")
  String? shippingInformation;
  @JsonKey(name: "availabilityStatus")
  String? availabilityStatus;
  @JsonKey(name: "reviews")
  List<Reviews>? reviews;
  @JsonKey(name: "returnPolicy")
  String? returnPolicy;
  @JsonKey(name: "minimumOrderQuantity")
  int? minimumOrderQuantity;
  @JsonKey(name: "meta")
  MetaData? metaData;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "thumbnail")
  String? thumbnail;

  ProductListData(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.tags,
      this.brand,
      this.sku,
      this.weight,
      this.dimensions,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.reviews,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.metaData,
      this.images,
      this.thumbnail});

  factory ProductListData.fromJson(Map<String, dynamic> json) =>
      _$ProductListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListDataToJson(this);
}

@JsonSerializable()
class Dimensions {
  @JsonKey(name: "width")
  double? width;
  @JsonKey(name: "height")
  double? height;
  @JsonKey(name: "depth")
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}

@JsonSerializable()
class Reviews {
  @JsonKey(name: "rating")
  int? rating;
  @JsonKey(name: "comment")
  String? comment;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "reviewerName")
  String? reviewerName;
  @JsonKey(name: "reviewerEmail")
  String? reviewerEmail;

  Reviews(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail});

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}

@JsonSerializable()
class MetaData {
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "barcode")
  String? barcode;
  @JsonKey(name: "qrCode")
  String? qrCode;

  MetaData({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}
