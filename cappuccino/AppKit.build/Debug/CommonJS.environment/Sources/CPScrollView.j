@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;7;CPBox.ji;12;CPClipView.ji;12;CPScroller.ji;8;CPView.jt;63419;objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("CPBox.j", YES);objj_executeFile("CPClipView.j", YES);objj_executeFile("CPScroller.j", YES);objj_executeFile("CPView.j", YES);var _isBrowserUsingOverlayScrollers = function()
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
        self._contentView = ((___r1 = CPClipView.isa.objj_msgSend0(CPClipView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", (self == null ? null : self.isa.objj_msgSend0(self, "_insetBounds"))));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._contentView));
        self._headerClipView = ((___r1 = CPClipView.isa.objj_msgSend0(CPClipView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._headerClipView));
        self._bottomCornerView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._bottomCornerView));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHasVerticalScroller:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHasHorizontalScroller:", YES));
        self._scrollerKnobStyle = CPScrollerKnobStyleDefault;
        (self == null ? null : self.isa.objj_msgSend1(self, "setScrollerStyle:", CPScrollerStyleGlobal));
        self._delegate = nil;
        self._scrollTimer = nil;
        self._implementedDelegateMethods = 0;
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_didReceiveDefaultStyleChange:"), CPScrollerStyleGlobalChangeNotification, nil));
    }
    return self;
    var ___r1;
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
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("scrollViewWillScroll:"))))
        self._implementedDelegateMethods |= CPScrollViewDelegate_scrollViewWillScroll_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("scrollViewDidScroll:"))))
        self._implementedDelegateMethods |= CPScrollViewDelegate_scrollViewDidScroll_;
    var ___r1;
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
    self.isa.objj_msgSend0(self, "_updateScrollerStyle");
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
    self.isa.objj_msgSend0(self, "_updateScrollerStyle");
}
,["void","int"]), new objj_method(sel_getUid("contentView"), function $CPScrollView__contentView(self, _cmd)
{
    return self._contentView;
}
,["CPClipView"]), new objj_method(sel_getUid("setContentView:"), function $CPScrollView__setContentView_(self, _cmd, aContentView)
{
    if (self._contentView === aContentView || !aContentView)
        return;
    var documentView = (aContentView == null ? null : aContentView.isa.objj_msgSend0(aContentView, "documentView"));
    if (documentView)
        (documentView == null ? null : documentView.isa.objj_msgSend0(documentView, "removeFromSuperview"));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    self._contentView = aContentView;
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", documentView));
    self.isa.objj_msgSend1(self, "addSubview:", self._contentView);
    self.isa.objj_msgSend1(self, "reflectScrolledClipView:", self._contentView);
    var ___r1;
}
,["void","CPClipView"]), new objj_method(sel_getUid("contentSize"), function $CPScrollView__contentSize(self, _cmd)
{
    return ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size;
    var ___r1;
}
,["CGSize"]), new objj_method(sel_getUid("documentView"), function $CPScrollView__documentView(self, _cmd)
{
    return ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "documentView"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("setDocumentView:"), function $CPScrollView__setDocumentView_(self, _cmd, aView)
{
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", aView));
    self.isa.objj_msgSend0(self, "_updateCornerAndHeaderView");
    self.isa.objj_msgSend1(self, "reflectScrolledClipView:", self._contentView);
    var ___r1;
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
    self.isa.objj_msgSend1(self, "reflectScrolledClipView:", self._contentView);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}
,["void","CPBorderType"]), new objj_method(sel_getUid("horizontalScroller"), function $CPScrollView__horizontalScroller(self, _cmd)
{
    return self._horizontalScroller;
}
,["CPScroller"]), new objj_method(sel_getUid("setHorizontalScroller:"), function $CPScrollView__setHorizontalScroller_(self, _cmd, aScroller)
{
    if (self._horizontalScroller === aScroller)
        return;
    ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", nil));
    ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", nil));
    self._horizontalScroller = aScroller;
    ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("_horizontalScrollerDidScroll:")));
    self.isa.objj_msgSend1(self, "addSubview:", self._horizontalScroller);
    self.isa.objj_msgSend0(self, "_updateScrollerStyle");
    var ___r1;
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
        var bounds = self.isa.objj_msgSend0(self, "_insetBounds");
        self.isa.objj_msgSend1(self, "setHorizontalScroller:", ((___r1 = CPScroller.isa.objj_msgSend0(CPScroller, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, MAX(CGRectGetWidth(bounds), CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle) + 1), CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle)))));
        ((___r1 = self.isa.objj_msgSend0(self, "horizontalScroller")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(CGRectGetWidth(bounds), CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle))));
    }
    self.isa.objj_msgSend1(self, "reflectScrolledClipView:", self._contentView);
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("verticalScroller"), function $CPScrollView__verticalScroller(self, _cmd)
{
    return self._verticalScroller;
}
,["CPScroller"]), new objj_method(sel_getUid("setVerticalScroller:"), function $CPScrollView__setVerticalScroller_(self, _cmd, aScroller)
{
    if (self._verticalScroller === aScroller)
        return;
    ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", nil));
    ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", nil));
    self._verticalScroller = aScroller;
    ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("_verticalScrollerDidScroll:")));
    self.isa.objj_msgSend1(self, "addSubview:", self._verticalScroller);
    self.isa.objj_msgSend0(self, "_updateScrollerStyle");
    var ___r1;
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
        var bounds = self.isa.objj_msgSend0(self, "_insetBounds");
        self.isa.objj_msgSend1(self, "setVerticalScroller:", ((___r1 = CPScroller.isa.objj_msgSend0(CPScroller, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle), MAX(CGRectGetHeight(bounds), CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle) + 1)))));
        ((___r1 = self.isa.objj_msgSend0(self, "verticalScroller")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle), CGRectGetHeight(bounds))));
    }
    self.isa.objj_msgSend1(self, "reflectScrolledClipView:", self._contentView);
    var ___r1;
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
    self.isa.objj_msgSend1(self, "reflectScrolledClipView:", self._contentView);
}
,["void","BOOL"]), new objj_method(sel_getUid("bottomCornerView"), function $CPScrollView__bottomCornerView(self, _cmd)
{
    return self._bottomCornerView;
}
,["CPView"]), new objj_method(sel_getUid("setBottomCornerView:"), function $CPScrollView__setBottomCornerView_(self, _cmd, aBottomCornerView)
{
    if (self._bottomCornerView === aBottomCornerView)
        return;
    ((___r1 = self._bottomCornerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    (aBottomCornerView == null ? null : aBottomCornerView.isa.objj_msgSend1(aBottomCornerView, "setFrame:", self.isa.objj_msgSend0(self, "_bottomCornerViewFrame")));
    self.isa.objj_msgSend1(self, "addSubview:", aBottomCornerView);
    self._bottomCornerView = aBottomCornerView;
    self.isa.objj_msgSend0(self, "_updateCornerAndHeaderView");
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("lineScroll"), function $CPScrollView__lineScroll(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "horizontalLineScroll");
}
,["float"]), new objj_method(sel_getUid("setLineScroll:"), function $CPScrollView__setLineScroll_(self, _cmd, aLineScroll)
{
    self.isa.objj_msgSend1(self, "setHorizontalLineScroll:", aLineScroll);
    self.isa.objj_msgSend1(self, "setVerticalLineScroll:", aLineScroll);
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
    return self.isa.objj_msgSend0(self, "horizontalPageScroll");
}
,["float"]), new objj_method(sel_getUid("setPageScroll:"), function $CPScrollView__setPageScroll_(self, _cmd, aPageScroll)
{
    self.isa.objj_msgSend1(self, "setHorizontalPageScroll:", aPageScroll);
    self.isa.objj_msgSend1(self, "setVerticalPageScroll:", aPageScroll);
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
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStyle:", self._scrollerStyle));
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateSelected));
        switch(self._scrollerKnobStyle) {
        case CPScrollerKnobStyleLight:
            ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateScrollerKnobDark));
            ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setThemeState:", CPThemeStateScrollerKnobLight));
            break;
        case CPScrollerKnobStyleDark:
            ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateScrollerKnobLight));
            ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setThemeState:", CPThemeStateScrollerKnobDark));
            break;
default:
            ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateScrollerKnobLight));
            ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateScrollerKnobDark));
        }
    }
    if (self._hasVerticalScroller)
    {
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStyle:", self._scrollerStyle));
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateSelected));
        switch(self._scrollerKnobStyle) {
        case CPScrollerKnobStyleLight:
            ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateScrollerKnobDark));
            ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setThemeState:", CPThemeStateScrollerKnobLight));
            break;
        case CPScrollerKnobStyleDark:
            ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateScrollerKnobLight));
            ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setThemeState:", CPThemeStateScrollerKnobDark));
            break;
default:
            ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateScrollerKnobLight));
            ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "unsetThemeState:", CPThemeStateScrollerKnobDark));
        }
    }
    if (self._scrollerStyle == CPScrollerStyleOverlay)
    {
        if (self._timerScrollersHide)
            ((___r1 = self._timerScrollersHide), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
        self._timerScrollersHide = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", CPScrollViewFadeOutTime, self, sel_getUid("_hideScrollers:"), nil, NO);
        ((___r1 = self.isa.objj_msgSend0(self, "bottomCornerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    }
    else
        ((___r1 = self.isa.objj_msgSend0(self, "bottomCornerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    self.isa.objj_msgSend1(self, "reflectScrolledClipView:", self._contentView);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_insetBounds"), function $CPScrollView___insetBounds(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_insetBounds:borderType:", self.isa.objj_msgSend0(self, "bounds"), self._borderType));
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("_updateCornerAndHeaderView"), function $CPScrollView___updateCornerAndHeaderView(self, _cmd)
{
    var documentView = self.isa.objj_msgSend0(self, "documentView"),
        currentHeaderView = self.isa.objj_msgSend0(self, "_headerView"),
        documentHeaderView = (documentView == null ? null : documentView.isa.objj_msgSend1(documentView, "respondsToSelector:", sel_getUid("headerView"))) ? (documentView == null ? null : documentView.isa.objj_msgSend0(documentView, "headerView")) : nil;
    if (currentHeaderView !== documentHeaderView)
    {
        (currentHeaderView == null ? null : currentHeaderView.isa.objj_msgSend0(currentHeaderView, "removeFromSuperview"));
        ((___r1 = self._headerClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", documentHeaderView));
    }
    var documentCornerView = (documentView == null ? null : documentView.isa.objj_msgSend1(documentView, "respondsToSelector:", sel_getUid("cornerView"))) ? (documentView == null ? null : documentView.isa.objj_msgSend0(documentView, "cornerView")) : nil;
    if (self._cornerView !== documentCornerView)
    {
        ((___r1 = self._cornerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self._cornerView = documentCornerView;
        if (self._cornerView)
        {
            ((___r1 = self._cornerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", !(self._scrollerStyle === CPScrollerStyleLegacy && self._verticalScroller && !((___r2 = self._verticalScroller), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "isHidden")))));
            self.isa.objj_msgSend1(self, "addSubview:", self._cornerView);
        }
    }
    self.isa.objj_msgSend1(self, "reflectScrolledClipView:", self._contentView);
    (documentHeaderView == null ? null : documentHeaderView.isa.objj_msgSend0(documentHeaderView, "setNeedsLayout"));
    (documentHeaderView == null ? null : documentHeaderView.isa.objj_msgSend1(documentHeaderView, "setNeedsDisplay:", YES));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_headerView"), function $CPScrollView___headerView(self, _cmd)
{
    return ((___r1 = self._headerClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "documentView"));
    var ___r1;
}
,["CPView"]), new objj_method(sel_getUid("_cornerViewFrame"), function $CPScrollView___cornerViewFrame(self, _cmd)
{
    if (!self._cornerView)
        return CGRectMakeZero();
    var bounds = self.isa.objj_msgSend0(self, "_insetBounds"),
        frame = ((___r1 = self._cornerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    frame.origin.x = CGRectGetMaxX(bounds) - CGRectGetWidth(frame);
    frame.origin.y = CGRectGetMinY(bounds);
    return frame;
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("_headerClipViewFrame"), function $CPScrollView___headerClipViewFrame(self, _cmd)
{
    var headerView = self.isa.objj_msgSend0(self, "_headerView");
    if (!headerView)
        return CGRectMakeZero();
    var frame = self.isa.objj_msgSend0(self, "_insetBounds");
    frame.size.height = CGRectGetHeight((headerView == null ? null : headerView.isa.objj_msgSend0(headerView, "frame")));
    if (self._scrollerStyle === CPScrollerStyleLegacy && self._verticalScroller && !((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        frame.size.width -= CGRectGetWidth(self.isa.objj_msgSend0(self, "_cornerViewFrame"));
    return frame;
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("_bottomCornerViewFrame"), function $CPScrollView___bottomCornerViewFrame(self, _cmd)
{
    if (((___r1 = self.isa.objj_msgSend0(self, "horizontalScroller")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")) || ((___r1 = self.isa.objj_msgSend0(self, "verticalScroller")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        return CGRectMakeZero();
    var verticalFrame = ((___r1 = self.isa.objj_msgSend0(self, "verticalScroller")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        bottomCornerFrame = CGRectMakeZero();
    bottomCornerFrame.origin.x = CGRectGetMinX(verticalFrame);
    bottomCornerFrame.origin.y = CGRectGetMaxY(verticalFrame);
    bottomCornerFrame.size.width = CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle);
    bottomCornerFrame.size.height = CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", self._scrollerStyle);
    return bottomCornerFrame;
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("_verticalScrollerDidScroll:"), function $CPScrollView___verticalScrollerDidScroll_(self, _cmd, aScroller)
{
    var value = (aScroller == null ? null : aScroller.isa.objj_msgSend0(aScroller, "floatValue")),
        documentFrame = ((___r1 = ((___r2 = self._contentView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "documentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        contentBounds = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds"));
    switch(((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "hitPart"))) {
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
    self.isa.objj_msgSend0(self, "_sendDelegateMessages");
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", contentBounds.origin));
    var ___r1, ___r2;
}
,["void","CPScroller"]), new objj_method(sel_getUid("_horizontalScrollerDidScroll:"), function $CPScrollView___horizontalScrollerDidScroll_(self, _cmd, aScroller)
{
    var value = (aScroller == null ? null : aScroller.isa.objj_msgSend0(aScroller, "floatValue")),
        documentFrame = ((___r1 = self.isa.objj_msgSend0(self, "documentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        contentBounds = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds"));
    switch(((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "hitPart"))) {
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
    self.isa.objj_msgSend0(self, "_sendDelegateMessages");
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", contentBounds.origin));
    ((___r1 = self._headerClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", CGPointMake(contentBounds.origin.x, 0.0)));
    var ___r1;
}
,["void","CPScroller"]), new objj_method(sel_getUid("_sendDelegateMessages"), function $CPScrollView___sendDelegateMessages(self, _cmd)
{
    if (self._implementedDelegateMethods == 0)
        return;
    if (!self._scrollTimer)
    {
        self.isa.objj_msgSend0(self, "_scrollViewWillScroll");
        self._scrollTimer = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", TIMER_INTERVAL, self, sel_getUid("_scrollViewDidScroll"), nil, YES);
    }
    else
        ((___r1 = self._scrollTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFireDate:", CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceNow:", TIMER_INTERVAL)));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_hideScrollers:"), function $CPScrollView___hideScrollers_(self, _cmd, theTimer)
{
    if (((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allowFadingOut")))
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "fadeOut"));
    if (((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allowFadingOut")))
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "fadeOut"));
    self._timerScrollersHide = nil;
    var ___r1;
}
,["void","CPTimer"]), new objj_method(sel_getUid("_respondToScrollWheelEventWithDeltaX:deltaY:"), function $CPScrollView___respondToScrollWheelEventWithDeltaX_deltaY_(self, _cmd, deltaX, deltaY)
{
    var documentFrame = ((___r1 = self.isa.objj_msgSend0(self, "documentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        contentBounds = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")),
        contentFrame = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        enclosingScrollView = self.isa.objj_msgSend0(self, "enclosingScrollView");
    contentBounds.origin.x = ROUND(contentBounds.origin.x + deltaX);
    contentBounds.origin.y = ROUND(contentBounds.origin.y + deltaY);
    var constrainedOrigin = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "constrainScrollPoint:", CGPointCreateCopy(contentBounds.origin))),
        extraX = contentBounds.origin.x - constrainedOrigin.x,
        extraY = contentBounds.origin.y - constrainedOrigin.y;
    self.isa.objj_msgSend0(self, "_sendDelegateMessages");
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", constrainedOrigin));
    ((___r1 = self._headerClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", CGPointMake(constrainedOrigin.x, 0.0)));
    if (extraX || extraY)
        (enclosingScrollView == null ? null : enclosingScrollView.isa.objj_msgSend2(enclosingScrollView, "_respondToScrollWheelEventWithDeltaX:deltaY:", extraX, extraY));
    var ___r1;
}
,["void","float","float"]), new objj_method(sel_getUid("_scrollViewWillScroll"), function $CPScrollView___scrollViewWillScroll(self, _cmd)
{
    if (self._implementedDelegateMethods & CPScrollViewDelegate_scrollViewWillScroll_)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollViewWillScroll:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_scrollViewDidScroll"), function $CPScrollView___scrollViewDidScroll(self, _cmd)
{
    ((___r1 = self._scrollTimer), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    self._scrollTimer = nil;
    if (self._implementedDelegateMethods & CPScrollViewDelegate_scrollViewDidScroll_)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollViewDidScroll:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_didReceiveDefaultStyleChange:"), function $CPScrollView___didReceiveDefaultStyleChange_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend1(self, "setScrollerStyle:", CPScrollerStyleGlobal);
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
    var documentView = self.isa.objj_msgSend0(self, "documentView");
    if (!documentView)
    {
        if (self._autohidesScrollers)
        {
            ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
            ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
        }
        ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend0(self, "_insetBounds")));
        ((___r1 = self._headerClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMakeZero()));
        --self._recursionCount;
        return;
    }
    var documentFrame = (documentView == null ? null : documentView.isa.objj_msgSend0(documentView, "frame")),
        contentFrame = self.isa.objj_msgSend0(self, "_insetBounds"),
        headerClipViewFrame = self.isa.objj_msgSend0(self, "_headerClipViewFrame"),
        headerClipViewHeight = CGRectGetHeight(headerClipViewFrame);
    contentFrame.origin.y += headerClipViewHeight;
    contentFrame.size.height -= headerClipViewHeight;
    var difference = CGSizeMake(CGRectGetWidth(documentFrame) - CGRectGetWidth(contentFrame), CGRectGetHeight(documentFrame) - CGRectGetHeight(contentFrame)),
        verticalScrollerWidth = CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "style"))),
        horizontalScrollerHeight = CPScroller.isa.objj_msgSend1(CPScroller, "scrollerWidthInStyle:", ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "style"))),
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
    ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", !shouldShowVerticalScroller));
    ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", hasVerticalScroll));
    ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", !shouldShowHorizontalScroller));
    ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", hasHorizontalScroll));
    var overlay = CPScroller.isa.objj_msgSend0(CPScroller, "scrollerOverlay");
    if (self._scrollerStyle === CPScrollerStyleLegacy)
    {
        if (shouldShowVerticalScroller)
            contentFrame.size.width -= verticalScrollerWidth;
        if (shouldShowHorizontalScroller)
            contentFrame.size.height -= horizontalScrollerHeight;
        overlay = 0;
    }
    var scrollPoint = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")).origin,
        wasShowingVerticalScroller = !((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")),
        wasShowingHorizontalScroller = !((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden"));
    if (shouldShowVerticalScroller)
    {
        var verticalScrollerY = MAX(CGRectGetMinY(contentFrame), MAX(CGRectGetMaxY(self.isa.objj_msgSend0(self, "_cornerViewFrame")), CGRectGetMaxY(headerClipViewFrame)));
        var verticalScrollerHeight = CGRectGetMaxY(contentFrame) - verticalScrollerY;
        if (self._scrollerStyle === CPScrollerStyleOverlay && hasHorizontalScroll)
            verticalScrollerHeight -= horizontalScrollerHeight;
        var documentHeight = CGRectGetHeight(documentFrame);
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", difference.height <= 0.0 ? 0.0 : scrollPoint.y / difference.height));
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setKnobProportion:", documentHeight > 0 ? CGRectGetHeight(contentFrame) / documentHeight : 1.0));
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(CGRectGetMaxX(contentFrame) - overlay, verticalScrollerY, verticalScrollerWidth, verticalScrollerHeight)));
    }
    else if (wasShowingVerticalScroller)
    {
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", 0.0));
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setKnobProportion:", 1.0));
    }
    if (shouldShowHorizontalScroller)
    {
        var horizontalScrollerWidth = CGRectGetWidth(contentFrame);
        if (self._scrollerStyle === CPScrollerStyleOverlay && hasVerticalScroll)
            horizontalScrollerWidth -= verticalScrollerWidth;
        var documentWidth = CGRectGetWidth(documentFrame);
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", difference.width <= 0.0 ? 0.0 : scrollPoint.x / difference.width));
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setKnobProportion:", documentWidth > 0 ? CGRectGetWidth(contentFrame) / documentWidth : 1.0));
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(CGRectGetMinX(contentFrame), CGRectGetMaxY(contentFrame) - overlay, horizontalScrollerWidth, horizontalScrollerHeight)));
    }
    else if (wasShowingHorizontalScroller)
    {
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", 0.0));
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setKnobProportion:", 1.0));
    }
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", contentFrame));
    ((___r1 = self._headerClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend0(self, "_headerClipViewFrame")));
    ((___r1 = ((___r2 = self._headerClipView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "documentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    if (self._scrollerStyle === CPScrollerStyleLegacy && self._verticalScroller && !((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
    {
        ((___r1 = self._cornerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend0(self, "_cornerViewFrame")));
        ((___r1 = self._cornerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    }
    else
        ((___r1 = self._cornerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    if (self._scrollerStyle === CPScrollerStyleLegacy)
    {
        ((___r1 = self.isa.objj_msgSend0(self, "bottomCornerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend0(self, "_bottomCornerViewFrame")));
        ((___r1 = self.isa.objj_msgSend0(self, "bottomCornerView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "bottom-corner-color")));
    }
    --self._recursionCount;
    var ___r1, ___r2;
}
,["void","CPClipView"]), new objj_method(sel_getUid("flashScrollers"), function $CPScrollView__flashScrollers(self, _cmd)
{
    if (self._scrollerStyle === CPScrollerStyleLegacy)
        return;
    if (self._hasHorizontalScroller)
    {
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "fadeIn"));
    }
    if (self._hasVerticalScroller)
    {
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "fadeIn"));
    }
    if (self._timerScrollersHide)
        ((___r1 = self._timerScrollersHide), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    self._timerScrollersHide = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", CPScrollViewFadeOutTime, self, sel_getUid("_hideScrollers:"), nil, NO);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPScrollView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
    self.isa.objj_msgSend1(self, "reflectScrolledClipView:", self._contentView);
}
,["void","CGSize"]), new objj_method(sel_getUid("documentVisibleRect"), function $CPScrollView__documentVisibleRect(self, _cmd)
{
    return ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "documentVisibleRect"));
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("drawRect:"), function $CPScrollView__drawRect_(self, _cmd, aRect)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScrollView").super_class }, "drawRect:", aRect);
    if (self._borderType == CPNoBorder)
        return;
    var strokeRect = self.isa.objj_msgSend0(self, "bounds"),
        context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextSetLineWidth(context, 1);
    switch(self._borderType) {
    case CPLineBorder:
        CGContextSetStrokeColor(context, self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "border-color"));
        CGContextStrokeRect(context, CGRectInset(strokeRect, 0.5, 0.5));
        break;
    case CPBezelBorder:
        self.isa.objj_msgSend2(self, "_drawGrayBezelInContext:bounds:", context, strokeRect);
        break;
    case CPGrooveBorder:
        self.isa.objj_msgSend2(self, "_drawGrooveInContext:bounds:", context, strokeRect);
        break;
default:
        break;
    }
    var ___r1;
}
,["void","CGRect"]), new objj_method(sel_getUid("_drawGrayBezelInContext:bounds:"), function $CPScrollView___drawGrayBezelInContext_bounds_(self, _cmd, context, aRect)
{
    var minX = CGRectGetMinX(aRect),
        maxX = CGRectGetMaxX(aRect),
        minY = CGRectGetMinY(aRect),
        maxY = CGRectGetMaxY(aRect),
        y = minY + 0.5;
    CGContextSetStrokeColor(context, CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 142.0 / 255.0, 1.0));
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, minX, y);
    CGContextAddLineToPoint(context, maxX, y);
    CGContextStrokePath(context);
    CGContextSetStrokeColor(context, CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 192.0 / 255.0, 1.0));
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
    CGContextSetStrokeColor(context, CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 159.0 / 255.0, 1.0));
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
    CGContextSetStrokeColor(context, CPColor.isa.objj_msgSend0(CPColor, "whiteColor"));
    var rect = CGRectOffset(aRect, 1.0, 1.0);
    rect.size.width -= 1.0;
    rect.size.height -= 1.0;
    CGContextStrokeRect(context, CGRectInset(rect, 0.5, 0.5));
    CGContextBeginPath(context);
    CGContextSetStrokeColor(context, CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 192.0 / 255.0, 1.0));
    y = minY + 2.5;
    CGContextMoveToPoint(context, minX + 2.0, y);
    CGContextAddLineToPoint(context, maxX - 2.0, y);
    CGContextStrokePath(context);
}
,["void","CGContext","CGRect"]), new objj_method(sel_getUid("scrollWheel:"), function $CPScrollView__scrollWheel_(self, _cmd, anEvent)
{
    if (self._timerScrollersHide)
        ((___r1 = self._timerScrollersHide), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "invalidate"));
    if (!((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        ((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "fadeIn"));
    if (!((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        ((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "fadeIn"));
    if (!((___r1 = self._horizontalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")) || !((___r1 = self._verticalScroller), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        self._timerScrollersHide = CPTimer.isa.objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", CPScrollViewFadeOutTime, self, sel_getUid("_hideScrollers:"), nil, NO);
    self.isa.objj_msgSend2(self, "_respondToScrollWheelEventWithDeltaX:deltaY:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "deltaX")), (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "deltaY")));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("scrollPageUp:"), function $CPScrollView__scrollPageUp_(self, _cmd, sender)
{
    var contentBounds = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds"));
    self.isa.objj_msgSend1(self, "moveByOffset:", CGSizeMake(0.0, -(CGRectGetHeight(contentBounds) - self._verticalPageScroll)));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("scrollPageDown:"), function $CPScrollView__scrollPageDown_(self, _cmd, sender)
{
    var contentBounds = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds"));
    self.isa.objj_msgSend1(self, "moveByOffset:", CGSizeMake(0.0, CGRectGetHeight(contentBounds) - self._verticalPageScroll));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("scrollToBeginningOfDocument:"), function $CPScrollView__scrollToBeginningOfDocument_(self, _cmd, sender)
{
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", CGPointMakeZero()));
    ((___r1 = self._headerClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", CGPointMakeZero()));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("scrollToEndOfDocument:"), function $CPScrollView__scrollToEndOfDocument_(self, _cmd, sender)
{
    var contentBounds = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")),
        documentFrame = ((___r1 = self.isa.objj_msgSend0(self, "documentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        scrollPoint = CGPointMake(0.0, CGRectGetHeight(documentFrame) - CGRectGetHeight(contentBounds));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", scrollPoint));
    ((___r1 = self._headerClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", CGPointMakeZero()));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("moveLeft:"), function $CPScrollView__moveLeft_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "moveByOffset:", CGSizeMake(-self._horizontalLineScroll, 0.0));
}
,["void","id"]), new objj_method(sel_getUid("moveRight:"), function $CPScrollView__moveRight_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "moveByOffset:", CGSizeMake(self._horizontalLineScroll, 0.0));
}
,["void","id"]), new objj_method(sel_getUid("moveUp:"), function $CPScrollView__moveUp_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "moveByOffset:", CGSizeMake(0.0, -self._verticalLineScroll));
}
,["void","id"]), new objj_method(sel_getUid("moveDown:"), function $CPScrollView__moveDown_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "moveByOffset:", CGSizeMake(0.0, self._verticalLineScroll));
}
,["void","id"]), new objj_method(sel_getUid("moveByOffset:"), function $CPScrollView__moveByOffset_(self, _cmd, aSize)
{
    var documentFrame = ((___r1 = self.isa.objj_msgSend0(self, "documentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        contentBounds = ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds"));
    contentBounds.origin.x += aSize.width;
    contentBounds.origin.y += aSize.height;
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", contentBounds.origin));
    ((___r1 = self._headerClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollToPoint:", CGPointMake(contentBounds.origin.x, 0)));
    var ___r1;
}
,["void","CGSize"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPScrollView__initialize(self, _cmd)
{
    if (self !== CPScrollView.isa.objj_msgSend0(CPScrollView, "class"))
        return;
    var globalValue = ((___r1 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForInfoDictionaryKey:", "CPScrollersGlobalStyle"));
    if (globalValue === nil || globalValue === -1)
        CPScrollerStyleGlobal = _isBrowserUsingOverlayScrollers() ? CPScrollerStyleOverlay : CPScrollerStyleLegacy;
    else
        CPScrollerStyleGlobal = globalValue;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("defaultThemeClass"), function $CPScrollView__defaultThemeClass(self, _cmd)
{
    return "scrollview";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPScrollView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), "bottom-corner-color", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "border-color");
}
,["CPDictionary"]), new objj_method(sel_getUid("contentSizeForFrameSize:hasHorizontalScroller:hasVerticalScroller:borderType:"), function $CPScrollView__contentSizeForFrameSize_hasHorizontalScroller_hasVerticalScroller_borderType_(self, _cmd, frameSize, hFlag, vFlag, borderType)
{
    var bounds = self.isa.objj_msgSend2(self, "_insetBounds:borderType:", CGRectMake(0.0, 0.0, frameSize.width, frameSize.height), borderType),
        scrollerWidth = CPScroller.isa.objj_msgSend0(CPScroller, "scrollerWidth");
    if (hFlag)
        bounds.size.height -= scrollerWidth;
    if (vFlag)
        bounds.size.width -= scrollerWidth;
    return bounds.size;
}
,["CGSize","CGSize","BOOL","BOOL","CPBorderType"]), new objj_method(sel_getUid("frameSizeForContentSize:hasHorizontalScroller:hasVerticalScroller:borderType:"), function $CPScrollView__frameSizeForContentSize_hasHorizontalScroller_hasVerticalScroller_borderType_(self, _cmd, contentSize, hFlag, vFlag, borderType)
{
    var bounds = self.isa.objj_msgSend2(self, "_insetBounds:borderType:", CGRectMake(0.0, 0.0, contentSize.width, contentSize.height), borderType),
        widthInset = contentSize.width - bounds.size.width,
        heightInset = contentSize.height - bounds.size.height,
        frameSize = CGSizeMake(contentSize.width + widthInset, contentSize.height + heightInset),
        scrollerWidth = CPScroller.isa.objj_msgSend0(CPScroller, "scrollerWidth");
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
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPScrollerStyleGlobalChangeNotification, nil));
    var ___r1;
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
        self._verticalLineScroll = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPScrollViewVLineScrollKey));
        self._verticalPageScroll = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPScrollViewVPageScrollKey));
        self._horizontalLineScroll = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPScrollViewHLineScrollKey));
        self._horizontalPageScroll = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeFloatForKey:", CPScrollViewHPageScrollKey));
        self._contentView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPScrollViewContentViewKey));
        self._headerClipView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPScrollViewHeaderClipViewKey));
        if (!self._headerClipView)
        {
            self._headerClipView = ((___r1 = CPClipView.isa.objj_msgSend0(CPClipView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
            (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._headerClipView));
        }
        self._verticalScroller = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPScrollViewVScrollerKey));
        self._horizontalScroller = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPScrollViewHScrollerKey));
        self._hasVerticalScroller = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPScrollViewHasVScrollerKey));
        self._hasHorizontalScroller = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPScrollViewHasHScrollerKey));
        self._autohidesScrollers = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPScrollViewAutohidesScrollerKey));
        self._borderType = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPScrollViewBorderTypeKey));
        self._cornerView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPScrollViewCornerViewKey));
        self._bottomCornerView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPScrollViewBottomCornerViewKey));
        self._delegate = nil;
        self._scrollTimer = nil;
        self._implementedDelegateMethods = 0;
        self._scrollerStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPScrollViewScrollerStyleKey)) || CPScrollerStyleGlobal;
        self._scrollerKnobStyle = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPScrollViewScrollerKnobStyleKey)) || CPScrollerKnobStyleDefault;
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:selector:name:object:", self, sel_getUid("_didReceiveDefaultStyleChange:"), CPScrollerStyleGlobalChangeNotification, nil));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("awakeFromCib"), function $CPScrollView__awakeFromCib(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_updateScrollerStyle");
    self.isa.objj_msgSend0(self, "_updateCornerAndHeaderView");
}
,["void"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPScrollView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPScrollView").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._contentView, CPScrollViewContentViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._headerClipView, CPScrollViewHeaderClipViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._verticalScroller, CPScrollViewVScrollerKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._horizontalScroller, CPScrollViewHScrollerKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._verticalLineScroll, CPScrollViewVLineScrollKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._verticalPageScroll, CPScrollViewVPageScrollKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._horizontalLineScroll, CPScrollViewHLineScrollKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeFloat:forKey:", self._horizontalPageScroll, CPScrollViewHPageScrollKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._hasVerticalScroller, CPScrollViewHasVScrollerKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._hasHorizontalScroller, CPScrollViewHasHScrollerKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._autohidesScrollers, CPScrollViewAutohidesScrollerKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._cornerView, CPScrollViewCornerViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._bottomCornerView, CPScrollViewBottomCornerViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._borderType, CPScrollViewBorderTypeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._scrollerStyle, CPScrollViewScrollerStyleKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._scrollerKnobStyle, CPScrollViewScrollerKnobStyleKey));
}
,["void","CPCoder"])]);
}