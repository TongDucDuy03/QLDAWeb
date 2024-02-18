using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface ISeriesRepository
    {
        public Task<List<SeriesModel>> GetAllSeriesAsync();
        public Task<SeriesModel> GetSeriesBySeriesIdAsync(int? SeriesId);
    }
}
