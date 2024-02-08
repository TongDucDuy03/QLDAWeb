using Doreamon.Data;

namespace Doreamon.Models
{
    public class SeriesModel
    {
        public int Series_Id { get; set; }
        public string Series_Name { get; set; }
        public ICollection<Products> Productss { get; set; }
        public SeriesModel()
        {
            Productss = new List<Products>();
        }
    }
}
