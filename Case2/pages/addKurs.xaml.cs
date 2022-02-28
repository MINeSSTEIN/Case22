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
    /// Логика взаимодействия для addKurs.xaml
    /// </summary>
    public partial class addKurs : Page
    {
        public addKurs()
        {
            InitializeComponent();
            FrameApp.db.Teachers.Load();
            FrameApp.db.Subjects.Load();
            foreach (var a in FrameApp.db.Teachers.Local)
            {
                if (!a.IsStudent)
                {
                    txb_prepod.Items.Add(a.FIO);
                }
            }
            foreach (var a in FrameApp.db.Subjects.Local)
            {
                txb_subject.Items.Add(a.Name);
            }
        }

        private void btn_addKurs_Click(object sender, RoutedEventArgs e)
        {
            var leader = FrameApp.db.Teachers.FirstOrDefault(x => x.FIO == txb_prepod.SelectedItem.ToString());
            var subj = FrameApp.db.Subjects.FirstOrDefault(x => x.Name == txb_subject.SelectedItem.ToString());
            var course = new Courses()
            {
                Hours = Convert.ToInt32(cbx_hours.Text),
                LeaderID = leader.id,
                SubjectsID = subj.id,
                Name = txb_title.Text,
                Theme = txb_tema.Text,
            };
            FrameApp.db.Courses.Add(course);
            FrameApp.db.SaveChanges();
            MessageBox.Show("Курс создан");
            FrameApp.frmObj.Navigate(new pageAdmin());
        }
    }
}
