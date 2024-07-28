import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomNetworkButton extends StatelessWidget {

  final String url;

  const CustomNetworkButton({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () async {
          final Uri urlUri = Uri.parse(url);
          if (!await launchUrl(urlUri)) {
            throw Exception('Could not launch $url');
          }
        } ,
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: size.aspectRatio * 55,
          width: size.aspectRatio * 55,
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(25)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: size.aspectRatio * 55,
              width: size.aspectRatio * 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.share_sharp,
                size:  size.aspectRatio * 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}