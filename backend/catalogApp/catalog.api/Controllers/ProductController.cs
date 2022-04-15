namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.db.Services;
using catalog.db.Models;

[ApiController]
[Route("api/[controller]")]
public class ProductController : ControllerBase
{
    private readonly ProductService _productService;

    public ProductController(ProductService productService)
    {
        _productService = productService;
    }

    // [HttpGet]
    // public async Task<List<Product>> GetProduct() 
    // {
    //     var products = await _productService.GetAsync();
    //     return products;
    // }

    [HttpGet("id/{id:length(24)}")]
    public async Task<Product> GetProductById(string Id) 
    {
        var product = await _productService.GetAsync(Id);
        return product ?? null;
    }

    [HttpGet("category/{categoryName}")]
    public async Task<List<Product>> GetProductByCategoryName(string categoryName) 
    {
        var product = await _productService.GetByCategoryName(categoryName);
        return product ?? null;
    }

    [HttpGet("{productName}")]
    public async Task<List<Product>> GetProductByName(string productName) 
    {
        var product = await _productService.GetByProductName(productName);
        return product ?? null;
    }
    
    [HttpGet("trending")]
    public async Task<List<Product>> GetAllTrendingProducts() 
    {
        var product = await _productService.GetAllTrendingProducts();
        return product ?? null;
    }

    [HttpPost]
    public async Task<IActionResult> AddUser(Product product)
    {
        await _productService.CreateAsync(product);

        return CreatedAtAction(nameof(AddUser), new { id = product.Id }, product);
    }
}
