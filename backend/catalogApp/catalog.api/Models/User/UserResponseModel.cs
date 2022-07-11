using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace catalog.api.Models.User
{
	public class UserResponseModel
	{
		public string UserId { get; set; }
		public string Username { get; set; }
		public string Email { get; set; }
		public string Password { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Address { get; set; }
		public string AccessToken { get; set; }
		public string RefreshToken { get; set; }
	}
}