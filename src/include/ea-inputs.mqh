//+------------------------------------------------------------------+
//|                  EA31337 - multi-strategy advanced trading robot |
//|                       Copyright 2016-2020, 31337 Investments Ltd |
//|                                       https://github.com/EA31337 |
//+------------------------------------------------------------------+

// Includes version specific user input params.
input static string __EA_Parameters__ = "-- input EA parameters for " + ea_name + " v" + ea_version + " --"; // >>> EA31337 <<<
#ifdef __advanced__ // Include default input settings based on the mode.
  #ifdef __rider__
    #include "EA31337/rider/ea-input.mqh"
  #else
    #include "EA31337/advanced/ea-input.mqh"
  #endif
#else
  #include "EA31337/lite/ea-input.mqh"
#endif

// Includes strategies.
input static string __Strategy_Timeframes__ = "-- Strategy's timeframes --"; // >>> STRATEGY'S TIMEFRAMES (1-255: M1=1,M5=2,M15=4,M30=8,H1=16,H2=32,H4=64...) <<<
input unsigned int AC_Active_Tf = 0; // AC: Activated timeframes
input unsigned int AD_Active_Tf = 0; // AD: Activated timeframes
input unsigned int ADX_Active_Tf = 0; // ADX: Activated timeframes
input unsigned int Alligator_Active_Tf = 0; // Alligator: Activated timeframes
unsigned int ATR_Active_Tf = 0; // ATR: Activated timeframes
unsigned int Awesome_Active_Tf = 0; // Awesome: Activated timeframes
input unsigned int Bands_Active_Tf = 0; // Bands: Activated timeframes
unsigned int BearsPower_Active_Tf = 0; // BearsPower: Activated timeframes
unsigned int BullsPower_Active_Tf = 0; // BullsPower: Activated timeframes
unsigned int BWMFI_Active_Tf = 0; // BWMFI: Activated timeframes
input unsigned int CCI_Active_Tf = 15; // CCI: Activated timeframes
input unsigned int DeMarker_Active_Tf = 0; // DeMarker: Activated timeframes
input unsigned int Envelopes_Active_Tf = 4; // Envelopes: Activated timeframes
input unsigned int Force_Active_Tf = 0; // Force: Activated timeframes
input unsigned int Fractals_Active_Tf = 0; // Fractals: Activated timeframes
unsigned int Gator_Active_Tf = 0; // Gator: Activated timeframes
unsigned int Ichimoku_Active_Tf = 0; // Ichimoku: Activated timeframes
unsigned int MA_Active_Tf = 0; // MA: Activated timeframes
input unsigned int MACD_Active_Tf = 0; // MACD: Activated timeframes
input unsigned int MFI_Active_Tf = 0; // MFI: Activated timeframes
unsigned int Momentum_Active_Tf = 0; // Momentum: Activated timeframes
unsigned int OBV_Active_Tf = 0; // OBV: Activated timeframes
unsigned int OsMA_Active_Tf = 0; // OsMA: Activated timeframes
input unsigned int RSI_Active_Tf = 12; // RSI: Activated timeframes
unsigned int RVI_Active_Tf = 0; // RVI: Activated timeframes
input unsigned int SAR_Active_Tf = 8; // SAR: Activated timeframes
unsigned int StdDev_Active_Tf = 0; // StdDev: Activated timeframes
unsigned int Stochastic_Active_Tf = 0; // Stochastic: Activated timeframes
input unsigned int WPR_Active_Tf = 0; // WPR: Activated timeframes
unsigned int ZigZag_Active_Tf = 0; // ZigZag: Activated timeframes

input static string __Strategy_Trails__ = "-- Strategy's trail stops --"; // >>> STRATEGY'S TRAIL STOPS <<<
input ENUM_TRAIL_TYPE AC_TrailingStopMethod = 3; // AC: Trail stop method
input ENUM_TRAIL_TYPE AC_TrailingProfitMethod = 22; // AC: Trail profit method
input ENUM_TRAIL_TYPE AD_TrailingStopMethod = 7; // AD: Trail stop method
input ENUM_TRAIL_TYPE AD_TrailingProfitMethod = 11; // AD: Trail profit method
input ENUM_TRAIL_TYPE ADX_TrailingStopMethod = 11; // ADX: Trail stop method
input ENUM_TRAIL_TYPE ADX_TrailingProfitMethod = 25; // ADX: Trail profit method
input ENUM_TRAIL_TYPE Alligator_TrailingStopMethod = 7; // Alligator: Trail stop method
input ENUM_TRAIL_TYPE Alligator_TrailingProfitMethod = 25; // Alligator: Trail profit method
ENUM_TRAIL_TYPE ATR_TrailingStopMethod = 7; // ATR: Trail stop method
ENUM_TRAIL_TYPE ATR_TrailingProfitMethod = 22; // ATR: Trail profit method
ENUM_TRAIL_TYPE Awesome_TrailingStopMethod = 22; // Awesome: Trail stop method
ENUM_TRAIL_TYPE Awesome_TrailingProfitMethod = 1; // Awesome: Trail profit method
input ENUM_TRAIL_TYPE Bands_TrailingStopMethod = 7; // Bands: Trail stop method
input ENUM_TRAIL_TYPE Bands_TrailingProfitMethod = 22; // Bands: Trail profit method
ENUM_TRAIL_TYPE BearsPower_TrailingStopMethod = 22; // BearsPower: Trail stop method
ENUM_TRAIL_TYPE BearsPower_TrailingProfitMethod = 1; // BearsPower: Trail profit method
ENUM_TRAIL_TYPE BullsPower_TrailingStopMethod = 22; // BullsPower: Trail stop method
ENUM_TRAIL_TYPE BullsPower_TrailingProfitMethod = 1; // BullsPower: Trail profit method
ENUM_TRAIL_TYPE BWMFI_TrailingStopMethod = 22; // BWMFI: Trail stop method
ENUM_TRAIL_TYPE BWMFI_TrailingProfitMethod = 1; // BWMFI: Trail profit method
input ENUM_TRAIL_TYPE CCI_TrailingStopMethod = 1; // CCI: Trail stop method
input ENUM_TRAIL_TYPE CCI_TrailingProfitMethod = 1; // CCI: Trail profit method
input ENUM_TRAIL_TYPE DeMarker_TrailingStopMethod = 23; // DeMarker: Trail stop method
input ENUM_TRAIL_TYPE DeMarker_TrailingProfitMethod = 22; // DeMarker: Trail profit method
input ENUM_TRAIL_TYPE Envelopes_TrailingStopMethod = 23; // Envelopes: Trail stop method
input ENUM_TRAIL_TYPE Envelopes_TrailingProfitMethod = -2; // Envelopes: Trail profit method
input ENUM_TRAIL_TYPE Force_TrailingStopMethod = 7; // Force: Trail stop method
input ENUM_TRAIL_TYPE Force_TrailingProfitMethod = 22; // Force: Trail profit method
input ENUM_TRAIL_TYPE Fractals_TrailingStopMethod = 1; // Fractals: Trail stop method
input ENUM_TRAIL_TYPE Fractals_TrailingProfitMethod = 21; // Fractals: Trail profit method
ENUM_TRAIL_TYPE Gator_TrailingStopMethod = 22; // Gator: Trail stop method
ENUM_TRAIL_TYPE Gator_TrailingProfitMethod = 1; // Gator: Trail profit method
ENUM_TRAIL_TYPE Ichimoku_TrailingStopMethod = 22; // Ichimoku: Trail stop method
ENUM_TRAIL_TYPE Ichimoku_TrailingProfitMethod = 1; // Ichimoku: Trail profit method
ENUM_TRAIL_TYPE MA_TrailingStopMethod = 23; // MA: Trail stop method
ENUM_TRAIL_TYPE MA_TrailingProfitMethod = 16; // MA: Trail profit method
input ENUM_TRAIL_TYPE MACD_TrailingStopMethod = -1; // MACD: Trail stop method
input ENUM_TRAIL_TYPE MACD_TrailingProfitMethod = -19; // MACD: Trail profit method
input ENUM_TRAIL_TYPE MFI_TrailingStopMethod = 7; // MFI: Trail stop method
input ENUM_TRAIL_TYPE MFI_TrailingProfitMethod = 22; // MFI: Trail profit method
ENUM_TRAIL_TYPE Momentum_TrailingStopMethod = 22; // Momentum: Trail stop method
ENUM_TRAIL_TYPE Momentum_TrailingProfitMethod = 1; // Momentum: Trail profit method
ENUM_TRAIL_TYPE OBV_TrailingStopMethod = 22; // OBV: Trail stop method
ENUM_TRAIL_TYPE OBV_TrailingProfitMethod = 1; // OBV: Trail profit method
ENUM_TRAIL_TYPE OsMA_TrailingStopMethod = 25; // OsMA: Trail stop method
ENUM_TRAIL_TYPE OsMA_TrailingProfitMethod = 1; // OsMA: Trail profit method
input ENUM_TRAIL_TYPE RSI_TrailingStopMethod = 6; // RSI: Trail stop method
input ENUM_TRAIL_TYPE RSI_TrailingProfitMethod = 11; // RSI: Trail profit method
ENUM_TRAIL_TYPE RVI_TrailingStopMethod = 22; // RVI: Trail stop method
ENUM_TRAIL_TYPE RVI_TrailingProfitMethod = 1; // RVI: Trail profit method
input ENUM_TRAIL_TYPE SAR_TrailingStopMethod = 7; // SAR: Trail stop method
input ENUM_TRAIL_TYPE SAR_TrailingProfitMethod = 11; // SAR: Trail profit method
ENUM_TRAIL_TYPE StdDev_TrailingStopMethod = 22; // StdDev: Trail stop method
ENUM_TRAIL_TYPE StdDev_TrailingProfitMethod = 1; // StdDev: Trail profit method
ENUM_TRAIL_TYPE Stochastic_TrailingStopMethod = 22; // Stochastic: Trail stop method
ENUM_TRAIL_TYPE Stochastic_TrailingProfitMethod = 1; // Stochastic: Trail profit method
input ENUM_TRAIL_TYPE WPR_TrailingStopMethod = 22; // WPR: Trail stop method
input ENUM_TRAIL_TYPE WPR_TrailingProfitMethod = 11; // WPR: Trail profit method
ENUM_TRAIL_TYPE ZigZag_TrailingStopMethod = 22; // ZigZag: Trail stop method
ENUM_TRAIL_TYPE ZigZag_TrailingProfitMethod = 1; // ZigZag: Trail profit method

#ifdef __advanced__
input static string __Strategy_Close_Conditions__ = "-- Strategy's close conditions --"; // >>> STRATEGY'S CLOSE CONDITIONS <<<
input ENUM_MARKET_EVENT AC1_CloseCondition = 26; // AC: Close condition for M1
input ENUM_MARKET_EVENT AC5_CloseCondition = 24; // AC: Close condition for M5
input ENUM_MARKET_EVENT AC15_CloseCondition = 1; // AC: Close condition for M15
input ENUM_MARKET_EVENT AC30_CloseCondition = 29; // AC: Close condition for M30
input ENUM_MARKET_EVENT AD1_CloseCondition = 2; // AD: Close condition for M1
input ENUM_MARKET_EVENT AD5_CloseCondition = 3; // AD: Close condition for M5
input ENUM_MARKET_EVENT AD15_CloseCondition = 1; // AD: Close condition for M15
input ENUM_MARKET_EVENT AD30_CloseCondition = 24; // AD: Close condition for M30
input ENUM_MARKET_EVENT ADX1_CloseCondition = 13; // ADX: Close condition for M1
input ENUM_MARKET_EVENT ADX5_CloseCondition = 11; // ADX: Close condition for M5
input ENUM_MARKET_EVENT ADX15_CloseCondition = 1; // ADX: Close condition for M15
input ENUM_MARKET_EVENT ADX30_CloseCondition = 24; // ADX: Close condition for M30
input ENUM_MARKET_EVENT Alligator1_CloseCondition = 4; // Alligator: Close condition for M1
input ENUM_MARKET_EVENT Alligator5_CloseCondition = 4; // Alligator: Close condition for M5
input ENUM_MARKET_EVENT Alligator15_CloseCondition = 5; // Alligator: Close condition for M15
input ENUM_MARKET_EVENT Alligator30_CloseCondition = 11; // Alligator: Close condition for M30
ENUM_MARKET_EVENT ATR1_CloseCondition = 1; // ATR: Close condition for M1
ENUM_MARKET_EVENT ATR5_CloseCondition = 1; // ATR: Close condition for M5
ENUM_MARKET_EVENT ATR15_CloseCondition = 1; // ATR: Close condition for M15
ENUM_MARKET_EVENT ATR30_CloseCondition = 1; // ATR: Close condition for M30
ENUM_MARKET_EVENT Awesome1_CloseCondition = C_AWESOME_BUY_SELL; // Awesome: Close condition for M1
ENUM_MARKET_EVENT Awesome5_CloseCondition = C_AWESOME_BUY_SELL; // Awesome: Close condition for M5
ENUM_MARKET_EVENT Awesome15_CloseCondition = C_AWESOME_BUY_SELL; // Awesome: Close condition for M15
ENUM_MARKET_EVENT Awesome30_CloseCondition = C_AWESOME_BUY_SELL; // Awesome: Close condition for M30
input ENUM_MARKET_EVENT Bands1_CloseCondition = 24; // Bands: Close condition for M1
input ENUM_MARKET_EVENT Bands5_CloseCondition = 11; // Bands: Close condition for M5
input ENUM_MARKET_EVENT Bands15_CloseCondition = 2; // Bands: Close condition for M15
input ENUM_MARKET_EVENT Bands30_CloseCondition = 1; // Bands: Close condition for M30
ENUM_MARKET_EVENT BearsPower1_CloseCondition = C_BEARSPOWER_BUY_SELL; // BearsPower: Close condition for M1
ENUM_MARKET_EVENT BearsPower5_CloseCondition = C_BEARSPOWER_BUY_SELL; // BearsPower: Close condition for M5
ENUM_MARKET_EVENT BearsPower15_CloseCondition = C_BEARSPOWER_BUY_SELL; // BearsPower: Close condition for M15
ENUM_MARKET_EVENT BearsPower30_CloseCondition = C_BEARSPOWER_BUY_SELL; // BearsPower: Close condition for M30
ENUM_MARKET_EVENT BullsPower1_CloseCondition = C_BULLSPOWER_BUY_SELL; // BullsPower: Close condition for M1
ENUM_MARKET_EVENT BullsPower5_CloseCondition = C_BULLSPOWER_BUY_SELL; // BullsPower: Close condition for M5
ENUM_MARKET_EVENT BullsPower15_CloseCondition = C_BULLSPOWER_BUY_SELL; // BullsPower: Close condition for M15
ENUM_MARKET_EVENT BullsPower30_CloseCondition = C_BULLSPOWER_BUY_SELL; // BullsPower: Close condition for M30
ENUM_MARKET_EVENT BWMFI1_CloseCondition = C_BWMFI_BUY_SELL; // BWMFI: Close condition for M1
ENUM_MARKET_EVENT BWMFI5_CloseCondition = C_BWMFI_BUY_SELL; // BWMFI: Close condition for M5
ENUM_MARKET_EVENT BWMFI15_CloseCondition = C_BWMFI_BUY_SELL; // BWMFI: Close condition for M15
ENUM_MARKET_EVENT BWMFI30_CloseCondition = C_BWMFI_BUY_SELL; // BWMFI: Close condition for M30
input ENUM_MARKET_EVENT CCI1_CloseCondition = 31; // CCI: Close condition for M1
input ENUM_MARKET_EVENT CCI5_CloseCondition = 5; // CCI: Close condition for M5
input ENUM_MARKET_EVENT CCI15_CloseCondition = 5; // CCI: Close condition for M15
input ENUM_MARKET_EVENT CCI30_CloseCondition = 5; // CCI: Close condition for M30
input ENUM_MARKET_EVENT DeMarker1_CloseCondition = 1; // DeMarker: Close condition for M1
input ENUM_MARKET_EVENT DeMarker5_CloseCondition = 1; // DeMarker: Close condition for M5
input ENUM_MARKET_EVENT DeMarker15_CloseCondition = 1; // DeMarker: Close condition for M15
input ENUM_MARKET_EVENT DeMarker30_CloseCondition = 1; // DeMarker: Close condition for M30
input ENUM_MARKET_EVENT Envelopes1_CloseCondition = 13; // Envelopes: Close condition for M1
input ENUM_MARKET_EVENT Envelopes5_CloseCondition = 7; // Envelopes: Close condition for M5
input ENUM_MARKET_EVENT Envelopes15_CloseCondition = 29; // Envelopes: Close condition for M15
input ENUM_MARKET_EVENT Envelopes30_CloseCondition = 29; // Envelopes: Close condition for M30
input ENUM_MARKET_EVENT Force1_CloseCondition = 1; // Force: Close condition for M1
input ENUM_MARKET_EVENT Force5_CloseCondition = 1; // Force: Close condition for M5
input ENUM_MARKET_EVENT Force15_CloseCondition = 1; // Force: Close condition for M15
input ENUM_MARKET_EVENT Force30_CloseCondition = 1; // Force: Close condition for M30
input ENUM_MARKET_EVENT Fractals1_CloseCondition = 11; // Fractals: Close condition for M1
input ENUM_MARKET_EVENT Fractals5_CloseCondition = 1; // Fractals: Close condition for M5
input ENUM_MARKET_EVENT Fractals15_CloseCondition = 15; // Fractals: Close condition for M15
input ENUM_MARKET_EVENT Fractals30_CloseCondition = 1; // Fractals: Close condition for M30
ENUM_MARKET_EVENT Gator1_CloseCondition = C_GATOR_BUY_SELL; // Gator: Close condition for M1
ENUM_MARKET_EVENT Gator5_CloseCondition = C_GATOR_BUY_SELL; // Gator: Close condition for M5
ENUM_MARKET_EVENT Gator15_CloseCondition = C_GATOR_BUY_SELL; // Gator: Close condition for M15
ENUM_MARKET_EVENT Gator30_CloseCondition = C_GATOR_BUY_SELL; // Gator: Close condition for M30
ENUM_MARKET_EVENT Ichimoku1_CloseCondition = C_ICHIMOKU_BUY_SELL; // Ichimoku: Close condition for M1
ENUM_MARKET_EVENT Ichimoku5_CloseCondition = C_ICHIMOKU_BUY_SELL; // Ichimoku: Close condition for M5
ENUM_MARKET_EVENT Ichimoku15_CloseCondition = C_ICHIMOKU_BUY_SELL; // Ichimoku: Close condition for M15
ENUM_MARKET_EVENT Ichimoku30_CloseCondition = C_ICHIMOKU_BUY_SELL; // Ichimoku: Close condition for M30
ENUM_MARKET_EVENT MA1_CloseCondition = 24; // MA: Close condition for M1
ENUM_MARKET_EVENT MA5_CloseCondition = 11; // MA: Close condition for M5
ENUM_MARKET_EVENT MA15_CloseCondition = 24; // MA: Close condition for M15
ENUM_MARKET_EVENT MA30_CloseCondition = 1; // MA: Close condition for M30
input ENUM_MARKET_EVENT MACD1_CloseCondition = 1; // MACD: Close condition for M1
input ENUM_MARKET_EVENT MACD5_CloseCondition = 1; // MACD: Close condition for M5
input ENUM_MARKET_EVENT MACD15_CloseCondition = 1; // MACD: Close condition for M15
input ENUM_MARKET_EVENT MACD30_CloseCondition = 1; // MACD: Close condition for M30
input ENUM_MARKET_EVENT MFI1_CloseCondition = 14; // Close condition for M1
input ENUM_MARKET_EVENT MFI5_CloseCondition = 2; // Close condition for M5
input ENUM_MARKET_EVENT MFI15_CloseCondition = 1; // Close condition for M15
input ENUM_MARKET_EVENT MFI30_CloseCondition = 3; // Close condition for M30
ENUM_MARKET_EVENT Momentum1_CloseCondition = C_MOMENTUM_BUY_SELL; // Close condition for M1
ENUM_MARKET_EVENT Momentum5_CloseCondition = C_MOMENTUM_BUY_SELL; // Close condition for M5
ENUM_MARKET_EVENT Momentum15_CloseCondition = C_MOMENTUM_BUY_SELL; // Close condition for M15
ENUM_MARKET_EVENT Momentum30_CloseCondition = C_MOMENTUM_BUY_SELL; // Close condition for M30
ENUM_MARKET_EVENT OBV1_CloseCondition = C_OBV_BUY_SELL; // OBV: Close condition for M1
ENUM_MARKET_EVENT OBV5_CloseCondition = C_OBV_BUY_SELL; // OBV: Close condition for M5
ENUM_MARKET_EVENT OBV15_CloseCondition = C_OBV_BUY_SELL; // OBV: Close condition for M15
ENUM_MARKET_EVENT OBV30_CloseCondition = C_OBV_BUY_SELL; // OBV: Close condition for M30
ENUM_MARKET_EVENT OsMA1_CloseCondition = C_OSMA_BUY_SELL; // OsMA: Close condition for M1
ENUM_MARKET_EVENT OsMA5_CloseCondition = C_OSMA_BUY_SELL; // OsMA: Close condition for M5
ENUM_MARKET_EVENT OsMA15_CloseCondition = C_OSMA_BUY_SELL; // OsMA: Close condition for M15
ENUM_MARKET_EVENT OsMA30_CloseCondition = C_OSMA_BUY_SELL; // OsMA: Close condition for M30
input ENUM_MARKET_EVENT RSI1_CloseCondition = 1; // RSI: Close condition for M1
input ENUM_MARKET_EVENT RSI5_CloseCondition = 31; // RSI: Close condition for M5
input ENUM_MARKET_EVENT RSI15_CloseCondition = 1; // RSI: Close condition for M15
input ENUM_MARKET_EVENT RSI30_CloseCondition = 1; // RSI: Close condition for M30
ENUM_MARKET_EVENT RVI1_CloseCondition = C_RVI_BUY_SELL; // RVI: Close condition for M1
ENUM_MARKET_EVENT RVI5_CloseCondition = C_RVI_BUY_SELL; // RVI: Close condition for M5
ENUM_MARKET_EVENT RVI15_CloseCondition = C_RVI_BUY_SELL; // RVI: Close condition for M15
ENUM_MARKET_EVENT RVI30_CloseCondition = C_RVI_BUY_SELL; // RVI: Close condition for M30
input ENUM_MARKET_EVENT SAR1_CloseCondition = 1; // SAR: Close condition for M1
input ENUM_MARKET_EVENT SAR5_CloseCondition = 1; // SAR: Close condition for M5
input ENUM_MARKET_EVENT SAR15_CloseCondition = 1; // SAR: Close condition for M15
input ENUM_MARKET_EVENT SAR30_CloseCondition = 1; // SAR: Close condition for M30
ENUM_MARKET_EVENT StdDev1_CloseCondition = C_STDDEV_BUY_SELL; // StdDev: Close condition for M1
ENUM_MARKET_EVENT StdDev5_CloseCondition = C_STDDEV_BUY_SELL; // StdDev: Close condition for M5
ENUM_MARKET_EVENT StdDev15_CloseCondition = C_STDDEV_BUY_SELL; // StdDev: Close condition for M15
ENUM_MARKET_EVENT StdDev30_CloseCondition = C_STDDEV_BUY_SELL; // StdDev: Close condition for M30
ENUM_MARKET_EVENT Stochastic1_CloseCondition = C_STOCHASTIC_BUY_SELL; // Stochastic: Close condition for M1
ENUM_MARKET_EVENT Stochastic5_CloseCondition = C_STOCHASTIC_BUY_SELL; // Stochastic: Close condition for M5
ENUM_MARKET_EVENT Stochastic15_CloseCondition = C_STOCHASTIC_BUY_SELL; // Stochastic: Close condition for M15
ENUM_MARKET_EVENT Stochastic30_CloseCondition = C_STOCHASTIC_BUY_SELL; // Stochastic: Close condition for M30
input ENUM_MARKET_EVENT WPR1_CloseCondition = 1; // WPR: Close condition for M1
input ENUM_MARKET_EVENT WPR5_CloseCondition = 1; // WPR: Close condition for M5
input ENUM_MARKET_EVENT WPR15_CloseCondition = 1; // WPR: Close condition for M15
input ENUM_MARKET_EVENT WPR30_CloseCondition = 1; // WPR: Close condition for M30
ENUM_MARKET_EVENT ZigZag1_CloseCondition = C_ZIGZAG_BUY_SELL; // ZigZag: Close condition for M1
ENUM_MARKET_EVENT ZigZag5_CloseCondition = C_ZIGZAG_BUY_SELL; // ZigZag: Close condition for M5
ENUM_MARKET_EVENT ZigZag15_CloseCondition = C_ZIGZAG_BUY_SELL; // ZigZag: Close condition for M15
ENUM_MARKET_EVENT ZigZag30_CloseCondition = C_ZIGZAG_BUY_SELL; // ZigZag: Close condition for M30
#endif

input static string __Strategy_Parameters__ = "-- Strategy's parameters --"; // >>> STRATEGY'S PARAMS <<<
#include "EA31337-strategies/strategies.h"