# Intro

Moving average strategies are extremely common on financial markets. They can be used as self-sufficient strategies, to find the best moments of buying and selling of an asset one has particular view has regarding its general trend or some other combination with fundamental, alternative and/or technical data.

This project aims to test an extremely simple strategy on the Ibovespa index, analyse its effectiveness and, if it is indeed effective, propose ways to expose one's portfolio to it.

## Simple Moving Average (SMA) with multiple holding periods (HP) on the Ibovespa index

The tested strategy is a common SMA breakout strategy. Here, a **breakout** is defined when the asset's open price on a certain day is higher/lower than the SMA and the close price is lower/higher than the SMA. When a breakout occurs, a buy or sell signal is generated, depending on whether the price breaks the SMA bottom-up (buy signal) or top-down (sell signal). On the next day of the breakout, the asset is bought/sold on the opening price. The next two images illustrate the generation of a buy and sell signal, respectively, using a 252 days SMA and the position entry points for each case:

**Buy signal**

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/459bbfe9-f40d-43e6-98b2-b1b24cadb1b3)

**Sell signal**

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/cd0f9be5-bfe9-49d6-a46c-381de6eed3d3)
