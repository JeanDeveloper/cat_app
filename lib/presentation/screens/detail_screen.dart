import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/cat.dart';
import 'package:myapp/presentation/widgets/custom_back_button.dart';
import 'package:myapp/presentation/widgets/custom_body_detail.dart';
import 'package:myapp/presentation/widgets/custom_network_button.dart';

class DetailScreen extends StatelessWidget {
  final Cat cat;

  const DetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                cat.imagePath!,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0,
              child: CustomNetworkButton(url:cat.vetstreetUrl ?? "https://www.google.com/" ),
            ),
            const CustomBackButton(),
            CustomBodyDetail(cat: cat)
          ],
        ),
      ),
    );

  }

}

