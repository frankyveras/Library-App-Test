using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BookApp.Models;
using BookApp.Services;

namespace BookApp.Controllers
{
    public class BooksController : Controller
    {
        private IBookListData _bookListData;

        public BooksController(IBookListData bookListData)
        {
            _bookListData = bookListData;
        }

        // GET: Books
        public async Task<IActionResult> Index()
        {
            var bookList = await _bookListData.GetAll();
            return View(bookList);
        }      
    }
}
