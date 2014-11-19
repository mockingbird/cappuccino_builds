@STATIC;1.0;i;7;CPBox.ji;20;CPSegmentedControl.ji;15;CPTabViewItem.ji;8;CPView.jt;21154;objj_executeFile("CPBox.j", YES);objj_executeFile("CPSegmentedControl.j", YES);objj_executeFile("CPTabViewItem.j", YES);objj_executeFile("CPView.j", YES);CPTopTabsBezelBorder = 0;
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
        self._items = CPArray.isa.objj_msgSend0(CPArray, "array");
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTabViewType:", CPTopTabsBezelBorder));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $CPTabView___init(self, _cmd)
{
    self._selectedIndex = CPNotFound;
    self._tabs = ((___r1 = CPSegmentedControl.isa.objj_msgSend0(CPSegmentedControl, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 0, 0, 0)));
    ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHitTests:", NO));
    var height = ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForThemeAttribute:", "min-size")).height;
    ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(0, height)));
    self._box = ((___r1 = CPBox.isa.objj_msgSend0(CPBox, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", self.isa.objj_msgSend0(self, "bounds")));
    self.isa.objj_msgSend1(self, "setBackgroundColor:", CPColor.isa.objj_msgSend2(CPColor, "colorWithCalibratedWhite:alpha:", 0.95, 1.0));
    self.isa.objj_msgSend1(self, "addSubview:", self._box);
    self.isa.objj_msgSend1(self, "addSubview:", self._tabs);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("addTabViewItem:"), function $CPTabView__addTabViewItem_(self, _cmd, aTabViewItem)
{
    self.isa.objj_msgSend2(self, "insertTabViewItem:atIndex:", aTabViewItem, ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")));
    var ___r1;
}
,["void","CPTabViewItem"]), new objj_method(sel_getUid("insertTabViewItem:atIndex:"), function $CPTabView__insertTabViewItem_atIndex_(self, _cmd, aTabViewItem, anIndex)
{
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", aTabViewItem, anIndex));
    self.isa.objj_msgSend0(self, "_updateItems");
    self.isa.objj_msgSend0(self, "_repositionTabs");
    (aTabViewItem == null ? null : aTabViewItem.isa.objj_msgSend1(aTabViewItem, "_setTabView:", self));
    if (self._delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "tabViewDidChangeNumberOfTabViewItems:", self));
    var ___r1;
}
,["void","CPTabViewItem","CPUInteger"]), new objj_method(sel_getUid("removeTabViewItem:"), function $CPTabView__removeTabViewItem_(self, _cmd, aTabViewItem)
{
    var count = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    for (var i = 0; i < count; i++)
    {
        if (((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", i)) === aTabViewItem)
        {
            ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", i));
            break;
        }
    }
    self.isa.objj_msgSend0(self, "_updateItems");
    self.isa.objj_msgSend0(self, "_repositionTabs");
    (aTabViewItem == null ? null : aTabViewItem.isa.objj_msgSend1(aTabViewItem, "_setTabView:", nil));
    if (self._delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "tabViewDidChangeNumberOfTabViewItems:", self));
    var ___r1;
}
,["void","CPTabViewItem"]), new objj_method(sel_getUid("indexOfTabViewItem:"), function $CPTabView__indexOfTabViewItem_(self, _cmd, aTabViewItem)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aTabViewItem));
    var ___r1;
}
,["int","CPTabViewItem"]), new objj_method(sel_getUid("indexOfTabViewItemWithIdentifier:"), function $CPTabView__indexOfTabViewItemWithIdentifier_(self, _cmd, anIdentifier)
{
    for (var index = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")); index >= 0; index--)
        if (((___r1 = ((___r2 = self._items[index]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "identifier"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", anIdentifier)))
            return index;
    return CPNotFound;
    var ___r1, ___r2;
}
,["int","CPString"]), new objj_method(sel_getUid("numberOfTabViewItems"), function $CPTabView__numberOfTabViewItems(self, _cmd)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    var ___r1;
}
,["unsigned"]), new objj_method(sel_getUid("tabViewItemAtIndex:"), function $CPTabView__tabViewItemAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", anIndex));
    var ___r1;
}
,["CPTabViewItem","CPUInteger"]), new objj_method(sel_getUid("tabViewItems"), function $CPTabView__tabViewItems(self, _cmd)
{
    return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("selectFirstTabViewItem:"), function $CPTabView__selectFirstTabViewItem_(self, _cmd, aSender)
{
    if (((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) === 0)
        return;
    self.isa.objj_msgSend1(self, "selectTabViewItemAtIndex:", 0);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("selectLastTabViewItem:"), function $CPTabView__selectLastTabViewItem_(self, _cmd, aSender)
{
    if (((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) === 0)
        return;
    self.isa.objj_msgSend1(self, "selectTabViewItemAtIndex:", ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("selectNextTabViewItem:"), function $CPTabView__selectNextTabViewItem_(self, _cmd, aSender)
{
    if (self._selectedIndex === CPNotFound)
        return;
    var nextIndex = self._selectedIndex + 1;
    if (nextIndex === ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        return;
    self.isa.objj_msgSend1(self, "selectTabViewItemAtIndex:", nextIndex);
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("selectPreviousTabViewItem:"), function $CPTabView__selectPreviousTabViewItem_(self, _cmd, aSender)
{
    if (self._selectedIndex === CPNotFound)
        return;
    var previousIndex = self._selectedIndex - 1;
    if (previousIndex < 0)
        return;
    self.isa.objj_msgSend1(self, "selectTabViewItemAtIndex:", previousIndex);
}
,["void","id"]), new objj_method(sel_getUid("selectTabViewItem:"), function $CPTabView__selectTabViewItem_(self, _cmd, aTabViewItem)
{
    self.isa.objj_msgSend1(self, "selectTabViewItemAtIndex:", self.isa.objj_msgSend1(self, "indexOfTabViewItem:", aTabViewItem));
}
,["void","CPTabViewItem"]), new objj_method(sel_getUid("selectTabViewItemAtIndex:"), function $CPTabView__selectTabViewItemAtIndex_(self, _cmd, anIndex)
{
    if (anIndex === self._selectedIndex)
        return;
    var aTabViewItem = self.isa.objj_msgSend1(self, "tabViewItemAtIndex:", anIndex);
    if (self._delegateSelectors & CPTabViewShouldSelectTabViewItemSelector && !((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tabView:shouldSelectTabViewItem:", self, aTabViewItem)))
        return NO;
    if (self._delegateSelectors & CPTabViewWillSelectTabViewItemSelector)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tabView:willSelectTabViewItem:", self, aTabViewItem));
    ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectSegmentWithTag:", anIndex));
    self.isa.objj_msgSend1(self, "_setSelectedIndex:", anIndex);
    if (self._delegateSelectors & CPTabViewDidSelectTabViewItemSelector)
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "tabView:didSelectTabViewItem:", self, aTabViewItem));
    return YES;
    var ___r1;
}
,["BOOL","CPUInteger"]), new objj_method(sel_getUid("selectedTabViewItem"), function $CPTabView__selectedTabViewItem(self, _cmd)
{
    if (self._selectedIndex != CPNotFound)
        return ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", self._selectedIndex));
    return nil;
    var ___r1;
}
,["CPTabViewItem"]), new objj_method(sel_getUid("font"), function $CPTabView__font(self, _cmd)
{
    return self._font;
}
,["CPFont"]), new objj_method(sel_getUid("setFont:"), function $CPTabView__setFont_(self, _cmd, font)
{
    if (((___r1 = self._font), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", font)))
        return;
    self._font = font;
    ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", self._font));
    var ___r1;
}
,["void","CPFont"]), new objj_method(sel_getUid("setTabViewType:"), function $CPTabView__setTabViewType_(self, _cmd, aTabViewType)
{
    if (self._type === aTabViewType)
        return;
    self._type = aTabViewType;
    if (self._type !== CPTopTabsBezelBorder && self._type !== CPBottomTabsBezelBorder)
        ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    else
        self.isa.objj_msgSend1(self, "addSubview:", self._tabs);
    switch(self._type) {
    case CPTopTabsBezelBorder:
    case CPBottomTabsBezelBorder:
    case CPNoTabsBezelBorder:
        ((___r1 = self._box), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBorderType:", CPBezelBorder));
        break;
    case CPNoTabsLineBorder:
        ((___r1 = self._box), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBorderType:", CPLineBorder));
        break;
    case CPNoTabsNoBorder:
        ((___r1 = self._box), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBorderType:", CPNoBorder));
        break;
    }
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPTabViewType"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTabView__layoutSubviews(self, _cmd)
{
    if (self._type !== CPTopTabsBezelBorder && self._type !== CPBottomTabsBezelBorder)
    {
        ((___r1 = self._box), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", self.isa.objj_msgSend0(self, "bounds")));
    }
    else
    {
        var aFrame = self.isa.objj_msgSend0(self, "frame"),
            segmentedHeight = CGRectGetHeight(((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))),
            origin = self._type === CPTopTabsBezelBorder ? segmentedHeight / 2 : 0;
        ((___r1 = self._box), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0, origin, CGRectGetWidth(aFrame), CGRectGetHeight(aFrame) - segmentedHeight / 2)));
        self.isa.objj_msgSend0(self, "_updateItems");
        self.isa.objj_msgSend0(self, "_repositionTabs");
    }
    var ___r1;
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
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tabView:shouldSelectTabViewItem:"))))
        self._delegateSelectors |= CPTabViewShouldSelectTabViewItemSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tabView:willSelectTabViewItem:"))))
        self._delegateSelectors |= CPTabViewWillSelectTabViewItemSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tabView:didSelectTabViewItem:"))))
        self._delegateSelectors |= CPTabViewDidSelectTabViewItemSelector;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("tabViewDidChangeNumberOfTabViewItems:"))))
        self._delegateSelectors |= CPTabViewDidChangeNumberOfTabViewItemsSelector;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setBackgroundColor:"), function $CPTabView__setBackgroundColor_(self, _cmd, aColor)
{
    ((___r1 = self._box), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", aColor));
    var ___r1;
}
,["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $CPTabView__backgroundColor(self, _cmd)
{
    return ((___r1 = self._box), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "backgroundColor"));
    var ___r1;
}
,["CPColor"]), new objj_method(sel_getUid("mouseDown:"), function $CPTabView__mouseDown_(self, _cmd, anEvent)
{
    var segmentIndex = ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "testSegment:", ((___r2 = self._tabs), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil))));
    if (segmentIndex != CPNotFound && self.isa.objj_msgSend1(self, "selectTabViewItemAtIndex:", segmentIndex))
        ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "trackSegment:", anEvent));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("_repositionTabs"), function $CPTabView___repositionTabs(self, _cmd)
{
    var horizontalCenterOfSelf = CGRectGetWidth(self.isa.objj_msgSend0(self, "bounds")) / 2,
        verticalCenterOfTabs = CGRectGetHeight(((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds"))) / 2;
    if (self._type === CPBottomTabsBezelBorder)
        ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", CGPointMake(horizontalCenterOfSelf, CGRectGetHeight(self.isa.objj_msgSend0(self, "bounds")) - verticalCenterOfTabs)));
    else
        ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCenter:", CGPointMake(horizontalCenterOfSelf, verticalCenterOfTabs)));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_setSelectedIndex:"), function $CPTabView___setSelectedIndex_(self, _cmd, index)
{
    self._selectedIndex = index;
    self.isa.objj_msgSend1(self, "_setContentViewFromItem:", ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", self._selectedIndex)));
    var ___r1;
}
,["void","CPNumber"]), new objj_method(sel_getUid("_setContentViewFromItem:"), function $CPTabView___setContentViewFromItem_(self, _cmd, anItem)
{
    ((___r1 = self._box), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContentView:", (anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "view"))));
    var ___r1;
}
,["void","CPTabViewItem"]), new objj_method(sel_getUid("_updateItems"), function $CPTabView___updateItems(self, _cmd)
{
    var count = ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSegmentCount:", count));
    for (var i = 0; i < count; i++)
    {
        ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setLabel:forSegment:", ((___r2 = ((___r3 = self._items), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectAtIndex:", i))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "label")), i));
        ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setTag:forSegment:", i, i));
    }
    if (self._selectedIndex === CPNotFound)
        self.isa.objj_msgSend1(self, "selectFirstTabViewItem:", self);
    var ___r1, ___r2, ___r3;
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
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
        self._font = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTabViewFontKey));
        ((___r1 = self._tabs), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", self._font));
        self._items = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTabViewItemsKey));
        ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("_setTabView:"), self));
        (self == null ? null : self.isa.objj_msgSend1(self, "setDelegate:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTabViewDelegateKey))));
        self.selectOnAwake = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTabViewSelectedItemKey));
        self._type = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPTabViewTypeKey));
    }
    return self;
    var ___r1;
}
,["id","CPCoder"]), new objj_method(sel_getUid("awakeFromCib"), function $CPTabView__awakeFromCib(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_updateItems");
    if (self.selectOnAwake)
    {
        self.isa.objj_msgSend1(self, "selectTabViewItem:", self.selectOnAwake);
        delete self.selectOnAwake;
    }
    var type = self._type;
    self._type = nil;
    self.isa.objj_msgSend1(self, "setTabViewType:", type);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTabView__encodeWithCoder_(self, _cmd, aCoder)
{
    var subviews = self.isa.objj_msgSend0(self, "subviews");
    ((___r1 = self._box), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTabView").super_class }, "encodeWithCoder:", aCoder);
    self.isa.objj_msgSend1(self, "setSubviews:", subviews);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._items, CPTabViewItemsKey));
    var selected = self.isa.objj_msgSend0(self, "selectedTabViewItem");
    if (selected)
        (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", selected, CPTabViewSelectedItemKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self._type, CPTabViewTypeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._font, CPTabViewFontKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeConditionalObject:forKey:", self._delegate, CPTabViewDelegateKey));
    var ___r1;
}
,["void","CPCoder"])]);
}