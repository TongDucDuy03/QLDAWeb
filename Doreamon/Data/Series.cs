using System.ComponentModel.DataAnnotations;

namespace Doreamon.Data
{
    public class Series
    {
        [Key]
        public int Series_Id { get; set; }
        public string Series_Name { get; set;}
        public ICollection<Products> Productss { get; set; }
        public Series()
        {
            Productss = new List<Products>();
        }
    }
}
