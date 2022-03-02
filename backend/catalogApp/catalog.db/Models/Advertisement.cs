using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace catalog.db.Models;

public class Advertisement {

    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? Id { get; set; }
    public string Name { get; set; }
    public string ImageUrl { get; set; }
}