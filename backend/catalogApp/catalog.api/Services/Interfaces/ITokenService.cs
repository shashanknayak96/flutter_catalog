using System.Security.Claims;
using catalog.db.Models;

namespace catalog.api.Services
{
	public interface ITokenService
	{
		string GenerateAccessToken(User user);
		string GenerateRefreshToken();
		ClaimsPrincipal GetPrincipalFromExpiredToken(string token);
	}
}