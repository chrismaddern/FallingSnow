
#import "VENSnowOverlayView.h"
#import <QuartzCore/QuartzCore.h>

#define kDefaultFlakesCount 160
#define kDefaultFlakeWidth 20.0
#define kDefaultFlakeHeight 23.0
#define kDefaultFlakeFileName @"VENSnowflake.png"
#define kDefaultMinimumSize 0.4
#define kDefaultAnimationDurationMin 6.0
#define kDefaultAnimationDurationMax 12.0

@implementation VENSnowOverlayView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		self.clipsToBounds      = YES;
        self.backgroundColor    = [UIColor clearColor];
        
        // Set default values
		self.flakesCount        = kDefaultFlakesCount;
		self.flakeWidth         = kDefaultFlakeWidth;
		self.flakeHeight        = kDefaultFlakeHeight;
		self.flakeFileName      = kDefaultFlakeFileName;
		self.flakeMinimumSize   = kDefaultMinimumSize;
		self.animationDurationMin = kDefaultAnimationDurationMin;
		self.animationDurationMax = kDefaultAnimationDurationMax;
    }
    return self;
}


- (void)beginSnowAnimation {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // Clean up if we go to the background as CABasicAnimations tend to do odd things then
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endSnowAnimationFromNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    // Prepare Rotation Animation
	CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	rotationAnimation.repeatCount       = 1e100;
	rotationAnimation.autoreverses      = NO;
	rotationAnimation.toValue = [NSNumber numberWithFloat:6.28318531];	// 360 degrees in radians
	
    // Prepare Vertical Motion Animation
	CABasicAnimation *fallAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	fallAnimation.repeatCount       = 1e100;
	fallAnimation.autoreverses      = NO;
	
	for (UIImageView *flake in self.flakesArray) {
		CGPoint flakeStartPoint     = flake.center;
		float flakeStartY           = flakeStartPoint.y;
		float flakeEndY             = self.frame.size.height;
		flakeStartPoint.y           = flakeEndY;
		flake.center                = flakeStartPoint;
        
        // Randomize the time each flake takes to animate to give texture
		float timeInterval = ((Float32)(self.animationDurationMax - self.animationDurationMin) * (Float32)random() / (Float32)RAND_MAX);
		fallAnimation.duration = timeInterval + self.animationDurationMin;
		fallAnimation.fromValue = [NSNumber numberWithFloat:-flakeStartY];
		[flake.layer addAnimation:fallAnimation forKey:@"transform.translation.y"];
		
		rotationAnimation.duration = timeInterval * 2; // Makes sure that we don't get super-fast spinning flakes
		[flake.layer addAnimation:rotationAnimation forKey:@"transform.rotation.y"];
	}
}


- (void)endSnowAnimationFromNotification:(NSNotification *)notification {
    [self endSnowAnimation];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginSnowAnimation) name:UIApplicationDidBecomeActiveNotification object:nil];
}


- (void)endSnowAnimation {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    for (UIImageView *flake in self.flakesArray) {
        [flake removeFromSuperview];
    }
    _flakesArray = nil;
}


-(NSMutableArray *)flakesArray {
    if (!_flakesArray) {
        srandomdev();
        self.flakesArray = [[NSMutableArray alloc] initWithCapacity:self.flakesCount];
        UIImage *flakeImg = [UIImage imageNamed:self.flakeFileName];
        for (int i=0; i < self.flakesCount; i++) {
            
			// Randomize Flake size
            float flakeScale = ((Float32)1.0*(Float32)random()/(Float32)RAND_MAX);
            
            // Make sure that we don't break the current size rules
            flakeScale          = (flakeScale < self.flakeMinimumSize ? self.flakeMinimumSize : flakeScale);
            float flakeWidth    = self.flakeWidth * flakeScale;
            float flakeHeight   = self.flakeHeight * flakeScale;
            
			// Allow flakes to be partially offscreen
            float flakeXPosition = ((Float32)self.frame.size.width*(Float32)random()/(Float32)RAND_MAX);
            flakeXPosition -= flakeWidth;
            
			// enlarge content height by 1/2 view height, screen is always well populated
            float flakeYPosition = ((Float32)self.frame.size.height*1.5*(Float32)random()/(Float32)RAND_MAX);
			// flakes start y position is above upper view bound, add view height
            flakeYPosition += self.frame.size.height;
            
            CGRect frame = CGRectMake(flakeXPosition, flakeYPosition, flakeWidth, flakeHeight);
            
            UIImageView *imageView = [[UIImageView alloc] initWithImage:flakeImg];
            imageView.frame = frame;
            imageView.userInteractionEnabled = NO;
            
            [self.flakesArray addObject:imageView];
            [self addSubview:imageView];
        }
	}
    return _flakesArray;
}

@end
