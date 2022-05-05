using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace catalog.db.Models;

public class User {

	[BsonId]
	[BsonRepresentation(BsonType.ObjectId)]
	#nullable enable
	public string? Id { get; set; }
	#nullable disable
	public string Username { get; set; }
	public string Email { get; set; }
	public string Password { get; set; }
	public string FirstName { get; set; }
	public string LastName { get; set; }
	public string Address { get; set; }
}