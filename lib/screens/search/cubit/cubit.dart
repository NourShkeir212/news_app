import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/topHeadLineModel.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'states.dart';


class AppSearchCubit extends Cubit<AppSearchStates> {
  AppSearchCubit() : super(AppSearchInitialState());

  static AppSearchCubit get(context) => BlocProvider.of(context);


  NewsModel searchResultModel = NewsModel();

  search({
    required String search,
  }) async {
    try {
      emit(AppSearchLoadingState());
      var response = await DioHelper.getData(
          url: AppConstants.EVERYTHING,
          query: {
            'apiKey': AppConstants.API_KEY,
            'q': search,
          }
      );
      if (response.statusCode == 200) {
        searchResultModel = NewsModel.fromJson(response.data);
        emit(AppSearchSuccessState());
      }
    } catch (error) {
      emit(AppSearchErrorState(error: error.toString()));
    }
  }




}