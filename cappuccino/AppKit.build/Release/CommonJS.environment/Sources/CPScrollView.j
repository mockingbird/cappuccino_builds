@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;7;CPBox.ji;12;CPClipView.ji;12;CPScroller.ji;8;CPView.jt;51285;objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("CPBox.j", YES);objj_executeFile("CPClipView.j", YES);objj_executeFile("CPScroller.j", YES);objj_executeFile("CPView.j", YES);var _isBrowserUsingOverlayScrollers = function()
{
    return NO;
};
var TIMER_INTERVAL = 0.2,
    CPScrollViewDelegate_scrollViewWillScroll_ = 1 << 0,
    CPScrollViewDelegate_scrollViewDidScroll_ = 1 << 1,
    CPScrollViewFadeOutTime = 1.3;
var CPScrollerStyleGlobal = CPScrollerStyleOverlay,
    CPScrollerStyleGlobalChangeNotification = "CPScrollerStyleGlobalChangeNotification";
{var the_class = objj_allocateClassPair(CPView, "CPScrollView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_headerClipView"), new objj_ivar("_cornerView"), new objj_ivar("_bottomCornerView"), new objj_ivar("_delegate"), new objj_ivar("_scrollTimer"), new objj_ivar("_hasVerticalScroller"), new objj_ivar("_hasHorizontalScroller"), new objj_ivar("_autohidesScrollers"), new objj_ivar("_verticalScroller"), new objj_ivar("_horizontalScroller"), new objj_ivar("_recursionCount"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_verticalLineScroll"), new objj_ivar("_verticalPageScroll"), new objj_ivar("_horizontalLineScroll"), new objj_ivar("_horizontalPageScroll"), new objj_ivar("_borderType"), new objj_ivar("_timerScrollersHide"), new objj_ivar("_scrollerStyle"), new objj_ivar("_scrollerKnobStyle")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPScrollView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScrollView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._verticalLineScroll = 10.0;
        self._verticalPageScroll = 10.0;
        self._horizontalLineScroll = 10.0;
        self._horizontalPageScroll = 10.0;
        self._borderType = CPNoBorder;
        self._contentView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "initWithFrame:", objj_msgSend(self, "_insetBounds"));
        objj_msgSend(self, "addSubview:", self._contentView);
        self._headerClipView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "init");
        objj_msgSend(self, "addSubview:", self._headerClipView);
        self._bottomCornerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(self, "addSubview:", self._bottomCornerView);
        objj_msgSend(self, "setHasVerticalScroller:", YES);
        objj_msgSend(self, "setHasHorizontalScroller:", YES);
        self._scrollerKnobStyle = CPScrollerKnobStyleDefault;
        objj_msgSend(self, "setScrollerStyle:", CPScrollerStyleGlobal);
        self._delegate = nil;
        self._scrollTimer = nil;
        self._implementedDelegateMethods = 0;
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_didReceiveDefaultStyleChange:"), CPScrollerStyleGlobalChangeNotification, nil);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("delegate"), function $CPScrollView__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPScrollView__setDelegate_(self, _cmd, aDelegate)
{
    if (aDelegate === self._delegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (self._delegate === nil)
        return;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("scrollViewWillScroll:")))
        self._implementedDelegateMethods |= CPScrollViewDelegate_scrollViewWillScroll_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("scrollViewDidScroll:")))
        self._implementedDelegateMethods |= CPScrollViewDelegate_scrollViewDidScroll_;
}
,["void","id"]), new objj_method(sel_getUid("scrollerStyle"), function $CPScrollView__scrollerStyle(self, _cmd)
{
    return self._scrollerStyle;
}
,["int"]), new objj_method(sel_getUid("setScrollerStyle:"), function $CPScrollView__setScrollerStyle_(self, _cmd, aStyle)
{
    if (self._scrollerStyle === aStyle)
        return;
    self._scrollerStyle = aStyle;
    objj_msgSend(self, "_updateScrollerStyle");
}
,["void","int"]), new objj_method(sel_getUid("scrollerKnobStyle"), function $CPScrollView__scrollerKnobStyle(self, _cmd)
{
    return self._scrollerKnobStyle;
}
,["int"]), new objj_method(sel_getUid("setScrollerKnobStyle:"), function $CPScrollView__setScrollerKnobStyle_(self, _cmd, newScrollerKnobStyle)
{
    if (self._scrollerKnobStyle === newScrollerKnobStyle)
        return;
    self._scrollerKnobStyle = newScrollerKnobStyle;
    objj_msgSend(self, "_updateScrollerStyle");
}
,["void","int"]), new objj_method(sel_getUid("contentView"), function $CPScrollView__contentView(self, _cmd)
{
    return self._contentView;
}
,["CPClipView"]), new objj_method(sel_getUid("setContentView:"), function $CPScrollView__setContentView_(self, _cmd, aContentView)
{
    if (self._contentView === aContentView || !aContentView)
        return;
    var documentView = objj_msgSend(aContentView, "documentView");
    if (documentView)
        objj_msgSend(documentView, "removeFromSuperview");
    objj_msgSend(self._contentView, "removeFromSuperview");
    self._contentView = aContentView;
    objj_msgSend(self._contentView, "setDocumentView:", documentView);
    objj_msgSend(self, "addSubview:", self._contentView);
    objj_msgSend(self, "reflectScrolledClipView:", self._contentView);
}
,["void","CPClipView"]), new objj_method(sel_getUid("contentSize"), function $CPScrollView__contentSize(self, _cmd)
{
    return objj_msgSend(self._contentView, "frame").size;
}
,["CGSize"]), new objj_method(sel_getUid("documentView"), function $CPScrollView__documentView(self, _cmd)
{
    return objj_msgSend(self._contentView, "documentView");
}
,["id"]), new objj_method(sel_getUid("setDocumentView:"), function $CPScrollView__setDocumentView_(self, _cmd, aView)
{
    objj_msgSend(self._contentView, "setDocumentView:", aView);
    objj_msgSend(self, "_updateCornerAndHeaderView");
    objj_msgSend(self, "reflectScrolledClipView:", self._contentView);
}
,["void","CPView"]), new objj_method(sel_getUid("borderType"), function $CPScrollView__borderType(self, _cmd)
{
    return self._borderType;
}
,["CPBorderType"]), new objj_method(sel_getUid("setBorderType:"), function $CPScrollView__setBorderType_(self, _cmd, borderType)
{
    if (self._borderType == borderType)
        return;
    self._borderType = borderType;
    objj_msgSend(self, "reflectScrolledClipView:", self._contentView);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPBorderType"]), new objj_method(sel_getUid("horizontalScroller"), function $CPScrollView__horizontalScroller(self, _cmd)
{
    return self._horizontalScroller;
}
,["CPScroller"]), new objj_method(sel_getUid("setHorizontalScroller:"), function $CPScrollView__setHorizontalScroller_(self, _cmd, aScroller)
{
    if (self._horizontalScroller === aScroller)
        return;
    objj_msgSend(self._horizontalScroller, "removeFromSuperview");
    objj_msgSend(self._horizontalScroller, "setTarget:", nil);
    objj_msgSend(self._horizontalScroller, "setAction:", nil);
    self._horizontalScroller = aScroller;
    objj_msgSend(self._horizontalScroller, "setTarget:", self);
    objj_msgSend(self._horizontalScroller, "setAction:", sel_getUid("_horizontalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", self._horizontalScroller);
    objj_msgSend(self, "_updateScrollerStyle");
}
,["void","CPScroller"]), new objj_method(sel_getUid("hasHorizontalScroller"), function $CPScrollView__hasHorizontalScroller(self, _cmd)
{
    return self._hasHorizontalScroller;
}
,["BOOL"]), new objj_method(sel_getUid("setHasHorizontalScroller:"), function $CPScrollView__setHasHorizontalScroller_(self, _cmd, shouldHaveHorizontalScroller)
{
    if (self._hasHorizontalScroller === shouldHaveHorizontalScroller)
        return;
    self._hasHorizontalScroller = shouldHaveHorizontalScroller;
    if (self._hasHorizontalScroller && !self._horizontalScroller)
    {
        var bounds = objj_msgSend(self, "_insetBounds");
        objj_msgSend(self, "setHorizontalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, MAX(CGRectGetWidth(bounds), objj_msgSend(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle) + 1), objj_msgSend(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle))));
        objj_msgSend(objj_msgSend(self, "horizontalScroller"), "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), objj_msgSend(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle)));
    }
    objj_msgSend(self, "reflectScrolledClipView:", self._contentView);
}
,["void","BOOL"]), new objj_method(sel_getUid("verticalScroller"), function $CPScrollView__verticalScroller(self, _cmd)
{
    return self._verticalScroller;
}
,["CPScroller"]), new objj_method(sel_getUid("setVerticalScroller:"), function $CPScrollView__setVerticalScroller_(self, _cmd, aScroller)
{
    if (self._verticalScroller === aScroller)
        return;
    objj_msgSend(self._verticalScroller, "removeFromSuperview");
    objj_msgSend(self._verticalScroller, "setTarget:", nil);
    objj_msgSend(self._verticalScroller, "setAction:", nil);
    self._verticalScroller = aScroller;
    objj_msgSend(self._verticalScroller, "setTarget:", self);
    objj_msgSend(self._verticalScroller, "setAction:", sel_getUid("_verticalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", self._verticalScroller);
    objj_msgSend(self, "_updateScrollerStyle");
}
,["void","CPScroller"]), new objj_method(sel_getUid("hasVerticalScroller"), function $CPScrollView__hasVerticalScroller(self, _cmd)
{
    return self._hasVerticalScroller;
}
,["BOOL"]), new objj_method(sel_getUid("setHasVerticalScroller:"), function $CPScrollView__setHasVerticalScroller_(self, _cmd, shouldHaveVerticalScroller)
{
    if (self._hasVerticalScroller === shouldHaveVerticalScroller)
        return;
    self._hasVerticalScroller = shouldHaveVerticalScroller;
    if (self._hasVerticalScroller && !self._verticalScroller)
    {
        var bounds = objj_msgSend(self, "_insetBounds");
        objj_msgSend(self, "setVerticalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, objj_msgSend(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle), MAX(CGRectGetHeight(bounds), objj_msgSend(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle) + 1))));
        objj_msgSend(objj_msgSend(self, "verticalScroller"), "setFrameSize:", CGSizeMake(objj_msgSend(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle), CGRectGetHeight(bounds)));
    }
    objj_msgSend(self, "reflectScrolledClipView:", self._contentView);
}
,["void","BOOL"]), new objj_method(sel_getUid("autohidesScrollers"), function $CPScrollView__autohidesScrollers(self, _cmd)
{
    return self._autohidesScrollers;
}
,["BOOL"]), new objj_method(sel_getUid("setAutohidesScrollers:"), function $CPScrollView__setAutohidesScrollers_(self, _cmd, autohidesScrollers)
{
    if (self._autohidesScrollers == autohidesScrollers)
        return;
    self._autohidesScrollers = autohidesScrollers;
    objj_msgSend(self, "reflectScrolledClipView:", self._contentView);
}
,["void","BOOL"]), new objj_method(sel_getUid("bottomCornerView"), function $CPScrollView__bottomCornerView(self, _cmd)
{
    return self._bottomCornerView;
}
,["CPView"]), new objj_method(sel_getUid("setBottomCornerView:"), function $CPScrollView__setBottomCornerView_(self, _cmd, aBottomCornerView)
{
    if (self._bottomCornerView === aBottomCornerView)
        return;
    objj_msgSend(self._bottomCornerView, "removeFromSuperview");
    objj_msgSend(aBottomCornerView, "setFrame:", objj_msgSend(self, "_bottomCornerViewFrame"));
    objj_msgSend(self, "addSubview:", aBottomCornerView);
    self._bottomCornerView = aBottomCornerView;
    objj_msgSend(self, "_updateCornerAndHeaderView");
}
,["void","CPView"]), new objj_method(sel_getUid("lineScroll"), function $CPScrollView__lineScroll(self, _cmd)
{
    return objj_msgSend(self, "horizontalLineScroll");
}
,["float"]), new objj_method(sel_getUid("setLineScroll:"), function $CPScrollView__setLineScroll_(self, _cmd, aLineScroll)
{
    objj_msgSend(self, "setHorizontalLineScroll:", aLineScroll);
    objj_msgSend(self, "setVerticalLineScroll:", aLineScroll);
}
,["void","float"]), new objj_method(sel_getUid("horizontalLineScroll"), function $CPScrollView__horizontalLineScroll(self, _cmd)
{
    return self._horizontalLineScroll;
}
,["float"]), new objj_method(sel_getUid("setHorizontalLineScroll:"), function $CPScrollView__setHorizontalLineScroll_(self, _cmd, aLineScroll)
{
    self._horizontalLineScroll = aLineScroll;
}
,["void","float"]), new objj_method(sel_getUid("verticalLineScroll"), function $CPScrollView__verticalLineScroll(self, _cmd)
{
    return self._verticalLineScroll;
}
,["float"]), new objj_method(sel_getUid("setVerticalLineScroll:"), function $CPScrollView__setVerticalLineScroll_(self, _cmd, aLineScroll)
{
    self._verticalLineScroll = aLineScroll;
}
,["void","float"]), new objj_method(sel_getUid("pageScroll"), function $CPScrollView__pageScroll(self, _cmd)
{
    return objj_msgSend(self, "horizontalPageScroll");
}
,["float"]), new objj_method(sel_getUid("setPageScroll:"), function $CPScrollView__setPageScroll_(self, _cmd, aPageScroll)
{
    objj_msgSend(self, "setHorizontalPageScroll:", aPageScroll);
    objj_msgSend(self, "setVerticalPageScroll:", aPageScroll);
}
,["void","float"]), new objj_method(sel_getUid("horizontalPageScroll"), function $CPScrollView__horizontalPageScroll(self, _cmd)
{
    return self._horizontalPageScroll;
}
,["float"]), new objj_method(sel_getUid("setHorizontalPageScroll:"), function $CPScrollView__setHorizontalPageScroll_(self, _cmd, aPageScroll)
{
    self._horizontalPageScroll = aPageScroll;
}
,["void","float"]), new objj_method(sel_getUid("verticalPageScroll"), function $CPScrollView__verticalPageScroll(self, _cmd)
{
    return self._verticalPageScroll;
}
,["float"]), new objj_method(sel_getUid("setVerticalPageScroll:"), function $CPScrollView__setVerticalPageScroll_(self, _cmd, aPageScroll)
{
    self._verticalPageScroll = aPageScroll;
}
,["void","float"]), new objj_method(sel_getUid("_updateScrollerStyle"), function $CPScrollView___updateScrollerStyle(self, _cmd)
{
    if (self._hasHorizontalScroller)
    {
        objj_msgSend(self._horizontalScroller, "setStyle:", self._scrollerStyle);
        objj_msgSend(self._horizontalScroller, "unsetThemeState:", CPThemeStateSelected);
        switch(self._scrollerKnobStyle) {
        case CPScrollerKnobStyleLight:
            objj_msgSend(self._horizontalScroller, "unsetThemeState:", CPThemeStateScrollerKnobDark);
            objj_msgSend(self._horizontalScroller, "setThemeState:", CPThemeStateScrollerKnobLight);
            break;
        case CPScrollerKnobStyleDark:
            objj_msgSend(self._horizontalScroller, "unsetThemeState:", CPThemeStateScrollerKnobLight);
            objj_msgSend(self._horizontalScroller, "setThemeState:", CPThemeStateScrollerKnobDark);
            break;
default:
            objj_msgSend(self._horizontalScroller, "unsetThemeState:", CPThemeStateScrollerKnobLight);
            objj_msgSend(self._horizontalScroller, "unsetThemeState:", CPThemeStateScrollerKnobDark);
        }
    }
    if (self._hasVerticalScroller)
    {
        objj_msgSend(self._verticalScroller, "setStyle:", self._scrollerStyle);
        objj_msgSend(self._verticalScroller, "unsetThemeState:", CPThemeStateSelected);
        switch(self._scrollerKnobStyle) {
        case CPScrollerKnobStyleLight:
            objj_msgSend(self._verticalScroller, "unsetThemeState:", CPThemeStateScrollerKnobDark);
            objj_msgSend(self._verticalScroller, "setThemeState:", CPThemeStateScrollerKnobLight);
            break;
        case CPScrollerKnobStyleDark:
            objj_msgSend(self._verticalScroller, "unsetThemeState:", CPThemeStateScrollerKnobLight);
            objj_msgSend(self._verticalScroller, "setThemeState:", CPThemeStateScrollerKnobDark);
            break;
default:
            objj_msgSend(self._verticalScroller, "unsetThemeState:", CPThemeStateScrollerKnobLight);
            objj_msgSend(self._verticalScroller, "unsetThemeState:", CPThemeStateScrollerKnobDark);
        }
    }
    if (self._scrollerStyle == CPScrollerStyleOverlay)
    {
        if (self._timerScrollersHide)
            objj_msgSend(self._timerScrollersHide, "invalidate");
        self._timerScrollersHide = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", CPScrollViewFadeOutTime, self, sel_getUid("_hideScrollers:"), nil, NO);
        objj_msgSend(objj_msgSend(self, "bottomCornerView"), "setHidden:", YES);
    }
    else
        objj_msgSend(objj_msgSend(self, "bottomCornerView"), "setHidden:", NO);
    objj_msgSend(self, "reflectScrolledClipView:", self._contentView);
}
,["void"]), new objj_method(sel_getUid("_insetBounds"), function $CPScrollView___insetBounds(self, _cmd)
{
    return objj_msgSend(objj_msgSend(self, "class"), "_insetBounds:borderType:", objj_msgSend(self, "bounds"), self._borderType);
}
,["CGRect"]), new objj_method(sel_getUid("_updateCornerAndHeaderView"), function $CPScrollView___updateCornerAndHeaderView(self, _cmd)
{
    var documentView = objj_msgSend(self, "documentView"),
        currentHeaderView = objj_msgSend(self, "_headerView"),
        documentHeaderView = objj_msgSend(documentView, "respondsToSelector:", sel_getUid("headerView")) ? objj_msgSend(documentView, "headerView") : nil;
    if (currentHeaderView !== documentHeaderView)
    {
        objj_msgSend(currentHeaderView, "removeFromSuperview");
        objj_msgSend(self._headerClipView, "setDocumentView:", documentHeaderView);
    }
    var documentCornerView = objj_msgSend(documentView, "respondsToSelector:", sel_getUid("cornerView")) ? objj_msgSend(documentView, "cornerView") : nil;
    if (self._cornerView !== documentCornerView)
    {
        objj_msgSend(self._cornerView, "removeFromSuperview");
        self._cornerView = documentCornerView;
        if (self._cornerView)
        {
            objj_msgSend(self._cornerView, "setHidden:", !(self._scrollerStyle === CPScrollerStyleLegacy && self._verticalScroller && !objj_msgSend(self._verticalScroller, "isHidden")));
            objj_msgSend(self, "addSubview:", self._cornerView);
        }
    }
    objj_msgSend(self, "reflectScrolledClipView:", self._contentView);
    objj_msgSend(documentHeaderView, "setNeedsLayout");
    objj_msgSend(documentHeaderView, "setNeedsDisplay:", YES);
}
,["void"]), new objj_method(sel_getUid("_headerView"), function $CPScrollView___headerView(self, _cmd)
{
    return objj_msgSend(self._headerClipView, "documentView");
}
,["CPView"]), new objj_method(sel_getUid("_cornerViewFrame"), function $CPScrollView___cornerViewFrame(self, _cmd)
{
    if (!self._cornerView)
        return CGRectMakeZero();
    var bounds = objj_msgSend(self, "_insetBounds"),
        frame = objj_msgSend(self._cornerView, "frame");
    frame.origin.x = CGRectGetMaxX(bounds) - CGRectGetWidth(frame);
    frame.origin.y = CGRectGetMinY(bounds);
    return frame;
}
,["CGRect"]), new objj_method(sel_getUid("_headerClipViewFrame"), function $CPScrollView___headerClipViewFrame(self, _cmd)
{
    var headerView = objj_msgSend(self, "_headerView");
    if (!headerView)
        return CGRectMakeZero();
    var frame = objj_msgSend(self, "_insetBounds");
    frame.size.height = CGRectGetHeight(objj_msgSend(headerView, "frame"));
    if (self._scrollerStyle === CPScrollerStyleLegacy && self._verticalScroller && !objj_msgSend(self._verticalScroller, "isHidden"))
        frame.size.width -= CGRectGetWidth(objj_msgSend(self, "_cornerViewFrame"));
    return frame;
}
,["CGRect"]), new objj_method(sel_getUid("_bottomCornerViewFrame"), function $CPScrollView___bottomCornerViewFrame(self, _cmd)
{
    if (objj_msgSend(objj_msgSend(self, "horizontalScroller"), "isHidden") || objj_msgSend(objj_msgSend(self, "verticalScroller"), "isHidden"))
        return CGRectMakeZero();
    var verticalFrame = objj_msgSend(objj_msgSend(self, "verticalScroller"), "frame"),
        bottomCornerFrame = CGRectMakeZero();
    bottomCornerFrame.origin.x = CGRectGetMinX(verticalFrame);
    bottomCornerFrame.origin.y = CGRectGetMaxY(verticalFrame);
    bottomCornerFrame.size.width = objj_msgSend(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle);
    bottomCornerFrame.size.height = objj_msgSend(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle);
    return bottomCornerFrame;
}
,["CGRect"]), new objj_method(sel_getUid("_verticalScrollerDidScroll:"), function $CPScrollView___verticalScrollerDidScroll_(self, _cmd, aScroller)
{
    var value = objj_msgSend(aScroller, "floatValue"),
        documentFrame = objj_msgSend(objj_msgSend(self._contentView, "documentView"), "frame"),
        contentBounds = objj_msgSend(self._contentView, "bounds");
    switch(objj_msgSend(self._verticalScroller, "hitPart")) {
    case CPScrollerDecrementLine:
        contentBounds.origin.y -= self._verticalLineScroll;
        break;
    case CPScrollerIncrementLine:
        contentBounds.origin.y += self._verticalLineScroll;
        break;
    case CPScrollerDecrementPage:
        contentBounds.origin.y -= CGRectGetHeight(contentBounds) - self._verticalPageScroll;
        break;
    case CPScrollerIncrementPage:
        contentBounds.origin.y += CGRectGetHeight(contentBounds) - self._verticalPageScroll;
        break;
    case CPScrollerKnobSlot:
    case CPScrollerKnob:
default:
        contentBounds.origin.y = ROUND(value * (CGRectGetHeight(documentFrame) - CGRectGetHeight(contentBounds)));
    }
    objj_msgSend(self, "_sendDelegateMessages");
    objj_msgSend(self._contentView, "scrollToPoint:", contentBounds.origin);
}
,["void","CPScroller"]), new objj_method(sel_getUid("_horizontalScrollerDidScroll:"), function $CPScrollView___horizontalScrollerDidScroll_(self, _cmd, aScroller)
{
    var value = objj_msgSend(aScroller, "floatValue"),
        documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
        contentBounds = objj_msgSend(self._contentView, "bounds");
    switch(objj_msgSend(self._horizontalScroller, "hitPart")) {
    case CPScrollerDecrementLine:
        contentBounds.origin.x -= self._horizontalLineScroll;
        break;
    case CPScrollerIncrementLine:
        contentBounds.origin.x += self._horizontalLineScroll;
        break;
    case CPScrollerDecrementPage:
        contentBounds.origin.x -= CGRectGetWidth(contentBounds) - self._horizontalPageScroll;
        break;
    case CPScrollerIncrementPage:
        contentBounds.origin.x += CGRectGetWidth(contentBounds) - self._horizontalPageScroll;
        break;
    case CPScrollerKnobSlot:
    case CPScrollerKnob:
default:
        contentBounds.origin.x = ROUND(value * (CGRectGetWidth(documentFrame) - CGRectGetWidth(contentBounds)));
    }
    objj_msgSend(self, "_sendDelegateMessages");
    objj_msgSend(self._contentView, "scrollToPoint:", contentBounds.origin);
    objj_msgSend(self._headerClipView, "scrollToPoint:", CGPointMake(contentBounds.origin.x, 0.0));
}
,["void","CPScroller"]), new objj_method(sel_getUid("_sendDelegateMessages"), function $CPScrollView___sendDelegateMessages(self, _cmd)
{
    if (self._implementedDelegateMethods == 0)
        return;
    if (!self._scrollTimer)
    {
        objj_msgSend(self, "_scrollViewWillScroll");
        self._scrollTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", TIMER_INTERVAL, self, sel_getUid("_scrollViewDidScroll"), nil, YES);
    }
    else
        objj_msgSend(self._scrollTimer, "setFireDate:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", TIMER_INTERVAL));
}
,["void"]), new objj_method(sel_getUid("_hideScrollers:"), function $CPScrollView___hideScrollers_(self, _cmd, theTimer)
{
    if (objj_msgSend(self._verticalScroller, "allowFadingOut"))
        objj_msgSend(self._verticalScroller, "fadeOut");
    if (objj_msgSend(self._horizontalScroller, "allowFadingOut"))
        objj_msgSend(self._horizontalScroller, "fadeOut");
    self._timerScrollersHide = nil;
}
,["void","CPTimer"]), new objj_method(sel_getUid("_respondToScrollWheelEventWithDeltaX:deltaY:"), function $CPScrollView___respondToScrollWheelEventWithDeltaX_deltaY_(self, _cmd, deltaX, deltaY)
{
    var documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
        contentBounds = objj_msgSend(self._contentView, "bounds"),
        contentFrame = objj_msgSend(self._contentView, "frame"),
        enclosingScrollView = objj_msgSend(self, "enclosingScrollView");
    contentBounds.origin.x = ROUND(contentBounds.origin.x + deltaX);
    contentBounds.origin.y = ROUND(contentBounds.origin.y + deltaY);
    var constrainedOrigin = objj_msgSend(self._contentView, "constrainScrollPoint:", CGPointCreateCopy(contentBounds.origin)),
        extraX = contentBounds.origin.x - constrainedOrigin.x,
        extraY = contentBounds.origin.y - constrainedOrigin.y;
    objj_msgSend(self, "_sendDelegateMessages");
    objj_msgSend(self._contentView, "scrollToPoint:", constrainedOrigin);
    objj_msgSend(self._headerClipView, "scrollToPoint:", CGPointMake(constrainedOrigin.x, 0.0));
    if (extraX || extraY)
        objj_msgSend(enclosingScrollView, "_respondToScrollWheelEventWithDeltaX:deltaY:", extraX, extraY);
}
,["void","float","float"]), new objj_method(sel_getUid("_scrollViewWillScroll"), function $CPScrollView___scrollViewWillScroll(self, _cmd)
{
    if (self._implementedDelegateMethods & CPScrollViewDelegate_scrollViewWillScroll_)
        objj_msgSend(self._delegate, "scrollViewWillScroll:", self);
}
,["void"]), new objj_method(sel_getUid("_scrollViewDidScroll"), function $CPScrollView___scrollViewDidScroll(self, _cmd)
{
    objj_msgSend(self._scrollTimer, "invalidate");
    self._scrollTimer = nil;
    if (self._implementedDelegateMethods & CPScrollViewDelegate_scrollViewDidScroll_)
        objj_msgSend(self._delegate, "scrollViewDidScroll:", self);
}
,["void"]), new objj_method(sel_getUid("_didReceiveDefaultStyleChange:"), function $CPScrollView___didReceiveDefaultStyleChange_(self, _cmd, aNotification)
{
    objj_msgSend(self, "setScrollerStyle:", CPScrollerStyleGlobal);
}
,["void","CPNotification"]), new objj_method(sel_getUid("tile"), function $CPScrollView__tile(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("reflectScrolledClipView:"), function $CPScrollView__reflectScrolledClipView_(self, _cmd, aClipView)
{
    if (self._contentView !== aClipView)
        return;
    if (self._recursionCount > 5)
        return;
    ++self._recursionCount;
    var documentView = objj_msgSend(self, "documentView");
    if (!documentView)
    {
        if (self._autohidesScrollers)
        {
            objj_msgSend(self._verticalScroller, "setHidden:", YES);
            objj_msgSend(self._horizontalScroller, "setHidden:", YES);
        }
        objj_msgSend(self._contentView, "setFrame:", objj_msgSend(self, "_insetBounds"));
        objj_msgSend(self._headerClipView, "setFrame:", CGRectMakeZero());
        --self._recursionCount;
        return;
    }
    var documentFrame = objj_msgSend(documentView, "frame"),
        contentFrame = objj_msgSend(self, "_insetBounds"),
        headerClipViewFrame = objj_msgSend(self, "_headerClipViewFrame"),
        headerClipViewHeight = CGRectGetHeight(headerClipViewFrame);
    contentFrame.origin.y += headerClipViewHeight;
    contentFrame.size.height -= headerClipViewHeight;
    var difference = CGSizeMake(CGRectGetWidth(documentFrame) - CGRectGetWidth(contentFrame), CGRectGetHeight(documentFrame) - CGRectGetHeight(contentFrame)),
        verticalScrollerWidth = objj_msgSend(CPScroller, "scrollerWidthInStyle:", objj_msgSend(self._verticalScroller, "style")),
        horizontalScrollerHeight = objj_msgSend(CPScroller, "scrollerWidthInStyle:", objj_msgSend(self._horizontalScroller, "style")),
        hasVerticalScroll = difference.height > 0.0,
        hasHorizontalScroll = difference.width > 0.0,
        shouldShowVerticalScroller = self._hasVerticalScroller && (!self._autohidesScrollers || hasVerticalScroll),
        shouldShowHorizontalScroller = self._hasHorizontalScroller && (!self._autohidesScrollers || hasHorizontalScroll);
    if (shouldShowVerticalScroller)
    {
        if (self._scrollerStyle === CPScrollerStyleLegacy)
            difference.width += verticalScrollerWidth;
        hasHorizontalScroll = difference.width > 0.0;
        shouldShowHorizontalScroller = self._hasHorizontalScroller && (!self._autohidesScrollers || hasHorizontalScroll);
    }
    if (shouldShowHorizontalScroller)
    {
        if (self._scrollerStyle === CPScrollerStyleLegacy)
            difference.height += horizontalScrollerHeight;
        hasVerticalScroll = difference.height > 0.0;
        shouldShowVerticalScroller = self._hasVerticalScroller && (!self._autohidesScrollers || hasVerticalScroll);
    }
    objj_msgSend(self._verticalScroller, "setHidden:", !shouldShowVerticalScroller);
    objj_msgSend(self._verticalScroller, "setEnabled:", hasVerticalScroll);
    objj_msgSend(self._horizontalScroller, "setHidden:", !shouldShowHorizontalScroller);
    objj_msgSend(self._horizontalScroller, "setEnabled:", hasHorizontalScroll);
    var overlay = objj_msgSend(CPScroller, "scrollerOverlay");
    if (self._scrollerStyle === CPScrollerStyleLegacy)
    {
        if (shouldShowVerticalScroller)
            contentFrame.size.width -= verticalScrollerWidth;
        if (shouldShowHorizontalScroller)
            contentFrame.size.height -= horizontalScrollerHeight;
        overlay = 0;
    }
    var scrollPoint = objj_msgSend(self._contentView, "bounds").origin,
        wasShowingVerticalScroller = !objj_msgSend(self._verticalScroller, "isHidden"),
        wasShowingHorizontalScroller = !objj_msgSend(self._horizontalScroller, "isHidden");
    if (shouldShowVerticalScroller)
    {
        var verticalScrollerY = MAX(CGRectGetMinY(contentFrame), MAX(CGRectGetMaxY(objj_msgSend(self, "_cornerViewFrame")), CGRectGetMaxY(headerClipViewFrame)));
        var verticalScrollerHeight = CGRectGetMaxY(contentFrame) - verticalScrollerY;
        if (self._scrollerStyle === CPScrollerStyleOverlay && hasHorizontalScroll)
            verticalScrollerHeight -= horizontalScrollerHeight;
        var documentHeight = CGRectGetHeight(documentFrame);
        objj_msgSend(self._verticalScroller, "setFloatValue:", difference.height <= 0.0 ? 0.0 : scrollPoint.y / difference.height);
        objj_msgSend(self._verticalScroller, "setKnobProportion:", documentHeight > 0 ? CGRectGetHeight(contentFrame) / documentHeight : 1.0);
        objj_msgSend(self._verticalScroller, "setFrame:", CGRectMake(CGRectGetMaxX(contentFrame) - overlay, verticalScrollerY, verticalScrollerWidth, verticalScrollerHeight));
    }
    else if (wasShowingVerticalScroller)
    {
        objj_msgSend(self._verticalScroller, "setFloatValue:", 0.0);
        objj_msgSend(self._verticalScroller, "setKnobProportion:", 1.0);
    }
    if (shouldShowHorizontalScroller)
    {
        var horizontalScrollerWidth = CGRectGetWidth(contentFrame);
        if (self._scrollerStyle === CPScrollerStyleOverlay && hasVerticalScroll)
            horizontalScrollerWidth -= verticalScrollerWidth;
        var documentWidth = CGRectGetWidth(documentFrame);
        objj_msgSend(self._horizontalScroller, "setFloatValue:", difference.width <= 0.0 ? 0.0 : scrollPoint.x / difference.width);
        objj_msgSend(self._horizontalScroller, "setKnobProportion:", documentWidth > 0 ? CGRectGetWidth(contentFrame) / documentWidth : 1.0);
        objj_msgSend(self._horizontalScroller, "setFrame:", CGRectMake(CGRectGetMinX(contentFrame), CGRectGetMaxY(contentFrame) - overlay, horizontalScrollerWidth, horizontalScrollerHeight));
    }
    else if (wasShowingHorizontalScroller)
    {
        objj_msgSend(self._horizontalScroller, "setFloatValue:", 0.0);
        objj_msgSend(self._horizontalScroller, "setKnobProportion:", 1.0);
    }
    objj_msgSend(self._contentView, "setFrame:", contentFrame);
    objj_msgSend(self._headerClipView, "setFrame:", objj_msgSend(self, "_headerClipViewFrame"));
    objj_msgSend(objj_msgSend(self._headerClipView, "documentView"), "setNeedsDisplay:", YES);
    if (self._scrollerStyle === CPScrollerStyleLegacy && self._verticalScroller && !objj_msgSend(self._verticalScroller, "isHidden"))
    {
        objj_msgSend(self._cornerView, "setFrame:", objj_msgSend(self, "_cornerViewFrame"));
        objj_msgSend(self._cornerView, "setHidden:", NO);
    }
    else
        objj_msgSend(self._cornerView, "setHidden:", YES);
    if (self._scrollerStyle === CPScrollerStyleLegacy)
    {
        objj_msgSend(objj_msgSend(self, "bottomCornerView"), "setFrame:", objj_msgSend(self, "_bottomCornerViewFrame"));
        objj_msgSend(objj_msgSend(self, "bottomCornerView"), "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "bottom-corner-color"));
    }
    --self._recursionCount;
}
,["void","CPClipView"]), new objj_method(sel_getUid("flashScrollers"), function $CPScrollView__flashScrollers(self, _cmd)
{
    if (self._scrollerStyle === CPScrollerStyleLegacy)
        return;
    if (self._hasHorizontalScroller)
    {
        objj_msgSend(self._horizontalScroller, "setHidden:", NO);
        objj_msgSend(self._horizontalScroller, "fadeIn");
    }
    if (self._hasVerticalScroller)
    {
        objj_msgSend(self._verticalScroller, "setHidden:", NO);
        objj_msgSend(self._verticalScroller, "fadeIn");
    }
    if (self._timerScrollersHide)
        objj_msgSend(self._timerScrollersHide, "invalidate");
    self._timerScrollersHide = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", CPScrollViewFadeOutTime, self, sel_getUid("_hideScrollers:"), nil, NO);
}
,["void"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPScrollView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
    objj_msgSend(self, "reflectScrolledClipView:", self._contentView);
}
,["void","CGSize"]), new objj_method(sel_getUid("drawRect:"), function $CPScrollView__drawRect_(self, _cmd, aRect)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScrollView").super_class }, "drawRect:", aRect);
    if (self._borderType == CPNoBorder)
        return;
    var strokeRect = objj_msgSend(self, "bounds"),
        context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextSetLineWidth(context, 1);
    switch(self._borderType) {
    case CPLineBorder:
        CGContextSetStrokeColor(context, objj_msgSend(self, "currentValueForThemeAttribute:", "border-color"));
        CGContextStrokeRect(context, CGRectInset(strokeRect, 0.5, 0.5));
        break;
    case CPBezelBorder:
        objj_msgSend(self, "_drawGrayBezelInContext:bounds:", context, strokeRect);
        break;
    case CPGrooveBorder:
        objj_msgSend(self, "_drawGrooveInContext:bounds:", context, strokeRect);
        break;
default:
        break;
    }
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawGrayBezelInContext:bounds:"), function $CPScrollView___drawGrayBezelInContext_bounds_(self, _cmd, context, aRect)
{
    var minX = CGRectGetMinX(aRect),
        maxX = CGRectGetMaxX(aRect),
        minY = CGRectGetMinY(aRect),
        maxY = CGRectGetMaxY(aRect),
        y = minY + 0.5;
    CGContextSetStrokeColor(context, objj_msgSend(CPColor, "colorWithWhite:alpha:", 142.0 / 255.0, 1.0));
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, minX, y);
    CGContextAddLineToPoint(context, maxX, y);
    CGContextStrokePath(context);
    CGContextSetStrokeColor(context, objj_msgSend(CPColor, "colorWithWhite:alpha:", 192.0 / 255.0, 1.0));
    var x = maxX - 0.5;
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, x, minY + 1.0);
    CGContextAddLineToPoint(context, x, maxY);
    CGContextMoveToPoint(context, x - 0.5, maxY - 0.5);
    CGContextAddLineToPoint(context, minX, maxY - 0.5);
    x = minX + 0.5;
    CGContextMoveToPoint(context, x, maxY);
    CGContextAddLineToPoint(context, x, minY + 1.0);
    CGContextStrokePath(context);
}
,["void","CGContext","CGRect"]), new objj_method(sel_getUid("_drawGrooveInContext:bounds:"), function $CPScrollView___drawGrooveInContext_bounds_(self, _cmd, context, aRect)
{
    var minX = CGRectGetMinX(aRect),
        maxX = CGRectGetMaxX(aRect),
        minY = CGRectGetMinY(aRect),
        maxY = CGRectGetMaxY(aRect);
    CGContextBeginPath(context);
    CGContextSetStrokeColor(context, objj_msgSend(CPColor, "colorWithWhite:alpha:", 159.0 / 255.0, 1.0));
    var y = minY + 0.5;
    CGContextMoveToPoint(context, minX, y);
    CGContextAddLineToPoint(context, maxX, y);
    var x = maxX - 1.5;
    CGContextMoveToPoint(context, x, minY + 2.0);
    CGContextAddLineToPoint(context, x, maxY - 1.0);
    y = maxY - 1.5;
    CGContextMoveToPoint(context, maxX - 1.0, y);
    CGContextAddLineToPoint(context, minX + 2.0, y);
    x = minX + 0.5;
    CGContextMoveToPoint(context, x, maxY);
    CGContextAddLineToPoint(context, x, minY);
    CGContextStrokePath(context);
    CGContextBeginPath(context);
    CGContextSetStrokeColor(context, objj_msgSend(CPColor, "whiteColor"));
    var rect = CGRectOffset(aRect, 1.0, 1.0);
    rect.size.width -= 1.0;
    rect.size.height -= 1.0;
    CGContextStrokeRect(context, CGRectInset(rect, 0.5, 0.5));
    CGContextBeginPath(context);
    CGContextSetStrokeColor(context, objj_msgSend(CPColor, "colorWithWhite:alpha:", 192.0 / 255.0, 1.0));
    y = minY + 2.5;
    CGContextMoveToPoint(context, minX + 2.0, y);
    CGContextAddLineToPoint(context, maxX - 2.0, y);
    CGContextStrokePath(context);
}
,["void","CGContext","CGRect"]), new objj_method(sel_getUid("scrollWheel:"), function $CPScrollView__scrollWheel_(self, _cmd, anEvent)
{
    if (self._timerScrollersHide)
        objj_msgSend(self._timerScrollersHide, "invalidate");
    if (!objj_msgSend(self._verticalScroller, "isHidden"))
        objj_msgSend(self._verticalScroller, "fadeIn");
    if (!objj_msgSend(self._horizontalScroller, "isHidden"))
        objj_msgSend(self._horizontalScroller, "fadeIn");
    if (!objj_msgSend(self._horizontalScroller, "isHidden") || !objj_msgSend(self._verticalScroller, "isHidden"))
        self._timerScrollersHide = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", CPScrollViewFadeOutTime, self, sel_getUid("_hideScrollers:"), nil, NO);
    objj_msgSend(self, "_respondToScrollWheelEventWithDeltaX:deltaY:", objj_msgSend(anEvent, "deltaX"), objj_msgSend(anEvent, "deltaY"));
}
,["void","CPEvent"]), new objj_method(sel_getUid("scrollPageUp:"), function $CPScrollView__scrollPageUp_(self, _cmd, sender)
{
    var contentBounds = objj_msgSend(self._contentView, "bounds");
    objj_msgSend(self, "moveByOffset:", CGSizeMake(0.0, -(CGRectGetHeight(contentBounds) - self._verticalPageScroll)));
}
,["void","id"]), new objj_method(sel_getUid("scrollPageDown:"), function $CPScrollView__scrollPageDown_(self, _cmd, sender)
{
    var contentBounds = objj_msgSend(self._contentView, "bounds");
    objj_msgSend(self, "moveByOffset:", CGSizeMake(0.0, CGRectGetHeight(contentBounds) - self._verticalPageScroll));
}
,["void","id"]), new objj_method(sel_getUid("scrollToBeginningOfDocument:"), function $CPScrollView__scrollToBeginningOfDocument_(self, _cmd, sender)
{
    objj_msgSend(self._contentView, "scrollToPoint:", CGPointMakeZero());
    objj_msgSend(self._headerClipView, "scrollToPoint:", CGPointMakeZero());
}
,["void","id"]), new objj_method(sel_getUid("scrollToEndOfDocument:"), function $CPScrollView__scrollToEndOfDocument_(self, _cmd, sender)
{
    var contentBounds = objj_msgSend(self._contentView, "bounds"),
        documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
        scrollPoint = CGPointMake(0.0, CGRectGetHeight(documentFrame) - CGRectGetHeight(contentBounds));
    objj_msgSend(self._contentView, "scrollToPoint:", scrollPoint);
    objj_msgSend(self._headerClipView, "scrollToPoint:", CGPointMakeZero());
}
,["void","id"]), new objj_method(sel_getUid("moveLeft:"), function $CPScrollView__moveLeft_(self, _cmd, sender)
{
    objj_msgSend(self, "moveByOffset:", CGSizeMake(-self._horizontalLineScroll, 0.0));
}
,["void","id"]), new objj_method(sel_getUid("moveRight:"), function $CPScrollView__moveRight_(self, _cmd, sender)
{
    objj_msgSend(self, "moveByOffset:", CGSizeMake(self._horizontalLineScroll, 0.0));
}
,["void","id"]), new objj_method(sel_getUid("moveUp:"), function $CPScrollView__moveUp_(self, _cmd, sender)
{
    objj_msgSend(self, "moveByOffset:", CGSizeMake(0.0, -self._verticalLineScroll));
}
,["void","id"]), new objj_method(sel_getUid("moveDown:"), function $CPScrollView__moveDown_(self, _cmd, sender)
{
    objj_msgSend(self, "moveByOffset:", CGSizeMake(0.0, self._verticalLineScroll));
}
,["void","id"]), new objj_method(sel_getUid("moveByOffset:"), function $CPScrollView__moveByOffset_(self, _cmd, aSize)
{
    var documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
        contentBounds = objj_msgSend(self._contentView, "bounds");
    contentBounds.origin.x += aSize.width;
    contentBounds.origin.y += aSize.height;
    objj_msgSend(self._contentView, "scrollToPoint:", contentBounds.origin);
    objj_msgSend(self._headerClipView, "scrollToPoint:", CGPointMake(contentBounds.origin.x, 0));
}
,["void","CGSize"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPScrollView__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPScrollView, "class"))
        return;
    var globalValue = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "CPScrollersGlobalStyle");
    if (globalValue === nil || globalValue === -1)
        CPScrollerStyleGlobal = _isBrowserUsingOverlayScrollers() ? CPScrollerStyleOverlay : CPScrollerStyleLegacy;
    else
        CPScrollerStyleGlobal = globalValue;
}
,["void"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPScrollView__defaultThemeClass(self, _cmd)
{
    return "scrollview";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPScrollView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPColor, "whiteColor"), "bottom-corner-color", objj_msgSend(CPColor, "blackColor"), "border-color");
}
,["CPDictionary"]), new objj_method(sel_getUid("contentSizeForFrameSize:hasHorizontalScroller:hasVerticalScroller:borderType:"), function $CPScrollView__contentSizeForFrameSize_hasHorizontalScroller_hasVerticalScroller_borderType_(self, _cmd, frameSize, hFlag, vFlag, borderType)
{
    var bounds = objj_msgSend(self, "_insetBounds:borderType:", CGRectMake(0.0, 0.0, frameSize.width, frameSize.height), borderType),
        scrollerWidth = objj_msgSend(CPScroller, "scrollerWidth");
    if (hFlag)
        bounds.size.height -= scrollerWidth;
    if (vFlag)
        bounds.size.width -= scrollerWidth;
    return bounds.size;
}
,["CGSize","CGSize","BOOL","BOOL","CPBorderType"]), new objj_method(sel_getUid("frameSizeForContentSize:hasHorizontalScroller:hasVerticalScroller:borderType:"), function $CPScrollView__frameSizeForContentSize_hasHorizontalScroller_hasVerticalScroller_borderType_(self, _cmd, contentSize, hFlag, vFlag, borderType)
{
    var bounds = objj_msgSend(self, "_insetBounds:borderType:", CGRectMake(0.0, 0.0, contentSize.width, contentSize.height), borderType),
        widthInset = contentSize.width - bounds.size.width,
        heightInset = contentSize.height - bounds.size.height,
        frameSize = CGSizeMake(contentSize.width + widthInset, contentSize.height + heightInset),
        scrollerWidth = objj_msgSend(CPScroller, "scrollerWidth");
    if (hFlag)
        frameSize.height += scrollerWidth;
    if (vFlag)
        frameSize.width += scrollerWidth;
    return frameSize;
}
,["CGSize","CGSize","BOOL","BOOL","CPBorderType"]), new objj_method(sel_getUid("_insetBounds:borderType:"), function $CPScrollView___insetBounds_borderType_(self, _cmd, bounds, borderType)
{
    switch(borderType) {
    case CPLineBorder:
    case CPBezelBorder:
        return CGRectInset(bounds, 1.0, 1.0);
    case CPGrooveBorder:
        bounds = CGRectInset(bounds, 2.0, 2.0);
        ++bounds.origin.y;
        --bounds.size.height;
        return bounds;
    case CPNoBorder:
default:
        return bounds;
    }
}
,["CGRect","CGRect","CPBorderType"]), new objj_method(sel_getUid("globalScrollerStyle"), function $CPScrollView__globalScrollerStyle(self, _cmd)
{
    return CPScrollerStyleGlobal;
}
,["int"]), new objj_method(sel_getUid("setGlobalScrollerStyle:"), function $CPScrollView__setGlobalScrollerStyle_(self, _cmd, aStyle)
{
    CPScrollerStyleGlobal = aStyle;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPScrollerStyleGlobalChangeNotification, nil);
}
,["void","int"])]);
}var CPScrollViewContentViewKey = "CPScrollViewContentView",
    CPScrollViewHeaderClipViewKey = "CPScrollViewHeaderClipViewKey",
    CPScrollViewVLineScrollKey = "CPScrollViewVLineScroll",
    CPScrollViewHLineScrollKey = "CPScrollViewHLineScroll",
    CPScrollViewVPageScrollKey = "CPScrollViewVPageScroll",
    CPScrollViewHPageScrollKey = "CPScrollViewHPageScroll",
    CPScrollViewHasVScrollerKey = "CPScrollViewHasVScroller",
    CPScrollViewHasHScrollerKey = "CPScrollViewHasHScroller",
    CPScrollViewVScrollerKey = "CPScrollViewVScroller",
    CPScrollViewHScrollerKey = "CPScrollViewHScroller",
    CPScrollViewAutohidesScrollerKey = "CPScrollViewAutohidesScroller",
    CPScrollViewCornerViewKey = "CPScrollViewCornerViewKey",
    CPScrollViewBottomCornerViewKey = "CPScrollViewBottomCornerViewKey",
    CPScrollViewBorderTypeKey = "CPScrollViewBorderTypeKey",
    CPScrollViewScrollerStyleKey = "CPScrollViewScrollerStyleKey",
    CPScrollViewScrollerKnobStyleKey = "CPScrollViewScrollerKnobStyleKey";
{
var the_class = objj_getClass("CPScrollView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPScrollView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPScrollView__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScrollView").super_class }, "initWithCoder:", aCoder))
    {
        self._verticalLineScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewVLineScrollKey);
        self._verticalPageScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewVPageScrollKey);
        self._horizontalLineScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewHLineScrollKey);
        self._horizontalPageScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewHPageScrollKey);
        self._contentView = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewContentViewKey);
        self._headerClipView = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewHeaderClipViewKey);
        if (!self._headerClipView)
        {
            self._headerClipView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "init");
            objj_msgSend(self, "addSubview:", self._headerClipView);
        }
        self._verticalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewVScrollerKey);
        self._horizontalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewHScrollerKey);
        self._hasVerticalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewHasVScrollerKey);
        self._hasHorizontalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewHasHScrollerKey);
        self._autohidesScrollers = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewAutohidesScrollerKey);
        self._borderType = objj_msgSend(aCoder, "decodeIntForKey:", CPScrollViewBorderTypeKey);
        self._cornerView = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewCornerViewKey);
        self._bottomCornerView = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewBottomCornerViewKey);
        self._delegate = nil;
        self._scrollTimer = nil;
        self._implementedDelegateMethods = 0;
        self._scrollerStyle = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewScrollerStyleKey) || CPScrollerStyleGlobal;
        self._scrollerKnobStyle = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewScrollerKnobStyleKey) || CPScrollerKnobStyleDefault;
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_didReceiveDefaultStyleChange:"), CPScrollerStyleGlobalChangeNotification, nil);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("awakeFromCib"), function $CPScrollView__awakeFromCib(self, _cmd)
{
    objj_msgSend(self, "_updateScrollerStyle");
    objj_msgSend(self, "_updateCornerAndHeaderView");
}
,["void"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPScrollView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScrollView").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._contentView, CPScrollViewContentViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._headerClipView, CPScrollViewHeaderClipViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._verticalScroller, CPScrollViewVScrollerKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._horizontalScroller, CPScrollViewHScrollerKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._verticalLineScroll, CPScrollViewVLineScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._verticalPageScroll, CPScrollViewVPageScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._horizontalLineScroll, CPScrollViewHLineScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", self._horizontalPageScroll, CPScrollViewHPageScrollKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._hasVerticalScroller, CPScrollViewHasVScrollerKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._hasHorizontalScroller, CPScrollViewHasHScrollerKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._autohidesScrollers, CPScrollViewAutohidesScrollerKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._cornerView, CPScrollViewCornerViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._bottomCornerView, CPScrollViewBottomCornerViewKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._borderType, CPScrollViewBorderTypeKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._scrollerStyle, CPScrollViewScrollerStyleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._scrollerKnobStyle, CPScrollViewScrollerKnobStyleKey);
}
,["void","CPCoder"])]);
}