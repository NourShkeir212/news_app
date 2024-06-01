import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/search/search.dart';
import '../shared/components/components.dart';
import '../shared/widgets/widgets.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppNewsCubit, AppNewsStates>(
      listener: (context, state) =>{},
      builder: (context, state) {
        var cubit = AppNewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, const SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavBarItem,
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottomNavBar(index),
          ),
          body: state is AppNewsGetTopHeadLoadingState ||
              cubit.sportsModel == null ?
          const Center(child: CircularProgressIndicator(),)
              : state is AppNewsGetTopHeadLinesSuccessState &&
              cubit.sportsModel == null
              ? const NoDataFound()
              : state is AppNewsGetTopHeadLineErrorState
              ? const NoDataFound()
              : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: cubit.screens[cubit.currentIndex],
          ),
        );
      },
    );
  }
}




