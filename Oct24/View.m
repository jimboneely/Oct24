//
//  View.m
//  Oct24
//
//  Created by James Neely on 10/24/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import "View.h"
#import "LittleView.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        littleView = [[LittleView alloc] initWithFrame: frame];
        [self addSubview: littleView];
    }
    return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
        
		[UIView animateWithDuration: 2.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations: ^{
                             //This block describes what the animation should do.
                             [UIView setAnimationRepeatCount: 1];
                             littleView.center = [[touches anyObject] locationInView: self];
                             littleView.transform = CGAffineTransformMakeRotation(90 * M_PI / 180);
                             
                         }
                         completion: NULL
         ];
	}
    
    //- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();
    
	//seven red stripes
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake( 0 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake(12 * w / 13, 0, w / 13, h));
    
	CGContextSetRGBFillColor(c, 0.0, 1.0, 0.0, 1.0);
	CGContextFillPath(c);
    
    
    /*UIImage *image = [UIImage imageNamed: @"patton.jpg"];	//100 by 100
	if (image == nil) {
		NSLog(@"could not find the image");
		return;
	}
    
	//upper left corner of image
	CGPoint point = CGPointMake(
                                w - image.size.width,
                                h - image.size.height
                                );
    
	[image drawAtPoint: point];*/
	NSString *string = @"Don't touch the green!";
	CGPoint words = CGPointMake(0.0, 0.0);
	UIFont *font = [UIFont systemFontOfSize: 32.0];
    
	NSDictionary *attributes =
    [NSDictionary dictionaryWithObject: font forKey: NSFontAttributeName];
    
	[string drawAtPoint: words withAttributes: attributes];
}

@end
