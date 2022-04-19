namespace catalog.api.Controllers;

using Microsoft.AspNetCore.Mvc;
using catalog.db.Services;
using catalog.db.Models;
using catalog.api.Models.User;
using catalog.api.Services;

[ApiController]
[Route("api/[controller]")]
public class UserController : ControllerBase
{
    private readonly UserService _userService;
    private readonly IUserControllerService _userControllerService;

    public UserController(UserService userService, IUserControllerService userControllerService)
    {
        _userService = userService;
        _userControllerService = userControllerService;
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

    [HttpPost("register")]
    public async Task<IActionResult> RegisterUser(UserRegisterModel user)
    {
        var response = await _userControllerService.RegisterUser(user);
        if(!response.Success)
            return Conflict();
        return Ok(response.Token);
    }
}
