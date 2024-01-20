import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
class InstructionsSection extends SliverFixedExtentList {
  InstructionsSection(Size size, {Key? key})
      : super(
          key: key,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    (0.061 * size.height * 0.26),
                    (0.071 * size.height * 0.26),
                    (0.076 * size.height * 0.26),
                    (0.061 * size.height * 0.26)),
                child: Container(
                  height: size.height * 0.26,
                  decoration: BoxDecoration(
                    color: kSecondary,
                    borderRadius:
                        BorderRadius.circular((0.061 * size.height * 0.26)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB((0.025 * size.height * 0.26),
                        0, 0, (0.025 * size.height * 0.26)),
                    child: ListView(
                      children:  [
                        ListTile(
                            leading: CircleAvatar(
                              backgroundColor: kMain,
                              child: Text(
                                '1',
                                style:GoogleFonts.lobster(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,letterSpacing: 1.5,fontSize: 20
                              ),
                              ),
                            ),
                            title: Text(
                              'Take/Select a photo of an affected plant by tapping the camera button below',

                              textAlign: TextAlign.justify,
                              style: GoogleFonts.lobster(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,letterSpacing: 1.5,fontSize: 15,

                            ),
                            )),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: kMain,
                            child: Text(
                              '2',
                              style:GoogleFonts.lobster(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,letterSpacing: 1.5,fontSize: 20
                              ),
                            ),
                          ),
                          title: Text(
                              'Give it a short while before you can get a suggestion of the disease',
                              textAlign: TextAlign.justify,
                            style:GoogleFonts.lobster(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,letterSpacing: 1.5,fontSize: 15
                            ),

                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: kMain,
                            child: Text(
                              '3',
                              style:GoogleFonts.lobster(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,letterSpacing: 1.5,fontSize: 20
                              ),
                            ),
                          ),
                          title: Text(
                            'Dont pick/upload any irrelevant object intentionally',
                            textAlign: TextAlign.justify,
                            style:GoogleFonts.lobster(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,letterSpacing: 1.5,fontSize: 15
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: 1,
          ),
          itemExtent: size.height * 0.26,
        );
}
