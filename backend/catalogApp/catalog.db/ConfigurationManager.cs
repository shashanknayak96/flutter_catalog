namespace catalog.db;
public class ConfigurationManager
{
    public string ConnectionString { get; set; } = null!;
    public string DatabaseName { get; set; } = null!;
    public string UsersCollection { get; set; } = null!;
    public string AdvertisementCollection { get; set; } = null!;
}