> Prevent double trigger and unique flow

```
e.stopPropagation();
e.preventDefault();
```

> replace all occurences

```
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
```

> Clean way to define JSON

```
Object.assign(this.yourvar, {
  property_1: 'value_1',
  property_2: 'value_2',
  property_3_is_object: {
    objectProperty_1: 1,
    objectProperty_2: 2,
    objectProperty_3: 3,
    objectProperty_4: 4
  }
});
```

> jQuery Function IN Object Prop Structure

```
var app = {
	setup: function(){
		jQuery("CSS_SELECTOR").click(function(){
			
		}
	});
	}		
}
jQuery(document).ready(function() {
	app.setup();
});
```

> Function IN Object Structure

```
(function() {
  'use strict'
  var APP = APP || {};

  APP.home = (function($) {
    init();

    function setup() {
    }

    function init() {
      setup();
    }

  }(jQuery));

})();
```