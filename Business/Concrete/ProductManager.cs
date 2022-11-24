using Business.Abstract;
using DataAccess.Abstract;
using DataAccess.Concrete.EntityFramework;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class ProductManager : IProductService
    {
        IProductDal _ProductDal;

        public ProductManager(IProductDal productDal)
        {
            _ProductDal = productDal;
        }

        public void Add(Product product)
        {
            _ProductDal.Add(product);
        }

        public void Delete(Product product)
        {
            _ProductDal.Delete(product);
        }

        public List<Product> GetAll()
        {
           return _ProductDal.GetAll();
        }

        public List<Product> GetAll(int id)
        {
            return _ProductDal.GetAll(x => x.CategoryId == id);
        }

        public List<Product> GetAllByDescription(string description)
        {
            return _ProductDal.GetAll(x => x.Description.Contains(description));
        }

        public Product GetById(int id)
        {
           return _ProductDal.Get(x => x.Id == id);
        }

        public void Update(Product product)
        {
            _ProductDal.Update(product);
        }
    }
}
