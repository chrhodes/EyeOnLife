﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using MSMO = Microsoft.SqlServer.Management.Smo;
using MSMOA = Microsoft.SqlServer.Management.Smo.Agent;

using SQLInformation;
using VNC;

namespace SQLInformation.SMO
{
    public static class InstanceInfo
    {
        private static int CLASS_BASE_ERRORNUMBER = ErrorNumbers.SQLINFORMATION_SMO_INSTANCEINFO;
        private const string LOG_APPNAME = "SQLInformation";

        private static void UpdateDatabaseWithSnapShot(Data.ApplicationDataSet.InstanceInfoRow dataRow, string snapShotError)
        {
            try
            {
                dataRow.SnapShotDate = DateTime.Now;
                dataRow.SnapShotError = snapShotError;
                Common.ApplicationDataSet.InstanceInfoTA.Update(Common.ApplicationDataSet.InstanceInfo);
            }
            catch (Exception ex)
            {
                string errorMessage = string.Format("InstanceInfoRow.ID:{0} - ex:{1} ex.Inner:{2}", dataRow.ID, ex, ex.InnerException);
                VNC.AppLog.Error(errorMessage, LOG_APPNAME, CLASS_BASE_ERRORNUMBER + 7);
            }
        }

        public static void UpdateDataSet(this MSMO.Server server, Data.ApplicationDataSet.InstanceInfoRow dataRow)
        {
            try
            {
                dataRow.PhysicalMemory = server.PhysicalMemory;
                //instanceRow.Platform = server.Platform;
                dataRow.Processors = server.Processors;
            }
            catch (Exception ex)
            {
                // TODO(crhodes):  
                // Wrap anything above that throws an exception that we want to ignore, 
                // e.g. property not available because of SQL Edition.
                VNC.AppLog.Error(ex, LOG_APPNAME, CLASS_BASE_ERRORNUMBER + 0);
            }
        }

    }
}
