namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.api.Models.User;
using catalog.api.Models;
using System.Net;
using catalog.api.Services.Interfaces;

[ApiController]
[Route("api/[controller]")]
public class UserController : ControllerBase
{
	private readonly IUserService _userService;

	public UserController(IUserService userService)
	{
		_userService = userService;
	}

	[HttpPost("register")]
	public async Task<ApiResponse> RegisterUser(UserRegisterModel user)
	{
		if(user == null)
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Incorrect username or password");
		}
		var response = await _userService.RegisterUser(user);
		if(!response.Success)
			return new ApiResponse(HttpStatusCode.Conflict, response);
		return new ApiResponse(HttpStatusCode.OK, response);
	}

	[HttpPost("login")]
	public async Task<ApiResponse> LoginUser(UserLoginModel user)
	{
		if(user == null)
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Incorrect username or password");
		}
		var response = await _userService.LoginUser(user);
		if(response == null)
			return new ApiResponse(HttpStatusCode.NotFound);
		return new ApiResponse(HttpStatusCode.OK, response);
	}

	[HttpPost]
	[Route("refresh")]
	public async Task <ApiResponse> Refresh(TokenApiModel tokenApiModel)
	{
		if (tokenApiModel.AccessToken is null || tokenApiModel.RefreshToken is null)
			return new ApiResponse(HttpStatusCode.Unauthorized,errorMessage: "Invalid token");

		var newAccessToken = String.Empty;
		var newRefreshToken = String.Empty;		
		(newAccessToken, newRefreshToken)= await _userService.RegenerateRefreshToken(tokenApiModel);

		return new ApiResponse(HttpStatusCode.OK, 
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
