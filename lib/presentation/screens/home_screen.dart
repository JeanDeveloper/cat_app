import 'package:flutter/material.dart';
import 'package:myapp/presentation/blocs/cat/cat_bloc.dart';
import 'package:myapp/presentation/widgets/card_list.dart';
import 'package:myapp/presentation/widgets/custom_search_delegate.dart';
import 'package:myapp/presentation/widgets/card_list_shimmer.dart';
import 'package:myapp/presentation/widgets/search_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CatBloc>(context).add(GetCatsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Center(child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {

            if (state is CatInitial || state is CatLoading) {
              return const ListCardShimmer();
            }

            if (state is CatLoaded) {
              final listCat = state.cats;
              return Column(
                children: [

                  FadeInRight(
                    child: AppBarSearch(
                      ontap: () {
                        showSearch(context: context, delegate: CustomSearchDelegate());
                      },
                    ),
                  ),

                  CardList( listCat: listCat )

                ],
              );
            }

            return Container();
          },
        )),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('CatBreeds'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }


}
