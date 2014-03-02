@STATIC;1.0;I;21;Foundation/CPObject.jI;25;AppKit/CPCollectionView.jI;21;AppKit/CPColorPanel.jI;21;AppKit/CPScrollView.jI;20;AppKit/CPSplitView.jI;18;AppKit/CPToolbar.jI;15;AppKit/CPView.jI;27;AppKit/CPWindow_Constants.ji;19;BKThemeDescriptor.jt;21499;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("AppKit/CPCollectionView.j", NO);objj_executeFile("AppKit/CPColorPanel.j", NO);objj_executeFile("AppKit/CPScrollView.j", NO);objj_executeFile("AppKit/CPSplitView.j", NO);objj_executeFile("AppKit/CPToolbar.j", NO);objj_executeFile("AppKit/CPView.j", NO);objj_executeFile("AppKit/CPWindow_Constants.j", NO);objj_executeFile("BKThemeDescriptor.j", YES);var LEFT_PANEL_WIDTH = 176.0;
var BKLearnMoreToolbarItemIdentifier = "BKLearnMoreToolbarItemIdentifier",
    BKStateToolbarItemIdentifier = "BKStateToolbarItemIdentifier",
    BKBackgroundColorToolbarItemIdentifier = "BKBackgroundColorToolbarItemIdentifier";
{var the_class = objj_allocateClassPair(CPObject, "BKShowcaseController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_themeDescriptorClasses"), new objj_ivar("_themesCollectionView"), new objj_ivar("_themedObjectsCollectionView"), new objj_ivar("theWindow")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $BKShowcaseController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    self._themeDescriptorClasses = objj_msgSend(BKThemeDescriptor, "allThemeDescriptorClasses");
    self.theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask);
    var toolbar = objj_msgSend(objj_msgSend(CPToolbar, "alloc"), "initWithIdentifier:", "Toolbar");
    objj_msgSend(toolbar, "setDelegate:", self);
    objj_msgSend(self.theWindow, "setToolbar:", toolbar);
    var contentView = objj_msgSend(self.theWindow, "contentView"),
        bounds = objj_msgSend(contentView, "bounds"),
        splitView = objj_msgSend(objj_msgSend(CPSplitView, "alloc"), "initWithFrame:", bounds);
    objj_msgSend(splitView, "setIsPaneSplitter:", YES);
    objj_msgSend(splitView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(contentView, "addSubview:", splitView);
    var label = objj_msgSend(CPTextField, "labelWithTitle:", "THEMES");
    objj_msgSend(label, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 11.0));
    objj_msgSend(label, "setTextColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 93.0 / 255.0, 93.0 / 255.0, 93.0 / 255.0, 1.0));
    objj_msgSend(label, "setTextShadowColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 225.0 / 255.0, 255.0 / 255.0, 255.0 / 255.0, 0.7));
    objj_msgSend(label, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
    objj_msgSend(label, "sizeToFit");
    objj_msgSend(label, "setFrameOrigin:", CGPointMake(5.0, 4.0));
    var themeDescriptorItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
    objj_msgSend(themeDescriptorItem, "setView:", objj_msgSend(objj_msgSend(BKThemeDescriptorCell, "alloc"), "init"));
    self._themesCollectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, LEFT_PANEL_WIDTH, CGRectGetHeight(bounds)));
    objj_msgSend(self._themesCollectionView, "setDelegate:", self);
    objj_msgSend(self._themesCollectionView, "setItemPrototype:", themeDescriptorItem);
    objj_msgSend(self._themesCollectionView, "setMinItemSize:", CGSizeMake(20.0, 36.0));
    objj_msgSend(self._themesCollectionView, "setMaxItemSize:", CGSizeMake(10000000.0, 36.0));
    objj_msgSend(self._themesCollectionView, "setMaxNumberOfColumns:", 1);
    objj_msgSend(self._themesCollectionView, "setContent:", self._themeDescriptorClasses);
    objj_msgSend(self._themesCollectionView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(self._themesCollectionView, "setVerticalMargin:", 0.0);
    objj_msgSend(self._themesCollectionView, "setSelectable:", YES);
    objj_msgSend(self._themesCollectionView, "setFrameOrigin:", CGPointMake(0.0, 20.0));
    objj_msgSend(self._themesCollectionView, "setAutoresizingMask:", CPViewWidthSizable);
    var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, LEFT_PANEL_WIDTH, CGRectGetHeight(bounds))),
        contentView = objj_msgSend(scrollView, "contentView");
    objj_msgSend(scrollView, "setAutohidesScrollers:", YES);
    objj_msgSend(scrollView, "setDocumentView:", self._themesCollectionView);
    objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 212.0 / 255.0, 221.0 / 255.0, 230.0 / 255.0, 1.0));
    objj_msgSend(contentView, "addSubview:", label);
    objj_msgSend(splitView, "addSubview:", scrollView);
    self._themedObjectsCollectionView = objj_msgSend(objj_msgSend(CPCollectionView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds) - LEFT_PANEL_WIDTH - 1.0, 10.0));
    var collectionViewItem = objj_msgSend(objj_msgSend(CPCollectionViewItem, "alloc"), "init");
    objj_msgSend(collectionViewItem, "setView:", objj_msgSend(objj_msgSend(BKShowcaseCell, "alloc"), "init"));
    objj_msgSend(self._themedObjectsCollectionView, "setItemPrototype:", collectionViewItem);
    objj_msgSend(self._themedObjectsCollectionView, "setVerticalMargin:", 20.0);
    objj_msgSend(self._themedObjectsCollectionView, "setAutoresizingMask:", CPViewWidthSizable);
    var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(LEFT_PANEL_WIDTH + 1.0, 0.0, CGRectGetWidth(bounds) - LEFT_PANEL_WIDTH - 1.0, CGRectGetHeight(bounds)));
    objj_msgSend(scrollView, "setHasHorizontalScroller:", NO);
    objj_msgSend(scrollView, "setAutohidesScrollers:", YES);
    objj_msgSend(scrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(scrollView, "setDocumentView:", self._themedObjectsCollectionView);
    objj_msgSend(splitView, "addSubview:", scrollView);
    objj_msgSend(self._themesCollectionView, "setSelectionIndexes:", objj_msgSend(CPIndexSet, "indexSetWithIndex:", 0));
    objj_msgSend(self.theWindow, "setMovable:", NO);
    objj_msgSend(self.theWindow, "setFullPlatformWindow:", YES);
    objj_msgSend(self.theWindow, "makeKeyAndOrderFront:", self);
}
,["void","CPNotification"]), new objj_method(sel_getUid("collectionViewDidChangeSelection:"), function $BKShowcaseController__collectionViewDidChangeSelection_(self, _cmd, aCollectionView)
{
    var themeDescriptorClass = self._themeDescriptorClasses[objj_msgSend(objj_msgSend(aCollectionView, "selectionIndexes"), "firstIndex")],
        itemSize = objj_msgSend(themeDescriptorClass, "itemSize");
    itemSize.width = MAX(100.0, itemSize.width + 20.0);
    itemSize.height = MAX(100.0, itemSize.height + 30.0);
    objj_msgSend(self._themedObjectsCollectionView, "setMinItemSize:", itemSize);
    objj_msgSend(self._themedObjectsCollectionView, "setMaxItemSize:", itemSize);
    objj_msgSend(self._themedObjectsCollectionView, "setContent:", objj_msgSend(themeDescriptorClass, "themedShowcaseObjectTemplates"));
    objj_msgSend(BKShowcaseCell, "setBackgroundColor:", objj_msgSend(themeDescriptorClass, "showcaseBackgroundColor"));
}
,["void","CPCollectionView"]), new objj_method(sel_getUid("hasLearnMoreURL"), function $BKShowcaseController__hasLearnMoreURL(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "BKLearnMoreURL");
}
,["BOOL"]), new objj_method(sel_getUid("toolbarAllowedItemIdentifiers:"), function $BKShowcaseController__toolbarAllowedItemIdentifiers_(self, _cmd, aToolbar)
{
    return [BKLearnMoreToolbarItemIdentifier, CPToolbarSpaceItemIdentifier, CPToolbarFlexibleSpaceItemIdentifier, BKBackgroundColorToolbarItemIdentifier, BKStateToolbarItemIdentifier];
}
,["CPArray","CPToolbar"]), new objj_method(sel_getUid("toolbarDefaultItemIdentifiers:"), function $BKShowcaseController__toolbarDefaultItemIdentifiers_(self, _cmd, aToolbar)
{
    var itemIdentifiers = [CPToolbarFlexibleSpaceItemIdentifier, BKBackgroundColorToolbarItemIdentifier, BKStateToolbarItemIdentifier];
    if (objj_msgSend(self, "hasLearnMoreURL"))
        itemIdentifiers = [BKLearnMoreToolbarItemIdentifier].concat(itemIdentifiers);
    return itemIdentifiers;
}
,["CPArray","CPToolbar"]), new objj_method(sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"), function $BKShowcaseController__toolbar_itemForItemIdentifier_willBeInsertedIntoToolbar_(self, _cmd, aToolbar, anItemIdentifier, aFlag)
{
    var toolbarItem = objj_msgSend(objj_msgSend(CPToolbarItem, "alloc"), "initWithItemIdentifier:", anItemIdentifier);
    objj_msgSend(toolbarItem, "setTarget:", self);
    if (anItemIdentifier === BKStateToolbarItemIdentifier)
    {
        var popUpButton = objj_msgSend(CPPopUpButton, "buttonWithTitle:", "Enabled");
        objj_msgSend(popUpButton, "addItemWithTitle:", "Disabled");
        objj_msgSend(toolbarItem, "setView:", popUpButton);
        objj_msgSend(toolbarItem, "setTarget:", nil);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("changeState:"));
        objj_msgSend(toolbarItem, "setLabel:", "State");
        var width = CGRectGetWidth(objj_msgSend(popUpButton, "frame"));
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(width + 20.0, 25.0));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(width + 20.0, 25.0));
    }
    else if (anItemIdentifier === BKBackgroundColorToolbarItemIdentifier)
    {
        var popUpButton = objj_msgSend(CPPopUpButton, "buttonWithTitle:", "Window Background");
        objj_msgSend(popUpButton, "addItemWithTitle:", "Light Checkers");
        objj_msgSend(popUpButton, "addItemWithTitle:", "Dark Checkers");
        objj_msgSend(popUpButton, "addItemWithTitle:", "White");
        objj_msgSend(popUpButton, "addItemWithTitle:", "Black");
        objj_msgSend(popUpButton, "addItemWithTitle:", "More Choices...");
        var itemArray = objj_msgSend(popUpButton, "itemArray");
        objj_msgSend(itemArray[0], "setRepresentedObject:", objj_msgSend(BKThemeDescriptor, "windowBackgroundColor"));
        objj_msgSend(itemArray[1], "setRepresentedObject:", objj_msgSend(BKThemeDescriptor, "lightCheckersColor"));
        objj_msgSend(itemArray[2], "setRepresentedObject:", objj_msgSend(BKThemeDescriptor, "darkCheckersColor"));
        objj_msgSend(itemArray[3], "setRepresentedObject:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(itemArray[4], "setRepresentedObject:", objj_msgSend(CPColor, "blackColor"));
        objj_msgSend(toolbarItem, "setView:", popUpButton);
        objj_msgSend(toolbarItem, "setTarget:", nil);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("changeColor:"));
        objj_msgSend(toolbarItem, "setLabel:", "Background Color");
        var width = CGRectGetWidth(objj_msgSend(popUpButton, "frame"));
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(width, 25.0));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(width, 25.0));
    }
    else if (anItemIdentifier === BKLearnMoreToolbarItemIdentifier)
    {
        var title = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "BKLearnMoreButtonTitle");
        if (!title)
            title = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "CPBundleName") || "Home Page";
        var button = objj_msgSend(CPButton, "buttonWithTitle:", title);
        objj_msgSend(self.theWindow, "setDefaultButton:", button);
        objj_msgSend(toolbarItem, "setView:", button);
        objj_msgSend(toolbarItem, "setLabel:", "Learn More");
        objj_msgSend(toolbarItem, "setTarget:", nil);
        objj_msgSend(toolbarItem, "setAction:", sel_getUid("learnMore:"));
        var width = CGRectGetWidth(objj_msgSend(button, "frame"));
        objj_msgSend(toolbarItem, "setMinSize:", CGSizeMake(width, 25.0));
        objj_msgSend(toolbarItem, "setMaxSize:", CGSizeMake(width, 25.0));
    }
    return toolbarItem;
}
,["CPToolbarItem","CPToolbar","CPString","BOOL"]), new objj_method(sel_getUid("learnMore:"), function $BKShowcaseController__learnMore_(self, _cmd, aSender)
{
    window.location.href = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "BKLearnMoreURL");
}
,["void","id"]), new objj_method(sel_getUid("selectedThemeDescriptor"), function $BKShowcaseController__selectedThemeDescriptor(self, _cmd)
{
    return self._themeDescriptorClasses[objj_msgSend(objj_msgSend(self._themesCollectionView, "selectionIndexes"), "firstIndex")];
}
,["BKThemeDescriptor"]), new objj_method(sel_getUid("changeState:"), function $BKShowcaseController__changeState_(self, _cmd, aSender)
{
    var themedShowcaseObjectTemplates = objj_msgSend(objj_msgSend(self, "selectedThemeDescriptor"), "themedShowcaseObjectTemplates"),
        count = objj_msgSend(themedShowcaseObjectTemplates, "count");
    while (count--)
    {
        var themedObject = objj_msgSend(themedShowcaseObjectTemplates[count], "valueForKey:", "themedObject");
        if (objj_msgSend(themedObject, "respondsToSelector:", sel_getUid("setEnabled:")))
            objj_msgSend(themedObject, "setEnabled:", objj_msgSend(aSender, "title") === "Enabled" ? YES : NO);
    }
}
,["void","id"]), new objj_method(sel_getUid("changeColor:"), function $BKShowcaseController__changeColor_(self, _cmd, aSender)
{
    var color = nil;
    if (objj_msgSend(aSender, "isKindOfClass:", objj_msgSend(CPColorPanel, "class")))
        color = objj_msgSend(aSender, "color");
    else
    {
        if (objj_msgSend(aSender, "titleOfSelectedItem") === "More Choices...")
        {
            objj_msgSend(aSender, "addItemWithTitle:", "Other");
            objj_msgSend(aSender, "selectItemWithTitle:", "Other");
            objj_msgSend(CPApp, "orderFrontColorPanel:", self);
        }
        else
        {
            color = objj_msgSend(objj_msgSend(aSender, "selectedItem"), "representedObject");
            objj_msgSend(aSender, "removeItemWithTitle:", "Other");
        }
    }
    if (color)
    {
        objj_msgSend(objj_msgSend(self, "selectedThemeDescriptor"), "setShowcaseBackgroundColor:", color);
        objj_msgSend(BKShowcaseCell, "setBackgroundColor:", color);
    }
}
,["void","id"])]);
}var SelectionColor = nil;
{var the_class = objj_allocateClassPair(CPView, "BKThemeDescriptorCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_label")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setRepresentedObject:"), function $BKThemeDescriptorCell__setRepresentedObject_(self, _cmd, aThemeDescriptor)
{
    if (!self._label)
    {
        self._label = objj_msgSend(CPTextField, "labelWithTitle:", "hello");
        objj_msgSend(self._label, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
        objj_msgSend(self._label, "setFrame:", CGRectMake(10.0, 0.0, CGRectGetWidth(objj_msgSend(self, "bounds")) - 20.0, CGRectGetHeight(objj_msgSend(self, "bounds"))));
        objj_msgSend(self._label, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
        objj_msgSend(self._label, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(self, "addSubview:", self._label);
    }
    objj_msgSend(self._label, "setStringValue:", objj_msgSend(aThemeDescriptor, "themeName") + " (" + objj_msgSend(objj_msgSend(aThemeDescriptor, "themedShowcaseObjectTemplates"), "count") + ")");
}
,["void","id"]), new objj_method(sel_getUid("setSelected:"), function $BKThemeDescriptorCell__setSelected_(self, _cmd, isSelected)
{
    objj_msgSend(self, "setBackgroundColor:", isSelected ? objj_msgSend(objj_msgSend(self, "class"), "selectionColor") : nil);
    objj_msgSend(self._label, "setTextShadowOffset:", isSelected ? CGSizeMake(0.0, 1.0) : CGSizeMakeZero());
    objj_msgSend(self._label, "setTextShadowColor:", isSelected ? objj_msgSend(CPColor, "blackColor") : nil);
    objj_msgSend(self._label, "setFont:", isSelected ? objj_msgSend(CPFont, "boldSystemFontOfSize:", 11.0) : objj_msgSend(CPFont, "systemFontOfSize:", 11.0));
    objj_msgSend(self._label, "setTextColor:", isSelected ? objj_msgSend(CPColor, "whiteColor") : objj_msgSend(CPColor, "blackColor"));
}
,["void","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("selectionColor"), function $BKThemeDescriptorCell__selectionColor(self, _cmd)
{
    if (!SelectionColor)
        SelectionColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(BKThemeDescriptorCell, "class")), "pathForResource:", "selection.png"), CGSizeMake(1.0, 36.0)));
    return SelectionColor;
}
,["CPImage"])]);
}var ShowcaseCellBackgroundColor = nil,
    BKShowcaseCellBackgroundColorDidChangeNotification = "BKShowcaseCellBackgroundColorDidChangeNotification";
{var the_class = objj_allocateClassPair(CPView, "BKShowcaseCell"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_backgroundView"), new objj_ivar("_view"), new objj_ivar("_label")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $BKShowcaseCell__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("BKShowcaseCell").super_class }, "init");
    if (self)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("showcaseBackgroundDidChange:"), BKShowcaseCellBackgroundColorDidChangeNotification, nil);
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithCoder:"), function $BKShowcaseCell__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("BKShowcaseCell").super_class }, "initWithCoder:", aCoder);
    if (self)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("showcaseBackgroundDidChange:"), BKShowcaseCellBackgroundColorDidChangeNotification, nil);
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("showcaseBackgroundDidChange:"), function $BKShowcaseCell__showcaseBackgroundDidChange_(self, _cmd, aNotification)
{
    objj_msgSend(self._backgroundView, "setBackgroundColor:", objj_msgSend(BKShowcaseCell, "backgroundColor"));
}
,["void","CPNotification"]), new objj_method(sel_getUid("setSelected:"), function $BKShowcaseCell__setSelected_(self, _cmd, isSelected)
{
}
,["void","BOOL"]), new objj_method(sel_getUid("setRepresentedObject:"), function $BKShowcaseCell__setRepresentedObject_(self, _cmd, anObject)
{
    if (!anObject)
        return;
    if (!self._label)
    {
        self._label = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._label, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(self._label, "setAutoresizingMask:", CPViewMinYMargin | CPViewWidthSizable);
        objj_msgSend(self._label, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 11.0));
        objj_msgSend(self, "addSubview:", self._label);
    }
    objj_msgSend(self._label, "setStringValue:", objj_msgSend(anObject, "valueForKey:", "label"));
    objj_msgSend(self._label, "sizeToFit");
    objj_msgSend(self._label, "setFrame:", CGRectMake(0.0, CGRectGetHeight(objj_msgSend(self, "bounds")) - CGRectGetHeight(objj_msgSend(self._label, "frame")), CGRectGetWidth(objj_msgSend(self, "bounds")), CGRectGetHeight(objj_msgSend(self._label, "frame"))));
    if (!self._backgroundView)
    {
        self._backgroundView = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(self, "addSubview:", self._backgroundView);
    }
    objj_msgSend(self._backgroundView, "setFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(objj_msgSend(self, "bounds")), CGRectGetMinY(objj_msgSend(self._label, "frame"))));
    objj_msgSend(self._backgroundView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    if (self._view)
        objj_msgSend(self._view, "removeFromSuperview");
    self._view = objj_msgSend(anObject, "valueForKey:", "themedObject");
    objj_msgSend(self._view, "setTheme:", nil);
    objj_msgSend(self._view, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin);
    objj_msgSend(self._view, "setFrameOrigin:", CGPointMake((CGRectGetWidth(objj_msgSend(self._backgroundView, "bounds")) - CGRectGetWidth(objj_msgSend(self._view, "frame"))) / 2.0, (CGRectGetHeight(objj_msgSend(self._backgroundView, "bounds")) - CGRectGetHeight(objj_msgSend(self._view, "frame"))) / 2.0));
    objj_msgSend(self._backgroundView, "addSubview:", self._view);
    objj_msgSend(self._backgroundView, "setBackgroundColor:", objj_msgSend(BKShowcaseCell, "backgroundColor"));
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setBackgroundColor:"), function $BKShowcaseCell__setBackgroundColor_(self, _cmd, aColor)
{
    if (ShowcaseCellBackgroundColor === aColor)
        return;
    ShowcaseCellBackgroundColor = aColor;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", BKShowcaseCellBackgroundColorDidChangeNotification, nil);
}
,["void","CPColor"]), new objj_method(sel_getUid("backgroundColor"), function $BKShowcaseCell__backgroundColor(self, _cmd)
{
    return ShowcaseCellBackgroundColor;
}
,["CPColor"])]);
}