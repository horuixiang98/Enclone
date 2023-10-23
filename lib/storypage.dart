import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:flutter/services.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StatePageState();
}

class _StatePageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .70,
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('RX'),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text("Ryanxavier",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    Container(
                      child: Text("1 minutes ago..",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                const Expanded(child: Icon(Typicons.heart_outline))
              ],
            ),
          ],
        ));
  }
}
