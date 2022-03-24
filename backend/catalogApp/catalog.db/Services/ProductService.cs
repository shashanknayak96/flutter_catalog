using catalog.db.Models;
using MongoDB.Driver;
using catalog.db.Services.Interface;

namespace catalog.db.Services;

public class ProductService : IService<Product>
{ 
    private readonly IDatabaseSettings _databaseSet;

    public ProductService(IDatabaseSettings databaseSet)
    {
        _databaseSet = databaseSet;
    }

    public async Task<List<Product>> GetAsync() =>
        await _databaseSet.getProductCollection().Find(_ => true).ToListAsync();

    
    #nullable enable
    public async Task<Product?> GetAsync(string id) => 
        await _databaseSet.getProductCollection().Find(x => x.Id == id).FirstOrDefaultAsync();
    #nullable disable

    public async Task<List<Product>> GetByCategoryName(string name) =>
        await _databaseSet.getProductCollection().Find(x => x.Category.Name.Contains(name, StringComparison.OrdinalIgnoreCase)).ToListAsync();

    public async Task<List<Product>> GetByProductName(string name) =>
        await _databaseSet.getProductCollection().Find(x => x.Name.Contains(name, StringComparison.OrdinalIgnoreCase)).ToListAsync();

    public async Task<List<Product>> GetAllTrendingProducts(string name) =>
        await _databaseSet.getProductCollection().Find(x => x.IsTrending).ToListAsync();

    public async Task CreateAsync(Product product) =>
        await _databaseSet.getProductCollection().InsertOneAsync(product);

    public async Task UpdateAsync(string id, Product updatedProduct) =>
        await _databaseSet.getProductCollection().ReplaceOneAsync(x => x.Id == id, updatedProduct);

    public async Task RemoveAsync(string id) =>
        await _databaseSet.getProductCollection().DeleteOneAsync(x => x.Id == id);
}
