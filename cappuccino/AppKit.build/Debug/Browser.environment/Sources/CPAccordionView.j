@STATIC;1.0;I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;32;Foundation/CPKeyValueObserving.jI;23;Foundation/CPIndexSet.jI;21;Foundation/CPString.ji;8;CPView.ji;10;CPButton.jt;14888;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPKeyValueObserving.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPView.j", YES);objj_executeFile("CPButton.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPAccordionViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_view"), new objj_ivar("_label")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("identifier"), function $CPAccordionViewItem__identifier(self, _cmd)
{
    return self._identifier;
}
,["CPString"]), new objj_method(sel_getUid("setIdentifier:"), function $CPAccordionViewItem__setIdentifier_(self, _cmd, newValue)
{
    self._identifier = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("view"), function $CPAccordionViewItem__view(self, _cmd)
{
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("setView:"), function $CPAccordionViewItem__setView_(self, _cmd, newValue)
{
    self._view = newValue;
}
,["void","CPView"]), new objj_method(sel_getUid("label"), function $CPAccordionViewItem__label(self, _cmd)
{
    return self._label;
}
,["CPString"]), new objj_method(sel_getUid("setLabel:"), function $CPAccordionViewItem__setLabel_(self, _cmd, newValue)
{
    self._label = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("init"), function $CPAccordionViewItem__init(self, _cmd)
{
    return objj_msgSend(self, "initWithIdentifier:", "");
}
,["id"]), new objj_method(sel_getUid("initWithIdentifier:"), function $CPAccordionViewItem__initWithIdentifier_(self, _cmd, anIdentifier)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAccordionViewItem").super_class }, "init");
    if (self)
        objj_msgSend(self, "setIdentifier:", anIdentifier);
    return self;
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(CPView, "CPAccordionView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dirtyItemIndex"), new objj_ivar("_itemHeaderPrototype"), new objj_ivar("_items"), new objj_ivar("_itemViews"), new objj_ivar("_expandedItemIndexes")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $CPAccordionView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAccordionView").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        self._items = [];
        self._itemViews = [];
        self._expandedItemIndexes = objj_msgSend(CPIndexSet, "indexSet");
        objj_msgSend(self, "setItemHeaderPrototype:", objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 100.0, 24.0)));
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setItemHeaderPrototype:"), function $CPAccordionView__setItemHeaderPrototype_(self, _cmd, aView)
{
    self._itemHeaderPrototype = aView;
}
,["void","CPView"]), new objj_method(sel_getUid("itemHeaderPrototype"), function $CPAccordionView__itemHeaderPrototype(self, _cmd)
{
    return self._itemHeaderPrototype;
}
,["CPView"]), new objj_method(sel_getUid("items"), function $CPAccordionView__items(self, _cmd)
{
    return self._items;
}
,["CPArray"]), new objj_method(sel_getUid("addItem:"), function $CPAccordionView__addItem_(self, _cmd, anItem)
{
    objj_msgSend(self, "insertItem:atIndex:", anItem, self._items.length);
}
,["void","CPAccordionViewItem"]), new objj_method(sel_getUid("insertItem:atIndex:"), function $CPAccordionView__insertItem_atIndex_(self, _cmd, anItem, anIndex)
{
    objj_msgSend(self._expandedItemIndexes, "addIndex:", anIndex);
    var itemView = objj_msgSend(objj_msgSend(_CPAccordionItemView, "alloc"), "initWithAccordionView:", self);
    objj_msgSend(itemView, "setIndex:", anIndex);
    objj_msgSend(itemView, "setLabel:", objj_msgSend(anItem, "label"));
    objj_msgSend(itemView, "setContentView:", objj_msgSend(anItem, "view"));
    objj_msgSend(self, "addSubview:", itemView);
    objj_msgSend(self._items, "insertObject:atIndex:", anItem, anIndex);
    objj_msgSend(self._itemViews, "insertObject:atIndex:", itemView, anIndex);
    objj_msgSend(self, "_invalidateItemsStartingAtIndex:", anIndex);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPAccordionViewItem","CPInteger"]), new objj_method(sel_getUid("removeItem:"), function $CPAccordionView__removeItem_(self, _cmd, anItem)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(self._items, "indexOfObjectIdenticalTo:", anItem));
}
,["void","CPAccordionViewItem"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPAccordionView__removeItemAtIndex_(self, _cmd, anIndex)
{
    objj_msgSend(self._expandedItemIndexes, "removeIndex:", anIndex);
    objj_msgSend(self._itemViews[anIndex], "removeFromSuperview");
    objj_msgSend(self._items, "removeObjectAtIndex:", anIndex);
    objj_msgSend(self._itemViews, "removeObjectAtIndex:", anIndex);
    objj_msgSend(self, "_invalidateItemsStartingAtIndex:", anIndex);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("removeAllItems"), function $CPAccordionView__removeAllItems(self, _cmd)
{
    var count = self._items.length;
    while (count--)
        objj_msgSend(self, "removeItemAtIndex:", count);
}
,["void"]), new objj_method(sel_getUid("expandItemAtIndex:"), function $CPAccordionView__expandItemAtIndex_(self, _cmd, anIndex)
{
    if (!objj_msgSend(self._itemViews[anIndex], "isCollapsed"))
        return;
    objj_msgSend(self._expandedItemIndexes, "addIndex:", anIndex);
    objj_msgSend(self._itemViews[anIndex], "setCollapsed:", NO);
    objj_msgSend(self, "_invalidateItemsStartingAtIndex:", anIndex);
}
,["void","CPInteger"]), new objj_method(sel_getUid("collapseItemAtIndex:"), function $CPAccordionView__collapseItemAtIndex_(self, _cmd, anIndex)
{
    if (objj_msgSend(self._itemViews[anIndex], "isCollapsed"))
        return;
    objj_msgSend(self._expandedItemIndexes, "removeIndex:", anIndex);
    objj_msgSend(self._itemViews[anIndex], "setCollapsed:", YES);
    objj_msgSend(self, "_invalidateItemsStartingAtIndex:", anIndex);
}
,["void","CPInteger"]), new objj_method(sel_getUid("toggleItemAtIndex:"), function $CPAccordionView__toggleItemAtIndex_(self, _cmd, anIndex)
{
    var itemView = self._itemViews[anIndex];
    if (objj_msgSend(itemView, "isCollapsed"))
        objj_msgSend(self, "expandItemAtIndex:", anIndex);
    else
        objj_msgSend(self, "collapseItemAtIndex:", anIndex);
}
,["void","CPInteger"]), new objj_method(sel_getUid("expandedItemIndexes"), function $CPAccordionView__expandedItemIndexes(self, _cmd)
{
    return self._expandedItemIndexes;
}
,["CPIndexSet"]), new objj_method(sel_getUid("collapsedItemIndexes"), function $CPAccordionView__collapsedItemIndexes(self, _cmd)
{
    var indexSet = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self._items.length));
    objj_msgSend(indexSet, "removeIndexes:", self._expandedItemIndexes);
    return indexSet;
}
,["CPIndexSet"]), new objj_method(sel_getUid("setEnabled:forItemAtIndex:"), function $CPAccordionView__setEnabled_forItemAtIndex_(self, _cmd, isEnabled, anIndex)
{
    var itemView = self._itemViews[anIndex];
    if (!itemView)
        return;
    if (!isEnabled)
        objj_msgSend(self, "collapseItemAtIndex:", anIndex);
    else
        objj_msgSend(self, "expandItemAtIndex:", anIndex);
    objj_msgSend(itemView, "setEnabled:", isEnabled);
}
,["void","BOOL","CPInteger"]), new objj_method(sel_getUid("_invalidateItemsStartingAtIndex:"), function $CPAccordionView___invalidateItemsStartingAtIndex_(self, _cmd, anIndex)
{
    if (self._dirtyItemIndex === CPNotFound)
        self._dirtyItemIndex = anIndex;
    self._dirtyItemIndex = MIN(self._dirtyItemIndex, anIndex);
    objj_msgSend(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("setFrameSize:"), function $CPAccordionView__setFrameSize_(self, _cmd, aSize)
{
    var width = CGRectGetWidth(objj_msgSend(self, "frame"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAccordionView").super_class }, "setFrameSize:", aSize);
    if (width !== CGRectGetWidth(objj_msgSend(self, "frame")))
        objj_msgSend(self, "_invalidateItemsStartingAtIndex:", 0);
}
,["void","CGSize"]), new objj_method(sel_getUid("layoutSubviews"), function $CPAccordionView__layoutSubviews(self, _cmd)
{
    if (self._items.length <= 0)
        return objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), 0.0));
    if (self._dirtyItemIndex === CPNotFound)
        return;
    self._dirtyItemIndex = MIN(self._dirtyItemIndex, self._items.length - 1);
    var index = self._dirtyItemIndex,
        count = self._itemViews.length,
        width = CGRectGetWidth(objj_msgSend(self, "bounds")),
        y = index > 0 ? CGRectGetMaxY(objj_msgSend(self._itemViews[index - 1], "frame")) : 0.0;
    self._dirtyItemIndex = CPNotFound;
    for (; index < count; ++index)
    {
        var itemView = self._itemViews[index];
        objj_msgSend(itemView, "setFrameY:width:", y, width);
        y = CGRectGetMaxY(objj_msgSend(itemView, "frame"));
    }
    objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), y));
}
,["void"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPAccordionItemView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_accordionView"), new objj_ivar("_isCollapsed"), new objj_ivar("_index"), new objj_ivar("_headerView"), new objj_ivar("_contentView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isCollapsed"), function $_CPAccordionItemView__isCollapsed(self, _cmd)
{
    return self._isCollapsed;
}
,["BOOL"]), new objj_method(sel_getUid("setCollapsed:"), function $_CPAccordionItemView__setCollapsed_(self, _cmd, newValue)
{
    self._isCollapsed = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("index"), function $_CPAccordionItemView__index(self, _cmd)
{
    return self._index;
}
,["CPInteger"]), new objj_method(sel_getUid("setIndex:"), function $_CPAccordionItemView__setIndex_(self, _cmd, newValue)
{
    self._index = newValue;
}
,["void","CPInteger"]), new objj_method(sel_getUid("initWithAccordionView:"), function $_CPAccordionItemView__initWithAccordionView_(self, _cmd, anAccordionView)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPAccordionItemView").super_class }, "initWithFrame:", CGRectMakeZero());
    if (self)
    {
        self._accordionView = anAccordionView;
        self._isCollapsed = NO;
        var bounds = objj_msgSend(self, "bounds");
        self._headerView = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", objj_msgSend(self._accordionView, "itemHeaderPrototype")));
        if (objj_msgSend(self._headerView, "respondsToSelector:", sel_getUid("setTarget:")) && objj_msgSend(self._headerView, "respondsToSelector:", sel_getUid("setAction:")))
        {
            objj_msgSend(self._headerView, "setTarget:", self);
            objj_msgSend(self._headerView, "setAction:", sel_getUid("toggle:"));
        }
        objj_msgSend(self, "addSubview:", self._headerView);
    }
    return self;
}
,["id","CPAccordionView"]), new objj_method(sel_getUid("toggle:"), function $_CPAccordionItemView__toggle_(self, _cmd, aSender)
{
    objj_msgSend(self._accordionView, "toggleItemAtIndex:", objj_msgSend(self, "index"));
}
,["void","id"]), new objj_method(sel_getUid("setLabel:"), function $_CPAccordionItemView__setLabel_(self, _cmd, aLabel)
{
    if (objj_msgSend(self._headerView, "respondsToSelector:", sel_getUid("setTitle:")))
        objj_msgSend(self._headerView, "setTitle:", aLabel);
    else if (objj_msgSend(self._headerView, "respondsToSelector:", sel_getUid("setLabel:")))
        objj_msgSend(self._headerView, "setLabel:", aLabel);
    else if (objj_msgSend(self._headerView, "respondsToSelector:", sel_getUid("setStringValue:")))
        objj_msgSend(self._headerView, "setStringValue:", aLabel);
}
,["void","CPString"]), new objj_method(sel_getUid("setEnabled:"), function $_CPAccordionItemView__setEnabled_(self, _cmd, isEnabled)
{
    if (objj_msgSend(self._headerView, "respondsToSelector:", sel_getUid("setEnabled:")))
        objj_msgSend(self._headerView, "setEnabled:", isEnabled);
}
,["void","BOOL"]), new objj_method(sel_getUid("setContentView:"), function $_CPAccordionItemView__setContentView_(self, _cmd, aView)
{
    if (self._contentView === aView)
        return;
    objj_msgSend(self._contentView, "removeObserver:forKeyPath:", self, "frame");
    objj_msgSend(self._contentView, "removeFromSuperview");
    self._contentView = aView;
    objj_msgSend(self._contentView, "addObserver:forKeyPath:options:context:", self, "frame", CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, NULL);
    objj_msgSend(self, "addSubview:", self._contentView);
    objj_msgSend(self._accordionView, "_invalidateItemsStartingAtIndex:", objj_msgSend(self, "index"));
}
,["void","CPView"]), new objj_method(sel_getUid("setFrameY:width:"), function $_CPAccordionItemView__setFrameY_width_(self, _cmd, aY, aWidth)
{
    var headerHeight = CGRectGetHeight(objj_msgSend(self._headerView, "frame"));
    objj_msgSend(self._headerView, "setFrameSize:", CGSizeMake(aWidth, headerHeight));
    objj_msgSend(self._contentView, "setFrameOrigin:", CGPointMake(0.0, headerHeight));
    if (objj_msgSend(self, "isCollapsed"))
        objj_msgSend(self, "setFrame:", CGRectMake(0.0, aY, aWidth, headerHeight));
    else
    {
        var contentHeight = CGRectGetHeight(objj_msgSend(self._contentView, "frame"));
        objj_msgSend(self._contentView, "setFrameSize:", CGSizeMake(aWidth, contentHeight));
        objj_msgSend(self, "setFrame:", CGRectMake(0.0, aY, aWidth, contentHeight + headerHeight));
    }
}
,["void","float","float"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPAccordionItemView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
}
,["void","CGSize"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPAccordionItemView__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, aChange, aContext)
{
    if (aKeyPath === "frame" && !CGRectEqualToRect(objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeOldKey), objj_msgSend(aChange, "objectForKey:", CPKeyValueChangeNewKey)))
        objj_msgSend(self._accordionView, "_invalidateItemsStartingAtIndex:", objj_msgSend(self, "index"));
}
,["void","CPString","id","CPDictionary","id"])]);
}