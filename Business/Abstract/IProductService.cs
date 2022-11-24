using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
    public interface IProductService
    {
        public void Add(Product product);
        public void Delete(Product product);
        public void Update(Product product);
        public List<Product> GetAll();
        public Product GetById(int id);

        public List<Product> GetAll(int id);

        public List<Product> GetAllByDescription(string description);
    }
}
