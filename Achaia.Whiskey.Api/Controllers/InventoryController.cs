using Achaia.Whiskey.Api.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Achaia.Whiskey.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InventoryController : ControllerBase
    {
        WhiskeyDbContext _whiskeyDbContext;

        public InventoryController(WhiskeyDbContext whiskeyDbContext)
        {
            _whiskeyDbContext = whiskeyDbContext;
        }

        [HttpGet(Name = "GetAllBottles")]
        public async Task<IEnumerable<Bottle>> GetBottles()
        {
            var retval = await _whiskeyDbContext.Bottles
                .Include(x => x.Distillery)
                .Include(x => x.ReleaseType)
                .ToListAsync();
            return retval;
        }
    }
}
