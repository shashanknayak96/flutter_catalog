using catalog.db.Models;
using catalog.db.Services.Interface;
using MongoDB.Driver;

namespace catalog.db.Services;

public class AdvertisementService : IService<Advertisement>
{
   private readonly IDatabaseSettings _databaseSet;

    public AdvertisementService(IDatabaseSettings databaseSet)
    {
        _databaseSet = databaseSet;
    }
    
    public async Task<List<Advertisement>> GetAsync() =>
        await _databaseSet.getAdvertisementCollection().Find(_ => true).ToListAsync();

    #nullable enable
    public async Task<Advertisement?> GetAsync(string id) => 
        await _databaseSet.getAdvertisementCollection().Find(x => x.Id == id).FirstOrDefaultAsync();
    #nullable disable
    public async Task CreateAsync(Advertisement user) =>
        await _databaseSet.getAdvertisementCollection().InsertOneAsync(user);

    public async Task UpdateAsync(string id, Advertisement updatedUser) =>
        await _databaseSet.getAdvertisementCollection().ReplaceOneAsync(x => x.Id == id, updatedUser);

    public async Task RemoveAsync(string id) =>
        await _databaseSet.getAdvertisementCollection().DeleteOneAsync(x => x.Id == id);
}