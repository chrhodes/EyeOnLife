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
using System.Windows.Navigation;
using System.Windows.Shapes;
using PacificLife.Life;

namespace EyeOnLife.User_Interface.User_Controls
{
    /// <summary>
    /// Interaction logic for wucServers_OverviewContent.xaml
    /// </summary>
    public partial class wucServers_OverviewContent : UserControl
    {
        private static int CLASS_BASE_ERRORNUMBER = SQLInformation.ErrorNumbers.EYEONLIFE;
        private const string PLLOG_APPNAME = "EyeOnLife";

        public wucServers_OverviewContent()
        {
#if TRACE
            long startTicks = PLLog.Trace5("Enter", PLLOG_APPNAME, CLASS_BASE_ERRORNUMBER + 0);
#endif
            InitializeComponent();
#if TRACE
            PLLog.Trace5("Exit", PLLOG_APPNAME, CLASS_BASE_ERRORNUMBER + 2, startTicks);
#endif
        }
    }
}
