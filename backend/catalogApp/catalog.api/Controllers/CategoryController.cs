namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.db.Models;
using catalog.api.Services;
using catalog.api.Models;
using System.Net;

[ApiController]
[Route("api/[controller]")]
public class CategoryController : ControllerBase
{
	private readonly ICategoryService _categoryService;

	public CategoryController(ICategoryService categoryService)
	{
		_categoryService = categoryService;
	}

	[HttpGet]
	public async Task<ApiResponse> GetCategory() 
	{
		var categories = await _categoryService.GetAllCategories();
		if (categories == null)
			return new ApiResponse(HttpStatusCode.NotFound, null, "Categories not found");
		return new ApiResponse(HttpStatusCode.OK, categories);
	}

	[HttpGet("{Id}")]
	public async Task<ApiResponse> GetCategoryById(string Id) 
	{
		if(string.IsNullOrEmpty(Id))
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Category Id cannot be null or empty");
		}
		var category = await _categoryService.GetCategoryById(Id);
		if (category == null)
			return new ApiResponse(HttpStatusCode.NotFound, null, "Categories not found");
		return new ApiResponse(HttpStatusCode.OK, category);
	}
	
	[HttpPost]
	public async Task<ApiResponse> AddCategory(Category category)
	{
		if(category == null)
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Category model cannot be null or empty");
		}
		var response = await _categoryService.AddCategory(category);
		if (category == null)
			return new ApiResponse(HttpStatusCode.InternalServerError, null, "Categorie cannot be added.");
		return new ApiResponse(HttpStatusCode.OK, category);
	}
}
