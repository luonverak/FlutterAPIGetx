// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int? id;
  String? name;
  String? detail;
  double? price;
  double? dicount;
  List<String>? preview;
  List<String>? color;
  Service? service;
  String? image;
  SpecificDetail? specificDetail;
  Category? category;
  double? rate;
  String? brand;
  PublicDate? publicDate;
  CreateDate? createDate;

  ProductModel({
    this.id,
    this.name,
    this.detail,
    this.price,
    this.dicount,
    this.preview,
    this.color,
    this.service,
    this.image,
    this.specificDetail,
    this.category,
    this.rate,
    this.brand,
    this.publicDate,
    this.createDate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        detail: json["detail"],
        price: json["price"]?.toDouble(),
        dicount: json["dicount"]?.toDouble(),
        preview: json["preview"] == null
            ? []
            : List<String>.from(json["preview"]!.map((x) => x)),
        color: json["color"] == null
            ? []
            : List<String>.from(json["color"]!.map((x) => x)),
        service: serviceValues.map[json["service"]]!,
        image: json["image"],
        specificDetail: json["specific_detail"] == null
            ? null
            : SpecificDetail.fromJson(json["specific_detail"]),
        category: categoryValues.map[json["category"]]!,
        rate: json["rate"]?.toDouble(),
        brand: json["brand"],
        publicDate: publicDateValues.map[json["public_date"]]!,
        createDate: createDateValues.map[json["create_date"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "detail": detail,
        "price": price,
        "dicount": dicount,
        "preview":
            preview == null ? [] : List<dynamic>.from(preview!.map((x) => x)),
        "color": color == null ? [] : List<dynamic>.from(color!.map((x) => x)),
        "service": serviceValues.reverse[service],
        "image": image,
        "specific_detail": specificDetail?.toJson(),
        "category": categoryValues.reverse[category],
        "rate": rate,
        "brand": brand,
        "public_date": publicDateValues.reverse[publicDate],
        "create_date": createDateValues.reverse[createDate],
      };
}

enum Category { BOTH_CLOTHES, MEN_CLOTHES, WOMEN_CLOTHES }

final categoryValues = EnumValues({
  "Both Clothes": Category.BOTH_CLOTHES,
  "Men Clothes": Category.MEN_CLOTHES,
  "Women Clothes": Category.WOMEN_CLOTHES
});

enum CreateDate { THE_01112023 }

final createDateValues = EnumValues({"01-11-2023": CreateDate.THE_01112023});

enum PublicDate { THE_12122023 }

final publicDateValues = EnumValues({"12-12-2023": PublicDate.THE_12122023});

enum Service { FREE_DELIVERY, PAY_DELIVERY }

final serviceValues = EnumValues({
  "Free delivery": Service.FREE_DELIVERY,
  "Pay delivery": Service.PAY_DELIVERY
});

class SpecificDetail {
  String? fabricType;
  CareInstructions? careInstructions;
  Origin? origin;
  ClosureType? closureType;

  SpecificDetail({
    this.fabricType,
    this.careInstructions,
    this.origin,
    this.closureType,
  });

  factory SpecificDetail.fromJson(Map<String, dynamic> json) => SpecificDetail(
        fabricType: json["fabric_type"],
        careInstructions:
            careInstructionsValues.map[json["care_instructions"]]!,
        origin: originValues.map[json["origin"]]!,
        closureType: closureTypeValues.map[json["closure_type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "fabric_type": fabricType,
        "care_instructions": careInstructionsValues.reverse[careInstructions],
        "origin": originValues.reverse[origin],
        "closure_type": closureTypeValues.reverse[closureType],
      };
}

enum CareInstructions { DRY_CLEAN_ONLY, HAND_WASH_ONLY, MACHINE_WASH }

final careInstructionsValues = EnumValues({
  "Dry Clean Only": CareInstructions.DRY_CLEAN_ONLY,
  "Hand Wash Only": CareInstructions.HAND_WASH_ONLY,
  "Machine Wash": CareInstructions.MACHINE_WASH
});

enum ClosureType { COLLARED_NECK, PULL_ON, ZIPPER }

final closureTypeValues = EnumValues({
  "Collared Neck": ClosureType.COLLARED_NECK,
  "Pull On": ClosureType.PULL_ON,
  "Zipper": ClosureType.ZIPPER
});

enum Origin { IMPORTED }

final originValues = EnumValues({"Imported": Origin.IMPORTED});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
