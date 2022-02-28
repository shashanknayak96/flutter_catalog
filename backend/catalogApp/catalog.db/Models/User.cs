using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace catalog.db.Models;

public class User {

    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Address { get; set; }
}