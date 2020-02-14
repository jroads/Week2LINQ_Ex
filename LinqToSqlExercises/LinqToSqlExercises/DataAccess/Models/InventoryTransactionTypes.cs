using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class InventoryTransactionTypes
    {
        public InventoryTransactionTypes()
        {
            InventoryTransactions = new HashSet<InventoryTransactions>();
        }

        public byte Id { get; set; }
        public string TypeName { get; set; }

        public ICollection<InventoryTransactions> InventoryTransactions { get; set; }
    }
}
