using catalog.db.Models;
using MongoDB.Driver;
using Microsoft.Extensions.Options;


namespace catalog.db.Services;

public class UserService
{
    private readonly IMongoCollection<User> _usersCollection;

    public UserService(IOptions<DatabaseSettings> databaseSettings)
    {
        var mongoClient = new MongoClient(
            databaseSettings.Value.ConnectionString);

        var mongoDatabase = mongoClient.GetDatabase(
            databaseSettings.Value.DatabaseName);

        _usersCollection = mongoDatabase.GetCollection<User>(
            databaseSettings.Value.UsersCollection);
    }

    public async Task<List<User>> GetAsync() =>
        await _usersCollection.Find(_ => true).ToListAsync();

    public async Task<User?> GetAsync(string id) => 
        await _usersCollection.Find(x => x.Id == id).FirstOrDefaultAsync();
    public async Task CreateAsync(User user) =>
        await _usersCollection.InsertOneAsync(user);

    public async Task UpdateAsync(string id, User updatedUser) =>
        await _usersCollection.ReplaceOneAsync(x => x.Id == id, updatedUser);

    public async Task RemoveAsync(string id) =>
        await _usersCollection.DeleteOneAsync(x => x.Id == id);
}
