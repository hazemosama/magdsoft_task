import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/business_logic/global_cubit/global_states.dart';
import 'package:magdsoft_task/data/local/cache_helper.dart';

class GlobalCubit extends Cubit<GlobalStates> {
  GlobalCubit() : super(GlobalInitialState());

  static GlobalCubit get(context) => BlocProvider.of(context);
  bool? isEnglish = true;

  void changeAppLang({bool? fromShared}) {
    if (fromShared != null) {
      isEnglish = fromShared;
      emit(ChangeAppLanguageState());
    } else {
      isEnglish = !isEnglish!;
      CacheHelper.saveData(key: 'isEnglish', value: isEnglish!).then((value) {
        emit(ChangeAppLanguageState());
      });
    }
  }
}
