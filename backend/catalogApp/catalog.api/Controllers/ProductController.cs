namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.db.Services;
using catalog.db.Models;
using catalog.api.Models;
using Microsoft.AspNetCore.Authorization;
using System.Net;
using catalog.api.Services.Interfaces;

[ApiController]
[Authorize]
[Route("api/[controller]")]
public class ProductController : ControllerBase
{
	private readonly IProductService _productService;

	public ProductController(IProductService productService)
	{
		_productService = productService;
	}

	[HttpGet("id")]
	public async Task<ApiResponse> GetProductById(string id) 
	{
		if(string.IsNullOrEmpty(id))
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Id cannot be null or empty");
		}
		var response = await _productService.GetProductsById(id);
		if(response == null)
			return new ApiResponse(HttpStatusCode.NotFound, null, "Product record not found");
		return new ApiResponse(HttpStatusCode.OK, response);
	}

	[HttpGet("category")]
	public async Task<ApiResponse> GetProductByCategoryName([FromQuery] string name) 
	{
		if (string.IsNullOrEmpty(name))
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Category name cannot be null or empty");
		}
		var response = await _productService.GetProductsByCategoryName(name);
		if(response == null)
			return new ApiResponse(HttpStatusCode.NotFound, null, "Product record not found");
		return new ApiResponse(HttpStatusCode.OK, response);
	}

	[HttpGet]
	public async Task<ApiResponse> GetProductByName([FromQuery] string name) 
	{
		if (string.IsNullOrEmpty(name))
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Category name cannot be null or empty");
		}
		var response = await _productService.GetProductsByName(name);
		if(response == null)
			return new ApiResponse(HttpStatusCode.NotFound, null, "Product record not found");
		return new ApiResponse(HttpStatusCode.OK, response);
	}
	
	[HttpGet("trending")]
	public async Task<ApiResponse> GetAllTrendingProducts() 
	{
		var response = await _productService.GetAllTrendingProducts();
		if(response == null)
			return new ApiResponse(HttpStatusCode.NotFound, null, "No trending products found");
		return new ApiResponse(HttpStatusCode.OK, response);
	}

	[HttpPost]
	public async Task<ApiResponse> AddProduct(Product product)
	{
		if (product == null)
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Product name cannot be null or empty");
		}
		var response = await _productService.AddProduct(product);
		if(response == null)
			return new ApiResponse(HttpStatusCode.InternalServerError, null, "Product cannot be added");
		return new ApiResponse(HttpStatusCode.OK, response);
	}
}
