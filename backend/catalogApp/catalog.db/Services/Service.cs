using System.Linq.Expressions;
using catalog.db.Models;
using catalog.db.Services.Interface;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace catalog.db.Services
{
	public class Service<T> : IService<T> where T : Base
	{
		private readonly IMongoDatabase _mongoDatabase;
		private readonly IMongoCollection<T> _collection;

		public Service(IOptions<DatabaseManager> databaseSettings)
		{
			var mongoClient = new MongoClient(databaseSettings.Value.ConnectionString);
			_mongoDatabase = mongoClient.GetDatabase(databaseSettings.Value.DatabaseName);
			_collection = _mongoDatabase.GetCollection<T>(typeof(T).Name);
		}

		public async Task<IEnumerable<T>> GetAsync()
		{
			try
			{
				var res = (await _collection.FindAsync(_ => true)).ToEnumerable();
				return res;
			}
			catch (Exception ex)
			{
				return null;
			}
		}

		public async Task<T> GetAsync(string id)
		{
			try
			{
				var res = (await _collection.FindAsync(x => x.Id == id)).FirstOrDefault();
				return res;
			} 
			catch (Exception ex)
			{
				return null;
			}
		}

		public async Task<T> CreateAsync(T obj)
		{
			try
			{
				await _collection.InsertOneAsync(obj);
				return obj;
			}
			catch(Exception ex)
			{
				return null;
			}
		}

		public async Task<IEnumerable<T>> GetAsyncByFilter(Expression<Func<T, bool>> filter)
		{
			var res = (await _collection.FindAsync(filter)).ToEnumerable();
			return res;
		}

		public async Task<bool> UpdateAsync(string id, T updatedUser)
		{
			try
			{
				var res = await _collection.ReplaceOneAsync(x => x.Id == id, updatedUser);
				return res.IsAcknowledged;
			}
			catch (Exception ex)
			{
				return false;
			}
		}

		public async Task<bool> RemoveAsync(string id)
		{
			try
			{
				var response = await _collection.DeleteOneAsync(id);
				return response.DeletedCount > 0 ? true : false;
			}
			catch (Exception ex)
			{
				return false;
			}
		}
		
	}
}