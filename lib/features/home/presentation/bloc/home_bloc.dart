import 'package:reminder/ui_export.dart';

class HomeBloc extends Cubit<HomeEvent> {
  HomeBloc(): super(HomeEvent(isLoading: true, data: []));

  Future getListReminder() async {
    emit(HomeEvent(
      isLoading: true,
      data: state.data
    ));

    try {
      await DbHelper.instance.get().then((value) {
        emit(state.copyWith(
          isLoading: false,
          data: value.map((e) => ReminderModel.fromJson(e)).toList()
        ));
      });
    } catch (err, stacktrace) {
      emit(state.copyWith(
        isLoading: false,
        errMsg: '$err'
      ));
    }
  }
}

class HomeEvent {
  final bool isLoading;
  final List<ReminderModel> data;
  final String? errMsg;

  HomeEvent({
    required this.isLoading,
    required this.data,
    this.errMsg
  });

  HomeEvent copyWith({
    bool? isLoading,
    List<ReminderModel>? data,
    String? errMsg
  }) => HomeEvent(
    isLoading: isLoading ?? this.isLoading,
    data: data ?? this.data,
    errMsg: errMsg ?? this.errMsg
  );
}