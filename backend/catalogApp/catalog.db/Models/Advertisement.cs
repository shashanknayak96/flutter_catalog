namespace catalog.db.Models;

public class Advertisement : Base
{
	public string Name { get; set; }
	public string ImageUrl { get; set; }
	public bool IsActive { get; set; }
}