using catalog.db.Models;
using MongoDB.Driver;
using catalog.db.Services.Interface;

namespace catalog.db.Services;

public class UserService : IUserService
{ 
	private readonly IDatabaseSettings _databaseSet;

	public UserService(IDatabaseSettings databaseSet)
	{
		_databaseSet = databaseSet;
	}

	public async Task<List<User>> GetAsync() =>
		await _databaseSet.getUserCollection().Find(_ => true).ToListAsync();

	#nullable enable
	public async Task<User?> GetAsync(string id) => 
		await _databaseSet.getUserCollection().Find(x => x.Id == id).FirstOrDefaultAsync();
	#nullable disable

	public async Task<User> GetUserByEmail(string email) => 
		await _databaseSet.getUserCollection().Find(x => x.Email == email).FirstOrDefaultAsync();

	public async Task<User> RegisterUser(User user) {
		await _databaseSet.getUserCollection().InsertOneAsync(user);
		return user;
	}

	public async Task<User> LoginUser(User user) {
		return await _databaseSet.getUserCollection().Find(x => x.Email == user.Email).FirstOrDefaultAsync();
	}

	public async Task CreateAsync(User user) =>
		await _databaseSet.getUserCollection().InsertOneAsync(user);

	public async Task UpdateAsync(string id, User updatedUser) =>
		await _databaseSet.getUserCollection().ReplaceOneAsync(x => x.Id == id, updatedUser);

	public async Task RemoveAsync(string id) =>
		await _databaseSet.getUserCollection().DeleteOneAsync(x => x.Id == id);
}
