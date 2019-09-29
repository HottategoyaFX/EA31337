//+------------------------------------------------------------------+
//|                  EA31337 - multi-strategy advanced trading robot |
//|                       Copyright 2016-2019, 31337 Investments Ltd |
//|                                       https://github.com/EA31337 |
//+------------------------------------------------------------------+

/**
 * @file
 * Implements MA strategy.
 */

// Includes.
#include "../../EA31337-classes/Indicators/Indi_MA.mqh"
#include "../../EA31337-classes/Strategy.mqh"

class Stg_MA : public Strategy {

  public:

  void Stg_MA(StgParams &_params, string _name) : Strategy(_params, _name) {}

  static Stg_MA *Init_M1() {
    ChartParams cparams1(PERIOD_M1);
    IndicatorParams ma_iparams(10, INDI_MA);
    MA_Params ma1_iparams(MA_Period_Fast, MA_Shift, MA_Method, MA_Applied_Price);
    StgParams ma1_sparams(new Trade(PERIOD_M1, _Symbol), new Indi_MA(ma1_iparams, ma_iparams, cparams1), NULL, NULL);
    ma1_sparams.SetSignals(MA1_SignalMethod, MA1_OpenCondition1, MA1_OpenCondition2, MA1_CloseCondition, NULL, MA_SignalLevel, NULL);
    ma1_sparams.SetStops(MA_TrailingProfitMethod, MA_TrailingStopMethod);
    ma1_sparams.SetMaxSpread(MA1_MaxSpread);
    ma1_sparams.SetId(MA1);
    return (new Stg_MA(ma1_sparams, "MA1"));
  }
  static Stg_MA *Init_M5() {
    ChartParams cparams5(PERIOD_M5);
    IndicatorParams ma_iparams(10, INDI_MA);
    MA_Params ma5_iparams(MA_Period_Fast, MA_Shift, MA_Method, MA_Applied_Price);
    StgParams ma5_sparams(new Trade(PERIOD_M5, _Symbol), new Indi_MA(ma5_iparams, ma_iparams, cparams5), NULL, NULL);
    ma5_sparams.SetSignals(MA5_SignalMethod, MA5_OpenCondition1, MA5_OpenCondition2, MA5_CloseCondition, NULL, MA_SignalLevel, NULL);
    ma5_sparams.SetStops(MA_TrailingProfitMethod, MA_TrailingStopMethod);
    ma5_sparams.SetMaxSpread(MA5_MaxSpread);
    ma5_sparams.SetId(MA5);
    return (new Stg_MA(ma5_sparams, "MA5"));
  }
  static Stg_MA *Init_M15() {
    ChartParams cparams15(PERIOD_M15);
    IndicatorParams ma_iparams(10, INDI_MA);
    MA_Params ma15_iparams(MA_Period_Fast, MA_Shift, MA_Method, MA_Applied_Price);
    StgParams ma15_sparams(new Trade(PERIOD_M15, _Symbol), new Indi_MA(ma15_iparams, ma_iparams, cparams15), NULL, NULL);
    ma15_sparams.SetSignals(MA15_SignalMethod, MA15_OpenCondition1, MA15_OpenCondition2, MA15_CloseCondition, NULL, MA_SignalLevel, NULL);
    ma15_sparams.SetStops(MA_TrailingProfitMethod, MA_TrailingStopMethod);
    ma15_sparams.SetMaxSpread(MA15_MaxSpread);
    ma15_sparams.SetId(MA15);
    return (new Stg_MA(ma15_sparams, "MA15"));
  }
  static Stg_MA *Init_M30() {
    ChartParams cparams30(PERIOD_M30);
    IndicatorParams ma_iparams(10, INDI_MA);
    MA_Params ma30_iparams(MA_Period_Fast, MA_Shift, MA_Method, MA_Applied_Price);
    StgParams ma30_sparams(new Trade(PERIOD_M30, _Symbol), new Indi_MA(ma30_iparams, ma_iparams, cparams30), NULL, NULL);
    ma30_sparams.SetSignals(MA30_SignalMethod, MA30_OpenCondition1, MA30_OpenCondition2, MA30_CloseCondition, NULL, MA_SignalLevel, NULL);
    ma30_sparams.SetStops(MA_TrailingProfitMethod, MA_TrailingStopMethod);
    ma30_sparams.SetMaxSpread(MA30_MaxSpread);
    ma30_sparams.SetId(MA30);
    return (new Stg_MA(ma30_sparams, "MA30"));
  }
  static Stg_MA *Init(ENUM_TIMEFRAMES _tf) {
    switch (_tf) {
      case PERIOD_M1:  return Init_M1();
      case PERIOD_M5:  return Init_M5();
      case PERIOD_M15: return Init_M15();
      case PERIOD_M30: return Init_M30();
      default: return NULL;
    }
  }

  /**
   * Check if MA indicator is on buy.
   *
   * @param
   *   cmd (int) - type of trade order command
   *   period (int) - period to check for
   *   _signal_method (int) - signal method to use by using bitwise AND operation
   *   _signal_level1 (double) - signal level to consider the signal
   */
  bool SignalOpen(ENUM_ORDER_TYPE cmd, long _signal_method = EMPTY, double _signal_level1 = EMPTY, double _signal_level2 = EMPTY) {
    bool _result = false;
    double ma_0_fast = ma_fast[this.Chart().TfToIndex()][CURR];
    double ma_0_medium = ma_medium[this.Chart().TfToIndex()][CURR];
    double ma_0_slow = ma_slow[this.Chart().TfToIndex()][CURR];
    double ma_1_fast = ma_fast[this.Chart().TfToIndex()][PREV];
    double ma_1_medium = ma_medium[this.Chart().TfToIndex()][PREV];
    double ma_1_slow = ma_slow[this.Chart().TfToIndex()][PREV];
    double ma_2_fast = ma_fast[this.Chart().TfToIndex()][FAR];
    double ma_2_medium = ma_medium[this.Chart().TfToIndex()][FAR];
    double ma_2_slow = ma_slow[this.Chart().TfToIndex()][FAR];
    /*
    @todo:
    double ma_0 = ((Indi_MA *) this.Data()).GetValue(0);
    double ma_1 = ((Indi_MA *) this.Data()).GetValue(1);
    double ma_2 = ((Indi_MA *) this.Data()).GetValue(2);
    */
    if (_signal_method == EMPTY) _signal_method = GetSignalBaseMethod();
    if (_signal_level1 == EMPTY) _signal_level1 = GetSignalLevel1();
    if (_signal_level2 == EMPTY) _signal_level2 = GetSignalLevel2();
    double gap = _signal_level1 * pip_size;

    switch (cmd) {
      case ORDER_TYPE_BUY:
        _result  = ma_0_fast   > ma_0_medium + gap;
        _result &= ma_0_medium > ma_0_slow;
        if (_signal_method != 0) {
          if (METHOD(_signal_method, 0)) _result &= ma_0_fast > ma_0_slow + gap;
          if (METHOD(_signal_method, 1)) _result &= ma_0_medium > ma_0_slow;
          if (METHOD(_signal_method, 2)) _result &= ma_0_slow > ma_1_slow;
          if (METHOD(_signal_method, 3)) _result &= ma_0_fast > ma_1_fast;
          if (METHOD(_signal_method, 4)) _result &= ma_0_fast - ma_0_medium > ma_0_medium - ma_0_slow;
          if (METHOD(_signal_method, 5)) _result &= (ma_1_medium < ma_1_slow || ma_2_medium < ma_2_slow);
          if (METHOD(_signal_method, 6)) _result &= (ma_1_fast < ma_1_medium || ma_2_fast < ma_2_medium);
        }
        break;
      case ORDER_TYPE_SELL:
        _result  = ma_0_fast   < ma_0_medium - gap;
        _result &= ma_0_medium < ma_0_slow;
        if (_signal_method != 0) {
          if (METHOD(_signal_method, 0)) _result &= ma_0_fast < ma_0_slow - gap;
          if (METHOD(_signal_method, 1)) _result &= ma_0_medium < ma_0_slow;
          if (METHOD(_signal_method, 2)) _result &= ma_0_slow < ma_1_slow;
          if (METHOD(_signal_method, 3)) _result &= ma_0_fast < ma_1_fast;
          if (METHOD(_signal_method, 4)) _result &= ma_0_medium - ma_0_fast > ma_0_slow - ma_0_medium;
          if (METHOD(_signal_method, 5)) _result &= (ma_1_medium > ma_1_slow || ma_2_medium > ma_2_slow);
          if (METHOD(_signal_method, 6)) _result &= (ma_1_fast > ma_1_medium || ma_2_fast > ma_2_medium);
        }
        break;
    }
    _result &= _signal_method <= 0 || Convert::ValueToOp(curr_trend) == cmd;
    return _result;
  }

};