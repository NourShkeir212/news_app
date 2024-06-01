import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../layout/cubit/states.dart';
import '../../model/topHeadLineModel.dart';
import '../widgets/widgets.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

String formatDate(String date) {
  DateTime dateTime = DateTime.parse(date).toLocal();
  var format = DateFormat('EEEE, MMMM d, y');
  String formattedDate = format.format(dateTime);
  return formattedDate;
}

Widget handleTheConditionsToBuildTheScreen({required AppNewsStates state,required NewsModel model}) {
  if (state is AppNewsGetTopHeadLoadingState) {
    return const CircularProgressIndicator();
  } else if (state is AppNewsGetTopHeadLineErrorState) {
    return const NoDataFound();
  } else if (state is AppNewsGetTopHeadLinesSuccessState && model == null) {
    return const NoDataFound();
  } else {
    return state is AppNewsGetTopHeadLineErrorState && model == null
        ? const NoDataFound()
        : Posts(model: model);
  }
}
