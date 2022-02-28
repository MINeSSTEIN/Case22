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
    /// Логика взаимодействия для pagePrepod.xaml
    /// </summary>
    public partial class pagePrepod : Page
    {
        public pagePrepod()
        {
            InitializeComponent();
        }

        private void btn_katalig_Click(object sender, RoutedEventArgs e)
        {
            frm_pagePrepod.Navigate(new kursKatalog());
        }

        private void btn_mykurs_Click(object sender, RoutedEventArgs e)
        {
            frm_pagePrepod.Navigate(new myKurs());
        }

        private void btn_timetable_Click(object sender, RoutedEventArgs e)
        {
            frm_pagePrepod.Navigate(new timetablePrepod());
        }
    }
}
