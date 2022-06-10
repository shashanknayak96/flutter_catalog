using catalog.api.Models;
using catalog.api.Models.Enums;
using catalog.api.Services;
using catalog.db.Services;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class TokenController : ControllerBase
{
	private readonly ITokenControllerService _tokenControllerService;
	private readonly UserService _userService;

	public TokenController(ITokenControllerService tokenControllerService)
	{
		_tokenControllerService = tokenControllerService;
	}

	[HttpPost]
	[Route("refresh")]
	public async Task <ApiResponse> Refresh(TokenApiModel tokenApiModel)
	{
		if (tokenApiModel.AccessToken is null || tokenApiModel.RefreshToken is null)
			return new ApiResponse(400,errorMessage: "Invalid token");

		var newAccessToken = String.Empty;
		var newRefreshToken = String.Empty;		
		(newAccessToken, newRefreshToken)= await _tokenControllerService.RegenerateRefreshToken(tokenApiModel);
		
		return new ApiResponse(200, 
			new AuthenticationResult()
			{
				Token = newAccessToken,
				RefreshToken = newRefreshToken,
				Success = true
			}
		);
	}

	// TODO: Add controller to revoke refresh token
}