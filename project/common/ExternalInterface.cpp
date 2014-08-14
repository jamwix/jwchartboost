#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include <stdio.h>
#include "JWChartboost.h"


using namespace jwchartboost;

static value jwchartboost_initialize(value appId, value sig) 
{
	#ifdef IPHONE
	initChartboost(val_string(appId), val_string(sig));
	#endif
	return alloc_null();
}
DEFINE_PRIM (jwchartboost_initialize, 2);


static value jwchartboost_show_interstitial() 
{
	#ifdef IPHONE
	showInterstitial();
	#endif
	return alloc_null();
}
DEFINE_PRIM (jwchartboost_show_interstitial, 0);

extern "C" void jwchartboost_main() 
{
	val_int(0); // Fix Neko init
}
DEFINE_ENTRY_POINT(jwchartboost_main);

extern "C" int jwchartboost_register_prims() { return 0; }

