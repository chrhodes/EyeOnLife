﻿using System;
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
using System.Windows.Shapes;

namespace EyeOnLife.User_Interface.Windows
{
    /// <summary>
    /// Interaction logic for AdminStoredProcedures.xaml
    /// </summary>
    public partial class AdminStoredProcedures : Window
    {
        const string TYPE_NAME = "AdminStoredProcedures";

        public AdminStoredProcedures()
        {
#if TRACE
            //Common.WriteToDebugWindow(string.Format("{0}:{1}()", TYPE_NAME, System.Reflection.MethodInfo.GetCurrentMethod().Name));
#endif
            InitializeComponent();
        }
    }
}
