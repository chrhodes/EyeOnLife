﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Data;


using EyeOnLife.User_Interface.Windows;

namespace EyeOnLife.User_Interface.User_Controls
{
    public partial class wucDX_JSTargetServerGroups : wucDX_Base
    {
        #region Constructors
        public wucDX_JSTargetServerGroups()
        {
            InitializeComponent();
        }
        #endregion

        #region Initialization

        private void OnLoaded(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!System.ComponentModel.DesignerProperties.GetIsInDesignMode(this))
                {
                    //((CollectionViewSource)this.Resources["jsTargetServerGroups"]).Source =
                    //    EyeOnLife.Common.ApplicationDataSet.JSTargetServerGroups;

                    dataGrid.ItemsSource = EyeOnLife.Common.ApplicationDataSet.JSTargetServerGroups;
                }

                ViewMode.ApplyAuthorization(this);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        #endregion

        #region Event Handlers

        private void OnCustomColumnDisplayText(object sender, DevExpress.Xpf.Grid.CustomColumnDisplayTextEventArgs e)
        {
            CustomDisplay.FormatStorageColumns(e);
        }

        private void OnAddNewRow(object sender, RoutedEventArgs e)
        {
            wndDX_NewServer win1 = new wndDX_NewServer();
            win1.ShowDialog();
        }

        private void OnCellValueChanged(object sender, DevExpress.Xpf.Grid.CellValueChangedEventArgs e)
        {
            ahg_Top.Visibility = System.Windows.Visibility.Visible;
        }

        //private void OnDeleteAllRows(object sender, RoutedEventArgs e)
        //{
        //    if (MessageBoxResult.Yes == MessageBox.Show("Are you really, really sure you want to delete everything?", "Confirm Action", MessageBoxButton.YesNo))
        //    {
        //        Common.ApplicationDataSet.JSTargetServerGroups.Clear();
        //        Common.ApplicationDataSet.JSTargetServerGroupsTA.Update(Common.ApplicationDataSet.JSTargetServerGroups);
        //    }
        //}

        //private void OnDeleteRow(object sender, RoutedEventArgs e)
        //{
        //    if (MessageBoxResult.Yes == MessageBox.Show("Are you sure you want to delete the selected item?", "Confirm Action", MessageBoxButton.YesNo))
        //    {
        //        tableView1.DeleteRow(tableView1.FocusedRowHandle);
        //    }
        //}

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            Common.ApplicationDataSet.JSTargetServerGroupsTA.Update(Common.ApplicationDataSet.JSTargetServerGroups);

            ahg_Top.Visibility = System.Windows.Visibility.Hidden;
        }

        private void undoButton_Click(object sender, RoutedEventArgs e)
        {
            Common.ApplicationDataSet.JSTargetServerGroups.RejectChanges();

            ahg_Top.Visibility = System.Windows.Visibility.Hidden;
        }

        #endregion

        #region Main Function Routines


        
        #endregion

    }
}