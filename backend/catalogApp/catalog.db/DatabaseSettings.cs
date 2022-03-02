using catalog.db.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace catalog.db;

public class DatabaseSettings : IDatabaseSettings
{
    private readonly IMongoDatabase _mongoDatabase;
    private readonly string _usersCollection;
    private readonly string _advertisementCollection;

    public DatabaseSettings(IOptions<ConfigurationManager> databaseSettings)
    {
        var mongoClient = new MongoClient(databaseSettings.Value.ConnectionString);
        _mongoDatabase = mongoClient.GetDatabase(databaseSettings.Value.DatabaseName);
        _usersCollection = databaseSettings.Value.UsersCollection;
        _advertisementCollection = databaseSettings.Value.AdvertisementCollection;
    }

    public IMongoCollection<User> getUserCollection()
    {
        return _mongoDatabase.GetCollection<User>(_usersCollection);
    }

    public IMongoCollection<Advertisement> getAdvertisementCollection()
    {
        return _mongoDatabase.GetCollection<Advertisement>(_advertisementCollection);
    }
}