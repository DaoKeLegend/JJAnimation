#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "KFVector.h"
#import "KFUtilities.h"
#import "KFVectorLayer.h"
#import "KFVectorParsingHelper.h"
#import "KFVectorView.h"

FOUNDATION_EXPORT double keyframesVersionNumber;
FOUNDATION_EXPORT const unsigned char keyframesVersionString[];

