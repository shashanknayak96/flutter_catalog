using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using catalog.api.Helpers;
using catalog.api.Models;
using catalog.api.Models.User;
using catalog.db.Models;
using catalog.db.Services;
using Microsoft.IdentityModel.Tokens;

namespace catalog.api.Services;

public class UserControllerService : IUserControllerService
{
	private readonly UserService _userService;
	private readonly JwtSettings _jwtSettings;

	public UserControllerService(UserService userService, JwtSettings jwtSettings)
	{
		_userService = userService;
		_jwtSettings = jwtSettings;
	}

	public async Task<AuthenticationResult> RegisterUser(UserRegisterModel model)
	{
		var userFromDb = await _userService.GetUserByEmail(model.Email);
		if(userFromDb != null)
			return new AuthenticationResult 
			{
				Error = new[] {"User with email already exist."}
			};

		var hashedPassword = EncryptionHelper.CreateHash(model.Password);
		var newUser = new User {
			Username = model.Email,
			Email = model.Email,
			Password = hashedPassword
		};
		var insertedUser = await _userService.RegisterUser(newUser);

		var token = GenerateToken(insertedUser);
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

		var token = GenerateToken(user);
		return new AuthenticationResult{
			Token = token,
			Success = true
		};
	}

	// Private methods
	private string GenerateToken(User userData)
	{
		var tokenHandler = new JwtSecurityTokenHandler();
		var key = Encoding.ASCII.GetBytes(_jwtSettings.Secret);
		var tokenDescriptor = new SecurityTokenDescriptor
		{
			Subject = new ClaimsIdentity(
				new [] {
					new Claim(JwtRegisteredClaimNames.Sub, userData.Email),
					new Claim(JwtRegisteredClaimNames.Email, userData.Email),
					new Claim("id", userData.Id)
				}),
			Expires = DateTime.UtcNow.AddHours(2),
			SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
		};

		var token = tokenHandler.CreateToken(tokenDescriptor);
		return tokenHandler.WriteToken(token);
	}
}