import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListCardShimmer extends StatelessWidget {
  const ListCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300, 
      highlightColor: Colors.grey.shade100, 
      child: SingleChildScrollView(
        child: Column(
          children: [
        
            SizedBox(height: size.height * .2),
            Container(
              width: size.aspectRatio * 450,
              height: size.aspectRatio * 450,
              decoration: buildDecoration(),
            ),
            SizedBox(height: size.height * .05),
            Container(
              width: size.aspectRatio * 400,
              height: size.aspectRatio * 100,
              decoration: buildDecoration(),
            ),
            SizedBox(height: size.height * .05),
            Container(
              width: size.aspectRatio * 300,
              height: size.aspectRatio * 60,
              decoration: buildDecoration(),
            ),
        
          ],
        ),
      ), 
    );
  }

  BoxDecoration buildDecoration() {
    return BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ]);
  }
}
