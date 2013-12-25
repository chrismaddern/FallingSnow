## VENSnowOverlayView
A snowy UIView overlay to make your apps Christmassy!

### Installation
The pod is currently pending pull-requesting.. should be available soon.
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

