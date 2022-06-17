using System.Linq.Expressions;

namespace catalog.db.Services.Interface;

public interface IService<T>
{
	Task<IEnumerable<T>> GetAsync();
	Task<T> GetAsync(string id);
	Task<IEnumerable<T>> GetAsyncByFilter(Expression<Func<T, bool>> filter);
	Task<T> CreateAsync(T user);
	Task<bool> UpdateAsync(string id, T updatedUser);
	Task<bool> RemoveAsync(string id);
}