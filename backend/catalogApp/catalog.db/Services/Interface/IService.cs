namespace catalog.db.Services.Interface;

public interface IService<T>
{
    Task<List<T>> GetAsync();

    #nullable enable
    Task<T?> GetAsync(string id);
    #nullable disable

    Task CreateAsync(T user);
    Task UpdateAsync(string id, T updatedUser);
    Task RemoveAsync(string id);    
} 