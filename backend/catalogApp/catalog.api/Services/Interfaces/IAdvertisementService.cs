using catalog.db.Models;

namespace catalog.api.Services.Interfaces
{
	public interface IAdvertisementService
	{
		public Task<List<Advertisement>> GetAllAdvertisements();
		public Task<Advertisement> GetAdvertisementById(string Id);
		public Task<Advertisement> AddAdvertisement(Advertisement Id);
	}
}