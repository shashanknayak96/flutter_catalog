namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.db.Services;
using catalog.db.Models;

[ApiController]
[Route("api/[controller]")]
public class UserController : ControllerBase
{
    private readonly UserService _userService;

    public UserController(UserService userService)
    {
        _userService = userService;
    }

    [HttpGet]
    public async Task<List<User>> GetUser() 
    {
        var users = await _userService.GetAsync();
        return users;
    }


    [HttpGet("{id:length(24)}")]
    public async Task<User> GetUserById(string Id) 
    {
        var user = await _userService.GetAsync(Id);
        return user ?? null;
    }
    
    [HttpPost]
    public async Task<IActionResult> AddUser(User user)
    {
        await _userService.CreateAsync(user);

        return CreatedAtAction(nameof(GetUserById), new { id = user.Id }, user);
    }
}
