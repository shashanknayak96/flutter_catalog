using catalog.api.Models;
using catalog.api.Models.Enums;
using catalog.db.Services;

namespace catalog.api.Services
{
	public class TokenControllerService : ITokenControllerService
	{
		private readonly UserService _userService;
		private readonly ITokenService _tokenService;

		public TokenControllerService(UserService userService, ITokenService tokenService)
		{
			_userService = userService;
			_tokenService = tokenService;
		}

		public async Task<(string accessToken, string refreshToken)> RegenerateRefreshToken(TokenApiModel tokenApiModel)
		{
			string accessToken = tokenApiModel.AccessToken;
			string refreshToken = tokenApiModel.RefreshToken;
			var principal = _tokenService.GetPrincipalFromExpiredToken(accessToken);

			var userId = principal.Claims.Where(c => c.Type == ClaimsTypeEnum.ClaimId.ToString()).FirstOrDefault().Value;
			if (userId is null)
				return (null, null);

			var userModel = await _userService.GetAsync(userId);
			if (userModel is null)
				return (null, null);

			var newAccessToken = _tokenService.GenerateAccessToken(userModel);
			var newRefreshToken = _tokenService.GenerateRefreshToken();

			// Force user to mandatorily login after refresh token expires.
			userModel.RefreshToken = newRefreshToken;

			await _userService.UpdateAsync(userModel.Id, userModel);

			return (newAccessToken, newRefreshToken);
		}
	}
}