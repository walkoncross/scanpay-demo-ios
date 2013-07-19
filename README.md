scanpay-demo-ios
================

To give it a try:

1. Clone this repo.
2. Go to https://scanpay.it and sign up for a account and create a new app
3. Download the SDK, drag and drop the folder scanpay on Xcode
4. Get the token of your app and  replce "YOUR_TOKEN_HERE" in _ViewController.m by your token.

Try and enjoy !


Requirements for card scanning
------------------------------

* Supports target deployment of iOS version 5.0+
* Supports armv7 and armv7s devices

Instruction
-----------

1. Drag and drop the folder ScanPay to your project
2. Go to Target -> "Other Linker Flags" and add the following flag: `-ObjC`
3. Go to Project Settings "Build Settings" search for "C++ Standard Library" and change to `libstdc++`
4. Add the following frameworks to your project :
  * libstdc++.dylib
  * libsqlite3.0.dylib
  * CoreVideo
  * CoreMedia
  * AVFoundation
  * AudioToolbox
  * QuartzCore
  * AssetsLibrary
  * Security

5. Create a class conform to ScanPayDelegate protocol

### Sample code

To start the scan simply present the scanViewController from a UIViewController:
```obj-c
ScanPayViewController *scan = [[ScanPayViewController alloc]initWithDelegate:self appToken:@"YOUR_TOKEN_HERE"];
[self presentViewController:scan animated:YES completion:nil];
[scan release];
```

You will be notified of the user interaction through the delegate method :
```obj-c

- (void)scanPayViewController:(ScanPayViewController *)scanPayViewController didScanCard:(SPCreditCard *)card
{
}

- (void)scanCancelledByUser:(ScanPayViewController *)scanPayViewController
{
}

- (void)scanPayViewController:(ScanPayViewController *)scanPayViewController failedToScanWithError:(NSError *)error
{
}
```

If you want to use your own confirmation view simply implement

 ```obj-c
 - (BOOL)scanPayViewControllerShouldShowConfirmationView:(ScanPayViewController *)scanPayViewController
 {
   return YES;
 }
 ```

If you want to hide the manual button

```obj-c
- (BOOL)scanPayViewControllerShouldShowManualEntryButton:(ScanPayViewController *)scanPayViewController
{
    return NO;
}
```

Helpers
-----------

SPWebViewFiller is an helper that can manage a Webview and fill the different inputs it provides.
Here is how it works :

### Case 1
Webview is loaded and fields are ready to be filled

```obj-c
SPWebViewFiller *filler = [[SPWebViewFiller alloc] init];
[filler fillFieldWithId:@"Id of the field" andValue:@"Value_to_put_into_field" onWebView:webView];
[filler fillFieldWithId:@"Id of the field" andValue:@"Value_to_put_into_field" onWebView:webView];
[filler release];
```

### Case 2
Webview is not loaded and may encounter some redirections that cause the fields not to be available for the moment

```obj-c
SPWebViewFiller *filler = [[SPWebViewFiller alloc] initWithWebview:web];
[filler addFieldWithId:@"Id of the field" andValue:@"Value_to_put_into_field"];
[filler addFieldWithId:@"Id of the field" andValue:@"Value_to_put_into_field"];
[filler release];
```

You can then do your call with your webview and the inputs will be filled for you.

```obj-c
[web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"url"]]];
```

Contact
-----------

For any problems or suggestions please contact us at support@scanpay.it
