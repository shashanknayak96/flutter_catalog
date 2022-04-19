using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
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
        // Check if user exists
        var userFromDb = await _userService.GetUserByEmail(model.Email);
        if(userFromDb != null)
            return new AuthenticationResult 
            {
                Error = new[] {"User with email already exist."}
            };

        // Register User
        var newUser = new User {
            Username = model.Email,
            Email = model.Email,
        };
        var insertedUser = await _userService.RegisterUser(newUser);
        if(insertedUser.Id == null)
        {
            return new AuthenticationResult 
            {
                Error = new[] {"Internal server error"}
            };
        }

        // Generate token for user
        var tokenHandler = new JwtSecurityTokenHandler();
        var key = Encoding.ASCII.GetBytes(_jwtSettings.Secret);
        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(
                new [] {
                    new Claim(JwtRegisteredClaimNames.Sub, newUser.Email),
                    new Claim(JwtRegisteredClaimNames.Email, newUser.Email),
                    new Claim("id","123")
                }),
            Expires = DateTime.UtcNow.AddHours(2),
            SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
        };

        var token = tokenHandler.CreateToken(tokenDescriptor);

        return new AuthenticationResult
        {
            Token = tokenHandler.WriteToken(token),
            Success = true,
        };
    }
}