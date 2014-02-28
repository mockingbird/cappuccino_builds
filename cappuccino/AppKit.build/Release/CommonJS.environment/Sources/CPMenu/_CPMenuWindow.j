@STATIC;1.0;i;12;CPClipView.ji;13;CPImageView.ji;10;CPWindow.ji;16;_CPMenuManager.jt;23064;objj_executeFile("CPClipView.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPWindow.j", YES);objj_executeFile("_CPMenuManager.j", YES);var _CPMenuWindowPool = [],
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
        objj_msgSend(self, "setLevel:", CPPopUpMenuWindowLevel);
        objj_msgSend(self, "setHasShadow:", YES);
        objj_msgSend(self, "setShadowStyle:", CPMenuWindowShadowStyle);
        objj_msgSend(self, "setAcceptsMouseMovedEvents:", YES);
        var contentView = objj_msgSend(self, "contentView");
        self._menuView = objj_msgSend(objj_msgSend(_CPMenuView, "alloc"), "initWithFrame:", CGRectMakeZero());
        self._menuClipView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "initWithFrame:", CGRectMake(objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-margin-inset").left, objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-margin-inset").top, 0.0, 0.0));
        objj_msgSend(self._menuClipView, "setDocumentView:", self._menuView);
        objj_msgSend(contentView, "addSubview:", self._menuClipView);
        self._moreAboveView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._moreAboveView, "setImage:", objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-more-above-image"));
        objj_msgSend(self._moreAboveView, "setFrameSize:", objj_msgSend(objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-more-above-image"), "size"));
        objj_msgSend(contentView, "addSubview:", self._moreAboveView);
        self._moreBelowView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._moreBelowView, "setImage:", objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-more-below-image"));
        objj_msgSend(self._moreBelowView, "setFrameSize:", objj_msgSend(objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-more-below-image"), "size"));
        objj_msgSend(contentView, "addSubview:", self._moreBelowView);
    }
    return self;
}
,["id","CGRect","unsigned"]), new objj_method(sel_getUid("setFont:"), function $_CPMenuWindow__setFont_(self, _cmd, aFont)
{
    objj_msgSend(self._menuView, "setFont:", aFont);
}
,["void","CPFont"]), new objj_method(sel_getUid("font"), function $_CPMenuWindow__font(self, _cmd)
{
    return objj_msgSend(self._menuView, "font");
}
,["CPFont"]), new objj_method(sel_getUid("setBackgroundStyle:"), function $_CPMenuWindow__setBackgroundStyle_(self, _cmd, aBackgroundStyle)
{
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(objj_msgSend(self, "class"), "backgroundColorForBackgroundStyle:", aBackgroundStyle));
}
,["void","_CPMenuWindowBackgroundStyle"]), new objj_method(sel_getUid("setMenu:"), function $_CPMenuWindow__setMenu_(self, _cmd, aMenu)
{
    objj_msgSend(aMenu, "_setMenuWindow:", self);
    objj_msgSend(self._menuView, "setMenu:", aMenu);
    var menuViewSize = objj_msgSend(self._menuView, "frame").size,
        marginInset = objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-margin-inset");
    objj_msgSend(self, "setFrameSize:", CGSizeMake(marginInset.left + menuViewSize.width + marginInset.right, marginInset.top + menuViewSize.height + marginInset.bottom));
    objj_msgSend(self._menuView, "scrollPoint:", CGPointMake(0.0, 0.0));
    objj_msgSend(self._menuClipView, "setFrame:", CGRectMake(marginInset.left, marginInset.top, menuViewSize.width, menuViewSize.height));
}
,["void","CPMenu"]), new objj_method(sel_getUid("setMinWidth:"), function $_CPMenuWindow__setMinWidth_(self, _cmd, aWidth)
{
    var size = objj_msgSend(self, "unconstrainedFrame").size;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(MAX(size.width, aWidth), size.height));
}
,["void","float"]), new objj_method(sel_getUid("menu"), function $_CPMenuWindow__menu(self, _cmd)
{
    return objj_msgSend(self._menuView, "menu");
}
,["CPMenu"]), new objj_method(sel_getUid("_menuView"), function $_CPMenuWindow___menuView(self, _cmd)
{
    return self._menuView;
}
,["_CPMenuView"]), new objj_method(sel_getUid("orderFront:"), function $_CPMenuWindow__orderFront_(self, _cmd, aSender)
{
    objj_msgSend(objj_msgSend(self, "menu"), "update");
    objj_msgSend(self, "setFrame:", self._unconstrainedFrame);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuWindow").super_class }, "orderFront:", aSender);
}
,["void","id"]), new objj_method(sel_getUid("setConstraintRect:"), function $_CPMenuWindow__setConstraintRect_(self, _cmd, aRect)
{
    self._constraintRect = aRect;
    objj_msgSend(self, "setFrame:", self._unconstrainedFrame);
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
        marginInset = objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-margin-inset"),
        scrollIndicatorHeight = objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-scroll-indicator-height");
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
        moreBelow = menuViewOrigin.y + CGRectGetHeight(objj_msgSend(self._menuView, "frame")) > CGRectGetMaxY(constrainedFrame) - marginInset.bottom,
        topMargin = marginInset.top,
        bottomMargin = marginInset.bottom,
        contentView = objj_msgSend(self, "contentView"),
        bounds = objj_msgSend(contentView, "bounds");
    if (moreAbove)
    {
        topMargin += scrollIndicatorHeight;
        var frame = objj_msgSend(self._moreAboveView, "frame");
        objj_msgSend(self._moreAboveView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(frame)) / 2.0, (marginInset.top + scrollIndicatorHeight - CGRectGetHeight(frame)) / 2.0));
    }
    objj_msgSend(self._moreAboveView, "setHidden:", !moreAbove);
    if (moreBelow)
    {
        bottomMargin += scrollIndicatorHeight;
        objj_msgSend(self._moreBelowView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(objj_msgSend(self._moreBelowView, "frame"))) / 2.0, CGRectGetHeight(bounds) - scrollIndicatorHeight - marginInset.bottom));
    }
    objj_msgSend(self._moreBelowView, "setHidden:", !moreBelow);
    var clipFrame = CGRectMakeZero();
    clipFrame.origin.x = marginInset.left;
    clipFrame.origin.y = topMargin;
    clipFrame.size.width = CGRectGetWidth(constrainedFrame) - marginInset.left - marginInset.right;
    clipFrame.size.height = CGRectGetHeight(constrainedFrame) - topMargin - bottomMargin;
    objj_msgSend(self._menuClipView, "setFrame:", clipFrame);
    objj_msgSend(self._menuView, "setFrameSize:", CGSizeMake(CGRectGetWidth(clipFrame), CGRectGetHeight(objj_msgSend(self._menuView, "frame"))));
    objj_msgSend(self._menuView, "scrollPoint:", CGPointMake(0.0, objj_msgSend(self, "convertBaseToGlobal:", clipFrame.origin).y - menuViewOrigin.y));
}
,["void","CGRect","BOOL","BOOL"]), new objj_method(sel_getUid("hasMinimumNumberOfVisibleItems"), function $_CPMenuWindow__hasMinimumNumberOfVisibleItems(self, _cmd)
{
    var visibleRect = objj_msgSend(self._menuView, "visibleRect");
    if (CGRectIsEmpty(visibleRect))
        return NO;
    var numberOfUnhiddenItems = objj_msgSend(self._menuView, "numberOfUnhiddenItems"),
        minimumNumberOfVisibleItems = MIN(numberOfUnhiddenItems, 3),
        count = 0,
        index = objj_msgSend(self._menuView, "itemIndexAtPoint:", objj_msgSend(self._menuView, "convertPoint:fromView:", objj_msgSend(self._menuClipView, "frame").origin, nil));
    for (; index < numberOfUnhiddenItems && count < minimumNumberOfVisibleItems; ++index)
    {
        var itemRect = objj_msgSend(self._menuView, "rectForUnhiddenItemAtIndex:", index),
            visibleItemRect = CGRectIntersection(visibleRect, itemRect);
        if (CGRectIsEmpty(visibleItemRect))
            break;
        if (CGRectEqualToRect(visibleItemRect, itemRect))
            ++count;
    }
    return count >= minimumNumberOfVisibleItems;
}
,["BOOL"]), new objj_method(sel_getUid("canScrollUp"), function $_CPMenuWindow__canScrollUp(self, _cmd)
{
    return !objj_msgSend(self._moreAboveView, "isHidden");
}
,["BOOL"]), new objj_method(sel_getUid("canScrollDown"), function $_CPMenuWindow__canScrollDown(self, _cmd)
{
    return !objj_msgSend(self._moreBelowView, "isHidden");
}
,["BOOL"]), new objj_method(sel_getUid("canScroll"), function $_CPMenuWindow__canScroll(self, _cmd)
{
    return objj_msgSend(self, "canScrollUp") || objj_msgSend(self, "canScrollDown");
}
,["BOOL"]), new objj_method(sel_getUid("scrollByDelta:"), function $_CPMenuWindow__scrollByDelta_(self, _cmd, theDelta)
{
    if (theDelta === 0.0)
        return;
    if (theDelta > 0.0 && !objj_msgSend(self, "canScrollDown"))
        return;
    if (theDelta < 0.0 && !objj_msgSend(self, "canScrollUp"))
        return;
    self._unconstrainedFrame.origin.y -= theDelta;
    objj_msgSend(self, "setFrame:", self._unconstrainedFrame);
}
,["void","float"]), new objj_method(sel_getUid("scrollUp"), function $_CPMenuWindow__scrollUp(self, _cmd)
{
    objj_msgSend(self, "scrollByDelta:", -10.0);
}
,["void"]), new objj_method(sel_getUid("scrollDown"), function $_CPMenuWindow__scrollDown(self, _cmd)
{
    objj_msgSend(self, "scrollByDelta:", 10.0);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("menuWindowWithMenu:font:"), function $_CPMenuWindow__menuWindowWithMenu_font_(self, _cmd, aMenu, aFont)
{
    var menuWindow = nil;
    if (_CPMenuWindowPool.length)
    {
        menuWindow = _CPMenuWindowPool.pop();
        objj_msgSend(menuWindow, "setFrameOrigin:", CGPointMakeZero());
    }
    else
        menuWindow = objj_msgSend(objj_msgSend(_CPMenuWindow, "alloc"), "init");
    objj_msgSend(menuWindow, "setFont:", aFont);
    objj_msgSend(menuWindow, "setMenu:", aMenu);
    objj_msgSend(menuWindow, "setMinWidth:", objj_msgSend(aMenu, "minimumWidth"));
    return menuWindow;
}
,["id","CPMenu","CPFont"]), new objj_method(sel_getUid("poolMenuWindow:"), function $_CPMenuWindow__poolMenuWindow_(self, _cmd, aMenuWindow)
{
    if (!aMenuWindow || _CPMenuWindowPool.length >= _CPMenuWindowPoolCapacity || objj_msgSend(_CPMenuWindowPool, "containsObject:", aMenuWindow))
        return;
    _CPMenuWindowPool.push(aMenuWindow);
}
,["void","_CPMenuWindow"]), new objj_method(sel_getUid("_standardLeftMargin"), function $_CPMenuWindow___standardLeftMargin(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-window-margin-inset", _CPMenuView).left;
}
,["float"]), new objj_method(sel_getUid("backgroundColorForBackgroundStyle:"), function $_CPMenuWindow__backgroundColorForBackgroundStyle_(self, _cmd, aBackgroundStyle)
{
    var color = _CPMenuWindowBackgroundColors[aBackgroundStyle];
    if (!color)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
        if (aBackgroundStyle == _CPMenuWindowPopUpBackgroundStyle)
            color = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-window-pop-up-background-style-color", _CPMenuView);
        else if (aBackgroundStyle == _CPMenuWindowMenuBarBackgroundStyle)
            color = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-window-menu-bar-background-style-color", _CPMenuView);
        _CPMenuWindowBackgroundColors[aBackgroundStyle] = color;
    }
    return color;
}
,["CPColor","_CPMenuWindowBackgroundStyle"])]);
}{
var the_class = objj_getClass("_CPMenuWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPMenuWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("globalFrame"), function $_CPMenuWindow__globalFrame(self, _cmd)
{
    return objj_msgSend(self, "frame");
}
,["CGRect"]), new objj_method(sel_getUid("isMenuBar"), function $_CPMenuWindow__isMenuBar(self, _cmd)
{
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("scrollingStateForPoint:"), function $_CPMenuWindow__scrollingStateForPoint_(self, _cmd, aGlobalLocation)
{
    var frame = objj_msgSend(self, "frame");
    if (!CGRectContainsPoint(frame, aGlobalLocation) || !objj_msgSend(self, "canScroll"))
        return _CPMenuManagerScrollingStateNone;
    if (aGlobalLocation.y < CGRectGetMinY(frame) + objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-margin-inset").top + objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-scroll-indicator-height") && !objj_msgSend(self._moreAboveView, "isHidden"))
        return _CPMenuManagerScrollingStateUp;
    if (aGlobalLocation.y > CGRectGetMaxY(frame) - objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-margin-inset").bottom - objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-scroll-indicator-height") && !objj_msgSend(self._moreBelowView, "isHidden"))
        return _CPMenuManagerScrollingStateDown;
    return _CPMenuManagerScrollingStateNone;
}
,["_CPManagerScrollingState","CGPoint"]), new objj_method(sel_getUid("deltaYForItemAtIndex:"), function $_CPMenuWindow__deltaYForItemAtIndex_(self, _cmd, anIndex)
{
    return objj_msgSend(self._menuView, "valueForThemeAttribute:", "menu-window-margin-inset").top + CGRectGetMinY(objj_msgSend(self._menuView, "rectForItemAtIndex:", anIndex));
}
,["float","int"]), new objj_method(sel_getUid("rectForItemAtIndex:"), function $_CPMenuWindow__rectForItemAtIndex_(self, _cmd, anIndex)
{
    return objj_msgSend(self._menuView, "convertRect:toView:", objj_msgSend(self._menuView, "rectForItemAtIndex:", anIndex), nil);
}
,["CGPoint","int"]), new objj_method(sel_getUid("itemIndexAtPoint:"), function $_CPMenuWindow__itemIndexAtPoint_(self, _cmd, aPoint)
{
    if (!CGRectContainsPoint(objj_msgSend(self._menuClipView, "bounds"), objj_msgSend(self._menuClipView, "convertPoint:fromView:", aPoint, nil)))
        return NO;
    return objj_msgSend(self._menuView, "itemIndexAtPoint:", objj_msgSend(self._menuView, "convertPoint:fromView:", aPoint, nil));
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
    return objj_msgSend(self, "rectForItemAtIndex:", self._visibleMenuItemInfos[anIndex].index);
}
,["CGRect","int"]), new objj_method(sel_getUid("rectForItemAtIndex:"), function $_CPMenuView__rectForItemAtIndex_(self, _cmd, anIndex)
{
    return objj_msgSend(self._menuItemViews[anIndex === CPNotFound ? 0 : anIndex], "frame");
}
,["CGRect","int"]), new objj_method(sel_getUid("itemIndexAtPoint:"), function $_CPMenuView__itemIndexAtPoint_(self, _cmd, aPoint)
{
    var x = aPoint.x,
        bounds = objj_msgSend(self, "bounds");
    if (x < CGRectGetMinX(bounds) || x > CGRectGetMaxX(bounds))
        return CPNotFound;
    var y = aPoint.y,
        low = 0,
        high = self._visibleMenuItemInfos.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            info = self._visibleMenuItemInfos[middle],
            frame = objj_msgSend(info.view, "frame");
        if (y < CGRectGetMinY(frame))
            high = middle - 1;
        else if (y > CGRectGetMaxY(frame))
            low = middle + 1;
        else
            return info.index;
    }
    return CPNotFound;
}
,["int","CGPoint"]), new objj_method(sel_getUid("tile"), function $_CPMenuView__tile(self, _cmd)
{
    objj_msgSend(self._menuItemViews, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview"));
    self._menuItemViews = [];
    self._visibleMenuItemInfos = [];
    var menu = objj_msgSend(self, "menu");
    if (!menu)
        return;
    var items = objj_msgSend(menu, "itemArray"),
        index = 0,
        count = objj_msgSend(items, "count"),
        maxWidth = 0,
        y = 0,
        showsStateColumn = objj_msgSend(menu, "showsStateColumn");
    for (; index < count; ++index)
    {
        var item = items[index],
            view = objj_msgSend(item, "_menuItemView");
        self._menuItemViews.push(view);
        if (objj_msgSend(item, "isHidden"))
            continue;
        self._visibleMenuItemInfos.push({view: view, index: index});
        objj_msgSend(view, "setFont:", self._font);
        objj_msgSend(view, "setShowsStateColumn:", showsStateColumn);
        objj_msgSend(view, "synchronizeWithMenuItem");
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(0.0, y));
        objj_msgSend(self, "addSubview:", view);
        var size = objj_msgSend(view, "minSize"),
            width = size.width;
        if (maxWidth < width)
            maxWidth = width;
        y += size.height;
    }
    for (index = 0; index < count; ++index)
    {
        var view = self._menuItemViews[index];
        objj_msgSend(view, "setFrameSize:", CGSizeMake(maxWidth, CGRectGetHeight(objj_msgSend(view, "frame"))));
    }
    objj_msgSend(self, "setAutoresizesSubviews:", NO);
    objj_msgSend(self, "setFrameSize:", CGSizeMake(maxWidth, y));
    objj_msgSend(self, "setAutoresizesSubviews:", YES);
}
,["void"]), new objj_method(sel_getUid("setMenu:"), function $_CPMenuView__setMenu_(self, _cmd, aMenu)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuView").super_class }, "setMenu:", aMenu);
    objj_msgSend(self, "tile");
}
,["void","CPMenu"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPMenuView__defaultThemeClass(self, _cmd)
{
    return "menu-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPMenuView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "menu-window-more-above-image", objj_msgSend(CPNull, "null"), "menu-window-more-below-image", objj_msgSend(CPNull, "null"), "menu-window-pop-up-background-style-color", objj_msgSend(CPNull, "null"), "menu-window-menu-bar-background-style-color", CGInsetMake(5.0, 1.0, 1.0, 5.0), "menu-window-margin-inset", 16.0, "menu-window-scroll-indicator-height", objj_msgSend(CPNull, "null"), "menu-bar-window-background-color", objj_msgSend(CPNull, "null"), "menu-bar-window-background-selected-color", objj_msgSend(CPNull, "null"), "menu-bar-window-font", 30.0, "menu-bar-window-height", 10.0, "menu-bar-window-margin", 10.0, "menu-bar-window-left-margin", 10.0, "menu-bar-window-right-margin", objj_msgSend(CPNull, "null"), "menu-bar-text-color", objj_msgSend(CPNull, "null"), "menu-bar-title-color", objj_msgSend(CPNull, "null"), "menu-bar-text-shadow-color", objj_msgSend(CPNull, "null"), "menu-bar-title-shadow-color", objj_msgSend(CPNull, "null"), "menu-bar-highlight-color", objj_msgSend(CPNull, "null"), "menu-bar-highlight-text-color", objj_msgSend(CPNull, "null"), "menu-bar-highlight-text-shadow-color", 28.0, "menu-bar-height", objj_msgSend(CPNull, "null"), "menu-bar-icon-image", 1.0, "menu-bar-icon-image-alpha-value", objj_msgSend(CPNull, "null"), "menu-general-icon-new", objj_msgSend(CPNull, "null"), "menu-general-icon-save", objj_msgSend(CPNull, "null"), "menu-general-icon-open");
}
,["CPDictionary"])]);
}