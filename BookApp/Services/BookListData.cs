using BookApp.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookApp.Services
{
    public class BookListData : IBookListData
    {
        private libraryContext _context;

        public BookListData(libraryContext context)
        {
            _context = context;
        }

        public IEnumerable<BookList> GetAll()
        {
            var bookList = _context.BookList.FromSql("EXECUTE dbo.GetBookList").ToList();
            return bookList;
        }

       async Task<IEnumerable<BookList>> IBookListData.GetAll()
        {
           return await _context.BookList.FromSql("EXECUTE dbo.GetBookList").ToListAsync();            
        }
    }
}
