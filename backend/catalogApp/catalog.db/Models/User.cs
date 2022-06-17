using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace catalog.db.Models;

public class User : Base 
{
	public string Username { get; set; }
	public string Email { get; set; }
	public string Password { get; set; }
	public string FirstName { get; set; }
	public string LastName { get; set; }
	public string Address { get; set; }
	public string RefreshToken { get; set; }
	public DateTime RefreshTokenExpirationDate { get; set; }
}