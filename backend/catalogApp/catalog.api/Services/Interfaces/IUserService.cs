using catalog.api.Models;
using catalog.api.Models.User;

namespace catalog.api.Services.Interfaces
{
	public interface IUserService
	{
		public Task<AuthenticationResult> RegisterUser(UserRegisterModel model);
		public Task<AuthenticationResult> LoginUser(UserLoginModel model);
		Task<(string accessToken, string refreshToken)> RegenerateRefreshToken(TokenApiModel tokenApiModel);
	}
}