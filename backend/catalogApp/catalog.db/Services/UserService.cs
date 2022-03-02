using catalog.db.Models;
using MongoDB.Driver;
using catalog.db.Services.Interface;

namespace catalog.db.Services;

public class UserService : IService<User>
{ 
    private readonly IDatabaseSettings _databaseSet;

    public UserService(IDatabaseSettings databaseSet)
    {
        _databaseSet = databaseSet;
    }

    public async Task<List<User>> GetAsync() =>
        await _databaseSet.getUserCollection().Find(_ => true).ToListAsync();

    public async Task<User?> GetAsync(string id) => 
        await _databaseSet.getUserCollection().Find(x => x.Id == id).FirstOrDefaultAsync();
    public async Task CreateAsync(User user) =>
        await _databaseSet.getUserCollection().InsertOneAsync(user);

    public async Task UpdateAsync(string id, User updatedUser) =>
        await _databaseSet.getUserCollection().ReplaceOneAsync(x => x.Id == id, updatedUser);

    public async Task RemoveAsync(string id) =>
        await _databaseSet.getUserCollection().DeleteOneAsync(x => x.Id == id);
}
