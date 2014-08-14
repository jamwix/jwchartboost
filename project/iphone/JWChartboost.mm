#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>
#include "JWChartboost.h"
#include "Chartboost.h"

@interface JWChartboost: NSObject <ChartboostDelegate>

- (void)initWithId: (NSString*) appId appSignature:(NSString*) appSig;
- (void)showInterstitial;

@end

@implementation JWChartboost

- (void)initWithId: (NSString*) appId appSignature:(NSString*) appSig
{
    [Chartboost startWithAppId: appId appSignature: appSig delegate:self];
}

- (void)showInterstitial
{
    [[Chartboost sharedChartboost] showInterstitial: CBLocationHomeScreen];
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
	
    void showInterstitial()
    {
        [chartboost showInterstitial];
    }
}
