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
    
    public partial class Teachers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Teachers()
        {
            this.Courses = new HashSet<Courses>();
            this.TeachersAndCourses = new HashSet<TeachersAndCourses>();
            this.TeachersAndGroups = new HashSet<TeachersAndGroups>();
        }
    
        public int id { get; set; }
        public int UsersID { get; set; }
        public Nullable<int> SubjectsID { get; set; }
        public string FIO { get; set; }
        public System.DateTime BirthDate { get; set; }
        public bool IsStudent { get; set; }
        public string Gender { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Courses> Courses { get; set; }
        public virtual Subjects Subjects { get; set; }
        public virtual Users Users { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TeachersAndCourses> TeachersAndCourses { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TeachersAndGroups> TeachersAndGroups { get; set; }
    }
}
