using catalog.api.Helpers;
using catalog.api.Models;
using catalog.api.Models.User;
using catalog.db.Models;
using catalog.db.Services;
using catalog.db.Services.Interface;

namespace catalog.api.Services;

public class UserControllerService : IUserControllerService
{
	private readonly IUserService _userService;
	private readonly ITokenService _tokenService;
    private readonly IEncryptionHelper _encryptionHelper;

    public UserControllerService(IUserService userService, ITokenService tokenService, IEncryptionHelper encryptionHelper)
	{
		_userService = userService;
		_tokenService = tokenService;
        _encryptionHelper = encryptionHelper;
    }

	public async Task<AuthenticationResult> RegisterUser(UserRegisterModel model)
	{
		var userFromDb = await _userService.GetUserByEmail(model.Email);
		if(userFromDb != null)
			return new AuthenticationResult 
			{
				Error = new[] {"User with email already exist."}
			};

		var hashedPassword = _encryptionHelper.CreateHash(model.Password);
		var newUser = new User {
			Username = model.Email,
			Email = model.Email,
			Password = hashedPassword
		};
		var insertedUser = await _userService.RegisterUser(newUser);

		var token = _tokenService.GenerateAccessToken(insertedUser);
		return new AuthenticationResult 
		{
			Token = token,
			Success = true
		};
	}

	public async Task<AuthenticationResult> LoginUser(UserLoginModel model)
	{
		var userModel = new User {
			Email = model.Email
		};
		var user = await _userService.LoginUser(userModel);
		if(user is null)
			return new AuthenticationResult
			{
				Error = new[] {"Incorrect email or password"}
			};

		var verifyPasswordResult = EncryptionHelper.Verify(model.Password, user.Password);
		if(!verifyPasswordResult)
			return new AuthenticationResult
			{
				Error = new[] {"Incorrect email or password"}
			};

		var accessToken = _tokenService.GenerateAccessToken(user);
		var refreshToken = _tokenService.GenerateRefreshToken();
		
		user.RefreshToken = refreshToken;
		user.RefreshTokenExpirationDate = DateTime.Now.AddDays(15);

		// TODO: Put method in trycatch and return 500 if it fails; return ApiResponse?
		await _userService.UpdateAsync(user.Id, user);


		return new AuthenticationResult{
			Token = accessToken,
			RefreshToken = refreshToken,
			Success = true
		};
	}
}