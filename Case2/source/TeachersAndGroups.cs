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
    
    public partial class TeachersAndGroups
    {
        public int id { get; set; }
        public int TeacherID { get; set; }
        public int GroupID { get; set; }
    
        public virtual Group Group { get; set; }
        public virtual Teachers Teachers { get; set; }
    }
}
