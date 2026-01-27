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
using Microsoft.AspNetCore.Authorization;

namespace cKitchen.MVCWebApp.HuyND.Controllers
{
    [Authorize]
    public class InventoryHuyNdsController : Controller
    {
        //private readonly CentralKitchenFranchiseDBContext _context;
        private readonly IInventoryHuyNDService _inventoryHuyNDService;
        private readonly InventoryLocationHuyNDService _inventoryLocationHuyNDService;

        //public InventoryHuyNdsController(CentralKitchenFranchiseDBContext context)
        //{
        //    _context = context;
        //}

        public InventoryHuyNdsController(IInventoryHuyNDService inventoryHuyNDService,
            InventoryLocationHuyNDService inventoryLocationHuyNDService)
        {
            _inventoryHuyNDService = inventoryHuyNDService;
            _inventoryLocationHuyNDService = inventoryLocationHuyNDService;
        }

        // GET: InventoryHuyNds
        //public async Task<IActionResult> Index()
        //{
        //    //return View(await _context.InventoryLocationHuyNds.ToListAsync());

        //    var items = await _inventoryHuyNDService.GetAllAsync();
        //    return View(items);
        //}
        public async Task<IActionResult> Index(string batchNum, int quantity, string localName)
        {
            //return View(await _context.InventoryLocationHuyNds.ToListAsync());

            //var items = await _inventoryHuyNDService.GetAllAsync();
            var items = await _inventoryHuyNDService.SearchAsync(batchNum, quantity, localName);
            return View(items);
        }

        // GET: InventoryHuyNds/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var inventoryHuyNd = await _inventoryHuyNDService.GetByIdAsync(id.Value);
            if (inventoryHuyNd == null)
            {
                return NotFound();
            }

            return View(inventoryHuyNd);
        }

        // GET: InventoryHuyNds/Create
        public async Task<IActionResult> Create()
        {
            var InventoryLocationHuyNds = await _inventoryLocationHuyNDService.GetAllAsync();
            //ViewData["CentralKitchenKhaiVpmid"] = new SelectList(_context.CentralKitchenKhaiVpms, "CentralKitchenKhaiVpmid", "CentralKitchenKhaiVpmid");
            ViewData["InventoryLocationHuyNdid"] = new SelectList(InventoryLocationHuyNds, "InventoryLocationHuyNdid", "LocationName");
           
            //Set default value
            var newInventoryHuyNd = new InventoryHuyNd
            {

                CreatedDate = DateTime.Now,
                UpdatedDate = DateTime.Now,
                IsActive = true,
                CentralKitchenKhaiVpmid = 1 // Default to 1 for now

            };

            return View(newInventoryHuyNd);
        }

        // POST: InventoryHuyNds/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(InventoryHuyNd inventoryHuyNd)
        {
            if (ModelState.IsValid)
            {
                //_context.Add(inventoryHuyNd);
                //await _context.SaveChangesAsync();
                var result = await _inventoryHuyNDService.CreateAsync(inventoryHuyNd);

                if(result > 0)
                {
                    return RedirectToAction(nameof(Index));
                }

                //return RedirectToAction(nameof(Index));
            }
            var InventoryLocationHuyNds = await _inventoryLocationHuyNDService.GetAllAsync();

            //ViewData["CentralKitchenKhaiVpmid"] = new SelectList(_context.CentralKitchenKhaiVpms, "CentralKitchenKhaiVpmid", "CentralKitchenKhaiVpmid", inventoryHuyNd.CentralKitchenKhaiVpmid);
            ViewData["InventoryLocationHuyNdid"] = new SelectList(InventoryLocationHuyNds, "InventoryLocationHuyNdid", "LocationName", inventoryHuyNd.InventoryLocationHuyNdid);
            return View(inventoryHuyNd);
        }

        // GET: InventoryHuyNds/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            //var inventoryHuyNd = await _context.InventoryHuyNds.FindAsync(id);

            var inventoryHuyNd = await _inventoryHuyNDService.GetByIdAsync(id.Value);
           
            if (inventoryHuyNd == null)
            {
                return NotFound();
            }

            inventoryHuyNd.UpdatedDate = DateTime.Now;

            var InventoryLocationHuyNds = await _inventoryLocationHuyNDService.GetAllAsync();

            //ViewData["CentralKitchenKhaiVpmid"] = new SelectList(_context.CentralKitchenKhaiVpms, "CentralKitchenKhaiVpmid", "CentralKitchenKhaiVpmid", inventoryHuyNd.CentralKitchenKhaiVpmid); 
            //ViewData["CentralKitchenKhaiVpmid"] = new SelectList(_context.CentralKitchenKhaiVpms, "CentralKitchenKhaiVpmid", "CentralKitchenKhaiVpmid", inventoryHuyNd.CentralKitchenKhaiVpmid);
            ViewData["CentralKitchenKhaiVpmid"] = new SelectList(InventoryLocationHuyNds, "InventoryLocationHuyNdid", "InventoryLocationHuyNdid", inventoryHuyNd.CentralKitchenKhaiVpmid);
            ViewData["InventoryLocationHuyNdid"] = new SelectList(InventoryLocationHuyNds, "InventoryLocationHuyNdid", "LocationName", inventoryHuyNd.InventoryLocationHuyNdid);

            return View(inventoryHuyNd);
        }

        // POST: InventoryHuyNds/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "1,2")]
        public async Task<IActionResult> Edit(int id, [Bind("InventoryHuyNdid,ItemName,Quantity,Unit,ExpiryDate,BatchNumber,Status,CreatedDate,UpdatedDate,Cost,IsActive,CentralKitchenKhaiVpmid,InventoryLocationHuyNdid")] InventoryHuyNd inventoryHuyNd)
        {
            //if (id != inventoryHuyNd.InventoryHuyNdid)
            //{
            //    return NotFound();
            //}

            if (ModelState.IsValid)
            {
                try
                {
                    //_context.Update(inventoryHuyNd);
                    //await _context.SaveChangesAsync();
                    var result = await _inventoryHuyNDService.UpdateAsync(inventoryHuyNd);
                }
                catch (Exception ex)
                {
                    //if (!InventoryHuyNdExists(inventoryHuyNd.InventoryHuyNdid))
                    //{
                    //    return NotFound();
                    //}
                    //else
                    //{
                    //    throw;
                    //}
                    throw new Exception(ex.Message);
                }
                return RedirectToAction(nameof(Index));
            }
            var InventoryLocationHuyNds = await _inventoryLocationHuyNDService.GetAllAsync();

            //ViewData["CentralKitchenKhaiVpmid"] = new SelectList(_context.CentralKitchenKhaiVpms, "CentralKitchenKhaiVpmid", "CentralKitchenKhaiVpmid", inventoryHuyNd.CentralKitchenKhaiVpmid);
            ViewData["CentralKitchenKhaiVpmid"] = new SelectList(InventoryLocationHuyNds, "InventoryLocationHuyNdid", "InventoryLocationHuyNdid", inventoryHuyNd.CentralKitchenKhaiVpmid);
            ViewData["InventoryLocationHuyNdid"] = new SelectList(InventoryLocationHuyNds, "InventoryLocationHuyNdid", "LocationName", inventoryHuyNd.InventoryLocationHuyNdid);
            return View(inventoryHuyNd);
        }

        // GET: InventoryHuyNds/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var inventoryHuyNd = await _inventoryHuyNDService.GetByIdAsync(id.Value);

            //var inventoryHuyNd = await _context.InventoryHuyNds
            //    .Include(i => i.CentralKitchenKhaiVpm)
            //    .Include(i => i.InventoryLocationHuyNd)
            //    .FirstOrDefaultAsync(m => m.InventoryHuyNdid == id);
            if (inventoryHuyNd == null)
            {
                return NotFound();
            }

            return View(inventoryHuyNd);
        }

        // POST: InventoryHuyNds/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var result = await _inventoryHuyNDService.DeleteAsync(id);
            if (result)
            {
                return RedirectToAction(nameof(Index));
            }
            
            //var inventoryHuyNd = await _context.InventoryHuyNds.FindAsync(id);
            //if (inventoryHuyNd != null)
            //{
            //    //_context.InventoryHuyNds.Remove(inventoryHuyNd);
            //    var result = await _inventoryHuyNDService.DeleteAsync(id);
            //}

            //await _context.SaveChangesAsync();
            
            return RedirectToAction(nameof(Delete), new {id=id});
        }

        //private bool InventoryHuyNdExists(int id)
        //{
        //    return _context.InventoryHuyNds.Any(e => e.InventoryHuyNdid == id);
        //}
    }
}
