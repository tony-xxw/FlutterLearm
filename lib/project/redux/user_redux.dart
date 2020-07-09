import 'package:helloflutter/project/model/User.dart';
import 'package:redux/redux.dart';

final UserReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateLoaded),
]);

User _updateLoaded(User user, action) {
  user = action.userInfo;
  return user;
}

class UpdateUserAction {
  final User userinfo;

  UpdateUserAction(this.userinfo);
}
