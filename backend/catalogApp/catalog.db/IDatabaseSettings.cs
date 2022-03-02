using catalog.db.Models;
using MongoDB.Driver;

public interface IDatabaseSettings
{
    IMongoCollection<User> getUserCollection();
    IMongoCollection<Advertisement> getAdvertisementCollection();
}