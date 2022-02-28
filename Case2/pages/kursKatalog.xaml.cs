using System;
using System.Collections.Generic;
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
using System.Data.Entity;
using Case2.source;

namespace Case2.pages
{
    /// <summary>
    /// Логика взаимодействия для kursKatalog.xaml
    /// </summary>
    public partial class kursKatalog : Page
    {
        public kursKatalog()
        {
            InitializeComponent();
            FrameApp.db.Courses.Load();
            foreach(var a in FrameApp.db.Courses.Local)
            {
                var k = new KourseToAdd();
                k.Hours = a.Hours.ToString();
                k.Theme = a.Theme;
                k.Leader = a.Teachers.FIO;
                k.Subject = a.Subjects.Name;
                k.id = a.id;
                
                lv_c.Items.Add(k);
                
            }
        }


    }
    public class KourseToAdd
    {
        public int id { get; set; }
        public string Name { get; set; }
        public string Theme { get; set; }
        public string Leader { get; set; }
        public string Subject { get; set; }
        public string Hours { get; set; }
    }
}
