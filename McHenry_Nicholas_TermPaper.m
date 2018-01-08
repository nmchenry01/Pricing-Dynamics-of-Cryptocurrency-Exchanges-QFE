%% Housekeeping
clear %Clearing and closing all exisiting workspace items
close all
clc

addpath(genpath('C:\Users\nmchenry\MFE_Toolbox')); %Needed for the OLS function (NEED TO CHANGE TO YOUR LOCAL DIRECTORY IN ORDER TO RUN)
%% Pull Excel data
inputfile = [pwd,'\Econ_590_TermPaper_Data']; %Source for all daily and monthly Bitcoin data, and volume data
inputfile2 = [pwd,'\Econ_590_TermPaper_Data2']; %Source for all weekly Bitcoin data
inputfile3 = [pwd,'\Econ_590_TermPaper_Data3']; %Source for traditional equity data

range = 'E2:E483'; %Predefined ranges on the Excel spreadsheets 
range2 = 'B5:B16';
range3 = 'G2:G483';
range4 = 'B5:B73';
range5 = 'I2:I351';
range6 = 'J2:J351';
range7 = 'K2:K351';
range8 = 'L2:L351';
range9 = 'M2:M351';
range10 = 'N2:N351';
range11 = 'O2:O351';
range12 = 'P2:P351';
range13 = 'B4:B15';
range14 = 'C4:C15';
range15 = 'D4:D15';
range16 = 'E4:E15';
range17 = 'F4:F15';
range18 = 'G4:G15';
range19 = 'H4:H15';
range20 = 'I4:I15';

sheet1 = 'coincheckJPY'; %Each asset has its own sheet
sheet2 = 'coinbaseEUR';
sheet3 = 'btcdeEUR';
sheet4 = 'btceCNY';
sheet5 = 'coinbaseUSD';
sheet6 = 'bitstampUSD';
sheet7 = 'bitbayPLN';
sheet8 = 'coinfloorGBP';
sheet9 = 'btcmarketsAUD';
sheet10 = 'mercadoBRL';
sheet11 = 'foxbitBRL';

sheet12 = 'coincheckJPY_Monthly'; %Built using pivot tables in excel
sheet13 = 'coinbaseEUR_Monthly';
sheet14 = 'btcdeEUR_Monthly';
sheet15 = 'btceCNY_Monthly';
sheet16 = 'coinbaseUSD_Monthly';
sheet17 = 'bitstampUSD_Monthly';
sheet18 = 'bitbayPLN_Monthly';
sheet19 = 'coinfloorGBP_Monthly';
sheet20 = 'btcmarketAUD_Monthly';
sheet21 = 'mercadoBRL_Monthly';
sheet22 = 'foxbitBRL_Monthly';

sheet23 = 'coincheckJPY_Weekly'; %Built using pivot tables in excel
sheet24 = 'coinbaseEUR_Weekly';
sheet25 = 'btcdeEUR_Weekly';
sheet26 = 'btceCNY_Weekly';
sheet27 = 'coinbaseUSD_Weekly';
sheet28 = 'bitstampUSD_Weekly';
sheet29 = 'bitbayPLN_Weekly';
sheet30 = 'coinfloorGBP_Weekly';
sheet31 = 'btcmarketAUD_Weekly';
sheet32 = 'mercadoBRL_Weekly';
sheet33 = 'foxbitBRL_Weekly';

sheet34 = 'Index_Data';
sheet35 = 'Monthly_Returns';

coincheckJPY_data = xlsread(inputfile,sheet1,range); %Reading in daily data
coinbaseEUR_data = xlsread(inputfile,sheet2,range);
btcdeEUR_data = xlsread(inputfile,sheet3,range);
btceCNY_data = xlsread(inputfile,sheet4,range);
coinbaseUSD_data = xlsread(inputfile,sheet5,range);
bitstampUSD_data = xlsread(inputfile,sheet6,range);
bitbayPLN_data = xlsread(inputfile,sheet7,range);
coinfloorGBP_data = xlsread(inputfile,sheet8,range);
btcmarketsAUD_data = xlsread(inputfile,sheet9,range);
mercadoBRL_data = xlsread(inputfile,sheet10,range);
foxbitBRL_data = xlsread(inputfile,sheet11,range);

coincheckJPY_volume = xlsread(inputfile,sheet1,range3); %Reading in volume data
coinbaseEUR_volume = xlsread(inputfile,sheet2,range3);
btcdeEUR_volume = xlsread(inputfile,sheet3,range3);
btceCNY_volume = xlsread(inputfile,sheet4,range3);
coinbaseUSD_volume = xlsread(inputfile,sheet5,range3);
bitstampUSD_volume = xlsread(inputfile,sheet6,range3);
bitbayPLN_volume = xlsread(inputfile,sheet7,range3);
coinfloorGBP_volume = xlsread(inputfile,sheet8,range3);
btcmarketsAUD_volume = xlsread(inputfile,sheet9,range3);
mercadoBRL_volume = xlsread(inputfile,sheet10,range3);
foxbitBRL_volume = xlsread(inputfile,sheet11,range3);

coincheckJPY_data2 = xlsread(inputfile,sheet12,range2); %Reading in monthly data
coinbaseEUR_data2 = xlsread(inputfile,sheet13,range2);
btcdeEUR_data2 = xlsread(inputfile,sheet14,range2);
btceCNY_data2 = xlsread(inputfile,sheet15,range2);
coinbaseUSD_data2 = xlsread(inputfile,sheet16,range2);
bitstampUSD_data2 = xlsread(inputfile,sheet17,range2);
bitbayPLN_data2 = xlsread(inputfile,sheet18,range2);
coinfloorGBP_data2 = xlsread(inputfile,sheet19,range2);
btcmarketsAUD_data2 = xlsread(inputfile,sheet20,range2);
mercadoBRL_data2 = xlsread(inputfile,sheet21,range2);
foxbitBRL_data2 = xlsread(inputfile,sheet22,range2);

coincheckJPY_data3 = xlsread(inputfile2,sheet23,range4); %Reading in weekly data
coinbaseEUR_data3 = xlsread(inputfile2,sheet24,range4);
btcdeEUR_data3 = xlsread(inputfile2,sheet25,range4);
btceCNY_data3 = xlsread(inputfile2,sheet26,range4);
coinbaseUSD_data3 = xlsread(inputfile2,sheet27,range4);
bitstampUSD_data3 = xlsread(inputfile2,sheet28,range4);
bitbayPLN_data3 = xlsread(inputfile2,sheet29,range4);
coinfloorGBP_data3 = xlsread(inputfile2,sheet30,range4);
btcmarketsAUD_data3 = xlsread(inputfile2,sheet31,range4);
mercadoBRL_data3 = xlsread(inputfile2,sheet32,range4);
foxbitBRL_data3 = xlsread(inputfile2,sheet33,range4);

SP500_data = xlsread(inputfile3,sheet34,range5); %Reading in index data
Nikkei225_data = xlsread(inputfile3,sheet34,range6);
ASX200_data = xlsread(inputfile3,sheet34,range7);
IBOVESPA_data = xlsread(inputfile3,sheet34,range8);
WIG_data = xlsread(inputfile3,sheet34,range9);
SHCOMP_data = xlsread(inputfile3,sheet34,range10);
UKX_data = xlsread(inputfile3,sheet34,range11);
SX5E_data = xlsread(inputfile3,sheet34,range12);

SP500_monthly_data = xlsread(inputfile3,sheet35,range13); %Reading in index monthly data
Nikkei225_monthly_data = xlsread(inputfile3,sheet35,range14);
ASX200_monthly_data = xlsread(inputfile3,sheet35,range15);
IBOVESPA_monthly_data = xlsread(inputfile3,sheet35,range16);
WIG_monthly_data = xlsread(inputfile3,sheet35,range17);
SHCOMP_monthly_data = xlsread(inputfile3,sheet35,range18);
UKX_monthly_data = xlsread(inputfile3,sheet35,range19);
SX5E_monthly_data = xlsread(inputfile3,sheet35,range20);

volume_data = table(coincheckJPY_volume,coinbaseEUR_volume,btcdeEUR_volume,btceCNY_volume,coinbaseUSD_volume,bitstampUSD_volume,bitbayPLN_volume,coinfloorGBP_volume,btcmarketsAUD_volume,mercadoBRL_volume,foxbitBRL_volume); %Compiling volume data into one table
index_daily_prices = table(SP500_data,Nikkei225_data,ASX200_data,IBOVESPA_data,WIG_data,SHCOMP_data,UKX_data,SX5E_data); %Compiling daily index price data
%% Aggregate Data and Calculate Returns
market_prices = table(bitbayPLN_data,bitstampUSD_data,btcdeEUR_data,btceCNY_data,btcmarketsAUD_data,coinbaseEUR_data,coinbaseUSD_data,coincheckJPY_data,coinfloorGBP_data,foxbitBRL_data,mercadoBRL_data); %Compiling Bitcoin daily price data
market_returns_monthly = table(bitbayPLN_data2,bitstampUSD_data2,btcdeEUR_data2,btceCNY_data2,btcmarketsAUD_data2,coinbaseEUR_data2,coinbaseUSD_data2,coincheckJPY_data2,coinfloorGBP_data2,foxbitBRL_data2,mercadoBRL_data2); %Compiling Bitcoin monthly returns
index_returns_monthly = table(SP500_monthly_data,Nikkei225_monthly_data,ASX200_monthly_data,IBOVESPA_monthly_data,WIG_monthly_data,SHCOMP_monthly_data,UKX_monthly_data,SX5E_monthly_data); %Compiling index monthly returns
market_return_weekly = table(bitbayPLN_data3,bitstampUSD_data3,btcdeEUR_data3,btceCNY_data3,btcmarketsAUD_data3,coinbaseEUR_data3,coinbaseUSD_data3,coincheckJPY_data3,coinfloorGBP_data3,foxbitBRL_data3,mercadoBRL_data3); %Compiling Bitcoin weekly returns 

market_returns = array2table(price2ret(table2array(market_prices))); %Calculating Bitcoin daily returns
index_daily_returns = array2table(price2ret(table2array(index_daily_prices))); %Calculating equity daily returns
market_returns.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'}; %Assigning table column headers
market_returns_monthly.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};
market_return_weekly.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};
index_daily_returns.Properties.VariableNames = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'};

clearvars -except market_prices market_returns market_returns_monthly market_return_weekly volume_data index_daily_prices index_daily_returns index_returns_monthly %Clearing unnecessary variables
%% Describe (Traditional International Equity Description (Daily))
index_mean_returns = mean(table2array(index_daily_returns)); %Pulling sample statistics 
index_median = median(table2array(index_daily_returns));
index_stdev = std(table2array(index_daily_returns));
index_skewness = skewness(table2array(index_daily_returns));
index_kurtosis = kurtosis(table2array(index_daily_returns));
index_min = min(table2array(index_daily_returns));
index_max = max(table2array(index_daily_returns));
exchange_title = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'}; %Variable holding row names

index_statistics = table(index_mean_returns',index_median',index_stdev',index_skewness',index_kurtosis',index_min',index_max','RowNames',exchange_title); %Compiling a table with all summary stats
index_statistics.Properties.VariableNames = {'Mean_Daily_Return' 'Median_Daily_Return' 'Daily_Stdev' 'Skewness' 'Kurtosis' 'Min' 'Max'}; %Assigning table column names
clear index_kurtosis index_mean_returns index_skewness index_stdev exchange_title index_median index_min index_max %Clearing unnecessary variables
%% Describe (Traditional International Equity Description (Monthly))
monthly_mean_returns = mean(table2array(index_returns_monthly));%Pulling sample statistics
monthly_median_returns = median(table2array(index_returns_monthly));
monthly_stdev = std(table2array(index_returns_monthly));
monthly_skewness = skewness(table2array(index_returns_monthly));
monthly_kurtosis = kurtosis(table2array(index_returns_monthly));
monthly_min = min(table2array(index_returns_monthly));
monthly_max = max(table2array(index_returns_monthly));
exchange_title = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'}; %Variable holding row names

index_monthly_statistics = table(monthly_mean_returns',monthly_median_returns',monthly_stdev',monthly_skewness',monthly_kurtosis',monthly_min',monthly_max','RowNames',exchange_title);%Compiling a table with all summary stats
index_monthly_statistics.Properties.VariableNames = {'Mean_Monthly_Return' 'Median' 'Monthly_Stdev' 'Skewness' 'Kurtosis' 'Min' 'Max'};%Assigning table column names
clear monthly_min monthly_max monthly_median_returns monthly_stdev monthly_kurtosis monthly_mean_returns monthly_mean_returnsCopy monthly_skewness monthly_variance exchange_title %Clearing unnecessary variables
%% Describe (Daily Data Summary)
daily_mean_returns = mean(table2array(market_returns)); %Pulling sample statistics
daily_median = median(table2array(market_returns));
daily_stdev = std(table2array(market_returns));
daily_skewness = skewness(table2array(market_returns));
daily_kurtosis = kurtosis(table2array(market_returns));
daily_min = min(table2array(market_returns));
daily_max = max(table2array(market_returns));
exchange_title = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'}; %Variable holding row names

daily_statistics = table(daily_mean_returns',daily_median',daily_stdev',daily_skewness',daily_kurtosis',daily_min',daily_max','RowNames',exchange_title); %Compiling a table with all summary stats
daily_statistics.Properties.VariableNames = {'Mean_Daily_Return' 'Median' 'Stdev' 'Skewness' 'Kurtosis' 'Min' 'Max'}; %Assigning table column names
clear daily_max daily_min daily_median daily_stdev daily_kurtosis daily_mean_returns daily_mean_returnsCopy daily_skewness daily_variance exchange_title %Clearing unnecessary variables
%% Describe (Monthly Data Summary)
monthly_mean_returns = mean(table2array(market_returns_monthly));%Pulling sample statistics
monthly_median = median(table2array(market_returns_monthly));
monthly_stdev = std(table2array(market_returns_monthly));
monthly_skewness = skewness(table2array(market_returns_monthly));
monthly_kurtosis = kurtosis(table2array(market_returns_monthly));
monthly_min = min(table2array(market_returns_monthly));
monthly_max = max(table2array(market_returns_monthly));
exchange_title = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};%Variable holding row names

monthly_statistics = table(monthly_mean_returns',monthly_median',monthly_stdev',monthly_skewness',monthly_kurtosis',monthly_min',monthly_max','RowNames',exchange_title);%Compiling a table with all summary stats
monthly_statistics.Properties.VariableNames = {'Mean_Monthly_Return' 'Median' 'Monthly_Stdev' 'Skewness' 'Kurtosis' 'Min' 'Max'};%Assigning table column names
clear monthly_stdev monthly_median monthly_max monthly_min monthly_kurtosis monthly_mean_returns monthly_mean_returnsCopy monthly_skewness monthly_variance exchange_title%Clearing unnecessary variables
%% Describe (Normality of Daily Returns (Bitcoin))
figure %Display figure 
bitbayPLN_qq = qqplot(table2array(market_returns(:,1))); %Generate the qq plot for bitbay
[bitbayPLN_ktest,p1] = kstest(table2array(market_returns(:,1))); %Run K-S test on bitbay

figure %Display figure 
bitstampUSD_qq = qqplot(table2array(market_returns(:,2))); %Generate the qq plot for bitstamp 
[bitstampUSD_ktest,p2] = kstest(table2array(market_returns(:,2))); %Run K-S test on bitstamp

figure %Display figure
btcdeEUR_qq = qqplot(table2array(market_returns(:,3))); %Generate the qq plot for btcde
[btcdeEUR_ktest,p3] = kstest(table2array(market_returns(:,3))); %Run K-S test on btcde

figure %Display figure
btceCNY_qq = qqplot(table2array(market_returns(:,4))); %Generate the qq plot for btce
[btceCNY_ktest,p4] = kstest(table2array(market_returns(:,4))); %Run K-S test on btce

figure %Display figure
btcmarketsAUD_qq = qqplot(table2array(market_returns(:,5))); %Generate the qq plot for btcmarket
[btcmarketsAUD_ktest,p5] = kstest(table2array(market_returns(:,5))); %Run the K-S test on btcmarket

figure %Display figure
coinbaseEUR_qq = qqplot(table2array(market_returns(:,6)));% Generate the qq plot for coinbase
[coinbaseEUR_ktest,p6] = kstest(table2array(market_returns(:,6))); %Run the K-S test on coinbase

figure %Display figure
coinbaseUSD_qq = qqplot(table2array(market_returns(:,7))); %Generate the qq plot for coinbase
[coinbaseUSD_ktest,p7] = kstest(table2array(market_returns(:,7))); %Run the K-S test on coinbase

figure %Display figure
coincheckJPY_qq = qqplot(table2array(market_returns(:,8))); %Generate the qq plot for coincheck
[coincheckJPY_ktest,p8] = kstest(table2array(market_returns(:,8))); %Run the K-S test for coincheck

figure %Display figure
coinfloorGBP_qq = qqplot(table2array(market_returns(:,9))); %Generate the qq plot for coinfloor
[coinfloorGBP_ktest,p9] = kstest(table2array(market_returns(:,9))); %Run the K-S test for coinfloor

figure %Display the figure
foxbitBRL_qq = qqplot(table2array(market_returns(:,10))); %Generate the qq plot for foxbit
[foxbitBRL_ktest,p10] = kstest(table2array(market_returns(:,10))); %Run the K-S test for foxbit

figure %Display the figure
mercadoBRL_qq = qqplot(table2array(market_returns(:,11))); %Generate the qq plot for mercado
[mercadoBRL_ktest,p11] = kstest(table2array(market_returns(:,11))); %Run the K-S test for mercado

ktests = [bitbayPLN_ktest,bitstampUSD_ktest,btcdeEUR_ktest,btceCNY_ktest,btcmarketsAUD_ktest,coinbaseEUR_ktest,coinbaseUSD_ktest,coincheckJPY_ktest,coinfloorGBP_ktest,foxbitBRL_ktest,mercadoBRL_ktest]; %Compile K-S test results
ptests = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11]; %Compile P-Values
exchange_title = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'}; %Row titles
ktest_summary = table(ktests',ptests','RowNames',exchange_title); %Compile all results
ktest_summary.Properties.VariableNames = {'ktest_results' 'P_value'};  %Column titles
clear exchange_title bitbayPLN_ktest bitstampUSD_ktest btcdeEUR_ktest btceCNY_ktest btcmarketsAUD_ktest coinbaseEUR_ktest coinbaseUSD_ktest coincheckJPY_ktest coinfloorGBP_ktest foxbitBRL_ktest ktests mercadoBRL_ktest mercadoBRL_ktest p1 p10 p11 p2 p3 p4 p5 p6 p7 p8 p9 ktests ptests %Clear unnecessary variables
%% Describe (Normality of Daily Returns (Traditional Equity))
figure %Display figure
SP500_qq = qqplot(table2array(index_daily_returns(:,1))); %Generate qq plot for SP500
[SP500_ktest,p1] = kstest(table2array(index_daily_returns(:,1))); %Run the K-S test on the S&P500

figure %Display figure
Nikkei225_qq = qqplot(table2array(index_daily_returns(:,2))); %Generate qq plot for Nikkei 225
[Nikkei225_ktest,p2] = kstest(table2array(index_daily_returns(:,2))); %Run the K-S test on Nikkei 225

figure %Display figure
ASX200_qq = qqplot(table2array(index_daily_returns(:,3))); %Generate qq plot for ASX200 
[ASX200_ktest,p3] = kstest(table2array(index_daily_returns(:,3))); %Run the K-S test on ASX200

figure %Display figure
IBOVESPA_qq = qqplot(table2array(index_daily_returns(:,4))); %Generate qq plot for IBOVESPA
[IBOVESPA_ktest,p4] = kstest(table2array(index_daily_returns(:,4))); %Run the K-S test on IBOVESPA

figure %Display figure
WIG_qq = qqplot(table2array(index_daily_returns(:,5))); %Generate qq plot for WIG
[WIG_ktest,p5] = kstest(table2array(index_daily_returns(:,5))); %Run the K-S test on WIG

figure %Display figure
SHCOMP_qq = qqplot(table2array(index_daily_returns(:,6))); %Generate qq plot for SHCOMP 
[SHCOMP_ktest,p6] = kstest(table2array(index_daily_returns(:,6))); %Run the K-S test on SHCOMP

figure %Display figure
UKX_qq = qqplot(table2array(index_daily_returns(:,7))); %Generate qq plot for UKX
[UKX_ktest,p7] = kstest(table2array(index_daily_returns(:,7))); %Run the K-S test on UKX

figure %Display figure
SX5E_qq = qqplot(table2array(index_daily_returns(:,8))); %Generate qq plot for SX5E
[SX5E_ktest,p8] = kstest(table2array(index_daily_returns(:,8))); %Run the K-S test on SX5E

index_ktests = [SP500_ktest,Nikkei225_ktest,ASX200_ktest,IBOVESPA_ktest,WIG_ktest,SHCOMP_ktest,UKX_ktest,SX5E_ktest]; %Compile K-S results
index_ptests = [p1,p2,p3,p4,p5,p6,p7,p8]; %Compile P-Values
exchange_title = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'}; %Compile row names
index_ktest_summary = table(index_ktests',index_ptests','RowNames',exchange_title); %Assemble summary table
index_ktest_summary.Properties.VariableNames = {'ktest_results' 'P_value'}; %Column names
clear exchange_title SP500_ktest Nikkei225_ktest ASX200_ktest IBOVESPA_ktest WIG_ktest SHCOMP_ktest UKX_ktest SX5E_ktest p1 p2 p3 p4 p5 p6 p7 p8 index_ktests index_ptests %Clear unnecessary variables

%% Describe (Volume Sample Stats)
daily_mean_volume = mean(table2array(volume_data)); %Generate summary statistics
daily_median = median(table2array(volume_data));
daily_stdev = std(table2array(volume_data));
daily_skewness = skewness(table2array(volume_data));
daily_kurtosis = kurtosis(table2array(volume_data));
daily_min = min(table2array(volume_data));
daily_max = max(table2array(volume_data));
exchange_title = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'}; %Compile row names

daily_volume_statistics = table(daily_mean_volume',daily_median',daily_stdev',daily_skewness',daily_kurtosis',daily_min',daily_max','RowNames',exchange_title); %Compile volume statistics
daily_volume_statistics.Properties.VariableNames = {'Mean_Daily_Return' 'Daily_median' 'Daily_Stdev' 'Skewness' 'Kurtosis' 'Min' 'Max'}; %Column names
clear daily_stdev daily_max daily_min daily_median daily_kurtosis daily_mean_volume daily_mean_returnsCopy daily_skewness daily_variance exchange_title %Clear unnecessary variables
%% Connectedness (Static correlation matrix)
correlations = array2table(corr(table2array(market_returns))); %Generate correlation matrix for Bitcoins
correlations.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

index_correlations = array2table(corr(table2array(index_daily_returns))); %Generate correlation matrix for Indices
index_correlations.Properties.VariableNames = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'};
%% Connectedness (Simple Regression)
ols_coefficents = zeros(11,11); %Initialize data structure
tstats = zeros(11,11); %Initialize data structure

for i=1:height(correlations) %Run OLS regression for every pairwise combination of Bitcoin daily return vectors
    for j=1:height(correlations)
        [temp,temp2] = ols(table2array(market_returns(:,i)),table2array(market_returns(:,j)),0);
        ols_coefficents(j,i) = temp;
        tstats(j,i) = temp2;
    end
end
ols_coefficents = array2table(ols_coefficents); %Convert to table
tstats = array2table(tstats); %Convert to table
ols_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};
tstats.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

clear temp i j temp2
%% Connectedness (Quantile Regressions)
bitbayPLN_coeffeicents = zeros(11,10); %Initialize data structures
bitstampUSD_coefficents = zeros(11,10);
btcdeEUR_coefficents = zeros(11,10);
btceCNY_coefficents = zeros(11,10);
btcmarketsAUD_coefficents = zeros(11,10);
coinbaseEUR_coefficents = zeros(11,10);
coinbaseUSD_coefficents = zeros(11,10);
coincheckJPY_coefficents = zeros(11,10);
coinfloorGBP_coefficents = zeros(11,10);
foxbitBRL_coefficents = zeros(11,10);
mercadoBRL_coefficents = zeros(11,10);

f = 0; %Quantile indicator variable
for i=1:11 %bitbayPLN quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,2)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,3)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,4)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,5)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,6)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,7)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,8)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,9)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,10)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,1)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile coefficents
    bitbayPLN_coeffeicents(i,:) = aggregate; %Assign to permanant data structure
end
bitbayPLN_coeffeicents = array2table(bitbayPLN_coeffeicents); %Convert to table
bitbayPLN_coeffeicents.Properties.VariableNames = {'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

f = 0; %Quantile indicator variable
for i=1:11 %bitstampUSD quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,3)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,4)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,5)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,6)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,7)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,8)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,9)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,10)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,2)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents
    bitstampUSD_coefficents(i,:) = aggregate; %Assign to permanant data structure
end
bitstampUSD_coefficents = array2table(bitstampUSD_coefficents); %Convert to table
bitstampUSD_coefficents.Properties.VariableNames = {'bitbayPLN' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

f = 0;%Quantile indicator variable
for i=1:11 %btcdeEUR quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,2)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,4)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,5)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,6)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,7)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,8)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,9)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,10)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,3)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents
    btcdeEUR_coefficents(i,:) = aggregate; %Assign to permanant data structure
end
btcdeEUR_coefficents = array2table(btcdeEUR_coefficents); %Convert to table
btcdeEUR_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

f = 0;%Quantile indicator variable
for i=1:11 %btceCNY quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,2)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,3)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,5)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,6)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,7)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,8)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,9)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,10)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,4)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents 
    btceCNY_coefficents(i,:) = aggregate; %Assign to permanant data structure 
end
btceCNY_coefficents = array2table(btceCNY_coefficents); %Convert to table
btceCNY_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

f = 0;%Quantile indicator variable
for i=1:11 %btcmarketsAUD quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,2)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,3)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,4)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,6)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,7)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,8)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,9)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,10)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,5)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents
    btcmarketsAUD_coefficents(i,:) = aggregate; %Assign to permanant data structure
end
btcmarketsAUD_coefficents = array2table(btcmarketsAUD_coefficents); %Convert to table
btcmarketsAUD_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

f = 0;%Quantile indicator variable
for i=1:11 %coinbaseEUR quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,2)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,3)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,4)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,5)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,7)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,8)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,9)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,10)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,6)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents
    coinbaseEUR_coefficents(i,:) = aggregate; %Assign to permanant data structure
end
coinbaseEUR_coefficents = array2table(coinbaseEUR_coefficents); %Convert to table
coinbaseEUR_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};


f = 0;%Quantile indicator variable
for i=1:11 %coinbaseUSD quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,2)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,3)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,4)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,5)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,6)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,8)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,9)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,10)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,7)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents
    coinbaseUSD_coefficents(i,:) = aggregate; %Assign to permanant data structure
end
coinbaseUSD_coefficents = array2table(coinbaseUSD_coefficents); %Convert to table
coinbaseUSD_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

f = 0;%Quantile indicator variable
for i=1:11 %coincheckJPY quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,2)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,3)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,4)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,5)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,6)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,7)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,9)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,10)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,8)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents
    coincheckJPY_coefficents(i,:) = aggregate; %Assign to permanant data structure
end
coincheckJPY_coefficents = array2table(coincheckJPY_coefficents); %Convert to table
coincheckJPY_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

f = 0;%Quantile indicator variable
for i=1:11 %coinfloorGBP quantile regression 
    temp1 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,2)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,3)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,4)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,5)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,6)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,7)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,8)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,10)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,9)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents 
    coinfloorGBP_coefficents(i,:) = aggregate; %Assign to permanant data structure
end
coinfloorGBP_coefficents = array2table(coinfloorGBP_coefficents); %Convert to table
coinfloorGBP_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'foxbitBRL' 'mercadoBRL'};

f = 0;%Quantile indicator variable
for i=1:11 %foxbitBRL quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,2)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,3)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,4)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,5)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,6)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,7)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,8)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,9)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,10)),table2array(market_returns(:,11)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents
    foxbitBRL_coefficents(i,:) = aggregate; %Assign to permanant data structure
end
foxbitBRL_coefficents = array2table(foxbitBRL_coefficents); %Convert to table
foxbitBRL_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'mercadoBRL'};

f=0;%Quantile indicator variable
for i=1:11 %mercadoBRL quantile regression
    temp1 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,1)),f);
    temp2 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,2)),f);
    temp3 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,3)),f);
    temp4 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,4)),f);
    temp5 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,5)),f);
    temp6 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,6)),f);
    temp7 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,7)),f);
    temp8 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,8)),f);
    temp9 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,9)),f);
    temp10 = qregressMatlab(table2array(market_returns(:,11)),table2array(market_returns(:,10)),f);
    f = f + .1;
    aggregate = transpose([temp1;temp2;temp3;temp4;temp5;temp6;temp7;temp8;temp9;temp10]); %Compile temporary coefficents
    mercadoBRL_coefficents(i,:) = aggregate; %Assign to permanant data structure
end
mercadoBRL_coefficents = array2table(mercadoBRL_coefficents); %Convert to table
mercadoBRL_coefficents.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL'};

clear f i aggregate temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp10 %Clear unnecessary variables
%% Connectedness (Coexceedances Bitcoin)
coex_matrix = zeros(481,11); %Initialize data structure
for i=1:size(coex_matrix,2) %Loop through all markets, pull upper and lower 2.5% threshold, assign binary value of "1" if return exceeds threshold
    temp1 = quantile(table2array(market_returns(:,i)),.975);
    temp2 = quantile(table2array(market_returns(:,i)),.025);
    for j=1:size(coex_matrix,1)
        if table2array(market_returns(j,i))>= temp1 || table2array(market_returns(j,i))<= temp2
            coex_matrix(j,i) = 1;
        end
    end
end

total_events = zeros(1,11); %Initialize data structure
for i=1:size(coex_matrix,2) %Sum up number of events per exchange
    temp = sum(coex_matrix(:,i));
    total_events(:,i) = temp;
end
clear i
total_events = array2table(total_events); %Convert to table
total_events.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

coex_counter = zeros(1,11); %Initialize data structure
for i=1:size(coex_matrix,1) %Sort into buckets of co-exceedence events
    if sum(coex_matrix(i,:)) == 1
        coex_counter(1,1) = coex_counter(1,1) + 1;
    end
    if sum(coex_matrix(i,:)) == 2
        coex_counter(1,2) = coex_counter(1,2) + 1;
    end
    if sum(coex_matrix(i,:)) == 3
        coex_counter(1,3) = coex_counter(1,3) + 1;
    end
    if sum(coex_matrix(i,:)) == 4
        coex_counter(1,4) = coex_counter(1,4) + 1;
    end
    if sum(coex_matrix(i,:)) == 5
        coex_counter(1,5) = coex_counter(1,5) + 1;
    end
    if sum(coex_matrix(i,:)) == 6
        coex_counter(1,6) = coex_counter(1,6) + 1;
    end
    if sum(coex_matrix(i,:)) == 7
        coex_counter(1,7) = coex_counter(1,7) + 1;
    end
    if sum(coex_matrix(i,:)) == 8
        coex_counter(1,8) = coex_counter(1,8) + 1;
    end
    if sum(coex_matrix(i,:)) == 9
        coex_counter(1,9) = coex_counter(1,9) + 1;
    end
    if sum(coex_matrix(i,:)) == 10
        coex_counter(1,10) = coex_counter(1,10) + 1;
    end
    if sum(coex_matrix(i,:)) == 11
        coex_counter(1,11) = coex_counter(1,11) + 1;
    end
end
coex_counter = array2table(coex_counter); %Convert to table
coex_counter.Properties.VariableNames = {'One_Event' 'Two_Events' 'Three_Events' 'Four_Events' 'Five_Events' 'Six_Events' 'Seven_Events' 'Eight_Events' 'Nine_Events' 'Ten_Events' 'Eleven_Events'};

clear temp1 temp2 i j temp coex_matrix
%% Connectedness (Coexceedence Equity)
coex_matrix = zeros(349,8); %Initialize data structure
for i=1:size(coex_matrix,2) %Loop through all markets, pull upper and lower 2.5% threshold, assign binary value of "1" if return exceeds threshold
    temp1 = quantile(table2array(index_daily_returns(:,i)),.975);
    temp2 = quantile(table2array(index_daily_returns(:,i)),.025);
    for j=1:size(coex_matrix,1)
        if table2array(index_daily_returns(j,i))>= temp1 || table2array(index_daily_returns(j,i))<= temp2
            coex_matrix(j,i) = 1;
        end
    end
end

index_total_events = zeros(1,8); %Initialize data struture 
for i=1:size(coex_matrix,2) %Sum up number of events per exchange
    temp = sum(coex_matrix(:,i));
    index_total_events(:,i) = temp;
end
clear i
index_total_events = array2table(index_total_events); %Convert to table
index_total_events.Properties.VariableNames = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'};

index_coex_counter = zeros(1,8);%Initialize data structure
for i=1:size(coex_matrix,1) %Sort into buckets of co-exceedence events
    if sum(coex_matrix(i,:)) == 1
        index_coex_counter(1,1) = index_coex_counter(1,1) + 1;
    end
    if sum(coex_matrix(i,:)) == 2
        index_coex_counter(1,2) = index_coex_counter(1,2) + 1;
    end
    if sum(coex_matrix(i,:)) == 3
        index_coex_counter(1,3) = index_coex_counter(1,3) + 1;
    end
    if sum(coex_matrix(i,:)) == 4
        index_coex_counter(1,4) = index_coex_counter(1,4) + 1;
    end
    if sum(coex_matrix(i,:)) == 5
        index_coex_counter(1,5) = index_coex_counter(1,5) + 1;
    end
    if sum(coex_matrix(i,:)) == 6
        index_coex_counter(1,6) = index_coex_counter(1,6) + 1;
    end
    if sum(coex_matrix(i,:)) == 7
        index_coex_counter(1,7) = index_coex_counter(1,7) + 1;
    end
    if sum(coex_matrix(i,:)) == 8
        index_coex_counter(1,8) = index_coex_counter(1,8) + 1;
    end
end
index_coex_counter = array2table(index_coex_counter); %Convert to table
index_coex_counter.Properties.VariableNames = {'One_Event' 'Two_Events' 'Three_Events' 'Four_Events' 'Five_Events' 'Six_Events' 'Seven_Events' 'Eight_Events'};

clear temp1 temp2 i j temp coex_matrix total_events
%% Connectedness (Moving Correlation)
interval = (1:10); %Window for the rolling correlation matrix
moving_corr = zeros(471,11); %Initialize data structure

for i=1:471 %Baseline is coinbaseUSD
    for j=1:11 %Calculate the correlation for the window, incrementing by 1 time period each time
        temp = corr(table2array(market_returns(interval,7)),table2array(market_returns(interval,j)));
        moving_corr(i,j) = temp;
    end
    interval = interval + 1;
end

moving_corr = array2table(moving_corr); %Convert to table
moving_corr.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

clear interval i j temp
%% Efficency (Autocorrelation Daily and Weekly (Bitcoin))
daily_autocorr_summary = zeros(21,11); %Initialize data structure
for i=1:size(daily_autocorr_summary,2) %Loop through all exchanges, calculate autocorrelation out to 20 periods
    [test,~,bounds] = autocorr(table2array(market_returns(:,i)));
    daily_autocorr_summary(:,i) = test;
end

weekly_autocorr_summary = zeros(21,11);
for i=1:size(weekly_autocorr_summary,2) %Same process, but for weekly data
    [test2,~,bounds2] = autocorr(table2array(market_return_weekly(:,i)));
    weekly_autocorr_summary(:,i) = test2;
end

daily_autocorr_summary = array2table(daily_autocorr_summary); %Convert to table
weekly_autocorr_summary = array2table(weekly_autocorr_summary); %Convert to table
daily_autocorr_summary.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};
weekly_autocorr_summary.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

clear i test test2
%% Efficency (Autocorrelation Daily (Equity))
index_daily_autocorr_summary = zeros(21,8); %Initalize data structure
for i=1:size(index_daily_autocorr_summary,2)%Loop through all exchanges, calculate autocorrelation out to 20 periods
    [test,~,bounds5] = autocorr(table2array(index_daily_returns(:,i)));
    index_daily_autocorr_summary(:,i) = test;
end

index_daily_autocorr_summary = array2table(index_daily_autocorr_summary); %Convert to table
index_daily_autocorr_summary.Properties.VariableNames = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'};

clear i test test2
%% Efficiency (Cross Correltion Daily and Weekly (Bitcoin))
daily_xcor_summary = zeros(21,11); %Initalize data structure
for i=1:size(daily_xcor_summary,2) %Calculate cross correlation with coinbaseUSD as the baseline, out to 10 periods of lag
    [temp,~,bounds3] = crosscorr(table2array(market_returns(:,7)),table2array(market_returns(:,i)),10);
    daily_xcor_summary(:,i) = temp;
end

weekly_xcor_summary = zeros(21,11); %Initialize data structure
for i=1:size(daily_xcor_summary,2) %Repeat for weekly data, coinbaseUSD is still the baseline
    [temp2,~,bounds4] = crosscorr(table2array(market_return_weekly(:,7)),table2array(market_return_weekly(:,i)),10);
    weekly_xcor_summary(:,i) = temp2;
end

daily_xcor_summary = array2table(daily_xcor_summary); %Convert to table
weekly_xcor_summary = array2table(weekly_xcor_summary); %Convert to table
daily_xcor_summary.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};
weekly_xcor_summary.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

clear i temp temp2
%% Efficiency (Cross Correaltion Daily (Equity))
index_daily_xcor_summary = zeros(21,8); %Initalize data structure
for i=1:size(index_daily_xcor_summary,2)%Calculate cross correlation with the S&P 500 as the baseline, out to 10 periods of lag
    [temp,~,bounds6] = crosscorr(table2array(index_daily_returns(:,1)),table2array(index_daily_returns(:,i)),10);
    index_daily_xcor_summary(:,i) = temp;
end

index_daily_xcor_summary = array2table(index_daily_xcor_summary); %Convert to table
index_daily_xcor_summary.Properties.VariableNames = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'};

clear i temp temp2
%% Efficiency (Variance Ratio Test (Bitcoin))
daily_var_summary = zeros(5,11); %Initialize data structure
daily_var_ratio = zeros(5,11); %Initialize data structure
daily_var_pvalue = zeros(5,11); %Initialize data structure
q = [2 4 6 8 10]; %Time periods for the variance ratio
 
for i=1:size(daily_var_summary,2) %Loops through all exchanges and runs the vratiotest on the log prices for the whole period
    [temp1,temp2,~,~,temp3] = vratiotest(log(table2array(market_prices(:,i))),'period',q);
    daily_var_summary(:,i) = temp1;
    daily_var_ratio(:,i) = temp3;
    daily_var_pvalue(:,i) = temp2;
end

daily_var_summary = array2table(daily_var_summary); %Convert to table
daily_var_ratio = array2table(daily_var_ratio);
daily_var_pvalue = array2table(daily_var_pvalue);
daily_var_summary.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};
daily_var_ratio.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};
daily_var_pvalue.Properties.VariableNames = {'bitbayPLN' 'bitstampUSD' 'btcdeEUR' 'btceCNY' 'btcmarketsAUD' 'coinbaseEUR' 'coinbaseUSD' 'coincheckJPY' 'coinfloorGBP' 'foxbitBRL' 'mercadoBRL'};

clear temp1 temp2 temp3 q i
%% Efficiency (Variance Ratio Test (Equity))
index_daily_var_summary = zeros(5,8);%Initialize data structure
index_daily_var_ratio = zeros(5,8);%Initialize data structure
index_daily_var_pvalue = zeros(5,8);%Initialize data structure
q = [2 4 6 8 10];%Time periods for the variance ratio

for i=1:size(index_daily_var_summary,2)%Loops through all indices and runs the vratiotest on the log prices for the whole period
    [temp1,temp2,~,~,temp3] = vratiotest(log(table2array(index_daily_prices(:,i))),'period',q);
    index_daily_var_summary(:,i) = temp1;
    index_daily_var_ratio(:,i) = temp3;
    index_daily_var_pvalue(:,i) = temp2;
end

index_daily_var_summary = array2table(index_daily_var_summary); %Convert to table
index_daily_var_ratio = array2table(index_daily_var_ratio);
index_daily_var_pvalue = array2table(index_daily_var_pvalue);
index_daily_var_summary.Properties.VariableNames = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'};
index_daily_var_ratio.Properties.VariableNames = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'};
index_daily_var_pvalue.Properties.VariableNames = {'SP500' 'Nikkei225' 'ASX200' 'IBOVESPA' 'WIG' 'SHCOMP' 'UKX' 'SX5E'};

clear temp1 temp2 temp3 q i