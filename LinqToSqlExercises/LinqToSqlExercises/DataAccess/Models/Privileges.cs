using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class Privileges
    {
        public Privileges()
        {
            EmployeePrivileges = new HashSet<EmployeePrivileges>();
        }

        public int PrivilegeId { get; set; }
        public string PrivilegeName { get; set; }

        public ICollection<EmployeePrivileges> EmployeePrivileges { get; set; }
    }
}
