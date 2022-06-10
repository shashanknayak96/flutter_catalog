using catalog.api.Models;

namespace catalog.api.Services
{
	public interface ITokenControllerService
	{
		Task<(string accessToken, string refreshToken)> RegenerateRefreshToken(TokenApiModel tokenApiModel);
	}
}