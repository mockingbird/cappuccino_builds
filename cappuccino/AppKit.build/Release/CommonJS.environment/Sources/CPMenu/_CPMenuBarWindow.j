@STATIC;1.0;i;9;CPPanel.ji;16;_CPMenuManager.jt;16393;objj_executeFile("CPPanel.j", YES);objj_executeFile("_CPMenuManager.j", YES);{var the_class = objj_allocateClassPair(CPPanel, "_CPMenuBarWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_highlightView"), new objj_ivar("_menuItemViews"), new objj_ivar("_trackingMenuItem"), new objj_ivar("_iconImageView"), new objj_ivar("_titleField"), new objj_ivar("_textColor"), new objj_ivar("_titleColor"), new objj_ivar("_textShadowColor"), new objj_ivar("_titleShadowColor"), new objj_ivar("_highlightColor"), new objj_ivar("_highlightTextColor"), new objj_ivar("_highlightTextShadowColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $_CPMenuBarWindow__init(self, _cmd)
{
    var contentRect = objj_msgSend(objj_msgSend(CPPlatformWindow, "primaryPlatformWindow"), "contentBounds");
    contentRect.size.height = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-window-height", _CPMenuView);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuBarWindow").super_class }, "initWithContentRect:styleMask:", contentRect, CPBorderlessWindowMask);
    if (self)
    {
        self._constrainsToUsableScreen = NO;
        objj_msgSend(self, "setLevel:", CPMainMenuWindowLevel);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowWidthSizable);
        var contentView = objj_msgSend(self, "contentView");
        objj_msgSend(contentView, "setAutoresizesSubviews:", NO);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        self._iconImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 16.0, 16.0));
        objj_msgSend(contentView, "addSubview:", self._iconImageView);
        self._titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._titleField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", objj_msgSend(CPFont, "systemFontSize") + 1));
        objj_msgSend(self._titleField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(self._titleField, "setTextShadowOffset:", CGSizeMake(0, 1));
        objj_msgSend(contentView, "addSubview:", self._titleField);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("setTitle:"), function $_CPMenuBarWindow__setTitle_(self, _cmd, aTitle)
{
    objj_msgSend(self._titleField, "setStringValue:", aTitle);
    objj_msgSend(self._titleField, "sizeToFit");
    objj_msgSend(self, "tile");
}
,["void","CPString"]), new objj_method(sel_getUid("setIconImage:"), function $_CPMenuBarWindow__setIconImage_(self, _cmd, anImage)
{
    objj_msgSend(self._iconImageView, "setImage:", anImage);
    objj_msgSend(self._iconImageView, "setHidden:", anImage == nil);
    objj_msgSend(self, "tile");
}
,["void","CPImage"]), new objj_method(sel_getUid("setIconImageAlphaValue:"), function $_CPMenuBarWindow__setIconImageAlphaValue_(self, _cmd, anAlphaValue)
{
    objj_msgSend(self._iconImageView, "setAlphaValue:", anAlphaValue);
}
,["void","float"]), new objj_method(sel_getUid("setColor:"), function $_CPMenuBarWindow__setColor_(self, _cmd, aColor)
{
    if (!aColor)
        objj_msgSend(objj_msgSend(self, "contentView"), "setBackgroundColor:", objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-window-background-color", _CPMenuView));
    else
        objj_msgSend(objj_msgSend(self, "contentView"), "setBackgroundColor:", aColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setTextColor:"), function $_CPMenuBarWindow__setTextColor_(self, _cmd, aColor)
{
    if (self._textColor == aColor)
        return;
    self._textColor = aColor;
    objj_msgSend(self._menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setTextColor:"), self._textColor);
    objj_msgSend(self._menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuTextColor:"), self._textColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setTitleColor:"), function $_CPMenuBarWindow__setTitleColor_(self, _cmd, aColor)
{
    if (self._titleColor == aColor)
        return;
    self._titleColor = aColor;
    objj_msgSend(self._titleField, "setTextColor:", aColor ? aColor : objj_msgSend(CPColor, "blackColor"));
}
,["void","CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPMenuBarWindow__setTextShadowColor_(self, _cmd, aColor)
{
    if (self._textShadowColor == aColor)
        return;
    self._textShadowColor = aColor;
    objj_msgSend(self._menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setTextShadowColor:"), self._textShadowColor);
    objj_msgSend(self._menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuTextShadowColor:"), self._textShadowColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setTitleShadowColor:"), function $_CPMenuBarWindow__setTitleShadowColor_(self, _cmd, aColor)
{
    if (self._titleShadowColor == aColor)
        return;
    self._titleShadowColor = aColor;
    objj_msgSend(self._titleField, "setTextShadowColor:", aColor ? aColor : objj_msgSend(CPColor, "whiteColor"));
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightColor:"), function $_CPMenuBarWindow__setHighlightColor_(self, _cmd, aColor)
{
    if (self._highlightColor == aColor)
        return;
    self._highlightColor = aColor;
    objj_msgSend(self._menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuHighlightColor:"), self._highlightColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextColor:"), function $_CPMenuBarWindow__setHighlightTextColor_(self, _cmd, aColor)
{
    if (self._highlightTextColor == aColor)
        return;
    self._highlightTextColor = aColor;
    objj_msgSend(self._menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuHighlightTextColor:"), self._highlightTextColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setHighlightTextShadowColor:"), function $_CPMenuBarWindow__setHighlightTextShadowColor_(self, _cmd, aColor)
{
    if (self._highlightTextShadowColor == aColor)
        return;
    self._highlightTextShadowColor = aColor;
    objj_msgSend(self._menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setParentMenuHighlightTextShadowColor:"), self._highlightTextShadowColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("setMenu:"), function $_CPMenuBarWindow__setMenu_(self, _cmd, aMenu)
{
    if (self._menu == aMenu)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (self._menu)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidAddItemNotification, self._menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidChangeItemNotification, self._menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidRemoveItemNotification, self._menu);
        var items = objj_msgSend(self._menu, "itemArray"),
            count = items.length;
        while (count--)
            objj_msgSend(objj_msgSend(items[count], "_menuItemView"), "removeFromSuperview");
    }
    self._menu = aMenu;
    if (self._menu)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidAddItem:"), CPMenuDidAddItemNotification, self._menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidChangeItem:"), CPMenuDidChangeItemNotification, self._menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, self._menu);
    }
    self._menuItemViews = [];
    var contentView = objj_msgSend(self, "contentView"),
        items = objj_msgSend(self._menu, "itemArray"),
        count = items.length;
    for (var index = 0; index < count; ++index)
    {
        var item = items[index],
            menuItemView = objj_msgSend(item, "_menuItemView");
        self._menuItemViews.push(menuItemView);
        objj_msgSend(menuItemView, "setTextColor:", self._textColor);
        objj_msgSend(menuItemView, "setHidden:", objj_msgSend(item, "isHidden"));
        objj_msgSend(menuItemView, "synchronizeWithMenuItem");
        objj_msgSend(contentView, "addSubview:", menuItemView);
    }
    objj_msgSend(self, "tile");
}
,["void","CPMenu"]), new objj_method(sel_getUid("menuDidChangeItem:"), function $_CPMenuBarWindow__menuDidChangeItem_(self, _cmd, aNotification)
{
    var menuItem = objj_msgSend(self._menu, "itemAtIndex:", objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex")),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(self, "tile");
}
,["void","CPNotification"]), new objj_method(sel_getUid("menuDidAddItem:"), function $_CPMenuBarWindow__menuDidAddItem_(self, _cmd, aNotification)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItem = objj_msgSend(self._menu, "itemAtIndex:", index),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(self._menuItemViews, "insertObject:atIndex:", menuItemView, index);
    objj_msgSend(menuItemView, "setTextColor:", self._textColor);
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", menuItemView);
    objj_msgSend(self, "tile");
}
,["void","CPNotification"]), new objj_method(sel_getUid("menuDidRemoveItem:"), function $_CPMenuBarWindow__menuDidRemoveItem_(self, _cmd, aNotification)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItemView = objj_msgSend(self._menuItemViews, "objectAtIndex:", index);
    objj_msgSend(self._menuItemViews, "removeObjectAtIndex:", index);
    objj_msgSend(menuItemView, "removeFromSuperview");
    objj_msgSend(self, "tile");
}
,["void","CPNotification"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $_CPMenuBarWindow__acceptsFirstMouse_(self, _cmd, anEvent)
{
    return YES;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("mouseDown:"), function $_CPMenuBarWindow__mouseDown_(self, _cmd, anEvent)
{
    var constraintRect = CGRectInset(objj_msgSend(objj_msgSend(self, "platformWindow"), "visibleFrame"), 5.0, 0.0);
    constraintRect.size.height -= 5.0;
    objj_msgSend(objj_msgSend(_CPMenuManager, "sharedMenuManager"), "beginTracking:menuContainer:constraintRect:callback:", anEvent, self, constraintRect, function(aMenuContainer, aMenu)
    {
        objj_msgSend(aMenu, "_performActionOfHighlightedItemChain");
        objj_msgSend(aMenu, "_highlightItemAtIndex:", CPNotFound);
    });
}
,["void","CPEvent"]), new objj_method(sel_getUid("font"), function $_CPMenuBarWindow__font(self, _cmd)
{
    objj_msgSend(CPFont, "systemFontOfSize:", objj_msgSend(CPFont, "systemFontSize"));
}
,["CPFont"]), new objj_method(sel_getUid("tile"), function $_CPMenuBarWindow__tile(self, _cmd)
{
    var items = objj_msgSend(self._menu, "itemArray"),
        index = 0,
        count = items.length,
        x = objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-window-left-margin", _CPMenuView),
        y = 0.0,
        isLeftAligned = YES;
    for (; index < count; ++index)
    {
        var item = items[index];
        if (objj_msgSend(item, "isSeparatorItem"))
        {
            x = CGRectGetWidth(objj_msgSend(self, "frame")) - objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-window-right-margin", _CPMenuView);
            isLeftAligned = NO;
            continue;
        }
        if (objj_msgSend(item, "isHidden"))
            continue;
        var menuItemView = objj_msgSend(item, "_menuItemView"),
            frame = objj_msgSend(menuItemView, "frame");
        if (isLeftAligned)
        {
            objj_msgSend(menuItemView, "setFrame:", CGRectMake(x, 0.0, CGRectGetWidth(frame), objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-window-height", _CPMenuView)));
            x += CGRectGetWidth(objj_msgSend(menuItemView, "frame"));
        }
        else
        {
            objj_msgSend(menuItemView, "setFrame:", CGRectMake(x - CGRectGetWidth(frame), 0.0, CGRectGetWidth(frame), objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-window-height", _CPMenuView)));
            x = CGRectGetMinX(objj_msgSend(menuItemView, "frame"));
        }
    }
    var bounds = objj_msgSend(objj_msgSend(self, "contentView"), "bounds"),
        titleFrame = objj_msgSend(self._titleField, "frame");
    if (objj_msgSend(self._iconImageView, "isHidden"))
        objj_msgSend(self._titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(titleFrame)) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0));
    else
    {
        var iconFrame = objj_msgSend(self._iconImageView, "frame"),
            iconWidth = CGRectGetWidth(iconFrame),
            totalWidth = iconWidth + CGRectGetWidth(titleFrame);
        objj_msgSend(self._iconImageView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(iconFrame)) / 2.0));
        objj_msgSend(self._titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0 + iconWidth, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0));
    }
}
,["void"]), new objj_method(sel_getUid("setFrame:display:animate:"), function $_CPMenuBarWindow__setFrame_display_animate_(self, _cmd, aRect, shouldDisplay, shouldAnimate)
{
    var size = objj_msgSend(self, "frame").size;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPMenuBarWindow").super_class }, "setFrame:display:animate:", aRect, shouldDisplay, shouldAnimate);
    if (!CGSizeEqualToSize(size, aRect.size))
        objj_msgSend(self, "tile");
}
,["void","CGRect","BOOL","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("font"), function $_CPMenuBarWindow__font(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPTheme, "defaultTheme"), "valueForAttributeWithName:forClass:", "menu-bar-window-font", _CPMenuView);
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
    return objj_msgSend(self, "frame");
}
,["CGRect"]), new objj_method(sel_getUid("scrollingStateForPoint:"), function $_CPMenuBarWindow__scrollingStateForPoint_(self, _cmd, aGlobalLocation)
{
    return _CPMenuManagerScrollingStateNone;
}
,["_CPManagerScrollingState","CGPoint"]), new objj_method(sel_getUid("itemIndexAtPoint:"), function $_CPMenuBarWindow__itemIndexAtPoint_(self, _cmd, aPoint)
{
    var items = objj_msgSend(self._menu, "itemArray"),
        index = items.length;
    while (index--)
    {
        var item = items[index];
        if (objj_msgSend(item, "isHidden") || objj_msgSend(item, "isSeparatorItem"))
            continue;
        if (CGRectContainsPoint(objj_msgSend(self, "rectForItemAtIndex:", index), aPoint))
            return index;
    }
    return CPNotFound;
}
,["CPInteger","CGPoint"]), new objj_method(sel_getUid("rectForItemAtIndex:"), function $_CPMenuBarWindow__rectForItemAtIndex_(self, _cmd, anIndex)
{
    var menuItem = objj_msgSend(self._menu, "itemAtIndex:", anIndex === CPNotFound ? 0 : anIndex);
    return objj_msgSend(objj_msgSend(menuItem, "_menuItemView"), "frame");
}
,["CGRect","CPInteger"])]);
}