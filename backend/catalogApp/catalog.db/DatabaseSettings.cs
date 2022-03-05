using catalog.db.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace catalog.db;

public class DatabaseSettings : IDatabaseSettings
{
    private readonly IMongoDatabase _mongoDatabase;
    private readonly string _usersCollection;
    private readonly string _advertisementCollection;
    private readonly string _categoryCollection;
    private readonly string _productCollection;

    public DatabaseSettings(IOptions<DatabaseManager> databaseSettings)
    {
        var mongoClient = new MongoClient(databaseSettings.Value.ConnectionString);
        _mongoDatabase = mongoClient.GetDatabase(databaseSettings.Value.DatabaseName);
        _usersCollection = databaseSettings.Value.UsersCollection;
        _advertisementCollection = databaseSettings.Value.AdvertisementCollection;
        _categoryCollection = databaseSettings.Value.CategoryCollection;
        _productCollection = databaseSettings.Value.ProductCollection;
    }

    public IMongoCollection<User> getUserCollection()
    {
        return _mongoDatabase.GetCollection<User>(_usersCollection);
    }

    public IMongoCollection<Advertisement> getAdvertisementCollection()
    {
        return _mongoDatabase.GetCollection<Advertisement>(_advertisementCollection);
    }

    public IMongoCollection<Category> getCategoryCollection()
    {
        return _mongoDatabase.GetCollection<Category>(_categoryCollection);
    }

    public IMongoCollection<Product> getProductCollection()
    {
        return _mongoDatabase.GetCollection<Product>(_productCollection);
    }
}