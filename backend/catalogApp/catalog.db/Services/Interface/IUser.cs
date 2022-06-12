using catalog.db.Models;
using catalog.db.Services.Interface;

namespace catalog.db.Services.Interface;
public interface IUserService : IService<User>
{
	Task<User> GetUserByEmail(string email);
	Task<User> RegisterUser(User user);
	Task<User> LoginUser(User user);
}