namespace catalog.api.Models;

public class AuthenticationResult 
{
    public string Token { get; set; }
    public bool Success { get; set; } = false;
    public string[] Error { get; set; }
}