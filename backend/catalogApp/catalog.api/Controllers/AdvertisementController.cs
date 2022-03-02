namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.db.Services;
using catalog.db.Models;

[ApiController]
[Route("api/[controller]")]
public class AdvertisementController : ControllerBase
{
    private readonly AdvertisementService _advertisementService;

    public AdvertisementController(AdvertisementService advertisementService)
    {
        _advertisementService = advertisementService;
    }

    [HttpGet]
    public async Task<List<Advertisement>> GetUser() 
    {
        var users = await _advertisementService.GetAsync();
        return users;
    }

    [HttpGet("{id:length(24)}")]
    public async Task<Advertisement> GetUserById(string Id) 
    {
        var user = await _advertisementService.GetAsync(Id);
        return user ?? null;
    }
    
    [HttpPost]
    public async Task<IActionResult> AddUser(Advertisement advertisement)
    {
        await _advertisementService.CreateAsync(advertisement);

        return CreatedAtAction(nameof(GetUserById), new { id = advertisement.Id }, advertisement);
    }
}
