using catalog.api.Helpers;
using catalog.api.Models;
using catalog.api.Models.Enums;
using catalog.api.Models.User;
using catalog.api.Services.Interfaces;
using catalog.db.Models;
using catalog.db.Services.Interface;

namespace catalog.api.Services;

public class UserService : IUserService
{
	private readonly IService<User> _service;
	private readonly ITokenService _tokenService;

	public UserService(IService<User> service, ITokenService tokenService)
	{
		_service = service;
		_tokenService = tokenService;
	}
	public async Task<AuthenticationResult> RegisterUser(UserRegisterModel userRegisterModel)
	{
		var usersFromDb = await _service.GetAsyncByFilter(x => x.Email == userRegisterModel.Email);
		var user = usersFromDb.FirstOrDefault();
		if(user != null)
			return new AuthenticationResult 
			{
				Error = new[] {"User with email already exist."}
			};

		var hashedPassword = EncryptionHelper.CreateHash(userRegisterModel.Password);
		var newUser = new User {
			Username = userRegisterModel.Name,
			Email = userRegisterModel.Email,
			Password = hashedPassword
		};
		var insertedUser = await _service.CreateAsync(newUser);

		var token = _tokenService.GenerateAccessToken(insertedUser);
		var refreshToken = _tokenService.GenerateRefreshToken();
		return new AuthenticationResult 
		{
			userId = insertedUser.Id,
			Token = token,
			RefreshToken = refreshToken,
			Success = true
		};
	}

	public async Task<UserResponseModel> LoginUser(UserLoginModel userLoginModel)
	{
		var userModel = new User {
			Email = userLoginModel.Email
		};
		var usersFromDb = await _service.GetAsyncByFilter(x => x.Email == userLoginModel.Email);
		var user = usersFromDb.FirstOrDefault();
		if(user is null)
			return null;

		var verifyPasswordResult = EncryptionHelper.Verify(userLoginModel.Password, user.Password);
		if(!verifyPasswordResult)
			return null;

		var accessToken = _tokenService.GenerateAccessToken(user);
		var refreshToken = _tokenService.GenerateRefreshToken();
		
		user.RefreshToken = refreshToken;
		user.RefreshTokenExpirationDate = DateTime.Now.AddDays(15);

		// TODO: Put method in trycatch and return 500 if it fails; return ApiResponse?
		await _service.UpdateAsync(user.Id, user);

		return new UserResponseModel{
			UserId = user.Id,
			FirstName = user.FirstName,
			LastName = user.LastName,
			Address = user.Address,
			Email = user.Email,
			AccessToken = accessToken,
			RefreshToken = refreshToken,
		};
	}

	public async Task<(string accessToken, string refreshToken)> RegenerateRefreshToken(TokenApiModel tokenApiModel)
	{
		var principal = _tokenService.GetPrincipalFromExpiredToken(tokenApiModel.AccessToken);

		var userId = principal.Claims
			.Where(c => c.Type == ClaimsTypeEnum.ClaimId.ToString())
			.FirstOrDefault()
			.Value;
		if (userId is null)
			return (null, null);

		var userModel = await _service.GetAsync(userId);
		if (userModel is null)
			return (null, null);

		var newAccessToken = _tokenService.GenerateAccessToken(userModel);
		var newRefreshToken = _tokenService.GenerateRefreshToken();

		// Force user to mandatorily login after refresh token expires.
		userModel.RefreshToken = newRefreshToken;

		await _service.UpdateAsync(userModel.Id, userModel);

		return (newAccessToken, newRefreshToken);
	}

		// TODO: Add controller to revoke refresh token
}