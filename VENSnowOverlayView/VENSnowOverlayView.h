#import <UIKit/UIKit.h>

@interface VENSnowOverlayView : UIView

@property (nonatomic, retain) NSMutableArray *flakesArray;
@property (nonatomic, retain) NSString *flakeFileName;
@property (nonatomic, assign) NSInteger flakesCount;
@property (nonatomic, assign) float flakeWidth;
@property (nonatomic, assign) float flakeHeight;
@property (nonatomic, assign) float flakeMinimumSize;
@property (nonatomic, assign) float animationDurationMin;
@property (nonatomic, assign) float animationDurationMax;

- (void)beginSnowAnimation;

@end
