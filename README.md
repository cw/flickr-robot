# flickr-robot

Flickr photo management and automation

## Getting Started
### On the server
Install the module with: `npm install flickr-robot`

```javascript
var flickr = require('flickr-robot');
flickr.awesome(); // "awesome"
```

### In the browser
Download the [production version][min] or the [development version][max].

[min]: https://raw.github.com/cw/flickr-robot/master/dist/flickr-robot.min.js
[max]: https://raw.github.com/cw/flickr-robot/master/dist/flickr-robot.js

In your web page:

```html
<script src="dist/flickr-robot.min.js"></script>
<script>
awesome(); // "awesome"
</script>
```

In your code, you can attach flickr's methods to any object.

```html
<script>
this.exports = Bocoup.utils;
</script>
<script src="dist/flickr-robot.min.js"></script>
<script>
Bocoup.utils.awesome(); // "awesome"
</script>
```

## Documentation
_(Coming soon)_

## Examples
```javascript
var flickr = require('flickr-robot');
flickr.get_photos(); // "count of photos for user id defined in .env file"
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [grunt](http://gruntjs.com/).

_Also, please don't edit files in the "dist" subdirectory as they are generated via grunt. You'll find source code in the "lib" subdirectory!_

## Release History
_(Nothing yet)_

## License
Copyright (c) 2012 Christian Wilcox  
Licensed under the MIT license.
