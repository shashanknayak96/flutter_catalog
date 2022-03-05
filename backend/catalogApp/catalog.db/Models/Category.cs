using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;


namespace catalog.db.Models;

public class Category {
    
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    #nullable enable
    public string? Id { get; set; }
    #nullable disable
    public string Name { get; set; }
}