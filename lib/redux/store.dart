import 'package:redux/redux.dart';

import 'package:all_things_eswatini/redux/reducers.dart';
import 'package:all_things_eswatini/redux/state.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
  );
}