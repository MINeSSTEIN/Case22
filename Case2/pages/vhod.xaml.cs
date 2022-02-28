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
using Case2.pages;
using Case2.source;
using System.Data.Entity;

namespace Case2.pages
{
    /// <summary>
    /// Логика взаимодействия для vhod.xaml
    /// </summary>
    public partial class vhod : Page
    {
        public vhod()
        {
            InitializeComponent();
        }

        private void btn_registr_Click(object sender, RoutedEventArgs e)
        {
            frm_Vhod.Navigate(new regiztraciya());
        }

        private void btn_login_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.db.Users.Load();
            var usr = FrameApp.db.Users.FirstOrDefault(x => x.Login == txb_login.Text && x.Password == txb_password.Password);
            Teachers tcr = null;
            try
            {
                tcr = FrameApp.db.Teachers.FirstOrDefault(x => x.UsersID == usr.id);
            }
            catch { }
            if (usr != null)
            {
                if (usr.UsersTypes.id == 1 && tcr.IsStudent)
                {
                    FrameApp.UserID = usr.id;
                    FrameApp.frmObj.Navigate(new pagePrepod());
                }
                else if (usr.UsersTypes.id == 2)
                {
                    FrameApp.frmObj.Navigate(new pageAdmin());
                }
                else
                {
                    MessageBox.Show("Ошибка!", "Неверный тип пользователя.");
                }
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль.");
            }

        }
    }
}
