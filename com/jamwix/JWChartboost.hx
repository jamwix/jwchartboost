package com.jamwix;

import openfl.Lib;

class JWChartboost {
	
	public static function initialize(appId:String, sig:String):Void 
	{
		#if ios
		chartboost_initialize(appId, sig);
		#end
	}
	
	public static function showInterstitial():Void
	{
		#if ios
		chartboost_showinterstitial();
		#end
	}
	
	// Native Methods
	
	
	#if ios
	private static var chartboost_initialize = 
		Lib.load ("jwchartboost", "jwchartboost_initialize", 2);
	private static var chartboost_showinterstitial = 
		Lib.load ("jwchartboost", "jwchartboost_show_interstitial", 0);
	#end
	
}


