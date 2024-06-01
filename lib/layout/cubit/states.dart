abstract class AppNewsStates{}

class AppNewsInitialState extends AppNewsStates{}

class AppNewsChangeBottomNavBarState extends AppNewsStates{}

class AppNewsGetTopHeadLoadingState extends AppNewsStates{}

class AppNewsGetTopHeadLinesSuccessState extends AppNewsStates{}

class AppNewsGetTopHeadLineErrorState extends AppNewsStates {
  final String error;

  AppNewsGetTopHeadLineErrorState({required this.error});
}