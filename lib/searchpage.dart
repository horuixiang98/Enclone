import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:badges/badges.dart' as badges;

/// Flutter code sample for [NestedScrollView].

class SearchPage extends StatelessWidget {
  final String id;
  const SearchPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 80, 10, 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .45,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'http://aserious.tplinkdns.com:54321/storage/v1/object/public/musiclist/2f912c35d9035b5b35be93ba6e59ce02.500x436x1.jpg'),
                    ),
                    color: Color.fromRGBO(30, 31, 31, 0.6),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                // child: const Icon(
                //   Typicons.heart,
                //   size: 50,
                // ),
              ),
              Text(id)
            ],
          )
        ],
      ),
    );
  }
}
