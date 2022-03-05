namespace catalog.db;
public class DatabaseManager
{
    public string ConnectionString { get; set; } = null!;
    public string DatabaseName { get; set; } = null!;
    public string UsersCollection { get; set; } = null!;
    public string AdvertisementCollection { get; set; } = null!;
    public string CategoryCollection { get; set; } = null!;
    public string ProductCollection { get; set; } = null!;
}