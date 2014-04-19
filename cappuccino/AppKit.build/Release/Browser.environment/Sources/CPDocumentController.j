@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;12;CPDocument.ji;13;CPOpenPanel.ji;12;CPMenuItem.ji;20;CPWindowController.jt;15465;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPBundle.j", NO);objj_executeFile("CPDocument.j", YES);objj_executeFile("CPOpenPanel.j", YES);objj_executeFile("CPMenuItem.j", YES);objj_executeFile("CPWindowController.j", YES);var CPSharedDocumentController = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPDocumentController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_documents"), new objj_ivar("_documentTypes")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPDocumentController__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDocumentController").super_class }, "init");
    if (self)
    {
        self._documents = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
        if (!CPSharedDocumentController)
            CPSharedDocumentController = self;
        self._documentTypes = objj_msgSend(objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "infoDictionary"), "objectForKey:", "CPBundleDocumentTypes");
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("documentForURL:"), function $CPDocumentController__documentForURL_(self, _cmd, aURL)
{
    var index = 0,
        count = objj_msgSend(self._documents, "count");
    for (; index < count; ++index)
    {
        var theDocument = self._documents[index];
        if (objj_msgSend(objj_msgSend(theDocument, "fileURL"), "isEqual:", aURL))
            return theDocument;
    }
    return nil;
}
,["CPDocument","CPURL"]), new objj_method(sel_getUid("openUntitledDocumentOfType:display:"), function $CPDocumentController__openUntitledDocumentOfType_display_(self, _cmd, aType, shouldDisplay)
{
    var theDocument = objj_msgSend(self, "makeUntitledDocumentOfType:error:", aType, nil);
    if (theDocument)
        objj_msgSend(self, "addDocument:", theDocument);
    if (shouldDisplay)
    {
        objj_msgSend(theDocument, "makeWindowControllers");
        objj_msgSend(theDocument, "showWindows");
    }
    return theDocument;
}
,["void","CPString","BOOL"]), new objj_method(sel_getUid("makeUntitledDocumentOfType:error:"), function $CPDocumentController__makeUntitledDocumentOfType_error_(self, _cmd, aType, anError)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "documentClassForType:", aType), "alloc"), "initWithType:error:", aType, anError);
}
,["CPDocument","CPString","CPError"]), new objj_method(sel_getUid("openDocumentWithContentsOfURL:display:error:"), function $CPDocumentController__openDocumentWithContentsOfURL_display_error_(self, _cmd, anAbsoluteURL, shouldDisplay, anError)
{
    var result = objj_msgSend(self, "documentForURL:", anAbsoluteURL);
    if (!result)
    {
        var type = objj_msgSend(self, "typeForContentsOfURL:error:", anAbsoluteURL, anError);
        result = objj_msgSend(self, "makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, type, self, sel_getUid("document:didRead:contextInfo:"), objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", shouldDisplay, "shouldDisplay"));
        objj_msgSend(self, "addDocument:", result);
        if (result)
            objj_msgSend(self, "noteNewRecentDocument:", result);
    }
    else if (shouldDisplay)
        objj_msgSend(result, "showWindows");
    return result;
}
,["CPDocument","CPURL","BOOL","CPError"]), new objj_method(sel_getUid("reopenDocumentForURL:withContentsOfURL:error:"), function $CPDocumentController__reopenDocumentForURL_withContentsOfURL_error_(self, _cmd, anAbsoluteURL, absoluteContentsURL, anError)
{
    return objj_msgSend(self, "makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, absoluteContentsURL, objj_msgSend(objj_msgSend(self._documentTypes, "objectAtIndex:", 0), "objectForKey:", "CPBundleTypeName"), self, sel_getUid("document:didRead:contextInfo:"), nil);
}
,["CPDocument","CPURL","CPURL","CPError"]), new objj_method(sel_getUid("makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocumentController__makeDocumentWithContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aSelector, aContextInfo)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "documentClassForType:", aType), "alloc"), "initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, aType, aDelegate, aSelector, aContextInfo);
}
,["CPDocument","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocumentController__makeDocumentForURL_withContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aSelector, aContextInfo)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "documentClassForType:", aType), "alloc"), "initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aSelector, aContextInfo);
}
,["CPDocument","CPURL","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("document:didRead:contextInfo:"), function $CPDocumentController__document_didRead_contextInfo_(self, _cmd, aDocument, didRead, aContextInfo)
{
    if (!didRead)
        return;
    objj_msgSend(aDocument, "makeWindowControllers");
    if (objj_msgSend(aContextInfo, "objectForKey:", "shouldDisplay"))
        objj_msgSend(aDocument, "showWindows");
}
,["void","CPDocument","BOOL","id"]), new objj_method(sel_getUid("newDocument:"), function $CPDocumentController__newDocument_(self, _cmd, aSender)
{
    objj_msgSend(self, "openUntitledDocumentOfType:display:", objj_msgSend(objj_msgSend(self._documentTypes, "objectAtIndex:", 0), "objectForKey:", "CPBundleTypeName"), YES);
}
,["CFAction","id"]), new objj_method(sel_getUid("openDocument:"), function $CPDocumentController__openDocument_(self, _cmd, aSender)
{
    var openPanel = objj_msgSend(CPOpenPanel, "openPanel");
    objj_msgSend(openPanel, "runModal");
    var URLs = objj_msgSend(openPanel, "URLs"),
        index = 0,
        count = objj_msgSend(URLs, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "openDocumentWithContentsOfURL:display:error:", objj_msgSend(CPURL, "URLWithString:", URLs[index]), YES, nil);
}
,["void","id"]), new objj_method(sel_getUid("documents"), function $CPDocumentController__documents(self, _cmd)
{
    return self._documents;
}
,["CPArray"]), new objj_method(sel_getUid("currentDocument"), function $CPDocumentController__currentDocument(self, _cmd)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPApp, "mainWindow"), "windowController"), "document");
}
,["CPDocument"]), new objj_method(sel_getUid("addDocument:"), function $CPDocumentController__addDocument_(self, _cmd, aDocument)
{
    objj_msgSend(self._documents, "addObject:", aDocument);
}
,["void","CPDocument"]), new objj_method(sel_getUid("removeDocument:"), function $CPDocumentController__removeDocument_(self, _cmd, aDocument)
{
    objj_msgSend(self._documents, "removeObjectIdenticalTo:", aDocument);
}
,["void","CPDocument"]), new objj_method(sel_getUid("documentForWindow:"), function $CPDocumentController__documentForWindow_(self, _cmd, aWindow)
{
    return objj_msgSend(objj_msgSend(aWindow, "windowController"), "document");
}
,["CPDocument","CPWindow"]), new objj_method(sel_getUid("hasEditedDocuments"), function $CPDocumentController__hasEditedDocuments(self, _cmd)
{
    var iter = objj_msgSend(self._documents, "objectEnumerator"),
        obj;
    while ((obj = objj_msgSend(iter, "nextObject")) !== nil)
    {
        if (objj_msgSend(obj, "isDocumentEdited"))
            return YES;
    }
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("defaultType"), function $CPDocumentController__defaultType(self, _cmd)
{
    return objj_msgSend(self._documentTypes[0], "objectForKey:", "CPBundleTypeName");
}
,["CPString"]), new objj_method(sel_getUid("typeForContentsOfURL:error:"), function $CPDocumentController__typeForContentsOfURL_error_(self, _cmd, anAbsoluteURL, outError)
{
    var index = 0,
        count = self._documentTypes.length,
        extension = objj_msgSend(objj_msgSend(anAbsoluteURL, "pathExtension"), "lowercaseString"),
        starType = nil;
    for (; index < count; ++index)
    {
        var documentType = self._documentTypes[index],
            extensions = objj_msgSend(documentType, "objectForKey:", "CFBundleTypeExtensions"),
            extensionIndex = 0,
            extensionCount = extensions.length;
        for (; extensionIndex < extensionCount; ++extensionIndex)
        {
            var thisExtension = objj_msgSend(extensions[extensionIndex], "lowercaseString");
            if (thisExtension === extension)
                return objj_msgSend(documentType, "objectForKey:", "CPBundleTypeName");
            if (thisExtension === "****")
                starType = objj_msgSend(documentType, "objectForKey:", "CPBundleTypeName");
        }
    }
    return starType || objj_msgSend(self, "defaultType");
}
,["CPString","CPURL","CPError"]), new objj_method(sel_getUid("_infoForType:"), function $CPDocumentController___infoForType_(self, _cmd, aType)
{
    var i = 0,
        count = objj_msgSend(self._documentTypes, "count");
    for (; i < count; ++i)
    {
        var documentType = self._documentTypes[i];
        if (objj_msgSend(documentType, "objectForKey:", "CPBundleTypeName") == aType)
            return documentType;
    }
    return nil;
}
,["CPDictionary","CPString"]), new objj_method(sel_getUid("documentClassForType:"), function $CPDocumentController__documentClassForType_(self, _cmd, aType)
{
    var className = objj_msgSend(objj_msgSend(self, "_infoForType:", aType), "objectForKey:", "CPDocumentClass");
    return className ? CPClassFromString(className) : nil;
}
,["Class","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedDocumentController"), function $CPDocumentController__sharedDocumentController(self, _cmd)
{
    if (!CPSharedDocumentController)
        objj_msgSend(objj_msgSend(self, "alloc"), "init");
    return CPSharedDocumentController;
}
,["id"])]);
}{
var the_class = objj_getClass("CPDocumentController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDocumentController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("closeAllDocumentsWithDelegate:didCloseAllSelector:contextInfo:"), function $CPDocumentController__closeAllDocumentsWithDelegate_didCloseAllSelector_contextInfo_(self, _cmd, aDelegate, didCloseSelector, info)
{
    var context = {delegate: aDelegate, selector: didCloseSelector, context: info};
    objj_msgSend(self, "_closeDocumentsStartingWith:shouldClose:context:", nil, YES, context);
}
,["void","id","SEL","Object"]), new objj_method(sel_getUid("_closeDocumentsStartingWith:shouldClose:context:"), function $CPDocumentController___closeDocumentsStartingWith_shouldClose_context_(self, _cmd, aDocument, shouldClose, context)
{
    if (shouldClose)
    {
        objj_msgSend(aDocument, "close");
        if (objj_msgSend(objj_msgSend(self, "documents"), "count") > 0)
        {
            objj_msgSend(objj_msgSend(objj_msgSend(self, "documents"), "lastObject"), "canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:", self, sel_getUid("_closeDocumentsStartingWith:shouldClose:context:"), context);
            return;
        }
    }
    if (objj_msgSend(context.delegate, "respondsToSelector:", context.selector))
        objj_msgSend(context.delegate, context.selector, self, objj_msgSend(objj_msgSend(self, "documents"), "count") === 0, context.context);
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
    objj_msgSend(self, "_updateRecentDocumentsMenu");
}
,["void","id"]), new objj_method(sel_getUid("noteNewRecentDocument:"), function $CPDocumentController__noteNewRecentDocument_(self, _cmd, aDocument)
{
    objj_msgSend(self, "noteNewRecentDocumentURL:", objj_msgSend(aDocument, "fileURL"));
}
,["void","CPDocument"]), new objj_method(sel_getUid("noteNewRecentDocumentURL:"), function $CPDocumentController__noteNewRecentDocumentURL_(self, _cmd, aURL)
{
    var urlAsString = objj_msgSend(aURL, "isKindOfClass:", CPString) ? aURL : objj_msgSend(aURL, "absoluteString");
    if (typeof window["cpNoteNewRecentDocumentPath"] === 'function')
        window.cpNoteNewRecentDocumentPath(urlAsString);
    objj_msgSend(self, "_updateRecentDocumentsMenu");
}
,["void","CPURL"]), new objj_method(sel_getUid("_removeAllRecentDocumentsFromMenu:"), function $CPDocumentController___removeAllRecentDocumentsFromMenu_(self, _cmd, aMenu)
{
    var items = objj_msgSend(aMenu, "itemArray"),
        count = objj_msgSend(items, "count");
    while (count--)
    {
        var item = items[count];
        if (objj_msgSend(item, "action") === sel_getUid("_openRecentDocument:"))
            objj_msgSend(aMenu, "removeItemAtIndex:", count);
    }
}
,["void","CPMenu"]), new objj_method(sel_getUid("_updateRecentDocumentsMenu"), function $CPDocumentController___updateRecentDocumentsMenu(self, _cmd)
{
    var menu = objj_msgSend(objj_msgSend(CPApp, "mainMenu"), "_menuWithName:", "_CPRecentDocumentsMenu"),
        recentDocuments = objj_msgSend(self, "recentDocumentURLs"),
        menuItems = objj_msgSend(menu, "itemArray"),
        documentCount = objj_msgSend(recentDocuments, "count"),
        menuItemCount = objj_msgSend(menuItems, "count");
    objj_msgSend(self, "_removeAllRecentDocumentsFromMenu:", menu);
    if (menuItemCount)
    {
        if (!documentCount)
        {
            if (objj_msgSend(menuItems[0], "isSeparatorItem"))
                objj_msgSend(menu, "removeItemAtIndex:", 0);
        }
        else
        {
            if (!objj_msgSend(menuItems[0], "isSeparatorItem"))
                objj_msgSend(menu, "insertItem:atIndex:", objj_msgSend(CPMenuItem, "separatorItem"), 0);
        }
    }
    while (documentCount--)
    {
        var path = recentDocuments[documentCount],
            item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", objj_msgSend(path, "lastPathComponent"), sel_getUid("_openRecentDocument:"), nil);
        objj_msgSend(item, "setTag:", path);
        objj_msgSend(menu, "insertItem:atIndex:", item, 0);
    }
}
,["void"]), new objj_method(sel_getUid("_openRecentDocument:"), function $CPDocumentController___openRecentDocument_(self, _cmd, sender)
{
    objj_msgSend(self, "openDocumentWithContentsOfURL:display:error:", objj_msgSend(sender, "tag"), YES, nil);
}
,["void","id"])]);
}