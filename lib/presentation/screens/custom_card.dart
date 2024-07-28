import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/cat.dart';

class CustomCard extends StatelessWidget {
  final Cat cat;

  const CustomCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.aspectRatio * 20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.black12),
        image: DecorationImage(
          image: NetworkImage(
            cat.imagePath ?? '',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
