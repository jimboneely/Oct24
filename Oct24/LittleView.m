//
//  LittleView.m
//  Oct24
//
//  Created by James Neely on 10/24/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import "LittleView.h"

@implementation LittleView
- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
	// Drawing code
	CGRect bounds = self.bounds;
	CGFloat radius = .2 * bounds.size.width;	//in pixels
    
	/*
	 Create the invisible square that will surround the circle.
	 Place the upper left corner of the square at the upper left corner of
	 the View.  bounds.origin.x and bounds.origin.y are the coordinates of
	 the upper left corner of the View.
     */
	CGRect r = CGRectMake(
                          -radius,//bounds.origin.x,
                          -radius,//bounds.origin.y,
                          2 * radius,
                          2 * radius
                          );
    
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(c, bounds.size.width / 2, bounds.size.height / 2);
	CGContextBeginPath(c);	//unnecessary here: the path is already empty.
	CGContextAddEllipseInRect(c, r);
	CGContextSetRGBFillColor(c, 1.0, 0.5467, 0.0, 1.0);	//red, opaque
	CGContextFillPath(c);
        
        CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef d = UIGraphicsGetCurrentContext();
    
	
	CGContextBeginPath(d);
	CGContextAddRect(d, CGRectMake( 0 * w / 13, 0, w / 13, h/10));
	
    
	CGContextSetRGBFillColor(d, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(d);
}

@end
