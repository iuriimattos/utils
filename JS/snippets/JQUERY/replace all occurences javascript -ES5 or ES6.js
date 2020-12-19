const chars = {'.':'',',':''};
let prices = [];

prices[0]="1.000,000"
prices[1]="1.000,001"
prices[2]="1.000,002"
prices[3]="1.000,003"
prices[4]="1.000,004"

prices.forEach((value, index) => prices[index] = `foo${value}`.replace(/[,.]/g, m => chars[m]));
console.log(prices)

prices[0]="1.000,000"
prices[1]="1.000,001"
prices[2]="1.000,002"
prices[3]="1.000,003"
prices[4]="1.000,004"
for (var i = 0; i < prices.length; i++) {
prices[i] = `foo${prices[i]}`.replace(/[,.]/g, m => chars[m]);
}
console.log(prices)
