namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.db.Services;
using catalog.db.Models;

[ApiController]
[Route("api/[controller]")]
public class CategoryController : ControllerBase
{
    private readonly CategoryService _categoryService;

    public CategoryController(CategoryService categoryService)
    {
        _categoryService = categoryService;
    }

    [HttpGet]
    public async Task<List<Category>> GetCategory() 
    {
        var categories = await _categoryService.GetAsync();
        return categories;
    }

    [HttpGet("{id:length(24)}")]
    public async Task<Category> GetCategoryById(string Id) 
    {
        var category = await _categoryService.GetAsync(Id);
        return category ?? null;
    }
    
    [HttpPost]
    public async Task<IActionResult> AddUser(Category category)
    {
        await _categoryService.CreateAsync(category);

        return CreatedAtAction(nameof(GetCategoryById), new { id = category.Id }, category);
    }
}
