#ifndef CHARTBOOST_H
#define CHARTBOOST_H

namespace jwchartboost
{	
    extern "C"
    {	
	    void initChartboost(const char *sAppId, const char *sSig);
        void showInterstitial(const char *sLoc);
    }
}

#endif
