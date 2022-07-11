namespace catalog.api.Models;

public class AuthenticationResult
{
	public string userId { get; set; }
	public string Token { get; set; }
	public string RefreshToken { get; set; }
	public bool Success { get; set; } = false;
	public string[] Error { get; set; }
}