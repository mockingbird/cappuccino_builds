@STATIC;1.0;i;7;CPBox.ji;20;CPSegmentedControl.ji;15;CPTabViewItem.ji;8;CPView.jt;16391;objj_executeFile("CPBox.j", YES);objj_executeFile("CPSegmentedControl.j", YES);objj_executeFile("CPTabViewItem.j", YES);objj_executeFile("CPView.j", YES);CPTopTabsBezelBorder = 0;
CPBottomTabsBezelBorder = 2;
CPNoTabsBezelBorder = 4;
CPNoTabsLineBorder = 5;
CPNoTabsNoBorder = 6;
var CPTabViewDidSelectTabViewItemSelector = 1 << 1,
    CPTabViewShouldSelectTabViewItemSelector = 1 << 2,
    CPTabViewWillSelectTabViewItemSelector = 1 << 3,
    CPTabViewDidChangeNumberOfTabViewItemsSelector = 1 << 4;
{var the_protocol = objj_allocateProtocol("CPTabViewDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPTabViewDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}{var the_class = objj_allocateClassPair(CPView, "CPTabView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_items"), new objj_ivar("_tabs"), new objj_ivar("_box"), new objj_ivar("_selectedIndex"), new objj_ivar("_type"), new objj_ivar("_font"), new objj_ivar("_delegate"), new objj_ivar("_delegateSelectors")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPTabView__initWithFrame_(self, _cmd, aFrame)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTabView").super_class }, "initWithFrame:", aFrame))
    {
        self._items = objj_msgSend(CPArray, "array");
        objj_msgSend(self, "_init");
        objj_msgSend(self, "setTabViewType:", CPTopTabsBezelBorder);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPTabView___init(self, _cmd)
{
    self._selectedIndex = CPNotFound;
    self._tabs = objj_msgSend(objj_msgSend(CPSegmentedControl, "alloc"), "initWithFrame:", CGRectMake(0, 0, 0, 0));
    objj_msgSend(self._tabs, "setHitTests:", NO);
    var height = objj_msgSend(self._tabs, "valueForThemeAttribute:", "default-height");
    objj_msgSend(self._tabs, "setFrameSize:", CGSizeMake(0, height));
    self._box = objj_msgSend(objj_msgSend(CPBox, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedWhite:alpha:", 0.95, 1.0));
    objj_msgSend(self, "addSubview:", self._box);
    objj_msgSend(self, "addSubview:", self._tabs);
}
,["void"]), new objj_method(sel_getUid("addTabViewItem:"), function $CPTabView__addTabViewItem_(self, _cmd, aTabViewItem)
{
    objj_msgSend(self, "insertTabViewItem:atIndex:", aTabViewItem, objj_msgSend(self._items, "count"));
}
,["void","CPTabViewItem"]), new objj_method(sel_getUid("insertTabViewItem:atIndex:"), function $CPTabView__insertTabViewItem_atIndex_(self, _cmd, aTabViewItem, anIndex)
{
    objj_msgSend(self._items, "insertObject:atIndex:", aTabViewItem, anIndex);
    objj_msgSend(self, "_updateItems");
    objj_msgSend(self, "_repositionTabs");
    objj_msgSend(aTabViewItem, "_setTabView:", self);
    if (self._delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        objj_msgSend(self._delegate, "tabViewDidChangeNumberOfTabViewItems:", self);
}
,["void","CPTabViewItem","CPUInteger"]), new objj_method(sel_getUid("removeTabViewItem:"), function $CPTabView__removeTabViewItem_(self, _cmd, aTabViewItem)
{
    var count = objj_msgSend(self._items, "count");
    for (var i = 0; i < count; i++)
    {
        if (objj_msgSend(self._items, "objectAtIndex:", i) === aTabViewItem)
        {
            objj_msgSend(self._items, "removeObjectAtIndex:", i);
            break;
        }
    }
    objj_msgSend(self, "_updateItems");
    objj_msgSend(self, "_repositionTabs");
    objj_msgSend(aTabViewItem, "_setTabView:", nil);
    if (self._delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        objj_msgSend(self._delegate, "tabViewDidChangeNumberOfTabViewItems:", self);
}
,["void","CPTabViewItem"]), new objj_method(sel_getUid("indexOfTabViewItem:"), function $CPTabView__indexOfTabViewItem_(self, _cmd, aTabViewItem)
{
    return objj_msgSend(self._items, "indexOfObjectIdenticalTo:", aTabViewItem);
}
,["int","CPTabViewItem"]), new objj_method(sel_getUid("indexOfTabViewItemWithIdentifier:"), function $CPTabView__indexOfTabViewItemWithIdentifier_(self, _cmd, anIdentifier)
{
    for (var index = objj_msgSend(self._items, "count"); index >= 0; index--)
        if (objj_msgSend(objj_msgSend(self._items[index], "identifier"), "isEqual:", anIdentifier))
            return index;
    return CPNotFound;
}
,["int","CPString"]), new objj_method(sel_getUid("numberOfTabViewItems"), function $CPTabView__numberOfTabViewItems(self, _cmd)
{
    return objj_msgSend(self._items, "count");
}
,["unsigned"]), new objj_method(sel_getUid("tabViewItemAtIndex:"), function $CPTabView__tabViewItemAtIndex_(self, _cmd, anIndex)
{
    return objj_msgSend(self._items, "objectAtIndex:", anIndex);
}
,["CPTabViewItem","CPUInteger"]), new objj_method(sel_getUid("tabViewItems"), function $CPTabView__tabViewItems(self, _cmd)
{
    return objj_msgSend(self._items, "copy");
}
,["CPArray"]), new objj_method(sel_getUid("selectFirstTabViewItem:"), function $CPTabView__selectFirstTabViewItem_(self, _cmd, aSender)
{
    if (objj_msgSend(self._items, "count") === 0)
        return;
    objj_msgSend(self, "selectTabViewItemAtIndex:", 0);
}
,["void","id"]), new objj_method(sel_getUid("selectLastTabViewItem:"), function $CPTabView__selectLastTabViewItem_(self, _cmd, aSender)
{
    if (objj_msgSend(self._items, "count") === 0)
        return;
    objj_msgSend(self, "selectTabViewItemAtIndex:", objj_msgSend(self._items, "count") - 1);
}
,["void","id"]), new objj_method(sel_getUid("selectNextTabViewItem:"), function $CPTabView__selectNextTabViewItem_(self, _cmd, aSender)
{
    if (self._selectedIndex === CPNotFound)
        return;
    var nextIndex = self._selectedIndex + 1;
    if (nextIndex === objj_msgSend(self._items, "count"))
        return;
    objj_msgSend(self, "selectTabViewItemAtIndex:", nextIndex);
}
,["void","id"]), new objj_method(sel_getUid("selectPreviousTabViewItem:"), function $CPTabView__selectPreviousTabViewItem_(self, _cmd, aSender)
{
    if (self._selectedIndex === CPNotFound)
        return;
    var previousIndex = self._selectedIndex - 1;
    if (previousIndex < 0)
        return;
    objj_msgSend(self, "selectTabViewItemAtIndex:", previousIndex);
}
,["void","id"]), new objj_method(sel_getUid("selectTabViewItem:"), function $CPTabView__selectTabViewItem_(self, _cmd, aTabViewItem)
{
    objj_msgSend(self, "selectTabViewItemAtIndex:", objj_msgSend(self, "indexOfTabViewItem:", aTabViewItem));
}
,["void","CPTabViewItem"]), new objj_method(sel_getUid("selectTabViewItemAtIndex:"), function $CPTabView__selectTabViewItemAtIndex_(self, _cmd, anIndex)
{
    if (anIndex === self._selectedIndex)
        return;
    var aTabViewItem = objj_msgSend(self, "tabViewItemAtIndex:", anIndex);
    if (self._delegateSelectors & CPTabViewShouldSelectTabViewItemSelector && !objj_msgSend(self._delegate, "tabView:shouldSelectTabViewItem:", self, aTabViewItem))
        return NO;
    if (self._delegateSelectors & CPTabViewWillSelectTabViewItemSelector)
        objj_msgSend(self._delegate, "tabView:willSelectTabViewItem:", self, aTabViewItem);
    objj_msgSend(self._tabs, "selectSegmentWithTag:", anIndex);
    objj_msgSend(self, "_setSelectedIndex:", anIndex);
    if (self._delegateSelectors & CPTabViewDidSelectTabViewItemSelector)
        objj_msgSend(self._delegate, "tabView:didSelectTabViewItem:", self, aTabViewItem);
    return YES;
}
,["BOOL","CPUInteger"]), new objj_method(sel_getUid("selectedTabViewItem"), function $CPTabView__selectedTabViewItem(self, _cmd)
{
    if (self._selectedIndex != CPNotFound)
        return objj_msgSend(self._items, "objectAtIndex:", self._selectedIndex);
    return nil;
}
,["CPTabViewItem"]), new objj_method(sel_getUid("font"), function $CPTabView__font(self, _cmd)
{
    return self._font;
}
,["CPFont"]), new objj_method(sel_getUid("setFont:"), function $CPTabView__setFont_(self, _cmd, font)
{
    if (objj_msgSend(self._font, "isEqual:", font))
        return;
    self._font = font;
    objj_msgSend(self._tabs, "setFont:", self._font);
}
,["void","CPFont"]), new objj_method(sel_getUid("setTabViewType:"), function $CPTabView__setTabViewType_(self, _cmd, aTabViewType)
{
    if (self._type === aTabViewType)
        return;
    self._type = aTabViewType;
    if (self._type !== CPTopTabsBezelBorder && self._type !== CPBottomTabsBezelBorder)
        objj_msgSend(self._tabs, "removeFromSuperview");
    else
        objj_msgSend(self, "addSubview:", self._tabs);
    switch(self._type) {
    case CPTopTabsBezelBorder:
    case CPBottomTabsBezelBorder:
    case CPNoTabsBezelBorder:
        objj_msgSend(self._box, "setBorderType:", CPBezelBorder);
        break;
    case CPNoTabsLineBorder:
        objj_msgSend(self._box, "setBorderType:", CPLineBorder);
        break;
    case CPNoTabsNoBorder:
        objj_msgSend(self._box, "setBorderType:", CPNoBorder);
        break;
    }
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPTabViewType"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTabView__layoutSubviews(self, _cmd)
{
    if (self._type !== CPTopTabsBezelBorder && self._type !== CPBottomTabsBezelBorder)
    {
        objj_msgSend(self._box, "setFrame:", objj_msgSend(self, "bounds"));
    }
    else
    {
        var aFrame = objj_msgSend(self, "frame"),
            segmentedHeight = CGRectGetHeight(objj_msgSend(self._tabs, "frame")),
            origin = self._type === CPTopTabsBezelBorder ? segmentedHeight / 2 : 0;
        objj_msgSend(self._box, "setFrame:", CGRectMake(0, origin, CGRectGetWidth(aFrame), CGRectGetHeight(aFrame) - segmentedHeight / 2));
        objj_msgSend(self, "_repositionTabs");
    }
}
,["void"]), new objj_method(sel_getUid("tabViewType"), function $CPTabView__tabViewType(self, _cmd)
{
    return self._type;
}
,["CPTabViewType"]), new objj_method(sel_getUid("delegate"), function $CPTabView__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPTabView__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate == aDelegate)
        return;
    self._delegate = aDelegate;
    self._delegateSelectors = 0;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tabView:shouldSelectTabViewItem:")))
        self._delegateSelectors |= CPTabViewShouldSelectTabViewItemSelector;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tabView:willSelectTabViewItem:")))
        self._delegateSelectors |= CPTabViewWillSelectTabViewItemSelector;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tabView:didSelectTabViewItem:")))
        self._delegateSelectors |= CPTabViewDidSelectTabViewItemSelector;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("tabViewDidChangeNumberOfTabViewItems:")))
        self._delegateSelectors |= CPTabViewDidChangeNumberOfTabViewItemsSelector;
}
,["void","id"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPTabView__setBackgroundColor_(self, _cmd, aColor)
{
    objj_msgSend(self._box, "setBackgroundColor:", aColor);
}
,["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPTabView__backgroundColor(self, _cmd)
{
    return objj_msgSend(self._box, "backgroundColor");
}
,["CPColor"]), new objj_method(sel_getUid("mouseDown:"), function $CPTabView__mouseDown_(self, _cmd, anEvent)
{
    var segmentIndex = objj_msgSend(self._tabs, "testSegment:", objj_msgSend(self._tabs, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil));
    if (segmentIndex != CPNotFound && objj_msgSend(self, "selectTabViewItemAtIndex:", segmentIndex))
        objj_msgSend(self._tabs, "trackSegment:", anEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("_repositionTabs"), function $CPTabView___repositionTabs(self, _cmd)
{
    var horizontalCenterOfSelf = CGRectGetWidth(objj_msgSend(self, "bounds")) / 2,
        verticalCenterOfTabs = CGRectGetHeight(objj_msgSend(self._tabs, "bounds")) / 2;
    if (self._type === CPBottomTabsBezelBorder)
        objj_msgSend(self._tabs, "setCenter:", CGPointMake(horizontalCenterOfSelf, CGRectGetHeight(objj_msgSend(self, "bounds")) - verticalCenterOfTabs));
    else
        objj_msgSend(self._tabs, "setCenter:", CGPointMake(horizontalCenterOfSelf, verticalCenterOfTabs));
}
,["void"]), new objj_method(sel_getUid("_setSelectedIndex:"), function $CPTabView___setSelectedIndex_(self, _cmd, index)
{
    self._selectedIndex = index;
    objj_msgSend(self, "_setContentViewFromItem:", objj_msgSend(self._items, "objectAtIndex:", self._selectedIndex));
}
,["void","CPNumber"]), new objj_method(sel_getUid("_setContentViewFromItem:"), function $CPTabView___setContentViewFromItem_(self, _cmd, anItem)
{
    objj_msgSend(self._box, "setContentView:", objj_msgSend(anItem, "view"));
}
,["void","CPTabViewItem"]), new objj_method(sel_getUid("_updateItems"), function $CPTabView___updateItems(self, _cmd)
{
    var count = objj_msgSend(self._items, "count");
    objj_msgSend(self._tabs, "setSegmentCount:", count);
    for (var i = 0; i < count; i++)
    {
        objj_msgSend(self._tabs, "setLabel:forSegment:", objj_msgSend(objj_msgSend(self._items, "objectAtIndex:", i), "label"), i);
        objj_msgSend(self._tabs, "setTag:forSegment:", i, i);
    }
    if (self._selectedIndex === CPNotFound)
        objj_msgSend(self, "selectFirstTabViewItem:", self);
}
,["void"])]);
}var CPTabViewItemsKey = "CPTabViewItemsKey",
    CPTabViewSelectedItemKey = "CPTabViewSelectedItemKey",
    CPTabViewTypeKey = "CPTabViewTypeKey",
    CPTabViewFontKey = "CPTabViewFontKey",
    CPTabViewDelegateKey = "CPTabViewDelegateKey";
{
var the_class = objj_getClass("CPTabView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTabView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTabView__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTabView").super_class }, "initWithCoder:", aCoder))
    {
        objj_msgSend(self, "_init");
        self._font = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewFontKey);
        objj_msgSend(self._tabs, "setFont:", self._font);
        self._items = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemsKey);
        objj_msgSend(self._items, "makeObjectsPerformSelector:withObject:", sel_getUid("_setTabView:"), self);
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewDelegateKey));
        self.selectOnAwake = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewSelectedItemKey);
        self._type = objj_msgSend(aCoder, "decodeIntForKey:", CPTabViewTypeKey);
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("awakeFromCib"), function $CPTabView__awakeFromCib(self, _cmd)
{
    objj_msgSend(self, "_updateItems");
    if (self.selectOnAwake)
    {
        objj_msgSend(self, "selectTabViewItem:", self.selectOnAwake);
        delete self.selectOnAwake;
    }
    var type = self._type;
    self._type = nil;
    objj_msgSend(self, "setTabViewType:", type);
    objj_msgSend(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTabView__encodeWithCoder_(self, _cmd, aCoder)
{
    var subviews = objj_msgSend(self, "subviews");
    objj_msgSend(self._box, "removeFromSuperview");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTabView").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(self, "setSubviews:", subviews);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._items, CPTabViewItemsKey);
    var selected = objj_msgSend(self, "selectedTabViewItem");
    if (selected)
        objj_msgSend(aCoder, "encodeObject:forKey:", selected, CPTabViewSelectedItemKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", self._type, CPTabViewTypeKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._font, CPTabViewFontKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", self._delegate, CPTabViewDelegateKey);
}
,["void","CPCoder"])]);
}