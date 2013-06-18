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
2. Add the following frameworks to your project :
  * libstdc++.dylib 
  * libc++.dylib 
  * CoreVideo.framework 
  * CoreMedia.framework
  * AVFoundation.framework 
  * AudioToolbox.framework 
  * QuartzCore.framework
  * AssetsLibrary.framework
3. Go to Target -> Other Linker Flags and add the following flag: `-ObjC`
4. Go to Project Settings Build Settings search for C++ Standard Library and change to `libstdc++`
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
  return NO;
}
```
