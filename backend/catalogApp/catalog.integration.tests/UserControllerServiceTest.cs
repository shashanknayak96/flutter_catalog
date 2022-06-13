using catalog.api.Helpers;
using catalog.api.Models.User;
using catalog.api.Services;
using catalog.db.Models;
using catalog.db.Services.Interface;
using NSubstitute;
using NSubstitute.ReturnsExtensions;

namespace catalog.integration.tests
{
	public class UserControllerServiceTest
	{
		private readonly UserControllerService _sut;
		private readonly IUserService _userService = Substitute.For<IUserService>();
		private readonly ITokenService _tokenService = Substitute.For<ITokenService>(); 

		public UserControllerServiceTest()
		{
			_sut = new UserControllerService(_userService, _tokenService);
		}

		[Fact]
		public async void RegisterUser_WhenUserDoesntExist_ReturnsSuccess()
		{
			// Arrange
			var userId = "1";
			var userEmail = "xyz@test.com";
			var userPassword = "test@123";
			var accessToken = "accessToken";
			
			UserRegisterModel userRegisterModel = new UserRegisterModel() {
				Email = userEmail,
				Password = userPassword
			};
			User userInsertModel = new User() {
				Username = userEmail,
				Email = userEmail,
				Password = userPassword
			};
			User userInsertedModel = new User() {
				Id = userId,
				Username = userEmail,
				Email = userEmail,
				Password = userPassword
			};

			_userService.GetUserByEmail(userEmail)
				.ReturnsNull();
			_userService.RegisterUser(Arg.Any<User>())
				.Returns<User>(userInsertedModel);
			_tokenService.GenerateAccessToken(userInsertedModel)
				.Returns(accessToken);

			// Act
			var response = await _sut.RegisterUser(userRegisterModel);

			// Assert
			_tokenService.Received(1).GenerateAccessToken(userInsertedModel);
			Assert.IsType<string>(response.Token);
			Assert.Equal(response.Token, accessToken);
			Assert.True(response.Success);
		}

		[Fact]
		public async void RegisterUser_WhenUserExists_ReturnsError()
		{
			// Arrange
			var userId = "1";
			var userEmail = "xyz@test.com";
			var userPassword = "test@123";
			
			UserRegisterModel userRegisterModel = new UserRegisterModel() {
				Email = userEmail,
				Password = userPassword
			};
			User userModel = new User() {
				Id = userId,
				Email = userEmail,
				Password = userPassword
			};
			_userService.GetUserByEmail(userEmail)
				.Returns<User>(userModel);

			// Act
			var response = await _sut.RegisterUser(userRegisterModel);

			// Assert
			Assert.False(response.Success);
			Assert.NotNull(response.Error);
		}

		[Fact]
		public async void LoginUser_WhenUsernamePasswordCorrect_ReturnsSuccess()
		{
			// Arrange
			var userId = "1";
			var userEmail = "xyz@test.com";
			var userPassword = "test@123";
			var accessToken = "accessToken";
			var refreshToken = "refreshToken";
			var hashedPassword = EncryptionHelper.CreateHash(userPassword);
			
			UserLoginModel userLoginModel = new UserLoginModel() {
				Email = userEmail,
				Password = userPassword
			};
			User userModel = new User() {
				Id = userId,
				Email = userEmail,
				Password = hashedPassword
			};

			_userService.LoginUser(Arg.Any<User>())
				.Returns<User>(userModel);
			_tokenService.GenerateAccessToken(userModel)
				.Returns<string>(accessToken);
			_tokenService.GenerateRefreshToken()
				.Returns<string>(refreshToken);

			// Act
			var response = await _sut.LoginUser(userLoginModel);

			// Assert
			Assert.True(response.Success);
			Assert.Null(response.Error);
			Assert.Equal(response.Token, accessToken);
			Assert.Equal(response.RefreshToken, refreshToken);
		}

		[Fact]
		public async void LoginUser_WhenEmailIncorrect_ReturnsError()
		{
			// Arrange
			var userEmail = "xyz@test.com";
			var userPassword = "test@123";

			UserLoginModel userLoginModel = new UserLoginModel() {
				Email = userEmail,
				Password = userPassword
			};

			_userService.LoginUser(Arg.Any<User>())
				.ReturnsNull();

			// Act
			var response = await _sut.LoginUser(userLoginModel);

			// Assert
			Assert.False(response.Success);
			Assert.NotNull(response.Error);
			Assert.Equal(response.Error[0], "Incorrect email or password");
		}

		[Fact]
		public async void LoginUser_WhenPasswordIncorrect_ReturnsError()
		{
			// Arrange
			var userId = "1";
			var userEmail = "xyz@test.com";
			var userPassword = "test@123";
			var userIncorrectPassword = "incorrect";
			var hashedPassword = EncryptionHelper.CreateHash(userIncorrectPassword);

			User userModel = new User() {
				Id = userId,
				Email = userEmail,
				Password = hashedPassword
			};

			UserLoginModel userLoginModel = new UserLoginModel() {
				Email = userEmail,
				Password = userPassword
			};

			_userService.LoginUser(Arg.Any<User>())
				.Returns<User>(userModel);

			// Act
			var response = await _sut.LoginUser(userLoginModel);

			// Assert
			Assert.False(response.Success);
			Assert.NotNull(response.Error);
			Assert.Equal(response.Error[0], "Incorrect email or password");
		}
	}
}