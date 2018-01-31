#!/bin/sh
PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"  
OUTPUTDIR="$PWD/build/Release-iphoneos"  

xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APPNAME.app" -o "$OUTPUTDIR/$APPNAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROFILE_NAME"  
curl http://www.pgyer.com/apiv1/app/upload \  
  -F uKey="$PGYER_UKEY" \  
  -F file="@$OUTPUTDIR/$APPNAME.ipa" \  
  -F _api_key="$PGYER_APIKEY"  
