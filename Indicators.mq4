//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class INDIC
  {
public :
   string Check ;
   double open, close, Ma ;
   string            Trend(int d)
     {
      double open        = iOpen(Symbol(),PERIOD_M5,d);
      double close       = iClose(Symbol(),PERIOD_M5,d);
      if(open > close)
        {
         Check = "Bearish";
         return Check;
        }
      if(open < close)
        {
         Check = "Bullish";
         return Check;
        }
     }
   double            MA(int p)
     {
      Ma = iMA(Symbol(),PERIOD_M5,p,0,MODE_EMA,PRICE_CLOSE,0);
      return Ma;
     }
  };
//+------------------------------------------------------------------+
