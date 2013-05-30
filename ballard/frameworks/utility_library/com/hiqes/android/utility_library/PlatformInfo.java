/*
 *  Copyright (c) 2013 HiQES LLC
 *  ALL RIGHTS RESERVED
 * 
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *       http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.hiqes.android.utility_library;

import android.content.Context;
import android.os.IPlatformInfoService;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;

public final class PlatformInfo {
    private static final String         LOG_TAG = "PlatformInfo";

    private IPlatformInfoService    mService;

    private synchronized IPlatformInfoService getService() {
        if (mService == null) {
            mService =
                IPlatformInfoService.Stub.asInterface(
                    ServiceManager.getService(Context.PLATFORM_INFO_SERVICE));
                if (mService == null) {
                    Log.w(LOG_TAG, "Unable to get service!");
                }
        }

        return mService;
    }

    public PlatformInfo() {
    }

    public int getSystemServerPid() {
        int                     ret = -1;

        try {
            IPlatformInfoService    srv = getService();

            if (srv != null) {
                ret = srv.getSystemServerPid();
            }
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }

        return ret;
    }
}
