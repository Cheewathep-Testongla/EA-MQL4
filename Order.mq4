#include    "Indicators.mq4"
INDIC In = new INDIC;

input int OrdersLimit = 5;
input double Lot = 0.01;
input int TP = 100;
input int SL = 2000;

int check = -1;
int signal = 0;

void OnTick()
  {
   if(check < Bars)
     {
      check = Bars;
      signal = 1;
     }
   if(OrdersTotal() < OrdersLimit) 
     {
      if(signal == 1)
        {
         if(In.Trend(2) == "Bullish" && Open[2] < In.MA(50))
           {
            if(In.Trend(1) == "Bullish" && Open[1] > In.MA(50))
              {
               if(Close[1] - Open[1] > 1)
                 {
                  if(In.Trend(0) == "Bullish" && Open[0] > Open[1])
                    {
                     if(In.MA(25) - In.MA(50) > 0.5 && In.MA(25) - In.MA(50) < 1)
                       { 
                        OrderSend(Symbol(),OP_BUY,Lot,Ask,0,Ask-SL*Point,Ask+TP*Point,"BUY",0,0,Blue);
                        signal = 0;
                       }
                    } 
                 }
              }
           }
         if(In.Trend(2) == "Bearish" && Open[2] < In.MA(50))
           {
            if(In.Trend(1) == "Bearish" && Open[1] < In.MA(50))
              {
               if(Open[1] - Close[1] > 1)
                 {
                  if(In.Trend(0) == "Bearish" && Open[0] < Open[1])
                    {
                     if(In.MA(50) - In.MA(25) < 0.5 && In.MA(50) - In.MA(25) > 0)
                       {
                        OrderSend(Symbol(),OP_SELL,Lot,Bid,0,Bid+SL*Point,Bid-TP*Point,"SELL",0,0,Red);
                        signal = 0;
                       }
                    }
                 }
              }
           }
        }
     }
   Comment("Balance : ",AccountBalance(),"\n",
           "Equity : ",AccountEquity(),"\n",
           "MA25 - MA50 : ",In.MA(25) - In.MA(50),"\n");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


