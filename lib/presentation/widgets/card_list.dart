import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/cat.dart';
import 'package:myapp/presentation/screens/custom_card.dart';
import 'package:myapp/presentation/screens/detail_screen.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:animate_do/animate_do.dart';

class CardList extends StatelessWidget {

  final List<Cat> listCat;

  const CardList({super.key, required this.listCat});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: VerticalCardPager(
        titles: listCat.map((cat) => cat.name).toList(),
        images: listCat.map((cat) => FadeInUp(
          child: Hero(
            tag: Key(cat.id),
            child: CustomCard(cat: cat)
          )
        )).toList(),
        textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        onSelectedItem: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(cat: listCat[index]))
          );
        },
        initialPage: 2,
        align: ALIGN.CENTER,
        physics: const ClampingScrollPhysics()
      ),
    );
  }
}