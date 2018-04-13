using System;
using System.Collections.Generic;

namespace BookApp.Models
{
    public partial class Book
    {
        public int BookId { get; set; }
        public string Title { get; set; }
        public DateTime? PublishedOn { get; set; }
        public int AuthorId { get; set; }

        public Author Author { get; set; }
    }
}
