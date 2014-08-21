#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>
#include "JWChartboost.h"
#include "Chartboost.h"

@interface JWChartboost: NSObject <ChartboostDelegate>

- (void)initWithId: (NSString*) appId appSignature:(NSString*) appSig;
- (void)showInterstitial: (NSString*) location;

@end

@implementation JWChartboost

- (void)initWithId: (NSString*) appId appSignature:(NSString*) appSig
{
    [Chartboost startWithAppId: appId appSignature: appSig delegate:self];
}

- (void)showInterstitial: (NSString*) location
{
    [[Chartboost sharedChartboost] showInterstitial: location];
}

- (BOOL)shouldRequestInterstitialsInFirstSession 
{
    return NO;
}

@end

extern "C"
{
	static JWChartboost* chartboost = nil;
    
	void initChartboost(const char *sAppId, const char *sSig)
    {
		NSString *appId = [ [NSString alloc] initWithUTF8String: sAppId ];
		NSString *sig = [ [NSString alloc] initWithUTF8String: sSig ];
		chartboost = [[JWChartboost alloc] init];
        [chartboost initWithId: appId appSignature: sig];
	}
	
    void showInterstitial(const char *sLoc)
    {
		NSString *loc = [ [NSString alloc] initWithUTF8String: sLoc ];
        [chartboost showInterstitial: loc];
    }
}
