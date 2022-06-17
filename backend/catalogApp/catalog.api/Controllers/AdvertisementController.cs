namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.db.Models;
using catalog.api.Models;
using System.Net;
using catalog.api.Services.Interfaces;

[ApiController]
[Route("api/[controller]")]
public class AdvertisementController : ControllerBase
{
	private readonly IAdvertisementService _advertisementControllerService;

	public AdvertisementController(IAdvertisementService advertisementControllerService)
	{
		_advertisementControllerService = advertisementControllerService;
	}

	[HttpGet]
	public async Task<ApiResponse> GetAdvertisements() 
	{
		var response = await _advertisementControllerService.GetAllAdvertisements();
		if(response == null)
			return new ApiResponse(HttpStatusCode.NotFound, null, "Advertisement records not found");
		return new ApiResponse(HttpStatusCode.OK, response);
	}

	[HttpGet("{Id}")]
	public async Task<ApiResponse> GetAdvertisementById(string Id) 
	{
		if (string.IsNullOrEmpty(Id))
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Id cannot be null or empty");
		}
		var response = await _advertisementControllerService.GetAdvertisementById(Id);
		if(response == null)
			return new ApiResponse(HttpStatusCode.NotFound, null, "Advertisement record not found");
		return new ApiResponse(HttpStatusCode.OK, response);
	}
	
	[HttpPost]
	public async Task<ApiResponse> AddAdvertisement(Advertisement advertisementModel)
	{
		if(advertisementModel == null)
		{
			return new ApiResponse(HttpStatusCode.BadRequest, null, "Body cannot be null or empty");
		}
		
		var response = await _advertisementControllerService.AddAdvertisement(advertisementModel);
		if(response == null)
			return new ApiResponse(HttpStatusCode.InternalServerError, null, "Advertisement record cannot be added");
		return new ApiResponse(HttpStatusCode.OK, response);
	}
}
