using catalog.api.Services.Interfaces;
using catalog.db.Models;
using catalog.db.Services.Interface;

namespace catalog.api.Services 
{
	public class AdvertisementService : IAdvertisementService
	{
		private readonly IService<Advertisement> _service;

		public AdvertisementService(IService<Advertisement> service)
		{
			_service = service;
		}

		public async Task<List<Advertisement>> GetAllAdvertisements()
		{
			var response = await _service.GetAsync();
			if(response == null)
			{
				return null;
			}
			return response.ToList();
		}

		public async Task<Advertisement> GetAdvertisementById(string Id)
		{
			var response = await _service.GetAsync(Id);
			return response;
		}

		public async Task<Advertisement> AddAdvertisement(Advertisement advertisementModel)
		{
			var response = await _service.CreateAsync(advertisementModel);
			return response;
		}
	}
}