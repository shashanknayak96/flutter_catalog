namespace catalog.api.Middleware;

public class JwtMiddleware
{
	private readonly RequestDelegate _next;

	public JwtMiddleware(RequestDelegate next)
	{
		_next = next;
	}

	// public async Task Invoke(HttpContext context, ) 
	
}
