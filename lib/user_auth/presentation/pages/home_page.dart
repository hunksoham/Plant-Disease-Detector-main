import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../services/classify.dart';
import '../../../services/disease_provider.dart';
import '../../../services/hive_database.dart';
import '../../../src/home_page/components/greeting.dart';
import '../../../src/home_page/components/history.dart';
import '../../../src/home_page/components/instructions.dart';
import '../../../src/home_page/components/onboarding_screen.dart';
import '../../../src/home_page/components/titlesection.dart';
import '../../../src/home_page/models/disease_model.dart';
import '../../../src/suggestions_page/suggestions.dart';
import 'package:google_fonts/google_fonts.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final diseaseService = Provider.of<DiseaseService>(context);

    // Hive service
    HiveService hiveService = HiveService();

    // Data
    Size size = MediaQuery.of(context).size;
    final Classifier classifier = Classifier();
    late Disease disease;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SpeedDial(
        icon: Icons.camera_alt,
        spacing: 10,
        children: [
          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.file,
              color: kWhite,
            ),
            label: "Choose image",
            backgroundColor: kMain,
            onTap: () {
              late double  confidence;
              classifier.getDisease(ImageSource.gallery).then((value) {
                disease = Disease(
                    name: value![0]["label"],
                    imagePath: classifier.imageFile.path);

                confidence = value[0]['confidence'];
              });
              // Check confidence
              if (confidence > 0.8) {
                // Set disease for Disease Service
                diseaseService.setDiseaseValue(disease);

                // Save disease
                hiveService.addDisease(disease);

                Navigator.restorablePushNamed(
                  context,
                  Suggestions.routeName,
                );
              } else {
                // Display unsure message
                Fluttertoast.showToast(msg: "Not Sure!!! keep Exact image");
              }
            },
          ),
          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.camera,
              color: kWhite,
            ),
            label: "Take photo",
            backgroundColor: kMain,
            onTap: ()  {
              late double confidence0;

              classifier.getDisease(ImageSource.camera).then((value) {
                disease = Disease(
                    name: value![0]["label"],
                    imagePath: classifier.imageFile.path);

                confidence0 = value[0]['confidence'];
              });

              // Check confidence
              if (confidence0 > 0.8) {
                // Set disease for Disease Service
                diseaseService.setDiseaseValue(disease);

                // Save disease
                hiveService.addDisease(disease);

                Navigator.restorablePushNamed(
                  context,
                  Suggestions.routeName,

                );
              } else {
                // Display unsure message
                    Fluttertoast.showToast(msg: "Not Sure!!! keep Exact image");

              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
        ),
        child: CustomScrollView(
          slivers: [
            GreetingSection(size.height * 0.2),
            TitleSection('Instructions', size.height * 0.066),
            InstructionsSection(size),
            TitleSection('Your History', size.height * 0.066),
            HistorySection(size, context, diseaseService)
          ],
        ),
      ),
    );
  }
}
