import '../../models/user.dart';
import 'AbstractService.dart';

abstract class AbstractAuthenticationService extends AbstractService {
  register(UserRegisterModel userRegisterModel) {}
  login(UserLoginModel userRegisterModel) {}
}
