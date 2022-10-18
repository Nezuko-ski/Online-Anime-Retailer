﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GoAnime.Domain.Models
{
    public class Order
    {
        [Key]
        public int Id { get; set; }
        public string Email { get; set; }
        public string UserId { get; set; }
        [ForeignKey("UserId")]
        public AnimeFan Fan { get; set; }
        public List<OrderItem> OrderItems { get; set; }
    }
}