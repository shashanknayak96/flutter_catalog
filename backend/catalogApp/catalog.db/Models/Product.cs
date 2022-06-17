using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace catalog.db.Models;

public class Product : Base
{
    public string Name { get; set; }
    public string Description { get; set; }
    public string ImageUrl { get; set; }
    public decimal Price { get; set; }
    public Category Category { get; set; }
    public bool IsTrending { get; set; }
}