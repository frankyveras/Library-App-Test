using BookApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookApp.Services
{
   public interface IBookListData
    {
       Task<IEnumerable<BookList>>GetAll();
    }
}
