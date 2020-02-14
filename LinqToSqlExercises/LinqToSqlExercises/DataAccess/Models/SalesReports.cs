using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class SalesReports
    {
        public string GroupBy { get; set; }
        public string Display { get; set; }
        public string Title { get; set; }
        public string FilterRowSource { get; set; }
        public bool? Default { get; set; }
        public byte[] SsmaTimeStamp { get; set; }
    }
}
