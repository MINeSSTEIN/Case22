//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Case2.source
{
    using System;
    using System.Collections.Generic;
    
    public partial class CoursesSchedules
    {
        public int id { get; set; }
        public int DayOfWeekID { get; set; }
        public int SubjectID { get; set; }
        public int Number { get; set; }
        public int GroupID { get; set; }
    
        public virtual DaysOfWeek DaysOfWeek { get; set; }
        public virtual Group Group { get; set; }
        public virtual Subjects Subjects { get; set; }
    }
}
