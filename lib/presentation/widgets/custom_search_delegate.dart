import 'package:flutter/material.dart';
import 'package:myapp/presentation/blocs/cat/cat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/screens/custom_card.dart';
import 'package:myapp/presentation/screens/detail_screen.dart';
import 'package:myapp/presentation/widgets/card_list.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';


class CustomSearchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
          size: 28,
        ),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final catBloc = context.read<CatBloc>();
    final listCat = catBloc.listCats;
    final listCatFiltered = listCat.where((cat) => cat.name.toLowerCase().contains(query.toLowerCase())).toList();
    return CardList( listCat: listCatFiltered );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final catBloc = context.read<CatBloc>();
    final listCat = catBloc.listCats;
    final listCatFiltered = listCat.where((cat) => cat.name.toLowerCase().contains(query.toLowerCase())).toList();
    return CardList( listCat: listCatFiltered );
  }

}
