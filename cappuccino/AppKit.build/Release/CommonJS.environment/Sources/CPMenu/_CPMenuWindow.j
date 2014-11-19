@STATIC;1.0;i;12;CPClipView.ji;13;CPImageView.ji;10;CPWindow.ji;16;_CPMenuManager.jt;28849;objj_executeFile("CPClipView.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPWindow.j", YES);objj_executeFile("_CPMenuManager.j", YES);var _CPMenuWindowPool = [],
    _CPMenuWindowPoolCapacity = 5,
    _CPMenuWindowBackgroundColors = [];
_CPMenuWindowMenuBarBackgroundStyle = 0;
_CPMenuWindowPopUpBackgroundStyle = 1;
_CPMenuWindowAttachedMenuBackgroundStyle = 2;
{var the_class = objj_allocateClassPair(CPWindow, "_CPMenuWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuView"), new objj_ivar("_menuClipView"), new objj_ivar("_moreAboveView"), new objj_ivar("_moreBelowView"), new objj_ivar("_unconstrainedFrame"), new objj_ivar("_constraintRect")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function $_CPMenuWindow__initWithContentRect_styleMask_(self, _cmd, aRect, aStyleMask)
{
    self._constraintRect = CGRectMakeZero();
    self._unconstrainedFrame = CGRectMakeZero();
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuWindow").super_class }, "initWithContentRect:styleMask:", aRect, CPBorderlessWindowMask);
    if (self)
    {
        self._constrainsToUsableScreen = NO;
        (self == null ? null : self.isa.objj_msgSend1(self, "setLevel:", CPPopUpMenuWindowLevel));
        (self == null ? null : self.isa.objj_msgSend1(self, "setHasShadow:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setShadowStyle:", CPMenuWindowShadowStyle));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAcceptsMouseMovedEvents:", YES));
        var contentView = (self == null ? null : self.isa.objj_msgSend0(self, "contentView"));
        self._menuView = ((___r1 = (_CPMenuView == null ? null : _CPMenuView.isa.objj_msgSend0(_CPMenuView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        self._menuClipView = ((___r1 = CPClipView.isa.objj_msgSend0(CPClipView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(((___r2 = self._menuView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForThemeAttribute:", "menu-window-margin-inset")).left, ((___r2 = self._menuView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForThemeAttribute:", "menu-window-margin-inset")).top, 0.0, 0.0)));
        ((___r1 = self._menuClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentView:", self._menuView));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._menuClipView));
        self._moreAboveView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._moreAboveView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._menuView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForThemeAttribute:", "menu-window-more-above-image"))));
        ((___r1 = self._moreAboveView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", ((___r2 = ((___r3 = self._menuView), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "valueForThemeAttribute:", "menu-window-more-above-image"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "size"))));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._moreAboveView));
        self._moreBelowView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._moreBelowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", ((___r2 = self._menuView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "valueForThemeAttribute:", "menu-window-more-below-image"))));
        ((___r1 = self._moreBelowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", ((___r2 = ((___r3 = self._menuView), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "valueForThemeAttribute:", "menu-window-more-below-image"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "size"))));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._moreBelowView));
    }
    return self;
    var ___r1, ___r2, ___r3;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("setFont:"), function $_CPMenuWindow__setFont_(self, _cmd, aFont)
{
    ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", aFont));
    var ___r1;
}
,["void","CPFont"]), new objj_method(sel_getUid("font"), function $_CPMenuWindow__font(self, _cmd)
{
    return ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "font"));
    var ___r1;
}
,["CPFont"]), new objj_method(sel_getUid("setBackgroundStyle:"), function $_CPMenuWindow__setBackgroundStyle_(self, _cmd, aBackgroundStyle)
{
    self.isa.objj_msgSend1(self, "setBackgroundColor:", ((___r1 = self.isa.objj_msgSend0(self, "class")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "backgroundColorForBackgroundStyle:", aBackgroundStyle)));
    var ___r1;
}
,["void","_CPMenuWindowBackgroundStyle"]), new objj_method(sel_getUid("setMenu:"), function $_CPMenuWindow__setMenu_(self, _cmd, aMenu)
{
    (aMenu == null ? null : aMenu.isa.objj_msgSend1(aMenu, "_setMenuWindow:", self));
    ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMenu:", aMenu));
    var menuViewSize = ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size,
        marginInset = ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "menu-window-margin-inset"));
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(marginInset.left + menuViewSize.width + marginInset.right, marginInset.top + menuViewSize.height + marginInset.bottom));
    ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollPoint:", CGPointMake(0.0, 0.0)));
    ((___r1 = self._menuClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(marginInset.left, marginInset.top, menuViewSize.width, menuViewSize.height)));
    var ___r1;
}
,["void","CPMenu"]), new objj_method(sel_getUid("setMinWidth:"), function $_CPMenuWindow__setMinWidth_(self, _cmd, aWidth)
{
    var size = self.isa.objj_msgSend0(self, "unconstrainedFrame").size;
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(MAX(size.width, aWidth), size.height));
}
,["void","float"]), new objj_method(sel_getUid("menu"), function $_CPMenuWindow__menu(self, _cmd)
{
    return ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "menu"));
    var ___r1;
}
,["CPMenu"]), new objj_method(sel_getUid("_menuView"), function $_CPMenuWindow___menuView(self, _cmd)
{
    return self._menuView;
}
,["_CPMenuView"]), new objj_method(sel_getUid("orderFront:"), function $_CPMenuWindow__orderFront_(self, _cmd, aSender)
{
    ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "update"));
    self.isa.objj_msgSend1(self, "setFrame:", self._unconstrainedFrame);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuWindow").super_class }, "orderFront:", aSender);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setConstraintRect:"), function $_CPMenuWindow__setConstraintRect_(self, _cmd, aRect)
{
    self._constraintRect = aRect;
    self.isa.objj_msgSend1(self, "setFrame:", self._unconstrainedFrame);
}
,["void","CGRect"]), new objj_method(sel_getUid("unconstrainedFrame"), function $_CPMenuWindow__unconstrainedFrame(self, _cmd)
{
    return CGRectMakeCopy(self._unconstrainedFrame);
}
,["CGRect"]), new objj_method(sel_getUid("setFrameOrigin:"), function $_CPMenuWindow__setFrameOrigin_(self, _cmd, aPoint)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuWindow").super_class }, "setFrame:", CGRectMake(aPoint.x, aPoint.y, CGRectGetWidth(self._unconstrainedFrame), CGRectGetHeight(self._unconstrainedFrame)));
}
,["void","CGPoint"]), new objj_method(sel_getUid("setFrameSize:"), function $_CPMenuWindow__setFrameSize_(self, _cmd, aSize)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuWindow").super_class }, "setFrame:", CGRectMake(CGRectGetMinX(self._unconstrainedFrame), CGRectGetMinY(self._unconstrainedFrame), aSize.width, aSize.height));
}
,["void","CGSize"]), new objj_method(sel_getUid("setFrame:display:animate:"), function $_CPMenuWindow__setFrame_display_animate_(self, _cmd, aFrame, shouldDisplay, shouldAnimate)
{
    self._unconstrainedFrame = CGRectMakeCopy(aFrame);
    var constrainedFrame = CGRectIntersection(self._unconstrainedFrame, self._constraintRect),
        marginInset = ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "menu-window-margin-inset")),
        scrollIndicatorHeight = ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "menu-window-scroll-indicator-height"));
    constrainedFrame.origin.x = CGRectGetMinX(self._unconstrainedFrame);
    constrainedFrame.size.width = CGRectGetWidth(self._unconstrainedFrame);
    if (CGRectGetWidth(constrainedFrame) > CGRectGetWidth(self._constraintRect))
        constrainedFrame.size.width = CGRectGetWidth(self._constraintRect);
    if (CGRectGetMaxX(constrainedFrame) > CGRectGetMaxX(self._constraintRect))
        constrainedFrame.origin.x -= CGRectGetMaxX(constrainedFrame) - CGRectGetMaxX(self._constraintRect);
    if (CGRectGetMinX(constrainedFrame) < CGRectGetMinX(self._constraintRect))
        constrainedFrame.origin.x = CGRectGetMinX(self._constraintRect);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuWindow").super_class }, "setFrame:display:animate:", constrainedFrame, shouldDisplay, shouldAnimate);
    var menuViewOrigin = CGPointMake(CGRectGetMinX(aFrame) + marginInset.left, CGRectGetMinY(aFrame) + marginInset.top),
        moreAbove = menuViewOrigin.y < CGRectGetMinY(constrainedFrame) + marginInset.top,
        moreBelow = menuViewOrigin.y + CGRectGetHeight(((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))) > CGRectGetMaxY(constrainedFrame) - marginInset.bottom,
        topMargin = marginInset.top,
        bottomMargin = marginInset.bottom,
        contentView = self.isa.objj_msgSend0(self, "contentView"),
        bounds = (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "bounds"));
    if (moreAbove)
    {
        topMargin += scrollIndicatorHeight;
        var frame = ((___r1 = self._moreAboveView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        ((___r1 = self._moreAboveView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(frame)) / 2.0, (marginInset.top + scrollIndicatorHeight - CGRectGetHeight(frame)) / 2.0)));
    }
    ((___r1 = self._moreAboveView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", !moreAbove));
    if (moreBelow)
    {
        bottomMargin += scrollIndicatorHeight;
        ((___r1 = self._moreBelowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(((___r2 = self._moreBelowView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame")))) / 2.0, CGRectGetHeight(bounds) - scrollIndicatorHeight - marginInset.bottom)));
    }
    ((___r1 = self._moreBelowView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", !moreBelow));
    var clipFrame = CGRectMakeZero();
    clipFrame.origin.x = marginInset.left;
    clipFrame.origin.y = topMargin;
    clipFrame.size.width = CGRectGetWidth(constrainedFrame) - marginInset.left - marginInset.right;
    clipFrame.size.height = CGRectGetHeight(constrainedFrame) - topMargin - bottomMargin;
    ((___r1 = self._menuClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", clipFrame));
    ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(CGRectGetWidth(clipFrame), CGRectGetHeight(((___r2 = self._menuView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "frame"))))));
    ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "scrollPoint:", CGPointMake(0.0, self.isa.objj_msgSend1(self, "convertBaseToGlobal:", clipFrame.origin).y - menuViewOrigin.y)));
    var ___r1, ___r2;
}
,["void","CGRect","BOOL","BOOL"]), new objj_method(sel_getUid("hasMinimumNumberOfVisibleItems"), function $_CPMenuWindow__hasMinimumNumberOfVisibleItems(self, _cmd)
{
    var visibleRect = ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleRect"));
    if (CGRectIsEmpty(visibleRect))
        return NO;
    var numberOfUnhiddenItems = ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "numberOfUnhiddenItems")),
        minimumNumberOfVisibleItems = MIN(numberOfUnhiddenItems, 3),
        count = 0,
        index = ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemIndexAtPoint:", ((___r2 = self._menuView), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "convertPoint:fromView:", ((___r3 = self._menuClipView), ___r3 == null ? null : ___r3.isa.objj_msgSend0(___r3, "frame")).origin, nil))));
    for (; index < numberOfUnhiddenItems && count < minimumNumberOfVisibleItems; ++index)
    {
        var itemRect = ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "rectForUnhiddenItemAtIndex:", index)),
            visibleItemRect = CGRectIntersection(visibleRect, itemRect);
        if (CGRectIsEmpty(visibleItemRect))
            break;
        if (CGRectEqualToRect(visibleItemRect, itemRect))
            ++count;
    }
    return count >= minimumNumberOfVisibleItems;
    var ___r1, ___r2, ___r3;
}
,["BOOL"]), new objj_method(sel_getUid("canScrollUp"), function $_CPMenuWindow__canScrollUp(self, _cmd)
{
    return !((___r1 = self._moreAboveView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("canScrollDown"), function $_CPMenuWindow__canScrollDown(self, _cmd)
{
    return !((___r1 = self._moreBelowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden"));
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("canScroll"), function $_CPMenuWindow__canScroll(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "canScrollUp") || self.isa.objj_msgSend0(self, "canScrollDown");
}
,["BOOL"]), new objj_method(sel_getUid("scrollByDelta:"), function $_CPMenuWindow__scrollByDelta_(self, _cmd, theDelta)
{
    if (theDelta === 0.0)
        return;
    if (theDelta > 0.0 && !self.isa.objj_msgSend0(self, "canScrollDown"))
        return;
    if (theDelta < 0.0 && !self.isa.objj_msgSend0(self, "canScrollUp"))
        return;
    self._unconstrainedFrame.origin.y -= theDelta;
    self.isa.objj_msgSend1(self, "setFrame:", self._unconstrainedFrame);
}
,["void","float"]), new objj_method(sel_getUid("scrollUp"), function $_CPMenuWindow__scrollUp(self, _cmd)
{
    self.isa.objj_msgSend1(self, "scrollByDelta:", -10.0);
}
,["void"]), new objj_method(sel_getUid("scrollDown"), function $_CPMenuWindow__scrollDown(self, _cmd)
{
    self.isa.objj_msgSend1(self, "scrollByDelta:", 10.0);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("menuWindowWithMenu:font:"), function $_CPMenuWindow__menuWindowWithMenu_font_(self, _cmd, aMenu, aFont)
{
    var menuWindow = nil;
    if (_CPMenuWindowPool.length)
    {
        menuWindow = _CPMenuWindowPool.pop();
        (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setFrameOrigin:", CGPointMakeZero()));
    }
    else
        menuWindow = ((___r1 = _CPMenuWindow.isa.objj_msgSend0(_CPMenuWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setFont:", aFont));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setMenu:", aMenu));
    (menuWindow == null ? null : menuWindow.isa.objj_msgSend1(menuWindow, "setMinWidth:", (aMenu == null ? null : aMenu.isa.objj_msgSend0(aMenu, "minimumWidth"))));
    return menuWindow;
    var ___r1;
}
,["id","CPMenu","CPFont"]), new objj_method(sel_getUid("poolMenuWindow:"), function $_CPMenuWindow__poolMenuWindow_(self, _cmd, aMenuWindow)
{
    if (!aMenuWindow || _CPMenuWindowPool.length >= _CPMenuWindowPoolCapacity || (_CPMenuWindowPool == null ? null : _CPMenuWindowPool.isa.objj_msgSend1(_CPMenuWindowPool, "containsObject:", aMenuWindow)))
        return;
    _CPMenuWindowPool.push(aMenuWindow);
}
,["void","_CPMenuWindow"]), new objj_method(sel_getUid("_standardLeftMargin"), function $_CPMenuWindow___standardLeftMargin(self, _cmd)
{
    return ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-window-margin-inset", _CPMenuView)).left;
    var ___r1;
}
,["float"]), new objj_method(sel_getUid("backgroundColorForBackgroundStyle:"), function $_CPMenuWindow__backgroundColorForBackgroundStyle_(self, _cmd, aBackgroundStyle)
{
    var color = _CPMenuWindowBackgroundColors[aBackgroundStyle];
    if (!color)
    {
        var bundle = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", self.isa.objj_msgSend0(self, "class"));
        if (aBackgroundStyle == _CPMenuWindowPopUpBackgroundStyle)
            color = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-window-pop-up-background-style-color", _CPMenuView));
        else if (aBackgroundStyle == _CPMenuWindowMenuBarBackgroundStyle)
            color = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-window-menu-bar-background-style-color", _CPMenuView));
        _CPMenuWindowBackgroundColors[aBackgroundStyle] = color;
    }
    return color;
    var ___r1;
}
,["CPColor","_CPMenuWindowBackgroundStyle"])]);
}{
var the_class = objj_getClass("_CPMenuWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPMenuWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("globalFrame"), function $_CPMenuWindow__globalFrame(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "frame");
}
,["CGRect"]), new objj_method(sel_getUid("isMenuBar"), function $_CPMenuWindow__isMenuBar(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("scrollingStateForPoint:"), function $_CPMenuWindow__scrollingStateForPoint_(self, _cmd, aGlobalLocation)
{
    var frame = self.isa.objj_msgSend0(self, "frame");
    if (!CGRectContainsPoint(frame, aGlobalLocation) || !self.isa.objj_msgSend0(self, "canScroll"))
        return _CPMenuManagerScrollingStateNone;
    if (aGlobalLocation.y < CGRectGetMinY(frame) + ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "menu-window-margin-inset")).top + ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "menu-window-scroll-indicator-height")) && !((___r1 = self._moreAboveView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        return _CPMenuManagerScrollingStateUp;
    if (aGlobalLocation.y > CGRectGetMaxY(frame) - ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "menu-window-margin-inset")).bottom - ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "menu-window-scroll-indicator-height")) && !((___r1 = self._moreBelowView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        return _CPMenuManagerScrollingStateDown;
    return _CPMenuManagerScrollingStateNone;
    var ___r1;
}
,["_CPManagerScrollingState","CGPoint"]), new objj_method(sel_getUid("deltaYForItemAtIndex:"), function $_CPMenuWindow__deltaYForItemAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "menu-window-margin-inset")).top + CGRectGetMinY(((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "rectForItemAtIndex:", anIndex)));
    var ___r1;
}
,["float","int"]), new objj_method(sel_getUid("rectForItemAtIndex:"), function $_CPMenuWindow__rectForItemAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertRect:toView:", ((___r2 = self._menuView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "rectForItemAtIndex:", anIndex)), nil));
    var ___r1, ___r2;
}
,["CGPoint","int"]), new objj_method(sel_getUid("itemIndexAtPoint:"), function $_CPMenuWindow__itemIndexAtPoint_(self, _cmd, aPoint)
{
    if (!CGRectContainsPoint(((___r1 = self._menuClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")), ((___r1 = self._menuClipView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "convertPoint:fromView:", aPoint, nil))))
        return NO;
    return ((___r1 = self._menuView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemIndexAtPoint:", ((___r2 = self._menuView), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "convertPoint:fromView:", aPoint, nil))));
    var ___r1, ___r2;
}
,["int","CGPoint"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPMenuView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItemViews"), new objj_ivar("_visibleMenuItemInfos"), new objj_ivar("_font")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("font"), function $_CPMenuView__font(self, _cmd)
{
    return self._font;
}
,["CPFont"]), new objj_method(sel_getUid("setFont:"), function $_CPMenuView__setFont_(self, _cmd, newValue)
{
    self._font = newValue;
}
,["void","CPFont"]), new objj_method(sel_getUid("numberOfUnhiddenItems"), function $_CPMenuView__numberOfUnhiddenItems(self, _cmd)
{
    return self._visibleMenuItemInfos.length;
}
,["unsigned"]), new objj_method(sel_getUid("rectForUnhiddenItemAtIndex:"), function $_CPMenuView__rectForUnhiddenItemAtIndex_(self, _cmd, anIndex)
{
    return self.isa.objj_msgSend1(self, "rectForItemAtIndex:", self._visibleMenuItemInfos[anIndex].index);
}
,["CGRect","int"]), new objj_method(sel_getUid("rectForItemAtIndex:"), function $_CPMenuView__rectForItemAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self._menuItemViews[anIndex === CPNotFound ? 0 : anIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    var ___r1;
}
,["CGRect","int"]), new objj_method(sel_getUid("itemIndexAtPoint:"), function $_CPMenuView__itemIndexAtPoint_(self, _cmd, aPoint)
{
    var x = aPoint.x,
        bounds = self.isa.objj_msgSend0(self, "bounds");
    if (x < CGRectGetMinX(bounds) || x > CGRectGetMaxX(bounds))
        return CPNotFound;
    var y = aPoint.y,
        low = 0,
        high = self._visibleMenuItemInfos.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            info = self._visibleMenuItemInfos[middle],
            frame = ((___r1 = info.view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
        if (y < CGRectGetMinY(frame))
            high = middle - 1;
        else if (y > CGRectGetMaxY(frame))
            low = middle + 1;
        else
            return info.index;
    }
    return CPNotFound;
    var ___r1;
}
,["int","CGPoint"]), new objj_method(sel_getUid("tile"), function $_CPMenuView__tile(self, _cmd)
{
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview")));
    self._menuItemViews = [];
    self._visibleMenuItemInfos = [];
    var menu = self.isa.objj_msgSend0(self, "menu");
    if (!menu)
        return;
    var items = (menu == null ? null : menu.isa.objj_msgSend0(menu, "itemArray")),
        index = 0,
        count = (items == null ? null : items.isa.objj_msgSend0(items, "count")),
        maxWidth = 0,
        y = 0,
        showsStateColumn = (menu == null ? null : menu.isa.objj_msgSend0(menu, "showsStateColumn"));
    for (; index < count; ++index)
    {
        var item = items[index],
            view = (item == null ? null : item.isa.objj_msgSend0(item, "_menuItemView"));
        self._menuItemViews.push(view);
        if ((item == null ? null : item.isa.objj_msgSend0(item, "isHidden")))
            continue;
        self._visibleMenuItemInfos.push({view: view, index: index});
        (view == null ? null : view.isa.objj_msgSend1(view, "setFont:", self._font));
        (view == null ? null : view.isa.objj_msgSend1(view, "setShowsStateColumn:", showsStateColumn));
        (view == null ? null : view.isa.objj_msgSend0(view, "synchronizeWithMenuItem"));
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrameOrigin:", CGPointMake(0.0, y)));
        self.isa.objj_msgSend1(self, "addSubview:", view);
        var size = (view == null ? null : view.isa.objj_msgSend0(view, "minSize")),
            width = size.width;
        if (maxWidth < width)
            maxWidth = width;
        y += size.height;
    }
    for (index = 0; index < count; ++index)
    {
        var view = self._menuItemViews[index];
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrameSize:", CGSizeMake(maxWidth, CGRectGetHeight((view == null ? null : view.isa.objj_msgSend0(view, "frame"))))));
    }
    self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", NO);
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(maxWidth, y));
    self.isa.objj_msgSend1(self, "setAutoresizesSubviews:", YES);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setMenu:"), function $_CPMenuView__setMenu_(self, _cmd, aMenu)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuView").super_class }, "setMenu:", aMenu);
    self.isa.objj_msgSend0(self, "tile");
}
,["void","CPMenu"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPMenuView__defaultThemeClass(self, _cmd)
{
    return "menu-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPMenuView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-window-more-above-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-window-more-below-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-window-pop-up-background-style-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-window-menu-bar-background-style-color", CGInsetMake(5.0, 1.0, 1.0, 5.0), "menu-window-margin-inset", 16.0, "menu-window-scroll-indicator-height", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-window-background-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-window-background-selected-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-window-font", 30.0, "menu-bar-window-height", 10.0, "menu-bar-window-margin", 10.0, "menu-bar-window-left-margin", 10.0, "menu-bar-window-right-margin", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-text-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-title-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-text-shadow-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-title-shadow-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-highlight-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-highlight-text-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-highlight-text-shadow-color", 28.0, "menu-bar-height", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-bar-icon-image", 1.0, "menu-bar-icon-image-alpha-value", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-general-icon-new", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-general-icon-save", CPNull.isa.objj_msgSend0(CPNull, "null"), "menu-general-icon-open");
}
,["CPDictionary"])]);
}