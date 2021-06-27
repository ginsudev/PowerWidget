#import <UIKit/UIKit.h>
#import "NSTask.h"

@interface SBHWidgetContainerViewController : UIViewController
@property (nonatomic,copy) NSString * applicationName;
@property (nonatomic,readonly) unsigned long long gridSizeClass;
-(void)createPowerWidget;
-(void)setPWFrame;
@end

@interface SBHWidgetContainerView : UIView
@property (nonatomic,copy) NSString * applicationName;
@property (nonatomic,readonly) unsigned long long gridSizeClass;
-(void)setPWFrame;
@end

@interface CHUISAvocadoHostViewController : UIViewController
@property (nonatomic,copy,readonly) NSString * extensionBundleIdentifier;
@end

@interface UIUserInterfaceStyleArbiter : NSObject
+(id)sharedInstance;
-(long long)currentStyle;
@end

UIView *overlay;
UIView *respringContainer;
UITapGestureRecognizer *respringTap;
UIImageView *respringButton;
UIView *safeModeContainer;
UITapGestureRecognizer *safeModeTap;
UIImageView *safeModeButton;
UIView *rebootContainer;
UITapGestureRecognizer *rebootTap;
UIImageView *rebootButton;
UIView *uicacheContainer;
UITapGestureRecognizer *uicacheTap;
UIImageView *uicacheButton;
UIVisualEffect *blurEffect;
UIVisualEffectView *visualEffectView;

%hook CHUISAvocadoHostViewController
-(void)viewWillAppear:(BOOL)arg1{
  %orig;
  if ([self.extensionBundleIdentifier isEqualToString:@"com.ginsu.Power.PowerWidget"]){
    [self.view setHidden:YES];
  }
}
%end

%hook SBHWidgetContainerView
-(void)layoutSubviews{
  %orig;
  if ([self.applicationName isEqualToString:@"Power"]){
    [self setPWFrame];
  }
}

-(void)viewWillAppear:(BOOL)arg1{
  %orig;
  if ([self.applicationName isEqualToString:@"Power"]){
    [self setPWFrame];
  }
}

%new -(void)setPWFrame{
  overlay.frame = self.bounds;
  visualEffectView.frame = overlay.bounds;

  if (self.gridSizeClass == 1){
    //small
    respringContainer.frame = CGRectMake(10,10, self.frame.size.width/2 - 15, self.frame.size.height/2 - 15);
    safeModeContainer.frame = CGRectMake(10,respringContainer.frame.origin.y + respringContainer.frame.size.height + 10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    rebootContainer.frame = CGRectMake(respringContainer.frame.origin.x + respringContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    uicacheContainer.frame = CGRectMake(rebootContainer.frame.origin.x,rebootContainer.frame.origin.y + rebootContainer.frame.size.height + 10, respringContainer.frame.size.width, respringContainer.frame.size.height);
  } else if (self.gridSizeClass == 3){
    //large
    respringContainer.frame = CGRectMake(10,10, self.frame.size.width/2 - 15, self.frame.size.height/2 - 15);
    safeModeContainer.frame = CGRectMake(10,respringContainer.frame.origin.y + respringContainer.frame.size.height + 10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    rebootContainer.frame = CGRectMake(respringContainer.frame.origin.x + respringContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    uicacheContainer.frame = CGRectMake(rebootContainer.frame.origin.x,rebootContainer.frame.origin.y + rebootContainer.frame.size.height + 10, respringContainer.frame.size.width, respringContainer.frame.size.height);
  } else if (self.gridSizeClass == 2){
    //medium
    respringContainer.frame = CGRectMake(10,10, self.frame.size.width/4 - 12.5, self.frame.size.height - 20);
    safeModeContainer.frame = CGRectMake(respringContainer.frame.origin.x + respringContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    rebootContainer.frame = CGRectMake(safeModeContainer.frame.origin.x + safeModeContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    uicacheContainer.frame = CGRectMake(rebootContainer.frame.origin.x + rebootContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);

  }

  respringButton.frame = CGRectMake(respringContainer.frame.size.width/2 - 25,respringContainer.frame.size.height/2 - 25,50,50);
  safeModeButton.frame = CGRectMake(safeModeContainer.frame.size.width/2 - 25,safeModeContainer.frame.size.height/2 - 25,50,50);
  rebootButton.frame = CGRectMake(rebootContainer.frame.size.width/2 - 25,rebootContainer.frame.size.height/2 - 25,50,50);
  uicacheButton.frame = CGRectMake(rebootContainer.frame.size.width/2 - 25,rebootContainer.frame.size.height/2 - 25,50,50);
}
%end

%hook SBHWidgetContainerViewController

-(void)viewWillAppear:(BOOL)arg1{
  %orig;
  if ([self.applicationName isEqualToString:@"Power"]){
    [self setPWFrame];
  }
}

%new -(void)setPWFrame{
  overlay.frame = self.view.bounds;
  visualEffectView.frame = overlay.bounds;

  if (self.gridSizeClass == 1){
    //small
    respringContainer.frame = CGRectMake(10,10, self.view.frame.size.width/2 - 15, self.view.frame.size.height/2 - 15);
    safeModeContainer.frame = CGRectMake(10,respringContainer.frame.origin.y + respringContainer.frame.size.height + 10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    rebootContainer.frame = CGRectMake(respringContainer.frame.origin.x + respringContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    uicacheContainer.frame = CGRectMake(rebootContainer.frame.origin.x,rebootContainer.frame.origin.y + rebootContainer.frame.size.height + 10, respringContainer.frame.size.width, respringContainer.frame.size.height);
  } else if (self.gridSizeClass == 3){
    //large
    respringContainer.frame = CGRectMake(10,10, self.view.frame.size.width/2 - 15, self.view.frame.size.height/2 - 15);
    safeModeContainer.frame = CGRectMake(10,respringContainer.frame.origin.y + respringContainer.frame.size.height + 10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    rebootContainer.frame = CGRectMake(respringContainer.frame.origin.x + respringContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    uicacheContainer.frame = CGRectMake(rebootContainer.frame.origin.x,rebootContainer.frame.origin.y + rebootContainer.frame.size.height + 10, respringContainer.frame.size.width, respringContainer.frame.size.height);
  } else if (self.gridSizeClass == 2){
    //medium
    respringContainer.frame = CGRectMake(10,10, self.view.frame.size.width/4 - 12.5, self.view.frame.size.height - 20);
    safeModeContainer.frame = CGRectMake(respringContainer.frame.origin.x + respringContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    rebootContainer.frame = CGRectMake(safeModeContainer.frame.origin.x + safeModeContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);
    uicacheContainer.frame = CGRectMake(rebootContainer.frame.origin.x + rebootContainer.frame.size.width + 10,10, respringContainer.frame.size.width, respringContainer.frame.size.height);

  }

  respringButton.frame = CGRectMake(respringContainer.frame.size.width/2 - 25,respringContainer.frame.size.height/2 - 25,50,50);
  safeModeButton.frame = CGRectMake(safeModeContainer.frame.size.width/2 - 25,safeModeContainer.frame.size.height/2 - 25,50,50);
  rebootButton.frame = CGRectMake(rebootContainer.frame.size.width/2 - 25,rebootContainer.frame.size.height/2 - 25,50,50);
  uicacheButton.frame = CGRectMake(rebootContainer.frame.size.width/2 - 25,rebootContainer.frame.size.height/2 - 25,50,50);
}

-(void)viewDidLoad{
  %orig;
  [self createPowerWidget];
}

%new -(void)createPowerWidget{
  if ([self.applicationName isEqualToString:@"Power"]){

      overlay = [[UIView alloc] init];
      [self.view addSubview:overlay];
      [self.view bringSubviewToFront:overlay];

      BOOL isDarkMode = ([[%c(UIUserInterfaceStyleArbiter) sharedInstance] currentStyle] == 2) ? YES : NO;
      blurEffect = isDarkMode ? [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark] : [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterialLight];
      visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
      [overlay addSubview:visualEffectView];

      //Respring
      respringContainer = [[UIView alloc] init];
      [respringContainer.layer setCornerRadius:13];
      respringContainer.clipsToBounds = YES;
      respringContainer.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
      respringTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleRespring:)];
      respringButton = [[UIImageView alloc]init];
      respringButton.image = [[UIImage imageNamed:@"/Library/Application Support/PowerWidget/respringIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
      respringButton.tintColor = isDarkMode ? [UIColor whiteColor] : [UIColor blackColor];


      //Safe mode
      safeModeContainer = [[UIView alloc] init];
      [safeModeContainer.layer setCornerRadius:13];
      safeModeContainer.clipsToBounds = YES;
      safeModeContainer.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
      safeModeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSafeMode:)];
      safeModeButton = [[UIImageView alloc]init];
      safeModeButton.image = [[UIImage imageNamed:@"/Library/Application Support/PowerWidget/safemodeIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
      safeModeButton.tintColor = isDarkMode ? [UIColor whiteColor] : [UIColor blackColor];


      //Reboot
      rebootContainer = [[UIView alloc] init];
      [rebootContainer.layer setCornerRadius:13];
      rebootContainer.clipsToBounds = YES;
      rebootContainer.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
      rebootTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleReboot:)];
      rebootButton = [[UIImageView alloc]init];
      rebootButton.image = [[UIImage imageNamed:@"/Library/Application Support/PowerWidget/rebootIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
      rebootButton.tintColor = isDarkMode ? [UIColor whiteColor] : [UIColor blackColor];


      //UICache
      uicacheContainer = [[UIView alloc] init];
      [uicacheContainer.layer setCornerRadius:13];
      uicacheContainer.clipsToBounds = YES;
      uicacheContainer.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
      uicacheTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleUIcache:)];
      uicacheButton = [[UIImageView alloc]init];
      uicacheButton.image = [[UIImage imageNamed:@"/Library/Application Support/PowerWidget/uicacheIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
      uicacheButton.tintColor = isDarkMode ? [UIColor whiteColor] : [UIColor blackColor];

      [overlay addSubview:respringContainer];
      [respringContainer addGestureRecognizer:respringTap];
      [respringContainer addSubview:respringButton];
      [overlay addSubview:safeModeContainer];
      [safeModeContainer addGestureRecognizer:safeModeTap];
      [safeModeContainer addSubview:safeModeButton];
      [overlay addSubview:rebootContainer];
      [rebootContainer addGestureRecognizer:rebootTap];
      [rebootContainer addSubview:rebootButton];
      [overlay addSubview:uicacheContainer];
      [uicacheContainer addGestureRecognizer:uicacheTap];
      [uicacheContainer addSubview:uicacheButton];
  }
}

%new -(void)handleRespring:(UITapGestureRecognizer *)recognizer
{

  UIAlertController *alert = [UIAlertController
  alertControllerWithTitle:@"Power Widget"
  message:@"Respring confirmation."
  preferredStyle:UIAlertControllerStyleAlert];

  UIAlertAction* noButton = [UIAlertAction
  actionWithTitle:@"Cancel"
  style:UIAlertActionStyleDefault
  handler:^(UIAlertAction * action) {
  }];

  UIAlertAction* yesButton = [UIAlertAction
  actionWithTitle:@"Proceed"
  style:UIAlertActionStyleDefault
  handler:^(UIAlertAction * action) {
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/bin/bash"];
    [task setArguments:@[@"-c", @"/usr/bin/killall SpringBoard"]];
    [task launch];
  }];

  [alert addAction:noButton];
  [alert addAction:yesButton];
  [self presentViewController:alert animated:YES completion:nil];

}

%new -(void)handleSafeMode:(UITapGestureRecognizer *)recognizer
{
  UIAlertController *alert = [UIAlertController
  alertControllerWithTitle:@"Power Widget"
  message:@"Safe mode confirmation."
  preferredStyle:UIAlertControllerStyleAlert];

  UIAlertAction* noButton = [UIAlertAction
  actionWithTitle:@"Cancel"
  style:UIAlertActionStyleDefault
  handler:^(UIAlertAction * action) {
  }];

  UIAlertAction* yesButton = [UIAlertAction
  actionWithTitle:@"Proceed"
  style:UIAlertActionStyleDefault
  handler:^(UIAlertAction * action) {
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/bin/bash"];
    [task setArguments:@[@"-c", @"/usr/bin/killall -SEGV SpringBoard"]];
    [task launch];
  }];

  [alert addAction:noButton];
  [alert addAction:yesButton];
  [self presentViewController:alert animated:YES completion:nil];
}

%new -(void)handleReboot:(UITapGestureRecognizer *)recognizer
{
  UIAlertController *alert = [UIAlertController
  alertControllerWithTitle:@"Power Widget"
  message:@"Reboot userspace confirmation."
  preferredStyle:UIAlertControllerStyleAlert];

  UIAlertAction* noButton = [UIAlertAction
  actionWithTitle:@"Cancel"
  style:UIAlertActionStyleDefault
  handler:^(UIAlertAction * action) {
  }];

  UIAlertAction* yesButton = [UIAlertAction
  actionWithTitle:@"Proceed"
  style:UIAlertActionStyleDefault
  handler:^(UIAlertAction * action) {
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/bin/bash"];
    [task setArguments:@[@"-c", @"launchctl reboot userspace"]];
    [task launch];
  }];

  [alert addAction:noButton];
  [alert addAction:yesButton];
  [self presentViewController:alert animated:YES completion:nil];
}

%new -(void)handleUIcache:(UITapGestureRecognizer *)recognizer
{

  UIAlertController *alert = [UIAlertController
  alertControllerWithTitle:@"Power Widget"
  message:@"UICache confirmation. It may take a moment to complete."
  preferredStyle:UIAlertControllerStyleAlert];

  UIAlertAction* noButton = [UIAlertAction
  actionWithTitle:@"Cancel"
  style:UIAlertActionStyleDefault
  handler:^(UIAlertAction * action) {
  }];

  UIAlertAction* yesButton = [UIAlertAction
  actionWithTitle:@"Proceed"
  style:UIAlertActionStyleDefault
  handler:^(UIAlertAction * action) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *pathForFile = @"/Applications/Sileo.app/Sileo";

    if ([fileManager fileExistsAtPath:pathForFile]){
      NSTask *task = [[NSTask alloc] init];
      [task setLaunchPath:@"/bin/bash"];
      [task setArguments:@[@"-c", @"uicache --all"]];
      [task launch];
    } else {
      NSTask *task = [[NSTask alloc] init];
      [task setLaunchPath:@"/bin/bash"];
      [task setArguments:@[@"-c", @"uicache"]];
      [task launch];
    }
  }];

  [alert addAction:noButton];
  [alert addAction:yesButton];
  [self presentViewController:alert animated:YES completion:nil];
}

%end
