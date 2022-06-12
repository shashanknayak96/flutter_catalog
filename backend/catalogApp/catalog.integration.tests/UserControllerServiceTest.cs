using catalog.api.Helpers;
using catalog.api.Models.User;
using catalog.api.Services;
using catalog.db.Models;
using catalog.db.Services;
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
		private readonly IEncryptionHelper _encryptionHelper = Substitute.For<IEncryptionHelper>(); 

		public UserControllerServiceTest()
		{
			_sut = new UserControllerService(_userService, _tokenService, _encryptionHelper);
		}

		[Fact]
		public async void RegisterUser_Returns_AuthenticationResult()
		{
			// Arrange
			var userId = "1";
			var userEmail = "xyz@test.com";
			var userPassword = "test@123";
			// var hashedPassword = "$HASHEDtest@123";
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
			_encryptionHelper.CreateHash(userPassword)
				.Returns(userPassword);
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
	}
}