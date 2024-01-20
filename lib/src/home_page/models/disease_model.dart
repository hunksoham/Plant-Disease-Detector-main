import 'package:hive/hive.dart';

part 'disease_model.g.dart';

@HiveType(typeId: 0)
class Disease extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  late String possibleCauses;

  @HiveField(2)
  late String possibleSolution;

  @HiveField(3)
  late String imagePath;

  @HiveField(4)
  late DateTime dateTime;

  Disease({required this.name, required this.imagePath}) {
    dateTime = DateTime.now();

    switch (name) {
      case " potato_healthy":
        possibleCauses = "N/A.";
        possibleSolution = "In Good Condition.";
        break;

      case "potato_late_blight":
        possibleCauses =
        "Potato late blight is caused by the oomycete pathogen Phytophthora infestans..";
        possibleSolution =
        "fungicide applications and practicing crop rotation can help manage and control potato late blight";
        break;

      case "potato_early_blight":
        possibleCauses =
        "Potato early blight is caused by the fungus Alternaria solani, thriving in warm and humid conditions..";
        possibleSolution = " Implementing crop rotation, applying fungicides.";
        break;

      case "Bacterial_spot_root":
        possibleCauses = " caused by the bacterium Xanthomonas campestris..";
        possibleSolution =
        " Implementing crop rotation and using copper-based fungicides";
        break;

      case "Black_root":
        possibleCauses = " Fungal pathogen (e.g., Thielaviopsis basicola)..";
        possibleSolution =
        "Implementing crop rotation and using disease-resistant crop varieties..";
        break;

      case "Tomato Bacterial Spot":
        possibleCauses =
        "Xanthomonas bacteria which can be introduced into a garden on contaminated seed and transplants, which may or may not show symptoms.";
        possibleSolution =
        "Remove symptomatic plants from the field or greenhouse to prevent the spread of bacteria to healthy plants.";
        break;

      case "Tomato Early Blight":
        possibleCauses =
        "The fungus Alternaria solani, high humidity and long periods of leaf wetness.";
        possibleSolution =
        "Maintaining optimum growing conditions: proper fertilization, irrigation, and pests management.";
        break;

      case "Tomato Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Tomato Late Blight":
        possibleCauses = "Caused by the water mold Phytophthora infestans.";
        possibleSolution = "Timely application of fungicide";
        break;

      case "Tomato Leaf Mold":
        possibleCauses = "High relative humidity (greater than 85%).";
        possibleSolution =
        "Growing leaf mold resistant varieties, use drip irrigation to avoid watering foliage.";
        break;

      case "Tomato Septoria Leaf Spot":
        possibleCauses =
        "It is a fungus and spreads by spores most rapidly in wet or humid weather. Attacks plants in the nightshade family, and can be harbored on weeds within this family.";
        possibleSolution =
        "Remove infected leaves immediately, use organic fungicide options.";
        break;

      case "Tomato Spotted Spider Mites":
        possibleCauses =
        "Spider mite feeding on leaves during hot and dry conditions.";
        possibleSolution =
        "Aiming a hard stream of water at infested plants to knock spider mites off the plants. Also use of insecticidal soaps, horticultural oils.";
        break;

      case "Tomato Target Spot":
        possibleCauses =
        "The fungus Corynespora cassiicola which spreads to plants.";
        possibleSolution =
        "Planting resistant varieties, keeping farms free from weeds.";
        break;

      case "Tomato Mosaic Virus":
        possibleCauses =
        "Spread by aphids and other insects, mites, fungi, nematodes, and contact; pollen and seeds can carry the infection as well.";
        possibleSolution =
        "No cure for infected plants, remove all infected plants and destroy them.";
        break;

      case "Tomato Yellow Leaf Curl Virus":
        possibleCauses =
        "Physically spread plant-to-plant by the silverleaf whitefly.";
        possibleSolution =
        "Chemical control: Imidacloprid should be sprayed on the entire plant and below the leaves.";
        break;

      default:
        possibleCauses = "N/A";
        possibleSolution = "N/A";
        break;
    }
  }
}
