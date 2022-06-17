using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using catalog.db.Models;
using catalog.db.Services.Interface;

namespace catalog.api.Services
{
	public class CategoryService : ICategoryService
	{
		private readonly IService<Category> _service;

		public CategoryService(IService<Category> service)
		{
			_service = service;
		}

		public async Task<List<Category>> GetAllCategories()
		{
			var response = await _service.GetAsync();
			if (response == null)
			{
				return null;
			}
			return response.ToList();
		}

		public async Task<Category> GetCategoryById(string Id)
		{
			var response = await _service.GetAsync(Id);
			return response;
		}

		public async Task<Category> AddCategory(Category categoryModel)
		{
			var response = await _service.CreateAsync(categoryModel);
			return response;
		}

		public async Task<Category> UpdateCategory(string Id, Category categoryModel)
		{
			var response = await _service.UpdateAsync(Id, categoryModel);
			return response ? categoryModel : null;
		}

		public async Task<bool> DeleteCategory(string Id)
		{
			var response = await _service.RemoveAsync(Id);
			return response;
		}

		

		
	}
}