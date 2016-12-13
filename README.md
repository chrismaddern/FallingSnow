## Falling Snow
Make your app snow with just a line of code!

<img src="https://cloud.githubusercontent.com/assets/1068437/21128029/884b5860-c0c5-11e6-8c50-2343f3b8b48d.gif" align="center" alt="" width="200"/>

### Installation
The easiest way is to use CocoaPods. If you don't already, here's a [guide](http://guides.cocoapods.org/using/getting-started.html).
```
pod 'FallingSnow', '~>1.0.0'
```

### Usage
To make your whole App snow, in your `AppDelegate`:

```objc
[self.window makeItSnow];
```

To make any particular view snow:

```objc
[myView makeItSnow];
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Attribution
Felice did a ton of great work in getting the actual snowfall animation working. I based this work on [his](https://github.com/felice/SnowFall).

