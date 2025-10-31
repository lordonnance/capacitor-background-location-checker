package com.sdl.background.location.checker;

import android.Manifest;
import android.content.pm.PackageManager;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "LocationChecker")
public class LocationCheckerPlugin extends Plugin {

    private LocationChecker implementation = new LocationChecker();

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void checkPermission(PluginCall call) {
        boolean backgroundLocationGranted = getBackgroundLocationPermissionState();

        if (backgroundLocationGranted) {
            call.resolve(new JSObject().put("status", "granted"));
        } else {
            call.resolve(new JSObject().put("status", "denied"));
        }
    }

    @PluginMethod()
    public void isGMSAvailable(PluginCall call) {
        PackageManager pm = getContext().getPackageManager();
        boolean hasPlay;
        try {
        pm.getPackageInfo("com.google.android.gms", PackageManager.GET_ACTIVITIES);
        hasPlay = true;
        } catch (Exception e) {
        hasPlay = false;
        }
        JSObject ret = new JSObject();
        ret.put("available", hasPlay);
        call.resolve(ret);
    }

    private boolean getBackgroundLocationPermissionState() {
        return getContext().checkSelfPermission(Manifest.permission.ACCESS_BACKGROUND_LOCATION) == PackageManager.PERMISSION_GRANTED;
    }
}
