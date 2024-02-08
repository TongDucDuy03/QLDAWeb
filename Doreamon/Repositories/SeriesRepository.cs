using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;

namespace Doreamon.Repositories
{
    public class SeriesRepository : ISeriesRepository
    {
        private readonly DoreamonWebContext _context;
        private readonly IMapper _mapper;

        public SeriesRepository(DoreamonWebContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<SeriesModel> GetSeriesBySeriesIdAsync(int? SeriesId)
        {
            var series = await _context.Series.FindAsync(SeriesId);
            return _mapper.Map<SeriesModel>(series);
        }
    }
}
