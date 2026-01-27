using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using cKitchen.Entities.HuyND.Models;
using cKitchen.Repositories.HuyND.DBContext;
using cKitchen.Services.HuyND;

namespace cKitchen.MVCWebApp.HuyND.Controllers
{
    public class InventoryLocationHuyNdsController : Controller
    {
        //private readonly CentralKitchenFranchiseDBContext _context;
        private readonly IInventoryHuyNDService _inventoryHuyNDService;
        private readonly InventoryLocationHuyNDService _inventoryLocationHuyNDService;

        //public InventoryLocationHuyNdsController(CentralKitchenFranchiseDBContext context)
        //{
        //    _context = context;
        //}

        public InventoryLocationHuyNdsController(IInventoryHuyNDService inventoryHuyNDService,
            InventoryLocationHuyNDService inventoryLocationHuyNDService)
        {
            _inventoryHuyNDService = inventoryHuyNDService;
            _inventoryLocationHuyNDService = inventoryLocationHuyNDService;
        }

        
        // GET: InventoryLocationHuyNds
        public async Task<IActionResult> Index()
        {
            //return View(await _context.InventoryLocationHuyNds.ToListAsync());

            var items = await _inventoryHuyNDService.GetAllAsync();
            return View(items);
        }

        //// GET: InventoryLocationHuyNds/Details/5
        //public async Task<IActionResult> Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var inventoryLocationHuyNd = await _context.InventoryLocationHuyNds
        //        .FirstOrDefaultAsync(m => m.InventoryLocationHuyNdid == id);
        //    if (inventoryLocationHuyNd == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(inventoryLocationHuyNd);
        //}

        //// GET: InventoryLocationHuyNds/Create
        //public IActionResult Create()
        //{
        //    return View();
        //}

        //// POST: InventoryLocationHuyNds/Create
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Create([Bind("InventoryLocationHuyNdid,LocationName,Description,IsActive")] InventoryLocationHuyNd inventoryLocationHuyNd)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _context.Add(inventoryLocationHuyNd);
        //        await _context.SaveChangesAsync();
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(inventoryLocationHuyNd);
        //}

        //// GET: InventoryLocationHuyNds/Edit/5
        //public async Task<IActionResult> Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var inventoryLocationHuyNd = await _context.InventoryLocationHuyNds.FindAsync(id);
        //    if (inventoryLocationHuyNd == null)
        //    {
        //        return NotFound();
        //    }
        //    return View(inventoryLocationHuyNd);
        //}

        //// POST: InventoryLocationHuyNds/Edit/5
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> Edit(int id, [Bind("InventoryLocationHuyNdid,LocationName,Description,IsActive")] InventoryLocationHuyNd inventoryLocationHuyNd)
        //{
        //    if (id != inventoryLocationHuyNd.InventoryLocationHuyNdid)
        //    {
        //        return NotFound();
        //    }

        //    if (ModelState.IsValid)
        //    {
        //        try
        //        {
        //            _context.Update(inventoryLocationHuyNd);
        //            await _context.SaveChangesAsync();
        //        }
        //        catch (DbUpdateConcurrencyException)
        //        {
        //            if (!InventoryLocationHuyNdExists(inventoryLocationHuyNd.InventoryLocationHuyNdid))
        //            {
        //                return NotFound();
        //            }
        //            else
        //            {
        //                throw;
        //            }
        //        }
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(inventoryLocationHuyNd);
        //}

        //// GET: InventoryLocationHuyNds/Delete/5
        //public async Task<IActionResult> Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var inventoryLocationHuyNd = await _context.InventoryLocationHuyNds
        //        .FirstOrDefaultAsync(m => m.InventoryLocationHuyNdid == id);
        //    if (inventoryLocationHuyNd == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(inventoryLocationHuyNd);
        //}

        //// POST: InventoryLocationHuyNds/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<IActionResult> DeleteConfirmed(int id)
        //{
        //    var inventoryLocationHuyNd = await _context.InventoryLocationHuyNds.FindAsync(id);
        //    if (inventoryLocationHuyNd != null)
        //    {
        //        _context.InventoryLocationHuyNds.Remove(inventoryLocationHuyNd);
        //    }

        //    await _context.SaveChangesAsync();
        //    return RedirectToAction(nameof(Index));
        //}

        //private bool InventoryLocationHuyNdExists(int id)
        //{
        //    return _context.InventoryLocationHuyNds.Any(e => e.InventoryLocationHuyNdid == id);
        //}
        
    }
}
