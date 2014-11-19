@STATIC;1.0;i;9;CPPanel.ji;16;_CPMenuManager.jt;22093;objj_executeFile("CPPanel.j", YES);objj_executeFile("_CPMenuManager.j", YES);{var the_class = objj_allocateClassPair(CPPanel, "_CPMenuBarWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_highlightView"), new objj_ivar("_menuItemViews"), new objj_ivar("_trackingMenuItem"), new objj_ivar("_iconImageView"), new objj_ivar("_titleField"), new objj_ivar("_textColor"), new objj_ivar("_titleColor"), new objj_ivar("_textShadowColor"), new objj_ivar("_titleShadowColor"), new objj_ivar("_highlightColor"), new objj_ivar("_highlightTextColor"), new objj_ivar("_highlightTextShadowColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPMenuBarWindow__init(self, _cmd)
{
    var contentRect = ((___r1 = CPPlatformWindow.isa.objj_msgSend0(CPPlatformWindow, "primaryPlatformWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentBounds"));
    contentRect.size.height = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-window-height", _CPMenuView));
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuBarWindow").super_class }, "initWithContentRect:styleMask:", contentRect, CPBorderlessWindowMask);
    if (self)
    {
        self._constrainsToUsableScreen = NO;
        (self == null ? null : self.isa.objj_msgSend1(self, "setLevel:", CPMainMenuWindowLevel));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAutoresizingMask:", CPWindowWidthSizable));
        var contentView = (self == null ? null : self.isa.objj_msgSend0(self, "contentView"));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "setAutoresizesSubviews:", NO));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBecomesKeyOnlyIfNeeded:", YES));
        self._iconImageView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 16.0, 16.0)));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._iconImageView));
        self._titleField = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", CPFont.isa.objj_msgSend1(CPFont, "boldSystemFontOfSize:", CPFont.isa.objj_msgSend0(CPFont, "systemFontSize") + 1)));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", CPCenterTextAlignment));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", CGSizeMake(0, 1)));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._titleField));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("setTitle:"), function $_CPMenuBarWindow__setTitle_(self, _cmd, aTitle)
{
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", aTitle));
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    self.isa.objj_msgSend0(self, "tile");
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("setIconImage:"), function $_CPMenuBarWindow__setIconImage_(self, _cmd, anImage)
{
    ((___r1 = self._iconImageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", anImage));
    ((___r1 = self._iconImageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", anImage == nil));
    self.isa.objj_msgSend0(self, "tile");
    var ___r1;
}
,["void","CPImage"]), new objj_method(sel_getUid("setIconImageAlphaValue:"), function $_CPMenuBarWindow__setIconImageAlphaValue_(self, _cmd, anAlphaValue)
{
    ((___r1 = self._iconImageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlphaValue:", anAlphaValue));
    var ___r1;
}
,["void","float"]), new objj_method(sel_getUid("setColor:"), function $_CPMenuBarWindow__setColor_(self, _cmd, aColor)
{
    if (!aColor)
        ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", ((___r2 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "valueForAttributeWithName:forClass:", "menu-bar-window-background-color", _CPMenuView))));
    else
        ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", aColor));
    var ___r1, ___r2;
}
,["void","CPColor"]), new objj_method(sel_getUid("setTextColor:"), function $_CPMenuBarWindow__setTextColor_(self, _cmd, aColor)
{
    if (self._textColor == aColor)
        return;
    self._textColor = aColor;
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setTextColor:"), self._textColor));
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuTextColor:"), self._textColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setTitleColor:"), function $_CPMenuBarWindow__setTitleColor_(self, _cmd, aColor)
{
    if (self._titleColor == aColor)
        return;
    self._titleColor = aColor;
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", aColor ? aColor : CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPMenuBarWindow__setTextShadowColor_(self, _cmd, aColor)
{
    if (self._textShadowColor == aColor)
        return;
    self._textShadowColor = aColor;
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setTextShadowColor:"), self._textShadowColor));
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuTextShadowColor:"), self._textShadowColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setTitleShadowColor:"), function $_CPMenuBarWindow__setTitleShadowColor_(self, _cmd, aColor)
{
    if (self._titleShadowColor == aColor)
        return;
    self._titleShadowColor = aColor;
    ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", aColor ? aColor : CPColor.isa.objj_msgSend0(CPColor, "whiteColor")));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightColor:"), function $_CPMenuBarWindow__setHighlightColor_(self, _cmd, aColor)
{
    if (self._highlightColor == aColor)
        return;
    self._highlightColor = aColor;
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuHighlightColor:"), self._highlightColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextColor:"), function $_CPMenuBarWindow__setHighlightTextColor_(self, _cmd, aColor)
{
    if (self._highlightTextColor == aColor)
        return;
    self._highlightTextColor = aColor;
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuHighlightTextColor:"), self._highlightTextColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextShadowColor:"), function $_CPMenuBarWindow__setHighlightTextShadowColor_(self, _cmd, aColor)
{
    if (self._highlightTextShadowColor == aColor)
        return;
    self._highlightTextShadowColor = aColor;
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuHighlightTextShadowColor:"), self._highlightTextShadowColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("setMenu:"), function $_CPMenuBarWindow__setMenu_(self, _cmd, aMenu)
{
    if (self._menu == aMenu)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (self._menu)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPMenuDidAddItemNotification, self._menu));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPMenuDidChangeItemNotification, self._menu));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPMenuDidRemoveItemNotification, self._menu));
        var items = ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray")),
            count = items.length;
        while (count--)
            ((___r1 = ((___r2 = items[count]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_menuItemView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    }
    self._menu = aMenu;
    if (self._menu)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidAddItem:"), CPMenuDidAddItemNotification, self._menu));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidChangeItem:"), CPMenuDidChangeItemNotification, self._menu));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, self._menu));
    }
    self._menuItemViews = [];
    var contentView = self.isa.objj_msgSend0(self, "contentView"),
        items = ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray")),
        count = items.length;
    for (var index = 0; index < count; ++index)
    {
        var item = items[index],
            menuItemView = (item == null ? null : item.isa.objj_msgSend0(item, "_menuItemView"));
        self._menuItemViews.push(menuItemView);
        (menuItemView == null ? null : menuItemView.isa.objj_msgSend1(menuItemView, "setTextColor:", self._textColor));
        (menuItemView == null ? null : menuItemView.isa.objj_msgSend1(menuItemView, "setHidden:", (item == null ? null : item.isa.objj_msgSend0(item, "isHidden"))));
        (menuItemView == null ? null : menuItemView.isa.objj_msgSend0(menuItemView, "synchronizeWithMenuItem"));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", menuItemView));
    }
    self.isa.objj_msgSend0(self, "tile");
    var ___r1, ___r2;
}
,["void","CPMenu"]), new objj_method(sel_getUid("menuDidChangeItem:"), function $_CPMenuBarWindow__menuDidChangeItem_(self, _cmd, aNotification)
{
    var menuItem = ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtIndex:", ((___r2 = (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "userInfo"))), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectForKey:", "CPMenuItemIndex")))),
        menuItemView = (menuItem == null ? null : menuItem.isa.objj_msgSend0(menuItem, "_menuItemView"));
    (menuItemView == null ? null : menuItemView.isa.objj_msgSend1(menuItemView, "setHidden:", (menuItem == null ? null : menuItem.isa.objj_msgSend0(menuItem, "isHidden"))));
    (menuItemView == null ? null : menuItemView.isa.objj_msgSend0(menuItemView, "synchronizeWithMenuItem"));
    self.isa.objj_msgSend0(self, "tile");
    var ___r1, ___r2;
}
,["void","CPNotification"]), new objj_method(sel_getUid("menuDidAddItem:"), function $_CPMenuBarWindow__menuDidAddItem_(self, _cmd, aNotification)
{
    var index = ((___r1 = (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "userInfo"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "CPMenuItemIndex")),
        menuItem = ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtIndex:", index)),
        menuItemView = (menuItem == null ? null : menuItem.isa.objj_msgSend0(menuItem, "_menuItemView"));
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", menuItemView, index));
    (menuItemView == null ? null : menuItemView.isa.objj_msgSend1(menuItemView, "setTextColor:", self._textColor));
    (menuItemView == null ? null : menuItemView.isa.objj_msgSend1(menuItemView, "setHidden:", (menuItem == null ? null : menuItem.isa.objj_msgSend0(menuItem, "isHidden"))));
    (menuItemView == null ? null : menuItemView.isa.objj_msgSend0(menuItemView, "synchronizeWithMenuItem"));
    ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", menuItemView));
    self.isa.objj_msgSend0(self, "tile");
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("menuDidRemoveItem:"), function $_CPMenuBarWindow__menuDidRemoveItem_(self, _cmd, aNotification)
{
    var index = ((___r1 = (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "userInfo"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "CPMenuItemIndex")),
        menuItemView = ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", index));
    ((___r1 = self._menuItemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", index));
    (menuItemView == null ? null : menuItemView.isa.objj_msgSend0(menuItemView, "removeFromSuperview"));
    self.isa.objj_msgSend0(self, "tile");
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $_CPMenuBarWindow__acceptsFirstMouse_(self, _cmd, anEvent)
{
    return YES;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $_CPMenuBarWindow__mouseDown_(self, _cmd, anEvent)
{
    var constraintRect = CGRectInset(((___r1 = self.isa.objj_msgSend0(self, "platformWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "visibleFrame")), 5.0, 0.0);
    constraintRect.size.height -= 5.0;
    ((___r1 = _CPMenuManager.isa.objj_msgSend0(_CPMenuManager, "sharedMenuManager")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "beginTracking:menuContainer:constraintRect:callback:", anEvent, self, constraintRect, function(aMenuContainer, aMenu)
    {
        (aMenu == null ? null : aMenu.isa.objj_msgSend0(aMenu, "_performActionOfHighlightedItemChain"));
        (aMenu == null ? null : aMenu.isa.objj_msgSend1(aMenu, "_highlightItemAtIndex:", CPNotFound));
    }));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("font"), function $_CPMenuBarWindow__font(self, _cmd)
{
    CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", CPFont.isa.objj_msgSend0(CPFont, "systemFontSize"));
}
,["CPFont"]), new objj_method(sel_getUid("tile"), function $_CPMenuBarWindow__tile(self, _cmd)
{
    var items = ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray")),
        index = 0,
        count = items.length,
        x = ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-window-left-margin", _CPMenuView)),
        y = 0.0,
        isLeftAligned = YES;
    for (; index < count; ++index)
    {
        var item = items[index];
        if ((item == null ? null : item.isa.objj_msgSend0(item, "isSeparatorItem")))
        {
            x = CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")) - ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-window-right-margin", _CPMenuView));
            isLeftAligned = NO;
            continue;
        }
        if ((item == null ? null : item.isa.objj_msgSend0(item, "isHidden")))
            continue;
        var menuItemView = (item == null ? null : item.isa.objj_msgSend0(item, "_menuItemView")),
            frame = (menuItemView == null ? null : menuItemView.isa.objj_msgSend0(menuItemView, "frame"));
        if (isLeftAligned)
        {
            (menuItemView == null ? null : menuItemView.isa.objj_msgSend1(menuItemView, "setFrame:", CGRectMake(x, 0.0, CGRectGetWidth(frame), ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-window-height", _CPMenuView)))));
            x += CGRectGetWidth((menuItemView == null ? null : menuItemView.isa.objj_msgSend0(menuItemView, "frame")));
        }
        else
        {
            (menuItemView == null ? null : menuItemView.isa.objj_msgSend1(menuItemView, "setFrame:", CGRectMake(x - CGRectGetWidth(frame), 0.0, CGRectGetWidth(frame), ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-window-height", _CPMenuView)))));
            x = CGRectGetMinX((menuItemView == null ? null : menuItemView.isa.objj_msgSend0(menuItemView, "frame")));
        }
    }
    var bounds = ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")),
        titleFrame = ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    if (((___r1 = self._iconImageView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isHidden")))
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(titleFrame)) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0)));
    else
    {
        var iconFrame = ((___r1 = self._iconImageView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
            iconWidth = CGRectGetWidth(iconFrame),
            totalWidth = iconWidth + CGRectGetWidth(titleFrame);
        ((___r1 = self._iconImageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(iconFrame)) / 2.0)));
        ((___r1 = self._titleField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0 + iconWidth, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0)));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setFrame:display:animate:"), function $_CPMenuBarWindow__setFrame_display_animate_(self, _cmd, aRect, shouldDisplay, shouldAnimate)
{
    var size = self.isa.objj_msgSend0(self, "frame").size;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuBarWindow").super_class }, "setFrame:display:animate:", aRect, shouldDisplay, shouldAnimate);
    if (!CGSizeEqualToSize(size, aRect.size))
        self.isa.objj_msgSend0(self, "tile");
}
,["void","CGRect","BOOL","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("font"), function $_CPMenuBarWindow__font(self, _cmd)
{
    return ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-bar-window-font", _CPMenuView));
    var ___r1;
}
,["CPFont"])]);
}{
var the_class = objj_getClass("_CPMenuBarWindow")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPMenuBarWindow\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("isMenuBar"), function $_CPMenuBarWindow__isMenuBar(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("globalFrame"), function $_CPMenuBarWindow__globalFrame(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "frame");
}
,["CGRect"]), new objj_method(sel_getUid("scrollingStateForPoint:"), function $_CPMenuBarWindow__scrollingStateForPoint_(self, _cmd, aGlobalLocation)
{
    return _CPMenuManagerScrollingStateNone;
}
,["_CPManagerScrollingState","CGPoint"]), new objj_method(sel_getUid("itemIndexAtPoint:"), function $_CPMenuBarWindow__itemIndexAtPoint_(self, _cmd, aPoint)
{
    var items = ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray")),
        index = items.length;
    while (index--)
    {
        var item = items[index];
        if ((item == null ? null : item.isa.objj_msgSend0(item, "isHidden")) || (item == null ? null : item.isa.objj_msgSend0(item, "isSeparatorItem")))
            continue;
        if (CGRectContainsPoint(self.isa.objj_msgSend1(self, "rectForItemAtIndex:", index), aPoint))
            return index;
    }
    return CPNotFound;
    var ___r1;
}
,["CPInteger","CGPoint"]), new objj_method(sel_getUid("rectForItemAtIndex:"), function $_CPMenuBarWindow__rectForItemAtIndex_(self, _cmd, anIndex)
{
    var menuItem = ((___r1 = self._menu), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtIndex:", anIndex === CPNotFound ? 0 : anIndex));
    return ((___r1 = (menuItem == null ? null : menuItem.isa.objj_msgSend0(menuItem, "_menuItemView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"));
    var ___r1;
}
,["CGRect","CPInteger"])]);
}