namespace Achaia.Whiskey.Api.Data
{
    public class Bottle
    {
        public int BottleId { get; set; }
        public required string Name { get; set; }
        public required decimal Proof { get; set; }
        public int? AgeYears { get; set; }
        public int? AgeMonths { get; set; }

        public required ReleaseType ReleaseType { get; set; }
        public required Distillery Distillery { get; set; }

    }
}
