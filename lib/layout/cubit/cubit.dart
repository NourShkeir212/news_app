import 'package:flutter/material.dart';
import '../../model/topHeadLineModel.dart';
import '../../screens/business/business.dart';
import '../../screens/science/science.dart';
import '../../screens/sports/sports.dart';
import '../../screens/technology/technology.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNewsCubit extends Cubit<AppNewsStates> {
  AppNewsCubit() : super(AppNewsInitialState());

  static AppNewsCubit get(context) => BlocProvider.of(context);


  List<BottomNavigationBarItem> bottomNavBarItem = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.phone_android),
        label: 'Technology'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'
    ),
  ];
  List<Widget> screens = const[
    SportsScreen(),
    BusinessScreen(),
    TechnologyScreen(),
    ScienceScreen()
  ];
  List<String> titles = [
    'Sports',
    'Business',
    'Technology',
    'Science',
  ];

  int currentIndex = 0;

  changeBottomNavBar(int index) async {
    currentIndex = index;
    if (index == 0) {
      await getTopHeadLineNews(category: 'sports');
    }
    else if (index == 1) {
      await getTopHeadLineNews(category: 'business');
    }
    else if (index == 2) {
      await getTopHeadLineNews(category: 'technology');
    }
    else if (index == 3) {
      await getTopHeadLineNews(category: 'science');
    }
    emit(AppNewsChangeBottomNavBarState());
  }


  NewsModel sportsModel = NewsModel();
  NewsModel businessModel = NewsModel();
  NewsModel technologyModel = NewsModel();
  NewsModel scienceModel = NewsModel();


  Future getTopHeadLineNews({
    String country = 'us',
    required String category
  }) async {
    try {
      emit(AppNewsGetTopHeadLoadingState());
      var response = await DioHelper.getData(
        url: AppConstants.TOP_HEAD_LINE_NEWS,
        query: {
          'country': country,
          'category': category,
          'apiKey': AppConstants.API_KEY
        },
      );
      if (response.statusCode == 200) {
        if (category == "sports") {
          sportsModel = NewsModel.fromJson(response.data);
        } else if (category == "business") {
          businessModel = NewsModel.fromJson(response.data);
        } else if (category == "technology") {
          technologyModel = NewsModel.fromJson(response.data);
        } else {
          scienceModel = NewsModel.fromJson(response.data);
        }
        emit(AppNewsGetTopHeadLinesSuccessState());
      }
    } catch (error) {
      emit(AppNewsGetTopHeadLineErrorState(error: error.toString()));
    }
  }

}