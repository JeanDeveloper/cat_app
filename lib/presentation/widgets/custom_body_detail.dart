import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/cat.dart';
import 'package:country_flags/country_flags.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';


class CustomBodyDetail extends StatelessWidget {
  final Cat cat;
  const CustomBodyDetail({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.6,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), 
              topRight: Radius.circular(20)
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 35,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),

                Text(
                  cat.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                const SizedBox(height: 10),

                Text(
                  cat.temperament,
                  style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.blueGrey)
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    CountryFlag.fromCountryCode(
                      cat.countryCode,
                      shape: const Circle(),
                      height: 30,
                      width: 30,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(cat.lifeSpan,
                        style: Theme.of(context).textTheme.labelMedium
                        // .copyWith(color: mainText),
                        ),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    height: 4,
                  ),
                ),

                Text(
                  "Description",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  cat.description,
                  style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.blueGrey)
                ),

                const SizedBox(
                  height: 10,
                ),

                Text(
                  "Skill",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                const SizedBox(
                  height: 10,
                ),


                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      indicatorRange(context, "adaptability", cat.adaptability),
                      indicatorRange(context, "affection", cat.affectionLevel),
                      indicatorRange(context, "child friendly", cat.childFriendly),
                      indicatorRange(context, "dog friendly", cat.dogFriendly),
                      indicatorRange(context, "energy", cat.energyLevel),
                      indicatorRange(context, "intelligence", cat.intelligence),
                      indicatorRange(context, "health issues", cat.healthIssues),
                      indicatorRange(context, "social needs", cat.socialNeeds),
                      indicatorRange(context, "stranger friendly", cat.strangerFriendly),
                    ],
                  )
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Widget indicatorRange(BuildContext context, String title, int value){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
      
          SfSlider.vertical(
            min: 0.0,
            max: 5.0,
            value: value,
            interval: 20,
            showTicks: true,
            enableTooltip: true,
            onChanged: (value){},
            minorTicksPerInterval: 1,
          ),
      
          Text(title, style: Theme.of(context).textTheme.labelLarge),
      
        ],
      ),
    );
  }

}