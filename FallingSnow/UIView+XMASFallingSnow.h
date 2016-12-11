@import Foundation;
@import UIKit;
@class XMASFallingSnowView;

@interface UIView (XMASFallingSnow)

@property (nonatomic, strong) XMASFallingSnowView *snowView;

- (void)makeItSnow;

- (void)stopSnowing;

@end
