namespace catalog.db.Services.Interface;

public interface IService<T>
{
    Task<List<T>> GetAsync();
    Task<T?> GetAsync(string id);
    Task CreateAsync(T user);
    Task UpdateAsync(string id, T updatedUser);
    Task RemoveAsync(string id);    
} 