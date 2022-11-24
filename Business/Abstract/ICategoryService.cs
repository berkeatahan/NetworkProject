using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
    public interface ICategoryService
    {
        public void Add(Category category);
        public void Delete(Category category);
        public void Update(Category category);

        public List<Category> GetAll();
    }
}
