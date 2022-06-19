using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

namespace catalog.api.Controllers
{
	[ApiController]
	[Route("api/[controller]")]
	public class BroadcastController : ControllerBase
	{
		private readonly IHubContext<MessageHub> _hub;
		public BroadcastController(IHubContext<MessageHub> hub)
		{
			_hub = hub;
		}

		[HttpGet]
		public async Task Get(string message)
		{
			await _hub.Clients.All.SendAsync("ReceiveMessage", message);
		}
	}
}