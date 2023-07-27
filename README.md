## The problem

Asset managers, individual investors, pension funds and virtually every trader daily face the challenge of deciding whether to buy or sell a security. But a particular one is faced by the long-only equities investor, that must maintain a long (bought) position at all times, even when the market is suffering losses. Moreover, timing the market is an extremely challenging endeavor, so it is difficult to decide *when* to reduce long exposure.

In order to address this problem, I tested a simple moving average (SMA) strategy analysing specifically its results when **only sell (short) signals** are considered. The idea is that, if the strategy is effective, those investors can use it to time the market and reduce their long exposure. I also analysed, given the effectiveness of the strategy, what is the best way to do that. We'll also look into long-only signals but mostly for comparison purposes.

Before we dive in the strategy *per se*, here's a step-by-step guide to use this repository.

## Step-by-step

1. Open your prompt terminal or GitBash the folder you want to clone the repository in
2. Git clone this repository into your machine by using the command
   ```bash
   git clone https://github.com/keraban-rocha/ibov-trading.git
   ```
3. Run the file `create_venv.bat` to create a virtual environment and install all required packages from `requirements.txt`
4. Run `strategy.ipynb` to create a file called `results.csv` that contains all the strategy's trades. You can run with the default parameters (SMA and HP combinations) or run any combinations you like
5. Lastly, run `results_analysis.ipynb` to obtain the analysis I show at the last session.

## Simple moving averages (SMA)

Moving average strategies are extremely common on financial markets. They can be self-sufficient strategies, used to improve timing of buying and selling 
securities or with some other combination of fundamental, alternative and/or technical data.

We call it "simple" because we don't apply some weight on, for example, the most recent prices, so all prices have the same weight. And we call it "moving" because at each new period, that average is updated by including the latest price and removing the oldest one. The formula to calculate it is as follows (n is the number of periods we are looking back to calculate the average):

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/41fec533-dad4-4ec2-8a31-02fbb0382fc3)

## Breakouts and holding period

The tested strategy is a common SMA breakout strategy. Here, a **breakout** is defined as when the asset's open price on a certain day is higher/lower than the SMA and the close price is lower/higher than the SMA. That generates a buy or sell signal, depending on whether the price breaks the SMA upwards (buy signal) or downwards (sell signal). On the next day of the breakout, the asset is bought/sold at the opening price. That way, we can define this strategy as a *trend following* strategy because it intends to capture a trend at its very beginning, signaled by the breakout.

After entering a position, we'll close it after X days. That X is called **holding period**. 
The next two images illustrate two trades, one a buy (long) and  other a sell (short), respectively, using a 252 days SMA, pointing out the entry and exit points considering a holding period of 10 days:

**Buy (long) example**

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/e18208cd-77d5-405d-92cd-b6668b489376)

**Sell (short) example**

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/6a82cee9-b572-4bf9-b69b-974b195c4439)

## Model parameters and data used

For this study, several combinations of SMA and holding periods were run. Specifically, the range for both was 5 through 252 with a step of 5, totaling 50 SMA, 50 holding periods and 2,500 possible combinations. That range can be dinamically changed on the script so that you might run this strategy to any combinations you like.

Also, since a signal occurs when the price breaks the SMA i.e., is close to the SMA, frequently more than one breakout occurs at a very short period of time. Also, the bigger the holding period, the more likely it is that a breakout while already positioned. In order to avoid two positions running simultaneously, **overlapping signals are ignored**. If a position is already taken and a breakout occurs, that signal is ignored, not mattering if the signal is at the same or at the opposite direction.

The data used was daily open-high-low-close (OHLC) adjusted prices from the Ibovespa index extracted from a trading platform called Tryd ranging from july/2002 through may/2023. If you wish to try this strategy on other securities, simply organize an Excel file with the same layout and run the scripts.

## Results analysis

For each combination of SMA and holding period, I calculated the return of each individual trade and then calculated the mean, maximum and minimum returns, number of trades and the percentage of positive trades. An important difference between each SMA is the *number of trades*. The higher the SMA period, the lower the number of signals, because the SMA swings less as the number of periods used to calculate it increases, generating fewer breakouts.

This is supposed to be a simple, descriptive statistics analysis, but feel to improve it anyway you like. I defined the following criteria for a SMA/HP combination to be eligible:

1. More than 50 trades (an average of approximately 1 trade every 100 days)
2. Positive mean
3. Max-min ratio larger than 3

Since the problem I aim to address is the difficulty of timing the market, specifically to reduce exposure on the Ibovespa index, I also considered only sell signals. Out of the 2,500 strategies, only 15 met those criteria (organized from highest to lowest mean):

![image](https://github.com/keraban-rocha/ibov-trading/assets/123394105/572f1d0a-b591-4297-a88f-2ec37f6b2f69)



