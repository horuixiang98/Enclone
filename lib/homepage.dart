import 'dart:convert';
import 'dart:ui';

import 'package:enclone/main.dart';
import 'package:enclone/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future _fetechlatestmusic(BuildContext context) async {
  final datas = await supabase.from('Music').select();
  return datas;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
            child: Column(
              children: [
                Text(
                  'Hi There,',
                  style: GoogleFonts.poppins(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '草泥马🦙,',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: MediaQuery.of(context).size.width * .45,
            child: FutureBuilder(
              future: _fetechlatestmusic(context),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * .45,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      NetworkImage(snapshot.data[index]['img']),
                                ),
                                color: const Color.fromRGBO(30, 31, 31, 0.6),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            // child: const Icon(
                            //   Typicons.heart,
                            //   size: 50,
                            // ),
                          ),
                        );
                      });
                }
              },
            ),

            // ListView(
            //   // This next line does the trick.
            //   scrollDirection: Axis.horizontal,
            //   children: <Widget>[
            //     Container(
            //       width: MediaQuery.of(context).size.width * .45,
            //       margin: const EdgeInsets.all(5),
            //       decoration: const BoxDecoration(
            //           image: DecorationImage(
            //             fit: BoxFit.fill,
            //             image: NetworkImage(
            //                 'http://aserious.tplinkdns.com:54321/storage/v1/object/public/musiclist/4517a3b127ebd0e6ea0a9f7af9330006.998x1000x1.jpg?t=2023-10-15T06%3A40%3A23.959Z'),
            //           ),
            //           color: Color.fromRGBO(30, 31, 31, 0.6),
            //           borderRadius: BorderRadius.all(Radius.circular(10))),
            //       // child: const Icon(
            //       //   Typicons.heart,
            //       //   size: 50,
            //       // ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width * .45,
            //       margin: const EdgeInsets.all(5),
            //       decoration: const BoxDecoration(
            //           color: Color.fromRGBO(30, 31, 31, 0.6),
            //           borderRadius: BorderRadius.all(Radius.circular(10))),
            //       // child: const Icon(
            //       //   Typicons.heart,
            //       //   size: 50,
            //       // ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width * .45,
            //       margin: const EdgeInsets.all(5),
            //       decoration: const BoxDecoration(
            //           color: Color.fromRGBO(30, 31, 31, 0.6),
            //           borderRadius: BorderRadius.all(Radius.circular(10))),
            //       // child: const Icon(
            //       //   Typicons.heart,
            //       //   size: 50,
            //       // ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width * .45,
            //       margin: const EdgeInsets.all(5),
            //       decoration: const BoxDecoration(
            //           color: Color.fromRGBO(30, 31, 31, 0.6),
            //           borderRadius: BorderRadius.all(Radius.circular(10))),
            //       // child: const Icon(
            //       //   Typicons.heart,
            //       //   size: 50,
            //       // ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width * .45,
            //       margin: const EdgeInsets.all(5),
            //       decoration: const BoxDecoration(
            //           color: Color.fromRGBO(30, 31, 31, 0.6),
            //           borderRadius: BorderRadius.all(Radius.circular(10))),
            //       // child: const Icon(
            //       //   Typicons.heart,
            //       //   size: 50,
            //       // ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width * .45,
            //       margin: const EdgeInsets.all(5),
            //       decoration: const BoxDecoration(
            //           color: Color.fromRGBO(30, 31, 31, 0.6),
            //           borderRadius: BorderRadius.all(Radius.circular(10))),
            //       // child: const Icon(
            //       //   Typicons.heart,
            //       //   size: 50,
            //       // ),
            //     ),
            //   ],
            // ),
          ),
          const Row(
            children: [],
          ),

          // SizedBox(
          //   height: MediaQuery.of(context).size.width * .05,
          // ),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'Discover',
                        style: GoogleFonts.poppins(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.join_right,
                        size: 25,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ],
              )),
          // SizedBox(
          //   height: MediaQuery.of(context).size.width * .30,
          // ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: MediaQuery.of(context).size.width * .5,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'http://aserious.tplinkdns.com:54321/storage/v1/object/public/musiclist/4517a3b127ebd0e6ea0a9f7af9330006.998x1000x1.jpg?t=2023-10-15T06%3A40%3A23.959Z'),
                            ),
                            color: Color.fromRGBO(30, 31, 31, 0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        // child: const Icon(
                        //   Typicons.heart,
                        //   size: 50,
                        // ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 30, 5, 10),
                          child: Column(
                            children: [
                              Text('"最好的承诺，不是爱你一万年，而是根本不需要承诺。"',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(height: 20),
                              Text("Ryanxavier -",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'http://aserious.tplinkdns.com:54321/storage/v1/object/public/musiclist/513.jpeg?t=2023-10-17T06%3A34%3A58.181Z'),
                            ),
                            color: Color.fromRGBO(30, 31, 31, 0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        // child: const Icon(
                        //   Typicons.heart,
                        //   size: 50,
                        // ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 30, 5, 10),
                          child: Column(
                            children: [
                              Text('"最好的承诺，不是爱你一万年，而是根本不需要承诺。"',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(height: 20),
                              Text("Ryanxavier -",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Malaysia's Top Hits",
                    style: GoogleFonts.poppins(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_right_rounded,
                        size: 15,
                      ),
                      onPressed: () {
                        // Clipboard.setData(ClipboardData(text: 'data'));
                        HapticFeedback.heavyImpact();
                      },
                    ),
                  ),
                ],
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: MediaQuery.of(context).size.width * .45,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
              ],
            ),
          ),

          // Music Artis
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Music Artists",
                    style: GoogleFonts.poppins(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_right_rounded,
                        size: 15,
                      ),
                      onPressed: () {
                        // Clipboard.setData(ClipboardData(text: 'data'));
                        HapticFeedback.heavyImpact();
                      },
                    ),
                  ),
                ],
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: MediaQuery.of(context).size.width * .45,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Scaffold.of(context).showBottomSheet<void>(
                      backgroundColor: Colors.black87.withOpacity(0.85),
                      (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .9,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  width:
                                      MediaQuery.of(context).size.height * .08,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'http://aserious.tplinkdns.com:54321/storage/v1/object/public/artistprofile/ej4LE_5f.jpg?t=2023-10-17T06%3A39%3A17.197Z'),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: ClipRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 1.5, sigmaY: 1.5),
                                          child: Container(
                                            // the size where the blurring starts
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black87.withOpacity(0.5),
                                        spreadRadius: 9,
                                        blurRadius: 10,
                                        offset: const Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 5, 10, 0),
                                        child: Row(
                                          children: [
                                            Text("JJ Lin",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const Spacer(),
                                            Container(
                                              child: OutlinedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                            side: const BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        107,
                                                                        228,
                                                                        255,
                                                                        1))))),
                                                child: const Text(
                                                  'Follow +',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          107, 228, 255, 1)),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 10, 0),
                                        child: const Row(
                                          children: [
                                            Text(
                                              'Taylor Alison Swift (born December 13, 1989) is an ...',
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              softWrap: true,
                                              style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        child: const Text('Close BottomSheet'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                // const Text(
                                //     'Hello from Persistent Bottom Sheet'),
                              ],
                            ));
                      },
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .45,
                    margin: const EdgeInsets.all(5),

                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'http://aserious.tplinkdns.com:54321/storage/v1/object/public/artistprofile/ej4LE_5f.jpg?t=2023-10-17T06%3A39%3A17.197Z'),
                        ),
                        color: Color.fromRGBO(30, 31, 31, 0.6),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    // child: const Icon(

                    //   Typicons.heart,
                    //   size: 50,
                    // ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 31, 31, 0.6),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  // child: const Icon(
                  //   Typicons.heart,
                  //   size: 50,
                  // ),
                ),
              ],
            ),
          ),

          // const AnimatedSmoothIndicator(
          //   activeIndex: 1,
          //   count: 6,
          //   effect: WormEffect(),
          // )
        ],
      ),
    );
  }
}
