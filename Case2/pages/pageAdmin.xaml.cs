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

namespace Case2.pages
{
    /// <summary>
    /// Логика взаимодействия для pageAdmin.xaml
    /// </summary>
    public partial class pageAdmin : Page
    {
        public pageAdmin()
        {
            InitializeComponent();
        }

        private void btn_timetable_Click(object sender, RoutedEventArgs e)
        {
            frm_pageAdmin.Navigate(new timetableAdmin());
        }

        private void btn_addkurs_Click(object sender, RoutedEventArgs e)
        {
            frm_pageAdmin.Navigate(new addKurs());
        }

        private void btn_otchet_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void btn_sertificat_Click(object sender, RoutedEventArgs e)
        {
            frm_pageAdmin.Navigate(new addSertifikat());
        }
    }
}
