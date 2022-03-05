using catalog.db.Models;
using MongoDB.Driver;
using catalog.db.Services.Interface;

namespace catalog.db.Services;

public class CategoryService : IService<Category>
{ 
    private readonly IDatabaseSettings _databaseSet;

    public CategoryService(IDatabaseSettings databaseSet)
    {
        _databaseSet = databaseSet;
    }

    public async Task<List<Category>> GetAsync() =>
        await _databaseSet.getCategoryCollection().Find(_ => true).ToListAsync();

    
    #nullable enable
    public async Task<Category?> GetAsync(string id) => 
        await _databaseSet.getCategoryCollection().Find(x => x.Id == id).FirstOrDefaultAsync();
    #nullable disable
    
    public async Task CreateAsync(Category category) =>
        await _databaseSet.getCategoryCollection().InsertOneAsync(category);

    public async Task UpdateAsync(string id, Category updatedCategory) =>
        await _databaseSet.getCategoryCollection().ReplaceOneAsync(x => x.Id == id, updatedCategory);

    public async Task RemoveAsync(string id) =>
        await _databaseSet.getCategoryCollection().DeleteOneAsync(x => x.Id == id);
}
