# Intro

Moving average strategies are extremely common on financial markets. They can be self-sufficient strategies, used to improve timing of buying and selling securitires or with some other combination of fundamental, alternative and/or technical data.

This project aims to test an extremely simple strategy on the Ibovespa index (the brazilian equities index), analyse its effectiveness and, if it is indeed effective, propose ways this strategy could fit into a portfolio.

## Breakouts and holding period

The tested strategy is a common SMA breakout strategy. Here, a **breakout** is defined as when the asset's open price on a certain day is higher/lower than the SMA and the close price is lower/higher than the SMA. That generates a buy or sell signal, depending on whether the price breaks the SMA upwards (buy signal) or downwards (sell signal). On the next day of the breakout, the asset is bought/sold at the opening price. That way, we can define this strategy as a *trend following* strategy.

After entering a position, we'll close it after X days. That X is called **holding period**. 
The next two images illustrate two trades, one a buy (long) and  other a sell (short), respectively, using a 252 days SMA, pointing out the entry and exit points considering a holding period of 10 days:

**Buy (long) example**

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/e18208cd-77d5-405d-92cd-b6668b489376)

**Sell (short) example**

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/6a82cee9-b572-4bf9-b69b-974b195c4439)
