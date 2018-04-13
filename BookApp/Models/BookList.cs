using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BookApp.Models
{
    public class BookList
    {
      
        public int AuthorId { get; set; }
        [Display(Name = "Author's First Name")]
        public string FirstName { get; set; }
        [Display(Name = "Author's Last Name")]
        public string LastName { get; set; }
        [Key]
        public int BookId { get; set; }
        [Display(Name = "Title")]
        public string Title { get; set; }
        [Display(Name = "Published Date")]
        public DateTime? PublishedOn { get; set; }
        [Display(Name = "Author")]
        public string AuthorFullName { get; set; }

    }
}
