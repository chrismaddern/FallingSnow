#import "FSEViewController.h"
#import "XMASFallingSnow.h"

@interface FSEViewController ()

@end

@implementation FSEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XMASFallingSnow *snowOverlay = [[XMASFallingSnow alloc] initWithFrame:self.view.frame];
    [self.view addSubview:snowOverlay];
    [snowOverlay beginSnowAnimation];
}

@end
