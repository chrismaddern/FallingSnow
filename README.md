## VENSnowOverlayView
A snowy UIView overlay to make your apps Christmassy!

<img src="http://chris.cm/wp-content/uploads/2013/12/snow_side.png" align="center" alt="" width="200"/>

### Installation
The easiest way is to use CocoaPods. If you don't already, here's a [guide](http://guides.cocoapods.org/using/getting-started.html).
```
pod 'VENSnowOverlayView', '~>0.1.0'
```

### Creation
```
    VENSnowOverlayView *snowOverlay = [[VENSnowOverlayView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:snowOverlay];
    [snowOverlay beginSnowAnimation];
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Attribution
Felice did a ton of great work in getting the actual snowfall animation working. I based this work on [his](https://github.com/felice/SnowFall).

