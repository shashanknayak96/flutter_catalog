using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;


namespace catalog.db.Models;

public class Category : Base
{
	public string Name { get; set; }
}