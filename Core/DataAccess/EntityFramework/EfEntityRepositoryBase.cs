using Core.Entities.Abstract;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Core.DataAccess.EntityFramework
{
    public class EfEntityRepositoryBase<TEntity, TContext> : IEntityRepository<TEntity>
        where TEntity : class, IEntity, new()
        where TContext : DbContext, new()
    {
        public void Add(TEntity entity)
        {
            using (TContext context = new TContext()) //normal newlemeyebiliyoruzda.using belleği hızlıca temizlememizi sağlıyor
            {
                var addedEntity = context.Entry(entity); //Veri kaynağımla ilişkilendirdim(referansı yakalama)
                addedEntity.State = EntityState.Added; //eklenecek nesne
                context.SaveChanges();
            }
        }

        public void Delete(TEntity entity)
        {
            using (TContext context = new TContext()) //normal newlemeyebiliyoruzda.using belleği hızlıca temizlememizi sağlıyor
            {
                var deletedEntity = context.Entry(entity); //Veri kaynağımla ilişkilendirdim(referansı yakalama)
                deletedEntity.State = EntityState.Deleted; 
                context.SaveChanges();
            }
        }

        public TEntity Get(Expression<Func<TEntity, bool>> filter)
        {
            using (TContext context = new TContext())
            {
                return context.Set<TEntity>().SingleOrDefault(filter);
            }
        }

        public List<TEntity> GetAll(Expression<Func<TEntity, bool>> filter = null)
        {
            using (TContext context = new TContext())
            {
                return filter == null
                    ? context.Set<TEntity>().ToList()
                    : context.Set<TEntity>().Where(filter).ToList();
            };
        }

        public void Update(TEntity entity)
        {
            using (TContext context = new TContext()) //normal newlemeyebiliyoruzda.using belleği hızlıca temizlememizi sağlıyor
            {
                var updatedEntity = context.Entry(entity); //Veri kaynağımla ilişkilendirdim(referansı yakalama)
                updatedEntity.State = EntityState.Modified; 
                context.SaveChanges();
            }
        }
    }
}
