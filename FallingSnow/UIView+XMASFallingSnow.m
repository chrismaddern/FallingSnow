#import "UIView+XMASFallingSnow.h"
#import "XMASFallingSnowView.h"
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>

@implementation UIView (XMASFallingSnow)

- (void)makeItSnow {
    if (self.snowView) {
        [self stopSnowing];
    }
    XMASFallingSnowView *snowView = [[XMASFallingSnowView alloc] initWithFrame:self.frame];
    [self addSubview:snowView];
    snowView.layer.zPosition = MAXFLOAT;
    [snowView beginSnowAnimation];
    [self setSnowView:snowView];
}


- (void)stopSnowing {
    [self.snowView stopSnowing];
    [self.snowView removeFromSuperview];
    self.snowView = nil;
}


- (void)setSnowView:(XMASFallingSnowView *)snowView {
    objc_setAssociatedObject(self, @selector(snowView), snowView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (XMASFallingSnowView *)snowView {
    XMASFallingSnowView *snowView = objc_getAssociatedObject(self, @selector(snowView));
    return snowView;
}

@end
