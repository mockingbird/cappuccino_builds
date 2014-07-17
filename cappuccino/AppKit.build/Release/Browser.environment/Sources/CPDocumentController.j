@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;12;CPDocument.ji;13;CPOpenPanel.ji;12;CPMenuItem.ji;20;CPWindowController.jt;19569;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPBundle.j", NO);objj_executeFile("CPDocument.j", YES);objj_executeFile("CPOpenPanel.j", YES);objj_executeFile("CPMenuItem.j", YES);objj_executeFile("CPWindowController.j", YES);var CPSharedDocumentController = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPDocumentController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_documents"), new objj_ivar("_documentTypes")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPDocumentController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDocumentController").super_class }, "init");
    if (self)
    {
        self._documents = ((___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        if (!CPSharedDocumentController)
            CPSharedDocumentController = self;
        self._documentTypes = ((___r1 = ((___r2 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "infoDictionary"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "CPBundleDocumentTypes"));
    }
    return self;
    var ___r1, ___r2;
}
,["id"]), new objj_method(sel_getUid("documentForURL:"), function $CPDocumentController__documentForURL_(self, _cmd, aURL)
{
    var index = 0,
        count = ((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    for (; index < count; ++index)
    {
        var theDocument = self._documents[index];
        if (((___r1 = (theDocument == null ? null : theDocument.isa.objj_msgSend0(theDocument, "fileURL"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", aURL)))
            return theDocument;
    }
    return nil;
    var ___r1;
}
,["CPDocument","CPURL"]), new objj_method(sel_getUid("openUntitledDocumentOfType:display:"), function $CPDocumentController__openUntitledDocumentOfType_display_(self, _cmd, aType, shouldDisplay)
{
    var theDocument = self.isa.objj_msgSend2(self, "makeUntitledDocumentOfType:error:", aType, nil);
    if (theDocument)
        self.isa.objj_msgSend1(self, "addDocument:", theDocument);
    if (shouldDisplay)
    {
        (theDocument == null ? null : theDocument.isa.objj_msgSend0(theDocument, "makeWindowControllers"));
        (theDocument == null ? null : theDocument.isa.objj_msgSend0(theDocument, "showWindows"));
    }
    return theDocument;
}
,["void","CPString","BOOL"]), new objj_method(sel_getUid("makeUntitledDocumentOfType:error:"), function $CPDocumentController__makeUntitledDocumentOfType_error_(self, _cmd, aType, anError)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend1(self, "documentClassForType:", aType)), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithType:error:", aType, anError));
    var ___r1, ___r2;
}
,["CPDocument","CPString","CPError"]), new objj_method(sel_getUid("openDocumentWithContentsOfURL:display:error:"), function $CPDocumentController__openDocumentWithContentsOfURL_display_error_(self, _cmd, anAbsoluteURL, shouldDisplay, anError)
{
    var result = self.isa.objj_msgSend1(self, "documentForURL:", anAbsoluteURL);
    if (!result)
    {
        var type = self.isa.objj_msgSend2(self, "typeForContentsOfURL:error:", anAbsoluteURL, anError);
        result = self.isa.objj_msgSend(self, "makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, type, self, sel_getUid("document:didRead:contextInfo:"), objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", shouldDisplay, "shouldDisplay"));
        self.isa.objj_msgSend1(self, "addDocument:", result);
        if (result)
            self.isa.objj_msgSend1(self, "noteNewRecentDocument:", result);
    }
    else if (shouldDisplay)
        (result == null ? null : result.isa.objj_msgSend0(result, "showWindows"));
    return result;
}
,["CPDocument","CPURL","BOOL","CPError"]), new objj_method(sel_getUid("reopenDocumentForURL:withContentsOfURL:error:"), function $CPDocumentController__reopenDocumentForURL_withContentsOfURL_error_(self, _cmd, anAbsoluteURL, absoluteContentsURL, anError)
{
    return self.isa.objj_msgSend(self, "makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, absoluteContentsURL, ((___r1 = ((___r2 = self._documentTypes), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", 0))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "CPBundleTypeName")), self, sel_getUid("document:didRead:contextInfo:"), nil);
    var ___r1, ___r2;
}
,["CPDocument","CPURL","CPURL","CPError"]), new objj_method(sel_getUid("makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocumentController__makeDocumentWithContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aSelector, aContextInfo)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend1(self, "documentClassForType:", aType)), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, aType, aDelegate, aSelector, aContextInfo));
    var ___r1, ___r2;
}
,["CPDocument","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocumentController__makeDocumentForURL_withContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aSelector, aContextInfo)
{
    return ((___r1 = ((___r2 = self.isa.objj_msgSend1(self, "documentClassForType:", aType)), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aSelector, aContextInfo));
    var ___r1, ___r2;
}
,["CPDocument","CPURL","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("document:didRead:contextInfo:"), function $CPDocumentController__document_didRead_contextInfo_(self, _cmd, aDocument, didRead, aContextInfo)
{
    if (!didRead)
        return;
    (aDocument == null ? null : aDocument.isa.objj_msgSend0(aDocument, "makeWindowControllers"));
    if ((aContextInfo == null ? null : aContextInfo.isa.objj_msgSend1(aContextInfo, "objectForKey:", "shouldDisplay")))
        (aDocument == null ? null : aDocument.isa.objj_msgSend0(aDocument, "showWindows"));
}
,["void","CPDocument","BOOL","id"]), new objj_method(sel_getUid("newDocument:"), function $CPDocumentController__newDocument_(self, _cmd, aSender)
{
    self.isa.objj_msgSend2(self, "openUntitledDocumentOfType:display:", ((___r1 = ((___r2 = self._documentTypes), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "objectAtIndex:", 0))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "CPBundleTypeName")), YES);
    var ___r1, ___r2;
}
,["CFAction","id"]), new objj_method(sel_getUid("openDocument:"), function $CPDocumentController__openDocument_(self, _cmd, aSender)
{
    var openPanel = CPOpenPanel.isa.objj_msgSend0(CPOpenPanel, "openPanel");
    (openPanel == null ? null : openPanel.isa.objj_msgSend0(openPanel, "runModal"));
    var URLs = (openPanel == null ? null : openPanel.isa.objj_msgSend0(openPanel, "URLs")),
        index = 0,
        count = (URLs == null ? null : URLs.isa.objj_msgSend0(URLs, "count"));
    for (; index < count; ++index)
        self.isa.objj_msgSend3(self, "openDocumentWithContentsOfURL:display:error:", CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", URLs[index]), YES, nil);
}
,["void","id"]), new objj_method(sel_getUid("documents"), function $CPDocumentController__documents(self, _cmd)
{
    return self._documents;
}
,["CPArray"]), new objj_method(sel_getUid("currentDocument"), function $CPDocumentController__currentDocument(self, _cmd)
{
    return ((___r1 = ((___r2 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainWindow"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "windowController"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "document"));
    var ___r1, ___r2;
}
,["CPDocument"]), new objj_method(sel_getUid("addDocument:"), function $CPDocumentController__addDocument_(self, _cmd, aDocument)
{
    ((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", aDocument));
    var ___r1;
}
,["void","CPDocument"]), new objj_method(sel_getUid("removeDocument:"), function $CPDocumentController__removeDocument_(self, _cmd, aDocument)
{
    ((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectIdenticalTo:", aDocument));
    var ___r1;
}
,["void","CPDocument"]), new objj_method(sel_getUid("documentForWindow:"), function $CPDocumentController__documentForWindow_(self, _cmd, aWindow)
{
    return ((___r1 = (aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "windowController"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "document"));
    var ___r1;
}
,["CPDocument","CPWindow"]), new objj_method(sel_getUid("hasEditedDocuments"), function $CPDocumentController__hasEditedDocuments(self, _cmd)
{
    var iter = ((___r1 = self._documents), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "objectEnumerator")),
        obj;
    while ((obj = (iter == null ? null : iter.isa.objj_msgSend0(iter, "nextObject"))) !== nil)
    {
        if ((obj == null ? null : obj.isa.objj_msgSend0(obj, "isDocumentEdited")))
            return YES;
    }
    return NO;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("defaultType"), function $CPDocumentController__defaultType(self, _cmd)
{
    return ((___r1 = self._documentTypes[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "CPBundleTypeName"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("typeForContentsOfURL:error:"), function $CPDocumentController__typeForContentsOfURL_error_(self, _cmd, anAbsoluteURL, outError)
{
    var index = 0,
        count = self._documentTypes.length,
        extension = ((___r1 = (anAbsoluteURL == null ? null : anAbsoluteURL.isa.objj_msgSend0(anAbsoluteURL, "pathExtension"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lowercaseString")),
        starType = nil;
    for (; index < count; ++index)
    {
        var documentType = self._documentTypes[index],
            extensions = (documentType == null ? null : documentType.isa.objj_msgSend1(documentType, "objectForKey:", "CFBundleTypeExtensions")),
            extensionIndex = 0,
            extensionCount = extensions.length;
        for (; extensionIndex < extensionCount; ++extensionIndex)
        {
            var thisExtension = ((___r1 = extensions[extensionIndex]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lowercaseString"));
            if (thisExtension === extension)
                return (documentType == null ? null : documentType.isa.objj_msgSend1(documentType, "objectForKey:", "CPBundleTypeName"));
            if (thisExtension === "****")
                starType = (documentType == null ? null : documentType.isa.objj_msgSend1(documentType, "objectForKey:", "CPBundleTypeName"));
        }
    }
    return starType || self.isa.objj_msgSend0(self, "defaultType");
    var ___r1;
}
,["CPString","CPURL","CPError"]), new objj_method(sel_getUid("_infoForType:"), function $CPDocumentController___infoForType_(self, _cmd, aType)
{
    var i = 0,
        count = ((___r1 = self._documentTypes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    for (; i < count; ++i)
    {
        var documentType = self._documentTypes[i];
        if ((documentType == null ? null : documentType.isa.objj_msgSend1(documentType, "objectForKey:", "CPBundleTypeName")) == aType)
            return documentType;
    }
    return nil;
    var ___r1;
}
,["CPDictionary","CPString"]), new objj_method(sel_getUid("documentClassForType:"), function $CPDocumentController__documentClassForType_(self, _cmd, aType)
{
    var className = ((___r1 = self.isa.objj_msgSend1(self, "_infoForType:", aType)), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", "CPDocumentClass"));
    return className ? CPClassFromString(className) : nil;
    var ___r1;
}
,["Class","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedDocumentController"), function $CPDocumentController__sharedDocumentController(self, _cmd)
{
    if (!CPSharedDocumentController)
        ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return CPSharedDocumentController;
    var ___r1;
}
,["id"])]);
}{
var the_class = objj_getClass("CPDocumentController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDocumentController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("closeAllDocumentsWithDelegate:didCloseAllSelector:contextInfo:"), function $CPDocumentController__closeAllDocumentsWithDelegate_didCloseAllSelector_contextInfo_(self, _cmd, aDelegate, didCloseSelector, info)
{
    var context = {delegate: aDelegate, selector: didCloseSelector, context: info};
    self.isa.objj_msgSend3(self, "_closeDocumentsStartingWith:shouldClose:context:", nil, YES, context);
}
,["void","id","SEL","Object"]), new objj_method(sel_getUid("_closeDocumentsStartingWith:shouldClose:context:"), function $CPDocumentController___closeDocumentsStartingWith_shouldClose_context_(self, _cmd, aDocument, shouldClose, context)
{
    if (shouldClose)
    {
        (aDocument == null ? null : aDocument.isa.objj_msgSend0(aDocument, "close"));
        if (((___r1 = self.isa.objj_msgSend0(self, "documents")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 0)
        {
            ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "documents")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "lastObject"))), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:", self, sel_getUid("_closeDocumentsStartingWith:shouldClose:context:"), context));
            return;
        }
    }
    if (((___r1 = context.delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", context.selector)))
        objj_msgSend(context.delegate, context.selector, self, ((___r1 = self.isa.objj_msgSend0(self, "documents")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) === 0, context.context);
    var ___r1, ___r2;
}
,["void","CPDocument","BOOL","Object"])]);
}{
var the_class = objj_getClass("CPDocumentController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDocumentController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("recentDocumentURLs"), function $CPDocumentController__recentDocumentURLs(self, _cmd)
{
    if (typeof window["cpRecentDocumentURLs"] === 'function')
        return window.cpRecentDocumentURLs();
    return [];
}
,["CPArray"]), new objj_method(sel_getUid("clearRecentDocuments:"), function $CPDocumentController__clearRecentDocuments_(self, _cmd, sender)
{
    if (typeof window["cpClearRecentDocuments"] === 'function')
        window.cpClearRecentDocuments();
    self.isa.objj_msgSend0(self, "_updateRecentDocumentsMenu");
}
,["void","id"]), new objj_method(sel_getUid("noteNewRecentDocument:"), function $CPDocumentController__noteNewRecentDocument_(self, _cmd, aDocument)
{
    self.isa.objj_msgSend1(self, "noteNewRecentDocumentURL:", (aDocument == null ? null : aDocument.isa.objj_msgSend0(aDocument, "fileURL")));
}
,["void","CPDocument"]), new objj_method(sel_getUid("noteNewRecentDocumentURL:"), function $CPDocumentController__noteNewRecentDocumentURL_(self, _cmd, aURL)
{
    var urlAsString = (aURL == null ? null : aURL.isa.objj_msgSend1(aURL, "isKindOfClass:", CPString)) ? aURL : (aURL == null ? null : aURL.isa.objj_msgSend0(aURL, "absoluteString"));
    if (typeof window["cpNoteNewRecentDocumentPath"] === 'function')
        window.cpNoteNewRecentDocumentPath(urlAsString);
    self.isa.objj_msgSend0(self, "_updateRecentDocumentsMenu");
}
,["void","CPURL"]), new objj_method(sel_getUid("_removeAllRecentDocumentsFromMenu:"), function $CPDocumentController___removeAllRecentDocumentsFromMenu_(self, _cmd, aMenu)
{
    var items = (aMenu == null ? null : aMenu.isa.objj_msgSend0(aMenu, "itemArray")),
        count = (items == null ? null : items.isa.objj_msgSend0(items, "count"));
    while (count--)
    {
        var item = items[count];
        if ((item == null ? null : item.isa.objj_msgSend0(item, "action")) === sel_getUid("_openRecentDocument:"))
            (aMenu == null ? null : aMenu.isa.objj_msgSend1(aMenu, "removeItemAtIndex:", count));
    }
}
,["void","CPMenu"]), new objj_method(sel_getUid("_updateRecentDocumentsMenu"), function $CPDocumentController___updateRecentDocumentsMenu(self, _cmd)
{
    var menu = ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "mainMenu"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_menuWithName:", "_CPRecentDocumentsMenu")),
        recentDocuments = self.isa.objj_msgSend0(self, "recentDocumentURLs"),
        menuItems = (menu == null ? null : menu.isa.objj_msgSend0(menu, "itemArray")),
        documentCount = (recentDocuments == null ? null : recentDocuments.isa.objj_msgSend0(recentDocuments, "count")),
        menuItemCount = (menuItems == null ? null : menuItems.isa.objj_msgSend0(menuItems, "count"));
    self.isa.objj_msgSend1(self, "_removeAllRecentDocumentsFromMenu:", menu);
    if (menuItemCount)
    {
        if (!documentCount)
        {
            if (((___r1 = menuItems[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isSeparatorItem")))
                (menu == null ? null : menu.isa.objj_msgSend1(menu, "removeItemAtIndex:", 0));
        }
        else
        {
            if (!((___r1 = menuItems[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isSeparatorItem")))
                (menu == null ? null : menu.isa.objj_msgSend2(menu, "insertItem:atIndex:", CPMenuItem.isa.objj_msgSend0(CPMenuItem, "separatorItem"), 0));
        }
    }
    while (documentCount--)
    {
        var path = recentDocuments[documentCount],
            item = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", (path == null ? null : path.isa.objj_msgSend0(path, "lastPathComponent")), sel_getUid("_openRecentDocument:"), nil));
        (item == null ? null : item.isa.objj_msgSend1(item, "setTag:", path));
        (menu == null ? null : menu.isa.objj_msgSend2(menu, "insertItem:atIndex:", item, 0));
    }
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_openRecentDocument:"), function $CPDocumentController___openRecentDocument_(self, _cmd, sender)
{
    self.isa.objj_msgSend3(self, "openDocumentWithContentsOfURL:display:error:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "tag")), YES, nil);
}
,["void","id"])]);
}