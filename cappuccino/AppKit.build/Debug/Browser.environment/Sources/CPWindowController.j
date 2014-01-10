@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;13;CPResponder.ji;10;CPWindow.jt;15659;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPCib.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPWindow.j", YES);{var the_class = objj_allocateClassPair(CPResponder, "CPWindowController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_documents"), new objj_ivar("_document"), new objj_ivar("_shouldCloseDocument"), new objj_ivar("_supportsMultipleDocuments"), new objj_ivar("_cibOwner"), new objj_ivar("_windowCibName"), new objj_ivar("_windowCibPath"), new objj_ivar("_viewController"), new objj_ivar("_viewControllerContainerView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPWindowController__init(self, _cmd)
{
    return objj_msgSend(self, "initWithWindow:", nil);
}
,["id"]), new objj_method(sel_getUid("initWithWindow:"), function $CPWindowController__initWithWindow_(self, _cmd, aWindow)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindowController").super_class }, "init");
    if (self)
    {
        objj_msgSend(self, "setWindow:", aWindow);
        objj_msgSend(self, "setShouldCloseDocument:", NO);
        objj_msgSend(self, "setNextResponder:", CPApp);
        self._documents = [];
    }
    return self;
}
,["id","CPWindow"]), new objj_method(sel_getUid("initWithWindowCibName:"), function $CPWindowController__initWithWindowCibName_(self, _cmd, aWindowCibName)
{
    return objj_msgSend(self, "initWithWindowCibName:owner:", aWindowCibName, self);
}
,["id","CPString"]), new objj_method(sel_getUid("initWithWindowCibName:owner:"), function $CPWindowController__initWithWindowCibName_owner_(self, _cmd, aWindowCibName, anOwner)
{
    self = objj_msgSend(self, "initWithWindow:", nil);
    if (self)
    {
        self._cibOwner = anOwner;
        self._windowCibName = aWindowCibName;
    }
    return self;
}
,["id","CPString","id"]), new objj_method(sel_getUid("initWithWindowCibPath:owner:"), function $CPWindowController__initWithWindowCibPath_owner_(self, _cmd, aWindowCibPath, anOwner)
{
    self = objj_msgSend(self, "initWithWindow:", nil);
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
    objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "loadCibFile:externalNameTable:", objj_msgSend(self, "windowCibPath"), objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self._cibOwner, CPCibOwner));
}
,["void"]), new objj_method(sel_getUid("showWindow:"), function $CPWindowController__showWindow_(self, _cmd, aSender)
{
    var theWindow = objj_msgSend(self, "window");
    if (objj_msgSend(theWindow, "respondsToSelector:", sel_getUid("becomesKeyOnlyIfNeeded")) && objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded"))
        objj_msgSend(theWindow, "orderFront:", aSender);
    else
        objj_msgSend(theWindow, "makeKeyAndOrderFront:", aSender);
}
,["void","id"]), new objj_method(sel_getUid("isWindowLoaded"), function $CPWindowController__isWindowLoaded(self, _cmd)
{
    return self._window !== nil;
}
,["BOOL"]), new objj_method(sel_getUid("window"), function $CPWindowController__window(self, _cmd)
{
    if (!self._window)
    {
        objj_msgSend(self, "windowWillLoad");
        objj_msgSend(self._document, "windowControllerWillLoadCib:", self);
        objj_msgSend(self, "loadWindow");
        if (self._window === nil && objj_msgSend(self._cibOwner, "isKindOfClass:", objj_msgSend(CPDocument, "class")))
            objj_msgSend(self, "setWindow:", objj_msgSend(self._cibOwner, "valueForKey:", "window"));
        if (!self._window)
        {
            var reason = objj_msgSend(CPString, "stringWithFormat:", "Window for %@ could not be loaded from Cib or no window specified. Override loadWindow to load the window manually.", self);
            objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, reason);
        }
        objj_msgSend(self, "windowDidLoad");
        objj_msgSend(self._document, "windowControllerDidLoadCib:", self);
        objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
    }
    return self._window;
}
,["CPWindow"]), new objj_method(sel_getUid("setWindow:"), function $CPWindowController__setWindow_(self, _cmd, aWindow)
{
    objj_msgSend(self._window, "setWindowController:", nil);
    self._window = aWindow;
    objj_msgSend(self._window, "setWindowController:", self);
    objj_msgSend(self._window, "setNextResponder:", self);
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
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (self._document)
    {
        if (!objj_msgSend(self, "supportsMultipleDocuments"))
            objj_msgSend(self, "removeDocument:", self._document);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentWillSaveNotification, self._document);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidSaveNotification, self._document);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidFailToSaveNotification, self._document);
    }
    self._document = aDocument;
    if (self._document)
    {
        objj_msgSend(self, "addDocument:", self._document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentWillSave:"), CPDocumentWillSaveNotification, self._document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidSave:"), CPDocumentDidSaveNotification, self._document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidFailToSave:"), CPDocumentDidFailToSaveNotification, self._document);
        objj_msgSend(self, "setDocumentEdited:", objj_msgSend(self._document, "isDocumentEdited"));
    }
    var viewController = objj_msgSend(self._document, "viewControllerForWindowController:", self);
    if (viewController)
        objj_msgSend(self, "setViewController:", viewController);
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
    objj_msgSend(objj_msgSend(objj_msgSend(self, "window"), "toolbar"), "_autoValidateVisibleItems");
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
    if (aDocument && !objj_msgSend(self._documents, "containsObject:", aDocument))
        objj_msgSend(self._documents, "addObject:", aDocument);
}
,["void","CPDocument"]), new objj_method(sel_getUid("removeDocument:"), function $CPWindowController__removeDocument_(self, _cmd, aDocument)
{
    var index = objj_msgSend(self._documents, "indexOfObjectIdenticalTo:", aDocument);
    if (index === CPNotFound)
        return;
    objj_msgSend(self._documents, "removeObjectAtIndex:", index);
    if (self._document === aDocument && objj_msgSend(self._documents, "count"))
        objj_msgSend(self, "setDocument:", objj_msgSend(self._documents, "objectAtIndex:", MIN(index, objj_msgSend(self._documents, "count") - 1)));
}
,["void","CPDocument"]), new objj_method(sel_getUid("removeDocumentAndCloseIfNecessary:"), function $CPWindowController__removeDocumentAndCloseIfNecessary_(self, _cmd, aDocument)
{
    objj_msgSend(self, "removeDocument:", aDocument);
    if (!objj_msgSend(self._documents, "count"))
        objj_msgSend(self, "close");
}
,["void","CPDocument"]), new objj_method(sel_getUid("documents"), function $CPWindowController__documents(self, _cmd)
{
    return self._documents;
}
,["CPArray"]), new objj_method(sel_getUid("setViewControllerContainerView:"), function $CPWindowController__setViewControllerContainerView_(self, _cmd, aView)
{
    if (!self._viewControllerContainerView && !aView)
        return;
    var viewController = objj_msgSend(self, "viewController"),
        viewControllerView = objj_msgSend(viewController, "isViewLoaded") ? objj_msgSend(viewController, "view") : nil,
        contentView = objj_msgSend(objj_msgSend(self, "window"), "contentView");
    if (aView)
    {
        objj_msgSend(aView, "setFrame:", objj_msgSend(contentView, "frame"));
        objj_msgSend(aView, "setAutoresizingMask:", objj_msgSend(contentView, "autoresizingMask"));
        if (viewControllerView)
        {
            objj_msgSend(viewControllerView, "removeFromSuperview");
            objj_msgSend(aView, "addSubview:", viewControllerView);
        }
        objj_msgSend(objj_msgSend(self, "window"), "setContentView:", aView);
    }
    else if (viewControllerView)
    {
        objj_msgSend(viewControllerView, "removeFromSuperview");
        objj_msgSend(viewControllerView, "setFrame:", objj_msgSend(contentView, "frame"));
        objj_msgSend(viewControllerView, "setAutoresizingMask:", objj_msgSend(contentView, "autoresizingMask"));
        objj_msgSend(objj_msgSend(self, "window"), "setContentView:", viewControllerView);
    }
    else
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
        objj_msgSend(view, "setFrame:", objj_msgSend(contentView, "frame"));
        objj_msgSend(view, "setAutoresizingMask:", objj_msgSend(contentView, "autoresizingMask"));
        objj_msgSend(objj_msgSend(self, "window"), "setContentView:", view);
    }
    self._viewControllerContainerView = aView;
}
,["void","CPView"]), new objj_method(sel_getUid("viewControllerContainerView"), function $CPWindowController__viewControllerContainerView(self, _cmd)
{
    return self._viewControllerContainerView;
}
,["void"]), new objj_method(sel_getUid("setViewController:"), function $CPWindowController__setViewController_(self, _cmd, aViewController)
{
    if (!self._viewController && !aViewController)
        return;
    var containerView = objj_msgSend(self, "viewControllerContainerView"),
        newView = objj_msgSend(aViewController, "isViewLoaded") ? objj_msgSend(aViewController, "view") : nil;
    if (containerView)
    {
        var oldView = objj_msgSend(self._viewController, "isViewLoaded") ? objj_msgSend(self._viewController, "view") : nil;
        if (oldView)
        {
            objj_msgSend(newView, "setFrame:", objj_msgSend(oldView, "frame"));
            objj_msgSend(newView, "setAutoresizingMask:", objj_msgSend(oldView, "autoresizingMask"));
        }
        if (oldView && newView)
            objj_msgSend(containerView, "replaceSubview:with:", oldView, newView);
        else if (oldView)
            objj_msgSend(oldView, "removeFromSuperview");
        else if (newView)
            objj_msgSend(containerView, "addSubview:", newView);
    }
    else if (newView)
    {
        var contentView = objj_msgSend(objj_msgSend(self, "window"), "contentView");
        objj_msgSend(newView, "setFrame:", objj_msgSend(contentView, "frame"));
        objj_msgSend(newView, "setAutoresizingMask:", objj_msgSend(contentView, "autoresizingMask"));
        objj_msgSend(objj_msgSend(self, "window"), "setContentView:", newView);
    }
    else
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "init"),
            contentView = objj_msgSend(objj_msgSend(self, "window"), "contentView");
        objj_msgSend(view, "setFrame:", objj_msgSend(contentView, "frame"));
        objj_msgSend(view, "setAutoresizingMask:", objj_msgSend(contentView, "autoresizingMask"));
        objj_msgSend(objj_msgSend(self, "window"), "setContentView:", view);
    }
    self._viewController = aViewController;
}
,["void","CPViewController"]), new objj_method(sel_getUid("viewController"), function $CPWindowController__viewController(self, _cmd)
{
    return self._viewController;
}
,["CPViewController"]), new objj_method(sel_getUid("_documentWillSave:"), function $CPWindowController___documentWillSave_(self, _cmd, aNotification)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", YES);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_documentDidSave:"), function $CPWindowController___documentDidSave_(self, _cmd, aNotification)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_documentDidFailToSave:"), function $CPWindowController___documentDidFailToSave_(self, _cmd, aNotification)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
,["void","CPNotification"]), new objj_method(sel_getUid("document"), function $CPWindowController__document(self, _cmd)
{
    return self._document;
}
,["CPDocument"]), new objj_method(sel_getUid("setDocumentEdited:"), function $CPWindowController__setDocumentEdited_(self, _cmd, isEdited)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentEdited:", isEdited);
}
,["void","BOOL"]), new objj_method(sel_getUid("close"), function $CPWindowController__close(self, _cmd)
{
    objj_msgSend(objj_msgSend(self, "window"), "close");
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
    return objj_msgSend(objj_msgSend(self._windowCibPath, "lastPathComponent"), "stringByDeletingPathExtension");
}
,["CPString"]), new objj_method(sel_getUid("windowCibPath"), function $CPWindowController__windowCibPath(self, _cmd)
{
    if (self._windowCibPath)
        return self._windowCibPath;
    return objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", self._windowCibName + ".cib");
}
,["CPString"]), new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"), function $CPWindowController__synchronizeWindowTitleWithDocumentName(self, _cmd)
{
    if (!self._document || !self._window)
        return;
    objj_msgSend(self._window, "setTitle:", objj_msgSend(self, "windowTitleForDocumentDisplayName:", objj_msgSend(self._document, "displayName")));
}
,["void"]), new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"), function $CPWindowController__windowTitleForDocumentDisplayName_(self, _cmd, aDisplayName)
{
    return aDisplayName;
}
,["CPString","CPString"])]);
}