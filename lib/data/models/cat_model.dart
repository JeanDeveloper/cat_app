
import 'package:myapp/data/models/weight_model.dart';
import 'package:myapp/domain/entities/cat.dart';

List<CatModel> catModelFromJson(List<dynamic> jsonList) {
  return jsonList
      .map((e) => CatModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

class CatModel extends Cat {
  CatModel({
    required super.weight,
    required super.id,
    required super.name,
    required super.temperament,
    required super.origin,
    required super.countryCodes,
    required super.countryCode,
    required super.description,
    required super.lifeSpan,
    required super.indoor,
    required super.adaptability,
    required super.affectionLevel,
    required super.childFriendly,
    required super.dogFriendly,
    required super.energyLevel,
    required super.grooming,
    required super.healthIssues,
    required super.intelligence,
    required super.sheddingLevel,
    required super.socialNeeds,
    required super.strangerFriendly,
    required super.vocalisation,
    required super.experimental,
    required super.hairless,
    required super.natural,
    required super.rare,
    required super.rex,
    required super.suppressedTail,
    required super.shortLegs,
    required super.hypoallergenic,
    super.cfaUrl,
    super.vetstreetUrl,
    super.vcahospitalsUrl,
    super.lap,
    super.altNames,
    super.wikipediaUrl,
    super.referenceImageId,
    super.catFriendly,
    super.bidability,
    super.imagePath,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
    weight: WeightModel.fromJson(json["weight"]),
    id: json["id"],
    name: json["name"],
    cfaUrl: json["cfa_url"],
    vetstreetUrl: json["vetstreet_url"],
    vcahospitalsUrl: json["vcahospitals_url"],
    temperament: json["temperament"],
    origin: json["origin"],
    countryCodes: json["country_codes"],
    countryCode: json["country_code"],
    description: json["description"],
    lifeSpan: json["life_span"],
    indoor: json["indoor"],
    lap: json["lap"],
    altNames: json["alt_names"],
    adaptability: json["adaptability"],
    affectionLevel: json["affection_level"],
    childFriendly: json["child_friendly"],
    dogFriendly: json["dog_friendly"],
    energyLevel: json["energy_level"],
    grooming: json["grooming"],
    healthIssues: json["health_issues"],
    intelligence: json["intelligence"],
    sheddingLevel: json["shedding_level"],
    socialNeeds: json["social_needs"],
    strangerFriendly: json["stranger_friendly"],
    vocalisation: json["vocalisation"],
    experimental: json["experimental"],
    hairless: json["hairless"],
    natural: json["natural"],
    rare: json["rare"],
    rex: json["rex"],
    suppressedTail: json["suppressed_tail"],
    shortLegs: json["short_legs"],
    wikipediaUrl: json["wikipedia_url"],
    hypoallergenic: json["hypoallergenic"],
    referenceImageId: json["reference_image_id"],
    catFriendly: json["cat_friendly"],
    bidability: json["bidability"],
    imagePath: (json["reference_image_id"] == null)
      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0mPJIxvYiTXwFhUEUFkvHrM3ZT9ywgh32v7pUwKNQYguUXUdHXczKjLgr_HxHv8kcANQ"
      : "${"https://cdn2.thecatapi.com/images/" + json["reference_image_id"]}.jpg"
  );
}
