import 'package:flutter/material.dart';

class AppBarSearch extends StatelessWidget {

  final void Function()? ontap;

  const AppBarSearch({
    super.key, 
    this.ontap
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.aspectRatio * 100,
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      margin: EdgeInsets.symmetric(horizontal: size.width * .05),
      decoration:  buildDecoration(),
      child: InkWell(
        onTap: ontap,
        child: Row(
          children: [
            const Icon(Icons.search),
            SizedBox(width: size.aspectRatio * 20),
            const Expanded(child: Text("Buscar..."))
          ],
        ),
      )
    );
  }

  Decoration buildDecoration(){
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    );
  }
  
}