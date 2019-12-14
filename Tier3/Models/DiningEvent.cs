using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Tier3.Models;

namespace Tier3.Models
{
    public class DiningEvent
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int EventId { get; set; }

        [JsonProperty("userId")]
        public int UserId { get; set; }

        public bool AlcoholicDrink { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public string Description { get; set; }
        public int AgeLimit { get; set; }
        public bool Pets { get; set; }
        public bool Entertainment { get; set; }
        public int MaxNoOfGuests { get; set; }
        public double EntryFee { get; set; }
        public string Starter { get; set; }
        public string MainCourse { get; set; }
        public string Dessert { get; set; }
        public string DateOfEvent { get; set; }
        public Address Address { get; set; }

        public override string ToString()
        {
            return $"{nameof(EventId)}: {EventId}, {nameof(UserId)}: {UserId}, {nameof(AlcoholicDrink)}: {AlcoholicDrink}, {nameof(StartTime)}: {StartTime}, {nameof(EndTime)}: {EndTime}, {nameof(Description)}: {Description}, {nameof(AgeLimit)}: {AgeLimit}, {nameof(Pets)}: {Pets}, {nameof(Entertainment)}: {Entertainment}, {nameof(MaxNoOfGuests)}: {MaxNoOfGuests}, {nameof(EntryFee)}: {EntryFee}, {nameof(Starter)}: {Starter}, {nameof(MainCourse)}: {MainCourse}, {nameof(Dessert)}: {Dessert}, {nameof(DateOfEvent)}: {DateOfEvent}, {nameof(Address)}: {Address}";
        }
    }
}
