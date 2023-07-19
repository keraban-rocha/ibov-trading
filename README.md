# Intro

Moving average strategies are extremely common on financial markets. They can be self-sufficient strategies, used to improve timing of buying and selling securitires or with some other combination of fundamental, alternative and/or technical data.

This project aims to test an extremely simple strategy on the Ibovespa index (the brazilian equities index), analyse its effectiveness and, if it is indeed effective, propose ways this strategy could fit into a portfolio.

## Simple moving averages (SMA)

We call it "simple" because we don't apply some weight on, for example, the most recent prices, all prices have the same weight. And we call it "moving" because each new period, that average is updated by including the latest price and removing the oldest one. The formula to calculate it is as follows (n is the number of periods we are looking back to calculate the average):

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/41fec533-dad4-4ec2-8a31-02fbb0382fc3)

**We will use various SMA periods throughout the study.**

## Breakouts and holding period

The tested strategy is a common SMA breakout strategy. Here, a **breakout** is defined as when the asset's open price on a certain day is higher/lower than the SMA and the close price is lower/higher than the SMA. That generates a buy or sell signal, depending on whether the price breaks the SMA upwards (buy signal) or downwards (sell signal). On the next day of the breakout, the asset is bought/sold at the opening price. That way, we can define this strategy as a *trend following* strategy.

After entering a position, we'll close it after X days. That X is called **holding period**. 
The next two images illustrate two trades, one a buy (long) and  other a sell (short), respectively, using a 252 days SMA, pointing out the entry and exit points considering a holding period of 10 days:

**Buy (long) example**

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/e18208cd-77d5-405d-92cd-b6668b489376)

**Sell (short) example**

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/6a82cee9-b572-4bf9-b69b-974b195c4439)

## Model parameters and other important observations

For this study, several combinations of SMA and holding periods were run. Specifically, the range for both was 5 through 252 with a step of 5, totaling 124 SMA and holding periods, and 15,376 possible combinations. 

Also, since a signal occurs when the price breaks to the SMA i.e. is close to the SMA, frequently more than one breakout occur at a very short period of time. In order to avoid closing a position and then opening another too quickly, **overlapping signals are ignored**. If a position is already taken and the price breaks the SMA upwards or downwards, generating a signal, that signal is ignored and the position is closed only when the holding period is reached. That generates less several trades and generates the opportunity to follow the trend if it occurs.
