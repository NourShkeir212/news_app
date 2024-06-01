abstract class AppSearchStates{}

class AppSearchInitialState extends AppSearchStates{}

class AppSearchLoadingState extends AppSearchStates{}
class AppSearchSuccessState extends AppSearchStates{}
class AppSearchErrorState extends AppSearchStates{
  final String error;

  AppSearchErrorState({required this.error});
}

