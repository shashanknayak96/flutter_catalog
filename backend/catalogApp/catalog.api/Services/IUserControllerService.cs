using catalog.api.Models;
using catalog.api.Models.User;

namespace catalog.api.Services;

public interface IUserControllerService
{
    public Task<AuthenticationResult> RegisterUser(UserRegisterModel model);
    public Task<AuthenticationResult> LoginUser(UserLoginModel model);
}