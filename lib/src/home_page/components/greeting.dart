import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
class GreetingSection extends SliverFixedExtentList {
  GreetingSection(double height, {Key? key})
      : super(
          key: key,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB((0.079*height), (0.32*height), (0.079*height), (0.09*height)),
                child: Container(
                  decoration: BoxDecoration(
                    color: kSecondary,
                    borderRadius: BorderRadius.only(
                       topLeft: Radius.circular((0.079*height)),
                        topRight:Radius.circular((0.079*height)) ,
                        bottomLeft: Radius.circular((0.079*height)),
                        bottomRight: Radius.circular((0.079*height))),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB((0.092*height), 0, 0, (0.099*height)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Plant Disease Detector',
                            style:GoogleFonts.lobster(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,letterSpacing: 3.5,fontSize: 25
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
          itemExtent: height,
        );
}
