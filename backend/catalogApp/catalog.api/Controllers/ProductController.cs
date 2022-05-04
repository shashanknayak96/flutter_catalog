namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.db.Services;
using catalog.db.Models;
using catalog.api.Models;

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

    [HttpGet("category")]
    public async Task<List<Product>> GetProductByCategoryName([FromQuery] string name) 
    {
        var product = await _productService.GetByCategoryName(name);
        return product ?? null;
    }

    [HttpGet]
    public async Task<ApiResponse> GetProductByName([FromQuery] string name) 
    {
        var product = await _productService.GetByProductName(name);
        return new ApiResponse(200, product ?? null);
    }
    
    [HttpGet("trending")]
    public async Task<List<Product>> GetAllTrendingProducts() 
    {
        var product = await _productService.GetAllTrendingProducts();
        return product ?? null;
    }

    [HttpPost]
    public async Task<IActionResult> AddProduct(Product product)
    {
        await _productService.CreateAsync(product);

        return CreatedAtAction(nameof(AddProduct), new { id = product.Id }, product);
    }
}
