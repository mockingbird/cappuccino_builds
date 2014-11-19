@STATIC;1.0;I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;32;Foundation/CPKeyValueObserving.jI;23;Foundation/CPIndexSet.jI;21;Foundation/CPString.ji;8;CPView.ji;10;CPButton.jt;18364;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPKeyValueObserving.j", NO);objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPView.j", YES);objj_executeFile("CPButton.j", YES);{var the_class = objj_allocateClassPair(CPObject, "CPAccordionViewItem"),
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
    return self.isa.objj_msgSend1(self, "initWithIdentifier:", "");
}
,["id"]), new objj_method(sel_getUid("initWithIdentifier:"), function $CPAccordionViewItem__initWithIdentifier_(self, _cmd, anIdentifier)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAccordionViewItem").super_class }, "init");
    if (self)
        (self == null ? null : self.isa.objj_msgSend1(self, "setIdentifier:", anIdentifier));
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
        self._expandedItemIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
        (self == null ? null : self.isa.objj_msgSend1(self, "setItemHeaderPrototype:", ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 100.0, 24.0)))));
    }
    return self;
    var ___r1;
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
    self.isa.objj_msgSend2(self, "insertItem:atIndex:", anItem, self._items.length);
}
,["void","CPAccordionViewItem"]), new objj_method(sel_getUid("insertItem:atIndex:"), function $CPAccordionView__insertItem_atIndex_(self, _cmd, anItem, anIndex)
{
    ((___r1 = self._expandedItemIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addIndex:", anIndex));
    var itemView = ((___r1 = (_CPAccordionItemView == null ? null : _CPAccordionItemView.isa.objj_msgSend0(_CPAccordionItemView, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithAccordionView:", self));
    (itemView == null ? null : itemView.isa.objj_msgSend1(itemView, "setIndex:", anIndex));
    (itemView == null ? null : itemView.isa.objj_msgSend1(itemView, "setLabel:", (anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "label"))));
    (itemView == null ? null : itemView.isa.objj_msgSend1(itemView, "setContentView:", (anItem == null ? null : anItem.isa.objj_msgSend0(anItem, "view"))));
    self.isa.objj_msgSend1(self, "addSubview:", itemView);
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", anItem, anIndex));
    ((___r1 = self._itemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", itemView, anIndex));
    self.isa.objj_msgSend1(self, "_invalidateItemsStartingAtIndex:", anIndex);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPAccordionViewItem","CPInteger"]), new objj_method(sel_getUid("removeItem:"), function $CPAccordionView__removeItem_(self, _cmd, anItem)
{
    self.isa.objj_msgSend1(self, "removeItemAtIndex:", ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", anItem)));
    var ___r1;
}
,["void","CPAccordionViewItem"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPAccordionView__removeItemAtIndex_(self, _cmd, anIndex)
{
    ((___r1 = self._expandedItemIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeIndex:", anIndex));
    ((___r1 = self._itemViews[anIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    ((___r1 = self._items), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", anIndex));
    ((___r1 = self._itemViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", anIndex));
    self.isa.objj_msgSend1(self, "_invalidateItemsStartingAtIndex:", anIndex);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("removeAllItems"), function $CPAccordionView__removeAllItems(self, _cmd)
{
    var count = self._items.length;
    while (count--)
        self.isa.objj_msgSend1(self, "removeItemAtIndex:", count);
}
,["void"]), new objj_method(sel_getUid("expandItemAtIndex:"), function $CPAccordionView__expandItemAtIndex_(self, _cmd, anIndex)
{
    if (!((___r1 = self._itemViews[anIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isCollapsed")))
        return;
    ((___r1 = self._expandedItemIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addIndex:", anIndex));
    ((___r1 = self._itemViews[anIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCollapsed:", NO));
    self.isa.objj_msgSend1(self, "_invalidateItemsStartingAtIndex:", anIndex);
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("collapseItemAtIndex:"), function $CPAccordionView__collapseItemAtIndex_(self, _cmd, anIndex)
{
    if (((___r1 = self._itemViews[anIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isCollapsed")))
        return;
    ((___r1 = self._expandedItemIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeIndex:", anIndex));
    ((___r1 = self._itemViews[anIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setCollapsed:", YES));
    self.isa.objj_msgSend1(self, "_invalidateItemsStartingAtIndex:", anIndex);
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("toggleItemAtIndex:"), function $CPAccordionView__toggleItemAtIndex_(self, _cmd, anIndex)
{
    var itemView = self._itemViews[anIndex];
    if ((itemView == null ? null : itemView.isa.objj_msgSend0(itemView, "isCollapsed")))
        self.isa.objj_msgSend1(self, "expandItemAtIndex:", anIndex);
    else
        self.isa.objj_msgSend1(self, "collapseItemAtIndex:", anIndex);
}
,["void","CPInteger"]), new objj_method(sel_getUid("expandedItemIndexes"), function $CPAccordionView__expandedItemIndexes(self, _cmd)
{
    return self._expandedItemIndexes;
}
,["CPIndexSet"]), new objj_method(sel_getUid("collapsedItemIndexes"), function $CPAccordionView__collapsedItemIndexes(self, _cmd)
{
    var indexSet = CPIndexSet.isa.objj_msgSend1(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(0, self._items.length));
    (indexSet == null ? null : indexSet.isa.objj_msgSend1(indexSet, "removeIndexes:", self._expandedItemIndexes));
    return indexSet;
}
,["CPIndexSet"]), new objj_method(sel_getUid("setEnabled:forItemAtIndex:"), function $CPAccordionView__setEnabled_forItemAtIndex_(self, _cmd, isEnabled, anIndex)
{
    var itemView = self._itemViews[anIndex];
    if (!itemView)
        return;
    if (!isEnabled)
        self.isa.objj_msgSend1(self, "collapseItemAtIndex:", anIndex);
    else
        self.isa.objj_msgSend1(self, "expandItemAtIndex:", anIndex);
    (itemView == null ? null : itemView.isa.objj_msgSend1(itemView, "setEnabled:", isEnabled));
}
,["void","BOOL","CPInteger"]), new objj_method(sel_getUid("_invalidateItemsStartingAtIndex:"), function $CPAccordionView___invalidateItemsStartingAtIndex_(self, _cmd, anIndex)
{
    if (self._dirtyItemIndex === CPNotFound)
        self._dirtyItemIndex = anIndex;
    self._dirtyItemIndex = MIN(self._dirtyItemIndex, anIndex);
    self.isa.objj_msgSend0(self, "setNeedsLayout");
}
,["void","CPInteger"]), new objj_method(sel_getUid("setFrameSize:"), function $CPAccordionView__setFrameSize_(self, _cmd, aSize)
{
    var width = CGRectGetWidth(self.isa.objj_msgSend0(self, "frame"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAccordionView").super_class }, "setFrameSize:", aSize);
    if (width !== CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")))
        self.isa.objj_msgSend1(self, "_invalidateItemsStartingAtIndex:", 0);
}
,["void","CGSize"]), new objj_method(sel_getUid("layoutSubviews"), function $CPAccordionView__layoutSubviews(self, _cmd)
{
    if (self._items.length <= 0)
        return self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")), 0.0));
    if (self._dirtyItemIndex === CPNotFound)
        return;
    self._dirtyItemIndex = MIN(self._dirtyItemIndex, self._items.length - 1);
    var index = self._dirtyItemIndex,
        count = self._itemViews.length,
        width = CGRectGetWidth(self.isa.objj_msgSend0(self, "bounds")),
        y = index > 0 ? CGRectGetMaxY(((___r1 = self._itemViews[index - 1]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))) : 0.0;
    self._dirtyItemIndex = CPNotFound;
    for (; index < count; ++index)
    {
        var itemView = self._itemViews[index];
        (itemView == null ? null : itemView.isa.objj_msgSend2(itemView, "setFrameY:width:", y, width));
        y = CGRectGetMaxY((itemView == null ? null : itemView.isa.objj_msgSend0(itemView, "frame")));
    }
    self.isa.objj_msgSend1(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(self.isa.objj_msgSend0(self, "frame")), y));
    var ___r1;
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
        var bounds = (self == null ? null : self.isa.objj_msgSend0(self, "bounds"));
        self._headerView = CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", ((___r1 = self._accordionView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemHeaderPrototype"))));
        if (((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setTarget:"))) && ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setAction:"))))
        {
            ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
            ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("toggle:")));
        }
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", self._headerView));
    }
    return self;
    var ___r1;
}
,["id","CPAccordionView"]), new objj_method(sel_getUid("toggle:"), function $_CPAccordionItemView__toggle_(self, _cmd, aSender)
{
    ((___r1 = self._accordionView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "toggleItemAtIndex:", self.isa.objj_msgSend0(self, "index")));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("setLabel:"), function $_CPAccordionItemView__setLabel_(self, _cmd, aLabel)
{
    if (((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setTitle:"))))
        ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", aLabel));
    else if (((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setLabel:"))))
        ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLabel:", aLabel));
    else if (((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setStringValue:"))))
        ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", aLabel));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("setEnabled:"), function $_CPAccordionItemView__setEnabled_(self, _cmd, isEnabled)
{
    if (((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("setEnabled:"))))
        ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setEnabled:", isEnabled));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("setContentView:"), function $_CPAccordionItemView__setContentView_(self, _cmd, aView)
{
    if (self._contentView === aView)
        return;
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "removeObserver:forKeyPath:", self, "frame"));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    self._contentView = aView;
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, "frame", CPKeyValueObservingOptionOld | CPKeyValueObservingOptionNew, NULL));
    self.isa.objj_msgSend1(self, "addSubview:", self._contentView);
    ((___r1 = self._accordionView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_invalidateItemsStartingAtIndex:", self.isa.objj_msgSend0(self, "index")));
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("setFrameY:width:"), function $_CPAccordionItemView__setFrameY_width_(self, _cmd, aY, aWidth)
{
    var headerHeight = CGRectGetHeight(((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
    ((___r1 = self._headerView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(aWidth, headerHeight)));
    ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(0.0, headerHeight)));
    if (self.isa.objj_msgSend0(self, "isCollapsed"))
        self.isa.objj_msgSend1(self, "setFrame:", CGRectMake(0.0, aY, aWidth, headerHeight));
    else
    {
        var contentHeight = CGRectGetHeight(((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")));
        ((___r1 = self._contentView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", CGSizeMake(aWidth, contentHeight)));
        self.isa.objj_msgSend1(self, "setFrame:", CGRectMake(0.0, aY, aWidth, contentHeight + headerHeight));
    }
    var ___r1;
}
,["void","float","float"]), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $_CPAccordionItemView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{
}
,["void","CGSize"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $_CPAccordionItemView__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, aChange, aContext)
{
    if (aKeyPath === "frame" && !CGRectEqualToRect((aChange == null ? null : aChange.isa.objj_msgSend1(aChange, "objectForKey:", CPKeyValueChangeOldKey)), (aChange == null ? null : aChange.isa.objj_msgSend1(aChange, "objectForKey:", CPKeyValueChangeNewKey))))
        ((___r1 = self._accordionView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_invalidateItemsStartingAtIndex:", self.isa.objj_msgSend0(self, "index")));
    var ___r1;
}
,["void","CPString","id","CPDictionary","id"])]);
}