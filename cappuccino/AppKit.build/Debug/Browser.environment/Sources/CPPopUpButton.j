@STATIC;1.0;i;12;CGGeometry.ji;10;CPButton.ji;19;CPKeyValueBinding.ji;8;CPMenu.ji;12;CPMenuItem.jt;42225;objj_executeFile("CGGeometry.j", YES);objj_executeFile("CPButton.j", YES);objj_executeFile("CPKeyValueBinding.j", YES);objj_executeFile("CPMenu.j", YES);objj_executeFile("CPMenuItem.j", YES);CPPopUpButtonStatePullsDown = CPThemeState("pulls-down");
{var the_class = objj_allocateClassPair(CPButton, "CPPopUpButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_selectedIndex"), new objj_ivar("_preferredEdge")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:pullsDown:"), function $CPPopUpButton__initWithFrame_pullsDown_(self, _cmd, aFrame, shouldPullDown)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopUpButton").super_class }, "initWithFrame:", aFrame);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "selectItemAtIndex:", CPNotFound));
        self._preferredEdge = CPMaxYEdge;
        (self == null ? null : self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CPImageLeft, "image-position"));
        (self == null ? null : self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CPLeftTextAlignment, "alignment"));
        (self == null ? null : self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", CPLineBreakByTruncatingTail, "line-break-mode"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setMenu:", ((___r1 = CPMenu.isa.objj_msgSend0(CPMenu, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTitle:", ""))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setPullsDown:", shouldPullDown));
        var options = CPKeyValueObservingOptionNew | CPKeyValueObservingOptionOld;
        (self == null ? null : self.isa.objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "menu.items", options, nil));
        (self == null ? null : self.isa.objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "_firstItem.changeCount", options, nil));
        (self == null ? null : self.isa.objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "selectedItem.changeCount", options, nil));
    }
    return self;
    var ___r1;
}
,["id","CGRect","BOOL"]), new objj_method(sel_getUid("initWithFrame:"), function $CPPopUpButton__initWithFrame_(self, _cmd, aFrame)
{
    return self.isa.objj_msgSend2(self, "initWithFrame:pullsDown:", aFrame, NO);
}
,["id","CGRect"]), new objj_method(sel_getUid("setPullsDown:"), function $CPPopUpButton__setPullsDown_(self, _cmd, shouldPullDown)
{
    if (shouldPullDown)
        var changed = self.isa.objj_msgSend1(self, "setThemeState:", CPPopUpButtonStatePullsDown);
    else
        var changed = self.isa.objj_msgSend1(self, "unsetThemeState:", CPPopUpButtonStatePullsDown);
    if (!changed)
        return;
    var items = ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray"));
    if ((items == null ? null : items.isa.objj_msgSend0(items, "count")) <= 0)
        return;
    ((___r1 = items[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", self.isa.objj_msgSend0(self, "pullsDown")));
    self.isa.objj_msgSend0(self, "synchronizeTitleAndSelectedItem");
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("pullsDown"), function $CPPopUpButton__pullsDown(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "hasThemeState:", CPPopUpButtonStatePullsDown);
}
,["BOOL"]), new objj_method(sel_getUid("addItem:"), function $CPPopUpButton__addItem_(self, _cmd, anItem)
{
    ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addItem:", anItem));
    var ___r1;
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("addItemWithTitle:"), function $CPPopUpButton__addItemWithTitle_(self, _cmd, aTitle)
{
    ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "addItemWithTitle:action:keyEquivalent:", aTitle, NULL, nil));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("addItemsWithTitles:"), function $CPPopUpButton__addItemsWithTitles_(self, _cmd, titles)
{
    var index = 0,
        count = (titles == null ? null : titles.isa.objj_msgSend0(titles, "count"));
    for (; index < count; ++index)
        self.isa.objj_msgSend1(self, "addItemWithTitle:", titles[index]);
}
,["void","CPArray"]), new objj_method(sel_getUid("insertItemWithTitle:atIndex:"), function $CPPopUpButton__insertItemWithTitle_atIndex_(self, _cmd, aTitle, anIndex)
{
    var items = self.isa.objj_msgSend0(self, "itemArray"),
        count = (items == null ? null : items.isa.objj_msgSend0(items, "count"));
    while (count--)
        if (((___r1 = items[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "title")) == aTitle)
            self.isa.objj_msgSend1(self, "removeItemAtIndex:", count);
    ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, NULL, nil, anIndex));
    var ___r1;
}
,["void","CPString","int"]), new objj_method(sel_getUid("removeAllItems"), function $CPPopUpButton__removeAllItems(self, _cmd)
{
    ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllItems"));
    self.isa.objj_msgSend0(self, "synchronizeTitleAndSelectedItem");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("removeItemWithTitle:"), function $CPPopUpButton__removeItemWithTitle_(self, _cmd, aTitle)
{
    self.isa.objj_msgSend1(self, "removeItemAtIndex:", self.isa.objj_msgSend1(self, "indexOfItemWithTitle:", aTitle));
    self.isa.objj_msgSend0(self, "synchronizeTitleAndSelectedItem");
}
,["void","CPString"]), new objj_method(sel_getUid("removeItemAtIndex:"), function $CPPopUpButton__removeItemAtIndex_(self, _cmd, anIndex)
{
    ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeItemAtIndex:", anIndex));
    self.isa.objj_msgSend0(self, "synchronizeTitleAndSelectedItem");
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("selectedItem"), function $CPPopUpButton__selectedItem(self, _cmd)
{
    var indexOfSelectedItem = self.isa.objj_msgSend0(self, "indexOfSelectedItem");
    if (indexOfSelectedItem < 0 || indexOfSelectedItem > self.isa.objj_msgSend0(self, "numberOfItems") - 1)
        return nil;
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtIndex:", indexOfSelectedItem));
    var ___r1;
}
,["CPMenuItem"]), new objj_method(sel_getUid("titleOfSelectedItem"), function $CPPopUpButton__titleOfSelectedItem(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "selectedItem")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "title"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("indexOfSelectedItem"), function $CPPopUpButton__indexOfSelectedItem(self, _cmd)
{
    return self._selectedIndex;
}
,["int"]), new objj_method(sel_getUid("selectItem:"), function $CPPopUpButton__selectItem_(self, _cmd, aMenuItem)
{
    self.isa.objj_msgSend1(self, "selectItemAtIndex:", self.isa.objj_msgSend1(self, "indexOfItem:", aMenuItem));
}
,["void","CPMenuItem"]), new objj_method(sel_getUid("selectItemAtIndex:"), function $CPPopUpButton__selectItemAtIndex_(self, _cmd, anIndex)
{
    self.isa.objj_msgSend1(self, "setObjectValue:", anIndex);
}
,["void","CPUInteger"]), new objj_method(sel_getUid("setSelectedIndex:"), function $CPPopUpButton__setSelectedIndex_(self, _cmd, anIndex)
{
    self.isa.objj_msgSend1(self, "setObjectValue:", anIndex);
}
,["void","CPUInteger"]), new objj_method(sel_getUid("selectedIndex"), function $CPPopUpButton__selectedIndex(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "objectValue");
}
,["CPUInteger"]), new objj_method(sel_getUid("setObjectValue:"), function $CPPopUpButton__setObjectValue_(self, _cmd, anIndex)
{
    var indexOfSelectedItem = self.isa.objj_msgSend0(self, "objectValue");
    anIndex = parseInt(+anIndex, 10);
    if (indexOfSelectedItem === anIndex)
        return;
    if (indexOfSelectedItem >= 0 && !self.isa.objj_msgSend0(self, "pullsDown"))
        ((___r1 = self.isa.objj_msgSend0(self, "selectedItem")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", CPOffState));
    self._selectedIndex = anIndex;
    if (indexOfSelectedItem >= 0 && !self.isa.objj_msgSend0(self, "pullsDown"))
        ((___r1 = self.isa.objj_msgSend0(self, "selectedItem")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", CPOnState));
    self.isa.objj_msgSend0(self, "synchronizeTitleAndSelectedItem");
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("objectValue"), function $CPPopUpButton__objectValue(self, _cmd)
{
    return self._selectedIndex;
}
,["id"]), new objj_method(sel_getUid("selectItemWithTag:"), function $CPPopUpButton__selectItemWithTag_(self, _cmd, aTag)
{
    self.isa.objj_msgSend1(self, "selectItemAtIndex:", self.isa.objj_msgSend1(self, "indexOfItemWithTag:", aTag));
}
,["void","int"]), new objj_method(sel_getUid("selectItemWithTitle:"), function $CPPopUpButton__selectItemWithTitle_(self, _cmd, aTitle)
{
    self.isa.objj_msgSend1(self, "selectItemAtIndex:", self.isa.objj_msgSend1(self, "indexOfItemWithTitle:", aTitle));
}
,["void","CPString"]), new objj_method(sel_getUid("numberOfItems"), function $CPPopUpButton__numberOfItems(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "numberOfItems"));
    var ___r1;
}
,["int"]), new objj_method(sel_getUid("itemArray"), function $CPPopUpButton__itemArray(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray"));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("itemAtIndex:"), function $CPPopUpButton__itemAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtIndex:", anIndex));
    var ___r1;
}
,["CPMenuItem","CPUInteger"]), new objj_method(sel_getUid("itemTitleAtIndex:"), function $CPPopUpButton__itemTitleAtIndex_(self, _cmd, anIndex)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "menu")), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "itemAtIndex:", anIndex))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "title"));
    var ___r1, ___r2;
}
,["CPString","CPUInteger"]), new objj_method(sel_getUid("itemTitles"), function $CPPopUpButton__itemTitles(self, _cmd)
{
    var titles = [],
        items = self.isa.objj_msgSend0(self, "itemArray"),
        index = 0,
        count = (items == null ? null : items.isa.objj_msgSend0(items, "count"));
    for (; index < count; ++index)
        titles.push(((___r1 = items[index]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "title")));
    return titles;
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("itemWithTitle:"), function $CPPopUpButton__itemWithTitle_(self, _cmd, aTitle)
{
    var menu = self.isa.objj_msgSend0(self, "menu"),
        itemIndex = (menu == null ? null : menu.isa.objj_msgSend1(menu, "indexOfItemWithTitle:", aTitle));
    if (itemIndex === CPNotFound)
        return nil;
    return (menu == null ? null : menu.isa.objj_msgSend1(menu, "itemAtIndex:", itemIndex));
}
,["CPMenuItem","CPString"]), new objj_method(sel_getUid("lastItem"), function $CPPopUpButton__lastItem(self, _cmd)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "menu")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "itemArray"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastObject"));
    var ___r1, ___r2;
}
,["CPMenuItem"]), new objj_method(sel_getUid("indexOfItem:"), function $CPPopUpButton__indexOfItem_(self, _cmd, aMenuItem)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfItem:", aMenuItem));
    var ___r1;
}
,["int","CPMenuItem"]), new objj_method(sel_getUid("indexOfItemWithTag:"), function $CPPopUpButton__indexOfItemWithTag_(self, _cmd, aTag)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfItemWithTag:", aTag));
    var ___r1;
}
,["int","int"]), new objj_method(sel_getUid("indexOfItemWithTitle:"), function $CPPopUpButton__indexOfItemWithTitle_(self, _cmd, aTitle)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfItemWithTitle:", aTitle));
    var ___r1;
}
,["int","CPString"]), new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"), function $CPPopUpButton__indexOfItemWithRepresentedObject_(self, _cmd, anObject)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfItemWithRepresentedObject:", anObject));
    var ___r1;
}
,["int","id"]), new objj_method(sel_getUid("indexOfItemWithTarget:action:"), function $CPPopUpButton__indexOfItemWithTarget_action_(self, _cmd, aTarget, anAction)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "indexOfItemWithTarget:action:", aTarget, anAction));
    var ___r1;
}
,["int","id","SEL"]), new objj_method(sel_getUid("preferredEdge"), function $CPPopUpButton__preferredEdge(self, _cmd)
{
    return self._preferredEdge;
}
,["CPRectEdge"]), new objj_method(sel_getUid("setPreferredEdge:"), function $CPPopUpButton__setPreferredEdge_(self, _cmd, aRectEdge)
{
    self._preferredEdge = aRectEdge;
}
,["void","CPRectEdge"]), new objj_method(sel_getUid("setTitle:"), function $CPPopUpButton__setTitle_(self, _cmd, aTitle)
{
    if (self.isa.objj_msgSend0(self, "title") === aTitle)
        return;
    if (self.isa.objj_msgSend0(self, "pullsDown"))
    {
        var items = ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray"));
        if ((items == null ? null : items.isa.objj_msgSend0(items, "count")) <= 0)
            self.isa.objj_msgSend1(self, "addItemWithTitle:", aTitle);
        else
        {
            ((___r1 = items[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", aTitle));
            self.isa.objj_msgSend0(self, "synchronizeTitleAndSelectedItem");
        }
    }
    else
    {
        var index = self.isa.objj_msgSend1(self, "indexOfItemWithTitle:", aTitle);
        if (index < 0)
        {
            self.isa.objj_msgSend1(self, "addItemWithTitle:", aTitle);
            index = self.isa.objj_msgSend0(self, "numberOfItems") - 1;
        }
        self.isa.objj_msgSend1(self, "selectItemAtIndex:", index);
    }
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("setImage:"), function $CPPopUpButton__setImage_(self, _cmd, anImage)
{
}
,["void","CPImage"]), new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"), function $CPPopUpButton__synchronizeTitleAndSelectedItem(self, _cmd)
{
    var item = nil;
    if (self.isa.objj_msgSend0(self, "pullsDown"))
    {
        var items = ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray"));
        if ((items == null ? null : items.isa.objj_msgSend0(items, "count")) > 0)
            item = items[0];
    }
    else
        item = self.isa.objj_msgSend0(self, "selectedItem");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopUpButton").super_class }, "setImage:", (item == null ? null : item.isa.objj_msgSend0(item, "image")));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopUpButton").super_class }, "setTitle:", (item == null ? null : item.isa.objj_msgSend0(item, "title")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $CPPopUpButton__observeValueForKeyPath_ofObject_change_context_(self, _cmd, aKeyPath, anObject, changes, aContext)
{
    var pullsDown = self.isa.objj_msgSend0(self, "pullsDown");
    if (!pullsDown && aKeyPath === "selectedItem.changeCount" || pullsDown && (aKeyPath === "_firstItem" || aKeyPath === "_firstItem.changeCount"))
        self.isa.objj_msgSend0(self, "synchronizeTitleAndSelectedItem");
    if (aKeyPath === "menu")
    {
        aKeyPath = "menu.items";
        (changes == null ? null : changes.isa.objj_msgSend2(changes, "setObject:forKey:", CPKeyValueChangeSetting, CPKeyValueChangeKindKey));
        (changes == null ? null : changes.isa.objj_msgSend2(changes, "setObject:forKey:", ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "itemArray")), CPKeyValueChangeNewKey));
    }
    if (aKeyPath === "menu.items")
    {
        var changeKind = (changes == null ? null : changes.isa.objj_msgSend1(changes, "objectForKey:", CPKeyValueChangeKindKey)),
            indexOfSelectedItem = self.isa.objj_msgSend0(self, "indexOfSelectedItem");
        if (changeKind === CPKeyValueChangeRemoval)
        {
            var index = CPNotFound,
                indexes = (changes == null ? null : changes.isa.objj_msgSend1(changes, "objectForKey:", CPKeyValueChangeIndexesKey));
            if ((indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "containsIndex:", 0)) && self.isa.objj_msgSend0(self, "pullsDown"))
                self.isa.objj_msgSend0(self, "_firstItemDidChange");
            if (!self.isa.objj_msgSend0(self, "pullsDown") && (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "containsIndex:", indexOfSelectedItem)))
            {
                indexOfSelectedItem = 0;
            }
            else
            {
                while ((index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", index))) !== CPNotFound && index <= indexOfSelectedItem)
                    --indexOfSelectedItem;
            }
            self.isa.objj_msgSend1(self, "selectItemAtIndex:", indexOfSelectedItem);
        }
        else if (changeKind === CPKeyValueChangeReplacement)
        {
            var indexes = (changes == null ? null : changes.isa.objj_msgSend1(changes, "objectForKey:", CPKeyValueChangeIndexesKey));
            if (pullsDown && (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "containsIndex:", 0)) || !pullsDown && (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "containsIndex:", indexOfSelectedItem)))
                self.isa.objj_msgSend0(self, "synchronizeTitleAndSelectedItem");
        }
        else
        {
            var newItems = (changes == null ? null : changes.isa.objj_msgSend1(changes, "objectForKey:", CPKeyValueChangeNewKey));
            (newItems == null ? null : newItems.isa.objj_msgSend1(newItems, "enumerateObjectsUsingBlock:", function(aMenuItem)
            {
                var action = (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend0(aMenuItem, "action"));
                if (!action)
                    (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend1(aMenuItem, "setAction:", action = sel_getUid("_popUpItemAction:")));
                if (action === sel_getUid("_popUpItemAction:"))
                    (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend1(aMenuItem, "setTarget:", self));
            }));
            if (changeKind === CPKeyValueChangeSetting)
            {
                self.isa.objj_msgSend0(self, "_firstItemDidChange");
                self.isa.objj_msgSend1(self, "selectItemAtIndex:", CPNotFound);
                self.isa.objj_msgSend1(self, "selectItemAtIndex:", MIN((newItems == null ? null : newItems.isa.objj_msgSend0(newItems, "count")) - 1, indexOfSelectedItem));
            }
            else
            {
                var indexes = (changes == null ? null : changes.isa.objj_msgSend1(changes, "objectForKey:", CPKeyValueChangeIndexesKey));
                if (self.isa.objj_msgSend0(self, "pullsDown") && (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "containsIndex:", 0)))
                {
                    self.isa.objj_msgSend0(self, "_firstItemDidChange");
                    if (self.isa.objj_msgSend0(self, "numberOfItems") > 1)
                    {
                        var index = CPNotFound,
                            originalIndex = 0;
                        while ((index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", index))) !== CPNotFound && index <= originalIndex)
                            ++originalIndex;
                        ((___r1 = self.isa.objj_msgSend1(self, "itemAtIndex:", originalIndex)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
                    }
                }
                if (indexOfSelectedItem < 0)
                    self.isa.objj_msgSend1(self, "selectItemAtIndex:", 0);
                else
                {
                    var index = CPNotFound;
                    while ((index = (indexes == null ? null : indexes.isa.objj_msgSend1(indexes, "indexGreaterThanIndex:", index))) !== CPNotFound && index <= indexOfSelectedItem)
                        ++indexOfSelectedItem;
                    self.isa.objj_msgSend1(self, "selectItemAtIndex:", indexOfSelectedItem);
                }
            }
        }
    }
    var ___r1;
}
,["void","CPString","id","CPDictionary","id"]), new objj_method(sel_getUid("mouseDown:"), function $CPPopUpButton__mouseDown_(self, _cmd, anEvent)
{
    if (!self.isa.objj_msgSend0(self, "isEnabled") || !self.isa.objj_msgSend0(self, "numberOfItems"))
        return;
    var menu = self.isa.objj_msgSend0(self, "menu");
    if (menu._lastCloseEvent === anEvent)
        return;
    self.isa.objj_msgSend1(self, "highlight:", YES);
    var bounds = self.isa.objj_msgSend0(self, "bounds"),
        minimumWidth = CGRectGetWidth(bounds);
    (menu == null ? null : menu.isa.objj_msgSend1(menu, "setFont:", self.isa.objj_msgSend0(self, "font")));
    if (self.isa.objj_msgSend0(self, "pullsDown"))
    {
        var positionedItem = nil,
            location = CGPointMake(0.0, CGRectGetMaxY(bounds) - 1);
    }
    else
    {
        var contentRect = self.isa.objj_msgSend1(self, "contentRectForBounds:", bounds),
            positionedItem = self.isa.objj_msgSend0(self, "selectedItem"),
            standardLeftMargin = _CPMenuWindow.isa.objj_msgSend0(_CPMenuWindow, "_standardLeftMargin") + _CPMenuItemStandardView.isa.objj_msgSend0(_CPMenuItemStandardView, "_standardLeftMargin"),
            location = CGPointMake(CGRectGetMinX(contentRect) - standardLeftMargin, 0.0);
        minimumWidth += standardLeftMargin;
        (menu == null ? null : menu.isa.objj_msgSend1(menu, "_highlightItemAtIndex:", CPNotFound));
    }
    (menu == null ? null : menu.isa.objj_msgSend1(menu, "setMinimumWidth:", minimumWidth));
    (menu == null ? null : menu.isa.objj_msgSend(menu, "_popUpMenuPositioningItem:atLocation:topY:bottomY:inView:callback:", positionedItem, location, CGRectGetMinY(bounds), CGRectGetMaxY(bounds), self, function(aMenu)
    {
        self.isa.objj_msgSend1(self, "highlight:", NO);
        var highlightedItem = (aMenu == null ? null : aMenu.isa.objj_msgSend0(aMenu, "highlightedItem"));
        if ((highlightedItem == null ? null : highlightedItem.isa.objj_msgSend0(highlightedItem, "_isSelectable")))
            self.isa.objj_msgSend1(self, "selectItem:", highlightedItem);
    }));
}
,["void","CPEvent"]), new objj_method(sel_getUid("rightMouseDown:"), function $CPPopUpButton__rightMouseDown_(self, _cmd, anEvent)
{
}
,["void","CPEvent"]), new objj_method(sel_getUid("_popUpItemAction:"), function $CPPopUpButton___popUpItemAction_(self, _cmd, aSender)
{
    self.isa.objj_msgSend2(self, "sendAction:to:", self.isa.objj_msgSend0(self, "action"), self.isa.objj_msgSend0(self, "target"));
}
,["void","id"]), new objj_method(sel_getUid("_firstItemDidChange"), function $CPPopUpButton___firstItemDidChange(self, _cmd)
{
    self.isa.objj_msgSend1(self, "willChangeValueForKey:", "_firstItem");
    self.isa.objj_msgSend1(self, "didChangeValueForKey:", "_firstItem");
    ((___r1 = self.isa.objj_msgSend0(self, "_firstItem")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_firstItem"), function $CPPopUpButton___firstItem(self, _cmd)
{
    if (self.isa.objj_msgSend0(self, "numberOfItems") <= 0)
        return nil;
    return ((___r1 = self.isa.objj_msgSend0(self, "menu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtIndex:", 0));
    var ___r1;
}
,["CPMenuItem"]), new objj_method(sel_getUid("takeValueFromKeyPath:ofObjects:"), function $CPPopUpButton__takeValueFromKeyPath_ofObjects_(self, _cmd, aKeyPath, objects)
{
    var count = objects.length,
        value = ((___r1 = objects[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aKeyPath));
    self.isa.objj_msgSend1(self, "selectItemWithTag:", value);
    self.isa.objj_msgSend1(self, "setEnabled:", YES);
    while (count-- > 1)
        if (value !== ((___r1 = objects[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", aKeyPath)))
            ((___r1 = self.isa.objj_msgSend0(self, "selectedItem")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setState:", CPOffState));
    var ___r1;
}
,["void","CPString","CPArray"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPPopUpButton__defaultThemeClass(self, _cmd)
{
    return "popup-button";
}
,["CPString"]), new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedIndex"), function $CPPopUpButton__keyPathsForValuesAffectingSelectedIndex(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", "objectValue");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedTag"), function $CPPopUpButton__keyPathsForValuesAffectingSelectedTag(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", "objectValue");
}
,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedItem"), function $CPPopUpButton__keyPathsForValuesAffectingSelectedItem(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObject:", "objectValue");
}
,["CPSet"])]);
}{
var the_class = objj_getClass("CPPopUpButton")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_reverseSetBinding"), function $CPPopUpButton___reverseSetBinding(self, _cmd)
{
    (_CPPopUpButtonSelectionBinder == null ? null : _CPPopUpButtonSelectionBinder.isa.objj_msgSend1(_CPPopUpButtonSelectionBinder, "_reverseSetValueFromExclusiveBinderForObject:", self));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopUpButton").super_class }, "_reverseSetBinding");
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_binderClassForBinding:"), function $CPPopUpButton___binderClassForBinding_(self, _cmd, aBinding)
{
    if (aBinding == CPSelectedIndexBinding || aBinding == CPSelectedObjectBinding || aBinding == CPSelectedTagBinding || aBinding == CPSelectedValueBinding || aBinding == CPContentBinding || aBinding == CPContentObjectsBinding || aBinding == CPContentValuesBinding)
    {
        var capitalizedBinding = (aBinding.charAt(0)).toUpperCase() + aBinding.substr(1);
        return ((___r1 = CPClassFromString("_CPPopUpButton" + capitalizedBinding + "Binder")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "class"));
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getMetaClass("CPPopUpButton").super_class }, "_binderClassForBinding:", aBinding);
    var ___r1;
}
,["Class","CPString"]), new objj_method(sel_getUid("isBindingExclusive:"), function $CPPopUpButton__isBindingExclusive_(self, _cmd, aBinding)
{
    return aBinding == CPSelectedIndexBinding || aBinding == CPSelectedTagBinding || aBinding == CPSelectedValueBinding;
}
,["BOOL","CPString"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPPopUpButtonContentBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_getInsertNullOffset"), function $_CPPopUpButtonContentBinder___getInsertNullOffset(self, _cmd)
{
    var options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey));
    return (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPInsertsNullPlaceholderBindingOption)) ? 1 : 0;
    var ___r1;
}
,["CPInteger"]), new objj_method(sel_getUid("_getNullPlaceholder"), function $_CPPopUpButtonContentBinder___getNullPlaceholder(self, _cmd)
{
    var options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey)),
        placeholder = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPNullPlaceholderBindingOption)) || "";
    if (placeholder === CPNull.isa.objj_msgSend0(CPNull, "null"))
        placeholder = "";
    return placeholder;
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("transformValue:withOptions:"), function $_CPPopUpButtonContentBinder__transformValue_withOptions_(self, _cmd, contentArray, options)
{
    return contentArray;
}
,["id","CPArray","CPDictionary"]), new objj_method(sel_getUid("setValue:forBinding:"), function $_CPPopUpButtonContentBinder__setValue_forBinding_(self, _cmd, contentArray, aBinding)
{
    self.isa.objj_msgSend1(self, "_setContent:", contentArray);
    self.isa.objj_msgSend1(self, "_setContentValuesIfNeeded:", contentArray);
}
,["void","CPArray","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPPopUpButtonContentBinder__valueForBinding_(self, _cmd, aBinding)
{
    return self.isa.objj_msgSend0(self, "_content");
}
,["id","CPString"]), new objj_method(sel_getUid("_setContent:"), function $_CPPopUpButtonContentBinder___setContent_(self, _cmd, aValue)
{
    var count = (aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "count")),
        options = ((___r1 = self._info), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey)),
        offset = self.isa.objj_msgSend0(self, "_getInsertNullOffset");
    if (count + offset != ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "numberOfItems")))
    {
        ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeAllItems"));
        if (offset)
            ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addItemWithTitle:", self.isa.objj_msgSend0(self, "_getNullPlaceholder")));
        for (var i = 0; i < count; i++)
        {
            var item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "", NULL, nil));
            self.isa.objj_msgSend3(self, "_setValue:forItem:withOptions:", (aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "objectAtIndex:", i)), item, options);
            ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addItem:", item));
        }
    }
    else
    {
        for (var i = 0; i < count; i++)
        {
            self.isa.objj_msgSend3(self, "_setValue:forItem:withOptions:", (aValue == null ? null : aValue.isa.objj_msgSend1(aValue, "objectAtIndex:", i)), ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "itemAtIndex:", i + offset)), options);
        }
    }
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("_setContentValuesIfNeeded:"), function $_CPPopUpButtonContentBinder___setContentValuesIfNeeded_(self, _cmd, values)
{
    var offset = self.isa.objj_msgSend0(self, "_getInsertNullOffset");
    if (!((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "infoForBinding:", CPContentValuesBinding)))
    {
        if (offset)
            ((___r1 = ((___r2 = self._source), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "itemAtIndex:", 0))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", self.isa.objj_msgSend0(self, "_getNullPlaceholder")));
        var count = (values == null ? null : values.isa.objj_msgSend0(values, "count"));
        for (var i = 0; i < count; i++)
            ((___r1 = ((___r2 = self._source), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "itemAtIndex:", i + offset))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", ((___r2 = (values == null ? null : values.isa.objj_msgSend1(values, "objectAtIndex:", i))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "description"))));
    }
    var ___r1, ___r2;
}
,["void","CPArray"]), new objj_method(sel_getUid("_setValue:forItem:withOptions:"), function $_CPPopUpButtonContentBinder___setValue_forItem_withOptions_(self, _cmd, aValue, aMenuItem, options)
{
    var value = self.isa.objj_msgSend2(self, "_transformValue:withOptions:", aValue, options);
    (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend1(aMenuItem, "setRepresentedObject:", value));
}
,["void","id","CPMenuItem","CPDictionary"]), new objj_method(sel_getUid("_transformValue:withOptions:"), function $_CPPopUpButtonContentBinder___transformValue_withOptions_(self, _cmd, aValue, options)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpButtonContentBinder").super_class }, "transformValue:withOptions:", aValue, options);
}
,["id","id","CPDictionary"]), new objj_method(sel_getUid("_content"), function $_CPPopUpButtonContentBinder___content(self, _cmd)
{
    return ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", "itemArray.representedObject"));
    var ___r1;
}
,["CPArray"])]);
}{var the_class = objj_allocateClassPair(_CPPopUpButtonContentBinder, "_CPPopUpButtonContentValuesBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPPopUpButtonContentValuesBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPPopUpButtonContentValuesBinder").super_class }, "_setContent:", aValue);
}
,["void","CPArray","CPString"]), new objj_method(sel_getUid("_setValue:forItem:withOptions:"), function $_CPPopUpButtonContentValuesBinder___setValue_forItem_withOptions_(self, _cmd, aValue, aMenuItem, options)
{
    if (aValue === CPNull.isa.objj_msgSend0(CPNull, "null"))
        aValue = nil;
    var value = self.isa.objj_msgSend2(self, "_transformValue:withOptions:", aValue, options);
    (aMenuItem == null ? null : aMenuItem.isa.objj_msgSend1(aMenuItem, "setTitle:", value));
}
,["void","id","CPMenuItem","CPDictionary"]), new objj_method(sel_getUid("_content"), function $_CPPopUpButtonContentValuesBinder___content(self, _cmd)
{
    return ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKeyPath:", "itemArray.title"));
    var ___r1;
}
,["CPArray"])]);
}{var the_class = objj_allocateClassPair(CPBinder, "_CPPopUpButtonSelectionBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setPlaceholderValue:withMarker:forBinding:"), function $_CPPopUpButtonSelectionBinder__setPlaceholderValue_withMarker_forBinding_(self, _cmd, aValue, aMarker, aBinding)
{
    self.isa.objj_msgSend2(self, "setValue:forBinding:", aValue, aBinding);
}
,["void","id","CPString","CPString"]), new objj_method(sel_getUid("_getInsertNullOffset"), function $_CPPopUpButtonSelectionBinder___getInsertNullOffset(self, _cmd)
{
    var options = ((___r1 = CPBinder.isa.objj_msgSend2(CPBinder, "infoForBinding:forObject:", CPContentBinding, self._source)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", CPOptionsKey));
    return (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", CPInsertsNullPlaceholderBindingOption)) ? 1 : 0;
    var ___r1;
}
,["CPInteger"])]);
}{var the_class = objj_allocateClassPair(_CPPopUpButtonSelectionBinder, "_CPPopUpButtonSelectedIndexBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPPopUpButtonSelectedIndexBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectItemAtIndex:", aValue + self.isa.objj_msgSend0(self, "_getInsertNullOffset")));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPPopUpButtonSelectedIndexBinder__valueForBinding_(self, _cmd, aBinding)
{
    return ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "indexOfSelectedItem")) - self.isa.objj_msgSend0(self, "_getInsertNullOffset");
    var ___r1;
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(_CPPopUpButtonSelectionBinder, "_CPPopUpButtonSelectedObjectBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPPopUpButtonSelectedObjectBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    var index = ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfItemWithRepresentedObject:", aValue)),
        offset = self.isa.objj_msgSend0(self, "_getInsertNullOffset");
    if (offset === 1 && index === CPNotFound)
        index = 0;
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectItemAtIndex:", index));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPPopUpButtonSelectedObjectBinder__valueForBinding_(self, _cmd, aBinding)
{
    return ((___r1 = ((___r2 = self._source), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "representedObject"));
    var ___r1, ___r2;
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(_CPPopUpButtonSelectionBinder, "_CPPopUpButtonSelectedTagBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPPopUpButtonSelectedTagBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectItemWithTag:", aValue));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPPopUpButtonSelectedTagBinder__valueForBinding_(self, _cmd, aBinding)
{
    return ((___r1 = ((___r2 = self._source), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tag"));
    var ___r1, ___r2;
}
,["id","CPString"])]);
}{var the_class = objj_allocateClassPair(_CPPopUpButtonSelectionBinder, "_CPPopUpButtonSelectedValueBinder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setValue:forBinding:"), function $_CPPopUpButtonSelectedValueBinder__setValue_forBinding_(self, _cmd, aValue, aBinding)
{
    ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectItemWithTitle:", aValue));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("valueForBinding:"), function $_CPPopUpButtonSelectedValueBinder__valueForBinding_(self, _cmd, aBinding)
{
    return ((___r1 = self._source), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "titleOfSelectedItem"));
    var ___r1;
}
,["id","CPString"])]);
}var DEPRECATED_CPPopUpButtonMenuKey = "CPPopUpButtonMenuKey",
    DEPRECATED_CPPopUpButtonSelectedIndexKey = "CPPopUpButtonSelectedIndexKey";
{
var the_class = objj_getClass("CPPopUpButton")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPPopUpButton\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPPopUpButton__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPopUpButton").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend0(self, "synchronizeTitleAndSelectedItem"));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", DEPRECATED_CPPopUpButtonMenuKey)))
        {
            CPLog.warn(self + " was encoded with an older version of Cappuccino. Please nib2cib the original nib again or open and re-save in Atlas.");
            (self == null ? null : self.isa.objj_msgSend1(self, "setMenu:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", DEPRECATED_CPPopUpButtonMenuKey))));
            (self == null ? null : self.isa.objj_msgSend1(self, "setObjectValue:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", DEPRECATED_CPPopUpButtonSelectedIndexKey))));
        }
        var options = CPKeyValueObservingOptionNew | CPKeyValueObservingOptionOld;
        (self == null ? null : self.isa.objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "menu.items", options, nil));
        (self == null ? null : self.isa.objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "_firstItem.changeCount", options, nil));
        (self == null ? null : self.isa.objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "selectedItem.changeCount", options, nil));
    }
    return self;
}
,["id","CPCoder"])]);
}