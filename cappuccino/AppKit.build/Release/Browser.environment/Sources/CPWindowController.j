@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;13;CPResponder.ji;10;CPWindow.jt;20904;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPCib.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPWindow.j", YES);{var the_class = objj_allocateClassPair(CPResponder, "CPWindowController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_documents"), new objj_ivar("_document"), new objj_ivar("_shouldCloseDocument"), new objj_ivar("_supportsMultipleDocuments"), new objj_ivar("_cibOwner"), new objj_ivar("_windowCibName"), new objj_ivar("_windowCibPath"), new objj_ivar("_viewController"), new objj_ivar("_viewControllerContainerView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPWindowController__init(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "initWithWindow:", nil);
}
,["id"]), new objj_method(sel_getUid("initWithWindow:"), function $CPWindowController__initWithWindow_(self, _cmd, aWindow)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindowController").super_class }, "init");
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setWindow:", aWindow));
        (self == null ? null : self.isa.objj_msgSend1(self, "setShouldCloseDocument:", NO));
        (self == null ? null : self.isa.objj_msgSend1(self, "setNextResponder:", CPApp));
        self._documents = [];
    }
    return self;
}
,["id","CPWindow"]), new objj_method(sel_getUid("initWithWindowCibName:"), function $CPWindowController__initWithWindowCibName_(self, _cmd, aWindowCibName)
{
    return self.isa.objj_msgSend2(self, "initWithWindowCibName:owner:", aWindowCibName, self);
}
,["id","CPString"]), new objj_method(sel_getUid("initWithWindowCibName:owner:"), function $CPWindowController__initWithWindowCibName_owner_(self, _cmd, aWindowCibName, anOwner)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "initWithWindow:", nil));
    if (self)
    {
        self._cibOwner = anOwner;
        self._windowCibName = aWindowCibName;
    }
    return self;
}
,["id","CPString","id"]), new objj_method(sel_getUid("initWithWindowCibPath:owner:"), function $CPWindowController__initWithWindowCibPath_owner_(self, _cmd, aWindowCibPath, anOwner)
{
    self = (self == null ? null : self.isa.objj_msgSend1(self, "initWithWindow:", nil));
    if (self)
    {
        self._cibOwner = anOwner;
        self._windowCibPath = aWindowCibPath;
    }
    return self;
}
,["id","CPString","id"]), new objj_method(sel_getUid("loadWindow"), function $CPWindowController__loadWindow(self, _cmd)
{
    if (self._window)
        return;
    ((___r1 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "loadCibFile:externalNameTable:", self.isa.objj_msgSend0(self, "windowCibPath"), objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self._cibOwner, CPCibOwner)));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("showWindow:"), function $CPWindowController__showWindow_(self, _cmd, aSender)
{
    var theWindow = self.isa.objj_msgSend0(self, "window");
    if ((theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "respondsToSelector:", sel_getUid("becomesKeyOnlyIfNeeded"))) && (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "becomesKeyOnlyIfNeeded")))
        (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "orderFront:", aSender));
    else
        (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "makeKeyAndOrderFront:", aSender));
}
,["void","id"]), new objj_method(sel_getUid("isWindowLoaded"), function $CPWindowController__isWindowLoaded(self, _cmd)
{
    return self._window !== nil;
}
,["BOOL"]), new objj_method(sel_getUid("window"), function $CPWindowController__window(self, _cmd)
{
    if (!self._window)
    {
        self.isa.objj_msgSend0(self, "windowWillLoad");
        ((___r1 = self._document), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "windowControllerWillLoadCib:", self));
        self.isa.objj_msgSend0(self, "loadWindow");
        if (self._window === nil && ((___r1 = self._cibOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isKindOfClass:", (CPDocument == null ? null : CPDocument.isa.objj_msgSend0(CPDocument, "class")))))
            self.isa.objj_msgSend1(self, "setWindow:", ((___r1 = self._cibOwner), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "valueForKey:", "window")));
        if (!self._window)
        {
            var reason = CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "Window for %@ could not be loaded from Cib or no window specified. Override loadWindow to load the window manually.", self);
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, reason);
        }
        self.isa.objj_msgSend0(self, "windowDidLoad");
        ((___r1 = self._document), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "windowControllerDidLoadCib:", self));
        self.isa.objj_msgSend0(self, "synchronizeWindowTitleWithDocumentName");
    }
    return self._window;
    var ___r1;
}
,["CPWindow"]), new objj_method(sel_getUid("setWindow:"), function $CPWindowController__setWindow_(self, _cmd, aWindow)
{
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWindowController:", nil));
    self._window = aWindow;
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setWindowController:", self));
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNextResponder:", self));
    var ___r1;
}
,["void","CPWindow"]), new objj_method(sel_getUid("windowDidLoad"), function $CPWindowController__windowDidLoad(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("windowWillLoad"), function $CPWindowController__windowWillLoad(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("setDocument:"), function $CPWindowController__setDocument_(self, _cmd, aDocument)
{
    if (self._document === aDocument)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (self._document)
    {
        if (!self.isa.objj_msgSend0(self, "supportsMultipleDocuments"))
            self.isa.objj_msgSend1(self, "removeDocument:", self._document);
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPDocumentWillSaveNotification, self._document));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidSaveNotification, self._document));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidFailToSaveNotification, self._document));
    }
    self._document = aDocument;
    if (self._document)
    {
        self.isa.objj_msgSend1(self, "addDocument:", self._document);
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentWillSave:"), CPDocumentWillSaveNotification, self._document));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidSave:"), CPDocumentDidSaveNotification, self._document));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidFailToSave:"), CPDocumentDidFailToSaveNotification, self._document));
        self.isa.objj_msgSend1(self, "setDocumentEdited:", ((___r1 = self._document), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isDocumentEdited")));
    }
    var viewController = ((___r1 = self._document), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "viewControllerForWindowController:", self));
    if (viewController)
        self.isa.objj_msgSend1(self, "setViewController:", viewController);
    self.isa.objj_msgSend0(self, "synchronizeWindowTitleWithDocumentName");
    ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "toolbar"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_autoValidateVisibleItems"));
    var ___r1, ___r2;
}
,["void","CPDocument"]), new objj_method(sel_getUid("setSupportsMultipleDocuments:"), function $CPWindowController__setSupportsMultipleDocuments_(self, _cmd, shouldSupportMultipleDocuments)
{
    self._supportsMultipleDocuments = shouldSupportMultipleDocuments;
}
,["void","BOOL"]), new objj_method(sel_getUid("supportsMultipleDocuments"), function $CPWindowController__supportsMultipleDocuments(self, _cmd)
{
    return self._supportsMultipleDocuments;
}
,["BOOL"]), new objj_method(sel_getUid("addDocument:"), function $CPWindowController__addDocument_(self, _cmd, aDocument)
{
    if (aDocument && !((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsObject:", aDocument)))
        ((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", aDocument));
    var ___r1;
}
,["void","CPDocument"]), new objj_method(sel_getUid("removeDocument:"), function $CPWindowController__removeDocument_(self, _cmd, aDocument)
{
    var index = ((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", aDocument));
    if (index === CPNotFound)
        return;
    ((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", index));
    if (self._document === aDocument && ((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        self.isa.objj_msgSend1(self, "setDocument:", ((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", MIN(index, ((___r2 = self._documents), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "count")) - 1))));
    var ___r1, ___r2;
}
,["void","CPDocument"]), new objj_method(sel_getUid("removeDocumentAndCloseIfNecessary:"), function $CPWindowController__removeDocumentAndCloseIfNecessary_(self, _cmd, aDocument)
{
    self.isa.objj_msgSend1(self, "removeDocument:", aDocument);
    if (!((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")))
        self.isa.objj_msgSend0(self, "close");
    var ___r1;
}
,["void","CPDocument"]), new objj_method(sel_getUid("documents"), function $CPWindowController__documents(self, _cmd)
{
    return self._documents;
}
,["CPArray"]), new objj_method(sel_getUid("setViewControllerContainerView:"), function $CPWindowController__setViewControllerContainerView_(self, _cmd, aView)
{
    if (!self._viewControllerContainerView && !aView)
        return;
    var viewController = self.isa.objj_msgSend0(self, "viewController"),
        viewControllerView = (viewController == null ? null : viewController.isa.objj_msgSend0(viewController, "isViewLoaded")) ? (viewController == null ? null : viewController.isa.objj_msgSend0(viewController, "view")) : nil,
        contentView = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentView"));
    if (aView)
    {
        (aView == null ? null : aView.isa.objj_msgSend1(aView, "setFrame:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "frame"))));
        (aView == null ? null : aView.isa.objj_msgSend1(aView, "setAutoresizingMask:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "autoresizingMask"))));
        if (viewControllerView)
        {
            (viewControllerView == null ? null : viewControllerView.isa.objj_msgSend0(viewControllerView, "removeFromSuperview"));
            (aView == null ? null : aView.isa.objj_msgSend1(aView, "addSubview:", viewControllerView));
        }
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContentView:", aView));
    }
    else if (viewControllerView)
    {
        (viewControllerView == null ? null : viewControllerView.isa.objj_msgSend0(viewControllerView, "removeFromSuperview"));
        (viewControllerView == null ? null : viewControllerView.isa.objj_msgSend1(viewControllerView, "setFrame:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "frame"))));
        (viewControllerView == null ? null : viewControllerView.isa.objj_msgSend1(viewControllerView, "setAutoresizingMask:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "autoresizingMask"))));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContentView:", viewControllerView));
    }
    else
    {
        var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrame:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "frame"))));
        (view == null ? null : view.isa.objj_msgSend1(view, "setAutoresizingMask:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "autoresizingMask"))));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContentView:", view));
    }
    self._viewControllerContainerView = aView;
    var ___r1;
}
,["void","CPView"]), new objj_method(sel_getUid("viewControllerContainerView"), function $CPWindowController__viewControllerContainerView(self, _cmd)
{
    return self._viewControllerContainerView;
}
,["void"]), new objj_method(sel_getUid("setViewController:"), function $CPWindowController__setViewController_(self, _cmd, aViewController)
{
    if (!self._viewController && !aViewController)
        return;
    var containerView = self.isa.objj_msgSend0(self, "viewControllerContainerView"),
        newView = (aViewController == null ? null : aViewController.isa.objj_msgSend0(aViewController, "isViewLoaded")) ? (aViewController == null ? null : aViewController.isa.objj_msgSend0(aViewController, "view")) : nil;
    if (containerView)
    {
        var oldView = ((___r1 = self._viewController), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isViewLoaded")) ? ((___r1 = self._viewController), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view")) : nil;
        if (oldView)
        {
            (newView == null ? null : newView.isa.objj_msgSend1(newView, "setFrame:", (oldView == null ? null : oldView.isa.objj_msgSend0(oldView, "frame"))));
            (newView == null ? null : newView.isa.objj_msgSend1(newView, "setAutoresizingMask:", (oldView == null ? null : oldView.isa.objj_msgSend0(oldView, "autoresizingMask"))));
        }
        if (oldView && newView)
            (containerView == null ? null : containerView.isa.objj_msgSend2(containerView, "replaceSubview:with:", oldView, newView));
        else if (oldView)
            (oldView == null ? null : oldView.isa.objj_msgSend0(oldView, "removeFromSuperview"));
        else if (newView)
            (containerView == null ? null : containerView.isa.objj_msgSend1(containerView, "addSubview:", newView));
    }
    else if (newView)
    {
        var contentView = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentView"));
        (newView == null ? null : newView.isa.objj_msgSend1(newView, "setFrame:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "frame"))));
        (newView == null ? null : newView.isa.objj_msgSend1(newView, "setAutoresizingMask:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "autoresizingMask"))));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContentView:", newView));
    }
    else
    {
        var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")),
            contentView = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentView"));
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrame:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "frame"))));
        (view == null ? null : view.isa.objj_msgSend1(view, "setAutoresizingMask:", (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "autoresizingMask"))));
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setContentView:", view));
    }
    self._viewController = aViewController;
    var ___r1;
}
,["void","CPViewController"]), new objj_method(sel_getUid("viewController"), function $CPWindowController__viewController(self, _cmd)
{
    return self._viewController;
}
,["CPViewController"]), new objj_method(sel_getUid("_documentWillSave:"), function $CPWindowController___documentWillSave_(self, _cmd, aNotification)
{
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentSaving:", YES));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("_documentDidSave:"), function $CPWindowController___documentDidSave_(self, _cmd, aNotification)
{
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentSaving:", NO));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("_documentDidFailToSave:"), function $CPWindowController___documentDidFailToSave_(self, _cmd, aNotification)
{
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentSaving:", NO));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("document"), function $CPWindowController__document(self, _cmd)
{
    return self._document;
}
,["CPDocument"]), new objj_method(sel_getUid("setDocumentEdited:"), function $CPWindowController__setDocumentEdited_(self, _cmd, isEdited)
{
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDocumentEdited:", isEdited));
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("close"), function $CPWindowController__close(self, _cmd)
{
    ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setShouldCloseDocument:"), function $CPWindowController__setShouldCloseDocument_(self, _cmd, shouldCloseDocument)
{
    self._shouldCloseDocument = shouldCloseDocument;
}
,["void","BOOL"]), new objj_method(sel_getUid("shouldCloseDocument"), function $CPWindowController__shouldCloseDocument(self, _cmd)
{
    return self._shouldCloseDocument;
}
,["BOOL"]), new objj_method(sel_getUid("owner"), function $CPWindowController__owner(self, _cmd)
{
    return self._cibOwner;
}
,["id"]), new objj_method(sel_getUid("windowCibName"), function $CPWindowController__windowCibName(self, _cmd)
{
    if (self._windowCibName)
        return self._windowCibName;
    return ((___r1 = ((___r2 = self._windowCibPath), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "lastPathComponent"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stringByDeletingPathExtension"));
    var ___r1, ___r2;
}
,["CPString"]), new objj_method(sel_getUid("windowCibPath"), function $CPWindowController__windowCibPath(self, _cmd)
{
    if (self._windowCibPath)
        return self._windowCibPath;
    return ((___r1 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", self._windowCibName + ".cib"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"), function $CPWindowController__synchronizeWindowTitleWithDocumentName(self, _cmd)
{
    if (!self._document || !self._window)
        return;
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", self.isa.objj_msgSend1(self, "windowTitleForDocumentDisplayName:", ((___r2 = self._document), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "displayName")))));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"), function $CPWindowController__windowTitleForDocumentDisplayName_(self, _cmd, aDisplayName)
{
    return aDisplayName;
}
,["CPString","CPString"])]);
}