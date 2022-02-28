using Case2.source;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Case2.pages
{
    /// <summary>
    /// Логика взаимодействия для myKurs.xaml
    /// </summary>
    public partial class myKurs : Page
    {
        public myKurs()
        {
            InitializeComponent();
            FrameApp.db.Courses.Load();
            FrameApp.db.Teachers.Load();

            var usr = FrameApp.db.Users.FirstOrDefault(x => x.id == FrameApp.UserID);
            FrameApp.db.TeachersAndCourses.Load();

            foreach (var a in FrameApp.db.Courses.Local)
            {
                
                var k = new KourseToShow();
                k.Hours = a.Hours.ToString();
                k.Theme = a.Theme;
                k.Leader = a.Teachers.FIO;
                k.Subject = a.Subjects.Name;

                lv_c.Items.Add(k);

            }
        }
    }
    public class KourseToShow
    {
        public string Name { get; set; }
        public string Theme { get; set; }
        public string Leader { get; set; }
        public string Subject { get; set; }
        public string Hours { get; set; }
    }
}
