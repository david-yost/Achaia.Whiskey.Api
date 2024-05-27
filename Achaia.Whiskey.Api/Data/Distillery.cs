namespace Achaia.Whiskey.Api.Data
{
    public class Distillery
    {
        public int DistilleryId { get; set; }
        public required string Name { get; set; }
        public required string StateProvince { get; set; }
    }
}
