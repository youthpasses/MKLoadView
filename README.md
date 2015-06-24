# MKLoadView

自定义加载视图

使用方法：

    //初始化
    MKLoadingView *loadingView = [[MKLoadingView alloc] init];
    [self.view addSubview:loadingView];
    
    //开始
    [loadingView startLoading];
    
    //停止
    [loadingView stopLoading];
