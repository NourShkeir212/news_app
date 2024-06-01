import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/widgets/widgets.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    TextEditingController searchController = TextEditingController();
    return BlocProvider(
      create: (context) => AppSearchCubit(),
      child: BlocConsumer<AppSearchCubit, AppSearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppSearchCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: const Text('Search Now'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(state is AppSearchLoadingState)
                    const LinearProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0),
                            child: Form(
                              key: key,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (value) {
                                  if (key.currentState!.validate()) {
                                    cubit.search(search: searchController.text);
                                  }
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please fill the search field';
                                  }
                                  return null;
                                },
                                controller: searchController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  suffixIconColor: Colors.blue.shade900,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade500
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade600
                                      )
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade500
                                      )
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade600
                                      )
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.red.shade400
                                      )
                                  ),
                                  hintText: 'Search',
                                  labelText: "Search Now",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[200]
                                  ),
                                  labelStyle: TextStyle(
                                      color: Colors.grey[500]
                                  ),
                                  suffixIcon: SizedBox(
                                    width: 96,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (key.currentState!.validate()) {
                                              cubit.search(
                                                search: searchController.text,
                                              );
                                            }
                                          },
                                          icon: Icon(
                                            Icons.search,
                                            color: Colors.blue.shade900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          if(state is AppSearchSuccessState &&
                              cubit.searchResultModel != null)
                            Posts(model: cubit.searchResultModel),
                          if(state is AppSearchSuccessState &&
                              cubit.searchResultModel == null)
                            const Center(child: Text('No Data found'))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}





