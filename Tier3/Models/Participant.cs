using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Tier3.Data
{
    public class Participant
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ParticapantId { get; set; }
        [ForeignKey("User")]
        public int UserId { get; set; }
        [ForeignKey("Event")]
        public int EventId { get; set; }
        [ForeignKey("Address")]
        public int AddressId { get; set; }
        [ForeignKey("City")]
        public int CityId { get; set; }

        public override string ToString()
        {
            return $"{nameof(ParticapantId)}: {ParticapantId}, {nameof(UserId)}: {UserId}, {nameof(EventId)}: {EventId}, {nameof(AddressId)}: {AddressId}, {nameof(CityId)}: {CityId}";
        }
    }
}
