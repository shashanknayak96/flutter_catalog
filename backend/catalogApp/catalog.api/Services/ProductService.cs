using catalog.api.Services.Interfaces;
using catalog.db.Models;
using catalog.db.Services.Interface;
using MongoDB.Driver;

namespace catalog.api.Services
{
	public class ProductService : IProductService
	{
		private readonly IService<Product> _service;

		public ProductService(IService<Product> service)
		{
			_service = service;
		}

		public async Task<Product> AddProduct(Product productModel)
		{
			var response = await _service.CreateAsync(productModel);
			return response;
		}

		public async Task<List<Product>> GetAllTrendingProducts()
		{
			var response = await _service.GetAsyncByFilter(x => x.IsTrending == true);
			return response.ToList();
		}

		public async Task<List<Product>> GetProductsByCategoryName(string categoryName)
		{
			// var filter = Builders<Product>.Filter.Regex(x => x.Category.Name, $"/{categoryName}/i");
			// return await (await _databaseSet.getProductCollection().FindAsync(filter).ConfigureAwait(false)).ToListAsync();
			var response = await _service.GetAsyncByFilter(x => x.Category.Name.Contains(categoryName));
			return response.ToList();
		}

		public async Task<Product> GetProductsById(string id)
		{
			var response = await _service.GetAsync(id);
			return response;
		}

		public async Task<List<Product>> GetProductsByName(string productName)
		{
			var response = await _service.GetAsyncByFilter(x => x.Name == productName);
			return response.ToList();
		}
	}
}