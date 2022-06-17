using catalog.db.Models;

namespace catalog.api.Services.Interfaces
{
	public interface IProductService
	{
		Task<Product> GetProductsById(string id);
		Task<List<Product>> GetProductsByName(string productName);
		Task<List<Product>> GetProductsByCategoryName(string categoryName);
		Task<List<Product>> GetAllTrendingProducts();
		Task<Product> AddProduct(Product productModel);
	}
}