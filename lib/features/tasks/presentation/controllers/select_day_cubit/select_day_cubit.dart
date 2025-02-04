import 'package:flutter_bloc/flutter_bloc.dart';


class SelectDayCubit extends Cubit<int> {
  SelectDayCubit() : super(0);
final List<DateTime> days =
      List.generate(5, (index) => DateTime.now().add(Duration(days: index)));
  void selectDay({required int index}) => emit(index);
}
