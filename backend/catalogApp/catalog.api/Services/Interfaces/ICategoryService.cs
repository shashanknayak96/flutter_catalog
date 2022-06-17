using catalog.db.Models;

namespace catalog.api.Services
{
	public interface ICategoryService
	{
		Task<List<Category>> GetAllCategories();
		Task<Category> GetCategoryById(string Id);
		Task<Category> AddCategory(Category categoryModel);
		Task<Category> UpdateCategory(string Id, Category categoryModel);
		Task<bool> DeleteCategory(string Id);
	}
}