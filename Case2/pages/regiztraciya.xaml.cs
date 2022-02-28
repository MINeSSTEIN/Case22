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
    /// Логика взаимодействия для regiztraciya.xaml
    /// </summary>
    public partial class regiztraciya : Page
    {

        public regiztraciya()
        {
            InitializeComponent();
            FrameApp.db.Group.Load();
            foreach (var g in FrameApp.db.Group.Local)
            {
                cbx_group.Items.Add(g.GroupName);
            }
        }

        private void btn_goback_Click(object sender, RoutedEventArgs e)
        {
            FrameApp.frmObj.Navigate(new vhod());

        }

        private void btn_signin_Click(object sender, RoutedEventArgs e)
        {
            if (txb_fio.Text != "" || txb_login.Text != "" || txb_password.Password != "" || txb_passwordrep.Password != "" || dpk_birthday.SelectedDate != null || cbx_sex.SelectedItem.ToString() != "" || cbx_group.SelectedItem.ToString() != "")
            {
                if(txb_password.Password == txb_passwordrep.Password)
                {
                    Users newUsr = new Users()
                    {
                        Login = txb_login.Text,
                        Password = txb_password.Password,
                        UsersTypesID = 1,
                    };
                    FrameApp.db.Users.Add(newUsr);
                    FrameApp.db.SaveChanges();
                    var usr = FrameApp.db.Users.FirstOrDefault(x => x.Login == txb_login.Text && x.Password == txb_password.Password);
                    Teachers newTeacher = new Teachers()
                    {
                        UsersID = usr.id,
                        FIO = txb_fio.Text,
                        BirthDate = dpk_birthday.SelectedDate.Value,
                        IsStudent = true,
                        Gender = cbx_sex.SelectedItem.ToString()
                    };
                    FrameApp.db.Teachers.Add(newTeacher);
                    FrameApp.db.SaveChanges();
                    FrameApp.db.Teachers.Load();
                    var tchr = FrameApp.db.Teachers.FirstOrDefault(x => x.UsersID == usr.id);
                    var grp = FrameApp.db.Group.FirstOrDefault(x => x.GroupName == cbx_group.SelectedItem.ToString());
                    var tng = new TeachersAndGroups()
                    {
                        GroupID = grp.id,
                        TeacherID = tchr.id
                    };
                    FrameApp.db.TeachersAndGroups.Add(tng);
                    FrameApp.db.SaveChanges();
                    FrameApp.UserID = tchr.Users.id;
                    FrameApp.frmObj.Navigate(new pagePrepod());
                }
                else
                {
                    MessageBox.Show("Пароли не совпадают");
                }
            }
            else
            {
                MessageBox.Show("Какое-то из полей пустое");
            }
        }
    }
}
