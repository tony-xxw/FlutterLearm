import 'package:helloflutter/project/model/User.dart';
import 'package:helloflutter/project/redux/user_redux.dart';

class XXWState {
  //用户信息
  User userInfo;

  XXWState({this.userInfo});
}

XXWState appReducer(XXWState state, action) {
  return XXWState(
    userInfo: UserReducer(state.userInfo, action),
  );
}