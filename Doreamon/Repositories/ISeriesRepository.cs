using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface ISeriesRepository
    {
        public Task<SeriesModel> GetSeriesBySeriesIdAsync(int? SeriesId);
    }
}
