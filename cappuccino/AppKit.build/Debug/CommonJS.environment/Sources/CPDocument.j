@STATIC;1.0;I;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;9;CPAlert.ji;13;CPResponder.ji;13;CPSavePanel.ji;18;CPViewController.ji;20;CPWindowController.jt;27049;objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("CPAlert.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPSavePanel.j", YES);objj_executeFile("CPViewController.j", YES);objj_executeFile("CPWindowController.j", YES);CPSaveOperation = 0;
CPSaveAsOperation = 1;
CPSaveToOperation = 2;
CPAutosaveOperation = 3;
CPChangeDone = 0;
CPChangeUndone = 1;
CPChangeCleared = 2;
CPChangeReadOtherContents = 3;
CPChangeAutosaved = 4;
CPDocumentWillSaveNotification = "CPDocumentWillSaveNotification";
CPDocumentDidSaveNotification = "CPDocumentDidSaveNotification";
CPDocumentDidFailToSaveNotification = "CPDocumentDidFailToSaveNotification";
var CPDocumentUntitledCount = 0;
{var the_class = objj_allocateClassPair(CPResponder, "CPDocument"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_view"), new objj_ivar("_viewControllersForWindowControllers"), new objj_ivar("_fileURL"), new objj_ivar("_fileType"), new objj_ivar("_windowControllers"), new objj_ivar("_untitledDocumentIndex"), new objj_ivar("_hasUndoManager"), new objj_ivar("_undoManager"), new objj_ivar("_changeCount"), new objj_ivar("_readConnection"), new objj_ivar("_writeRequest"), new objj_ivar("_canCloseAlert")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPDocument__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPDocument").super_class }, "init");
    if (self)
    {
        self._windowControllers = [];
        self._viewControllersForWindowControllers = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self._hasUndoManager = YES;
        self._changeCount = 0;
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithType:error:"), function $CPDocument__initWithType_error_(self, _cmd, aType, anError)
{
    self = objj_msgSend(self, "init");
    if (self)
        objj_msgSend(self, "setFileType:", aType);
    return self;
}
,["id","CPString","CPError"]), new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__initWithContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        objj_msgSend(self, "setFileURL:", anAbsoluteURL);
        objj_msgSend(self, "setFileType:", aType);
        objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo);
    }
    return self;
}
,["id","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__initForURL_withContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        objj_msgSend(self, "setFileURL:", anAbsoluteURL);
        objj_msgSend(self, "setFileType:", aType);
        objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo);
    }
    return self;
}
,["id","CPURL","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("dataOfType:error:"), function $CPDocument__dataOfType_error_(self, _cmd, aType, anError)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "dataOfType:error: must be overridden by the document subclass.");
}
,["CPData","CPString","CPError"]), new objj_method(sel_getUid("readFromData:ofType:error:"), function $CPDocument__readFromData_ofType_error_(self, _cmd, aData, aType, anError)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "readFromData:ofType: must be overridden by the document subclass.");
}
,["void","CPData","CPString","CPError"]), new objj_method(sel_getUid("viewControllerWillLoadCib:"), function $CPDocument__viewControllerWillLoadCib_(self, _cmd, aViewController)
{
}
,["void","CPViewController"]), new objj_method(sel_getUid("viewControllerDidLoadCib:"), function $CPDocument__viewControllerDidLoadCib_(self, _cmd, aViewController)
{
}
,["void","CPViewController"]), new objj_method(sel_getUid("makeWindowControllers"), function $CPDocument__makeWindowControllers(self, _cmd)
{
    objj_msgSend(self, "makeViewAndWindowControllers");
}
,["void"]), new objj_method(sel_getUid("makeViewAndWindowControllers"), function $CPDocument__makeViewAndWindowControllers(self, _cmd)
{
    var viewCibName = objj_msgSend(self, "viewCibName"),
        windowCibName = objj_msgSend(self, "windowCibName"),
        viewController = nil,
        windowController = nil;
    if (objj_msgSend(viewCibName, "length"))
        viewController = objj_msgSend(objj_msgSend(CPViewController, "alloc"), "initWithCibName:bundle:owner:", viewCibName, nil, self);
    if (objj_msgSend(windowCibName, "length"))
        windowController = objj_msgSend(objj_msgSend(CPWindowController, "alloc"), "initWithWindowCibName:owner:", windowCibName, self);
    else if (viewController)
    {
        var view = objj_msgSend(viewController, "view"),
            viewFrame = objj_msgSend(view, "frame");
        viewFrame.origin = CGPointMake(50, 50);
        var theWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", viewFrame, CPTitledWindowMask | CPClosableWindowMask | CPMiniaturizableWindowMask | CPResizableWindowMask);
        windowController = objj_msgSend(objj_msgSend(CPWindowController, "alloc"), "initWithWindow:", theWindow);
    }
    if (windowController && viewController)
        objj_msgSend(windowController, "setSupportsMultipleDocuments:", YES);
    if (windowController)
        objj_msgSend(self, "addWindowController:", windowController);
    if (viewController)
        objj_msgSend(self, "addViewController:forWindowController:", viewController, windowController);
}
,["void"]), new objj_method(sel_getUid("windowControllers"), function $CPDocument__windowControllers(self, _cmd)
{
    return self._windowControllers;
}
,["CPArray"]), new objj_method(sel_getUid("addWindowController:"), function $CPDocument__addWindowController_(self, _cmd, aWindowController)
{
    objj_msgSend(self._windowControllers, "addObject:", aWindowController);
    if (objj_msgSend(aWindowController, "document") !== self)
        objj_msgSend(aWindowController, "setDocument:", self);
}
,["void","CPWindowController"]), new objj_method(sel_getUid("removeWindowController:"), function $CPDocument__removeWindowController_(self, _cmd, aWindowController)
{
    if (aWindowController)
        objj_msgSend(self._windowControllers, "removeObject:", aWindowController);
    if (objj_msgSend(aWindowController, "document") === self)
        objj_msgSend(aWindowController, "setDocument:", nil);
}
,["void","CPWindowController"]), new objj_method(sel_getUid("view"), function $CPDocument__view(self, _cmd)
{
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("viewControllers"), function $CPDocument__viewControllers(self, _cmd)
{
    return objj_msgSend(self._viewControllersForWindowControllers, "allValues");
}
,["CPArray"]), new objj_method(sel_getUid("addViewController:forWindowController:"), function $CPDocument__addViewController_forWindowController_(self, _cmd, aViewController, aWindowController)
{
    objj_msgSend(self._viewControllersForWindowControllers, "setObject:forKey:", aViewController, objj_msgSend(aWindowController, "UID"));
    if (objj_msgSend(aWindowController, "document") === self)
        objj_msgSend(aWindowController, "setViewController:", aViewController);
}
,["void","CPViewController","CPWindowController"]), new objj_method(sel_getUid("removeViewController:"), function $CPDocument__removeViewController_(self, _cmd, aViewController)
{
    objj_msgSend(self._viewControllersForWindowControllers, "removeObject:", aViewController);
}
,["void","CPViewController"]), new objj_method(sel_getUid("viewControllerForWindowController:"), function $CPDocument__viewControllerForWindowController_(self, _cmd, aWindowController)
{
    return objj_msgSend(self._viewControllersForWindowControllers, "objectForKey:", objj_msgSend(aWindowController, "UID"));
}
,["CPViewController","CPWindowController"]), new objj_method(sel_getUid("showWindows"), function $CPDocument__showWindows(self, _cmd)
{
    objj_msgSend(self._windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocument:"), self);
    objj_msgSend(self._windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("showWindow:"), self);
}
,["void"]), new objj_method(sel_getUid("displayName"), function $CPDocument__displayName(self, _cmd)
{
    if (self._fileURL)
        return objj_msgSend(self._fileURL, "lastPathComponent");
    if (!self._untitledDocumentIndex)
        self._untitledDocumentIndex = ++CPDocumentUntitledCount;
    if (self._untitledDocumentIndex == 1)
        return "Untitled";
    return "Untitled " + self._untitledDocumentIndex;
}
,["CPString"]), new objj_method(sel_getUid("viewCibName"), function $CPDocument__viewCibName(self, _cmd)
{
    return nil;
}
,["CPString"]), new objj_method(sel_getUid("windowCibName"), function $CPDocument__windowCibName(self, _cmd)
{
    return nil;
}
,["CPString"]), new objj_method(sel_getUid("windowControllerDidLoadCib:"), function $CPDocument__windowControllerDidLoadCib_(self, _cmd, aWindowController)
{
}
,["void","CPWindowController"]), new objj_method(sel_getUid("windowControllerWillLoadCib:"), function $CPDocument__windowControllerWillLoadCib_(self, _cmd, aWindowController)
{
}
,["void","CPWindowController"]), new objj_method(sel_getUid("readFromURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__readFromURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{
    objj_msgSend(self._readConnection, "cancel");
    self._readConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", anAbsoluteURL), self);
    self._readConnection.session = _CPReadSessionMake(aType, aDelegate, aDidReadSelector, aContextInfo);
}
,["void","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("fileURL"), function $CPDocument__fileURL(self, _cmd)
{
    return self._fileURL;
}
,["CPURL"]), new objj_method(sel_getUid("setFileURL:"), function $CPDocument__setFileURL_(self, _cmd, aFileURL)
{
    if (self._fileURL === aFileURL)
        return;
    self._fileURL = aFileURL;
    objj_msgSend(self._windowControllers, "makeObjectsPerformSelector:", sel_getUid("synchronizeWindowTitleWithDocumentName"));
}
,["void","CPURL"]), new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"), function $CPDocument__saveToURL_ofType_forSaveOperation_delegate_didSaveSelector_contextInfo_(self, _cmd, anAbsoluteURL, aTypeName, aSaveOperation, aDelegate, aDidSaveSelector, aContextInfo)
{
    var data = objj_msgSend(self, "dataOfType:error:", objj_msgSend(self, "fileType"), nil),
        oldChangeCount = self._changeCount;
    self._writeRequest = objj_msgSend(CPURLRequest, "requestWithURL:", anAbsoluteURL);
    if (objj_msgSend(CPPlatform, "isBrowser"))
        objj_msgSend(self._writeRequest, "setHTTPMethod:", "POST");
    else
        objj_msgSend(self._writeRequest, "setHTTPMethod:", "PUT");
    objj_msgSend(self._writeRequest, "setHTTPBody:", objj_msgSend(data, "rawString"));
    objj_msgSend(self._writeRequest, "setValue:forHTTPHeaderField:", "close", "Connection");
    if (aSaveOperation === CPSaveOperation)
        objj_msgSend(self._writeRequest, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite");
    if (aSaveOperation !== CPSaveToOperation)
        objj_msgSend(self, "updateChangeCount:", CPChangeCleared);
    var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", self._writeRequest, self);
    connection.session = _CPSaveSessionMake(anAbsoluteURL, aSaveOperation, oldChangeCount, aDelegate, aDidSaveSelector, aContextInfo, connection);
}
,["void","CPURL","CPString","CPSaveOperationType","id","SEL","id"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $CPDocument__connection_didReceiveResponse_(self, _cmd, aConnection, aResponse)
{
    if (!objj_msgSend(aResponse, "isKindOfClass:", objj_msgSend(CPHTTPURLResponse, "class")))
        return;
    var statusCode = objj_msgSend(aResponse, "statusCode");
    if (statusCode === 200)
        return;
    var session = aConnection.session;
    if (aConnection == self._readConnection)
    {
        objj_msgSend(aConnection, "cancel");
        alert("There was an error retrieving the document.");
        objj_msgSend(session.delegate, session.didReadSelector, self, NO, session.contextInfo);
    }
    else
    {
        if (statusCode == 409)
        {
            objj_msgSend(aConnection, "cancel");
            if (confirm("There already exists a file with that name, would you like to overwrite it?"))
            {
                objj_msgSend(self._writeRequest, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite");
                objj_msgSend(aConnection, "start");
            }
            else
            {
                if (session.saveOperation != CPSaveToOperation)
                {
                    self._changeCount += session.changeCount;
                    objj_msgSend(self._windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
                }
                self._writeRequest = nil;
                objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
                objj_msgSend(self, "_sendDocumentSavedNotification:", NO);
            }
        }
    }
}
,["void","CPURLConnection","CPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $CPDocument__connection_didReceiveData_(self, _cmd, aConnection, aData)
{
    var session = aConnection.session;
    if (aConnection == self._readConnection)
    {
        objj_msgSend(self, "readFromData:ofType:error:", objj_msgSend(CPData, "dataWithRawString:", aData), session.fileType, nil);
        objj_msgSend(session.delegate, session.didReadSelector, self, YES, session.contextInfo);
    }
    else
    {
        if (session.saveOperation != CPSaveToOperation)
            objj_msgSend(self, "setFileURL:", session.absoluteURL);
        self._writeRequest = nil;
        objj_msgSend(session.delegate, session.didSaveSelector, self, YES, session.contextInfo);
        objj_msgSend(self, "_sendDocumentSavedNotification:", YES);
    }
}
,["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $CPDocument__connection_didFailWithError_(self, _cmd, aConnection, anError)
{
    var session = aConnection.session;
    if (self._readConnection == aConnection)
        objj_msgSend(session.delegate, session.didReadSelector, self, NO, session.contextInfo);
    else
    {
        if (session.saveOperation != CPSaveToOperation)
        {
            self._changeCount += session.changeCount;
            objj_msgSend(self._windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
        }
        self._writeRequest = nil;
        alert("There was an error saving the document.");
        objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
        objj_msgSend(self, "_sendDocumentSavedNotification:", NO);
    }
}
,["void","CPURLConnection","CPError"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $CPDocument__connectionDidFinishLoading_(self, _cmd, aConnection)
{
    if (self._readConnection == aConnection)
        self._readConnection = nil;
}
,["void","CPURLConnection"]), new objj_method(sel_getUid("isDocumentEdited"), function $CPDocument__isDocumentEdited(self, _cmd)
{
    return self._changeCount != 0;
}
,["BOOL"]), new objj_method(sel_getUid("updateChangeCount:"), function $CPDocument__updateChangeCount_(self, _cmd, aChangeType)
{
    if (aChangeType == CPChangeDone)
        ++self._changeCount;
    else if (aChangeType == CPChangeUndone)
        --self._changeCount;
    else if (aChangeType == CPChangeCleared)
        self._changeCount = 0;
    objj_msgSend(self._windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
}
,["void","CPDocumentChangeType"]), new objj_method(sel_getUid("setFileType:"), function $CPDocument__setFileType_(self, _cmd, aType)
{
    self._fileType = aType;
}
,["void","CPString"]), new objj_method(sel_getUid("fileType"), function $CPDocument__fileType(self, _cmd)
{
    return self._fileType;
}
,["CPString"]), new objj_method(sel_getUid("hasUndoManager"), function $CPDocument__hasUndoManager(self, _cmd)
{
    return self._hasUndoManager;
}
,["BOOL"]), new objj_method(sel_getUid("setHasUndoManager:"), function $CPDocument__setHasUndoManager_(self, _cmd, aFlag)
{
    if (self._hasUndoManager == aFlag)
        return;
    self._hasUndoManager = aFlag;
    if (!self._hasUndoManager)
        objj_msgSend(self, "setUndoManager:", nil);
}
,["void","BOOL"]), new objj_method(sel_getUid("_undoManagerWillCloseGroup:"), function $CPDocument___undoManagerWillCloseGroup_(self, _cmd, aNotification)
{
    var undoManager = objj_msgSend(aNotification, "object");
    if (objj_msgSend(undoManager, "isUndoing") || objj_msgSend(undoManager, "isRedoing"))
        return;
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_undoManagerDidUndoChange:"), function $CPDocument___undoManagerDidUndoChange_(self, _cmd, aNotification)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeUndone);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_undoManagerDidRedoChange:"), function $CPDocument___undoManagerDidRedoChange_(self, _cmd, aNotification)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
,["void","CPNotification"]), new objj_method(sel_getUid("setUndoManager:"), function $CPDocument__setUndoManager_(self, _cmd, anUndoManager)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (self._undoManager)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidUndoChangeNotification, self._undoManager);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidRedoChangeNotification, self._undoManager);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerWillCloseUndoGroupNotification, self._undoManager);
    }
    self._undoManager = anUndoManager;
    if (self._undoManager)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidUndoChange:"), CPUndoManagerDidUndoChangeNotification, self._undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidRedoChange:"), CPUndoManagerDidRedoChangeNotification, self._undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerWillCloseGroup:"), CPUndoManagerWillCloseUndoGroupNotification, self._undoManager);
    }
}
,["void","CPUndoManager"]), new objj_method(sel_getUid("undoManager"), function $CPDocument__undoManager(self, _cmd)
{
    if (self._hasUndoManager && !self._undoManager)
        objj_msgSend(self, "setUndoManager:", objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init"));
    return self._undoManager;
}
,["CPUndoManager"]), new objj_method(sel_getUid("windowWillReturnUndoManager:"), function $CPDocument__windowWillReturnUndoManager_(self, _cmd, aWindow)
{
    return objj_msgSend(self, "undoManager");
}
,["CPUndoManager","CPWindow"]), new objj_method(sel_getUid("saveDocument:"), function $CPDocument__saveDocument_(self, _cmd, aSender)
{
    objj_msgSend(self, "saveDocumentWithDelegate:didSaveSelector:contextInfo:", nil, nil, nil);
}
,["void","id"]), new objj_method(sel_getUid("saveDocumentWithDelegate:didSaveSelector:contextInfo:"), function $CPDocument__saveDocumentWithDelegate_didSaveSelector_contextInfo_(self, _cmd, delegate, didSaveSelector, contextInfo)
{
    if (self._fileURL)
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
        objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", self._fileURL, objj_msgSend(self, "fileType"), CPSaveOperation, delegate, didSaveSelector, contextInfo);
    }
    else
        objj_msgSend(self, "_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:", delegate, didSaveSelector, contextInfo);
}
,["void","id","SEL","Object"]), new objj_method(sel_getUid("saveDocumentAs:"), function $CPDocument__saveDocumentAs_(self, _cmd, aSender)
{
    objj_msgSend(self, "_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:", nil, nil, nil);
}
,["void","id"]), new objj_method(sel_getUid("_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:"), function $CPDocument___saveDocumentAsWithDelegate_didSaveSelector_contextInfo_(self, _cmd, delegate, didSaveSelector, contextInfo)
{
    var savePanel = objj_msgSend(CPSavePanel, "savePanel"),
        response = objj_msgSend(savePanel, "runModal");
    if (!response)
        return;
    var saveURL = objj_msgSend(savePanel, "URL");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
    objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", saveURL, objj_msgSend(self, "fileType"), CPSaveAsOperation, delegate, didSaveSelector, contextInfo);
}
,["void","id","SEL","Object"]), new objj_method(sel_getUid("_sendDocumentSavedNotification:"), function $CPDocument___sendDocumentSavedNotification_(self, _cmd, didSave)
{
    if (didSave)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidSaveNotification, self);
    else
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidFailToSaveNotification, self);
}
,["void","BOOL"])]);
}{
var the_class = objj_getClass("CPDocument")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDocument\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("close"), function $CPDocument__close(self, _cmd)
{
    objj_msgSend(self._windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("removeDocumentAndCloseIfNecessary:"), self);
    objj_msgSend(objj_msgSend(CPDocumentController, "sharedDocumentController"), "removeDocument:", self);
}
,["void"]), new objj_method(sel_getUid("shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:"), function $CPDocument__shouldCloseWindowController_delegate_shouldCloseSelector_contextInfo_(self, _cmd, controller, delegate, selector, info)
{
    if (objj_msgSend(controller, "shouldCloseDocument") || objj_msgSend(self._windowControllers, "count") < 2 && objj_msgSend(self._windowControllers, "indexOfObject:", controller) !== CPNotFound)
        objj_msgSend(self, "canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:", self, sel_getUid("_document:shouldClose:context:"), {delegate: delegate, selector: selector, context: info});
    else if (objj_msgSend(delegate, "respondsToSelector:", selector))
        objj_msgSend(delegate, selector, self, YES, info);
}
,["void","CPWindowController","id","SEL","Object"]), new objj_method(sel_getUid("_document:shouldClose:context:"), function $CPDocument___document_shouldClose_context_(self, _cmd, aDocument, shouldClose, context)
{
    if (aDocument === self && shouldClose)
        objj_msgSend(self, "close");
    objj_msgSend(context.delegate, context.selector, aDocument, shouldClose, context.context);
}
,["void","CPDocument","BOOL","Object"]), new objj_method(sel_getUid("canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:"), function $CPDocument__canCloseDocumentWithDelegate_shouldCloseSelector_contextInfo_(self, _cmd, aDelegate, aSelector, context)
{
    if (!objj_msgSend(self, "isDocumentEdited"))
        return objj_msgSend(aDelegate, "respondsToSelector:", aSelector) && objj_msgSend(aDelegate, aSelector, self, YES, context);
    self._canCloseAlert = objj_msgSend(objj_msgSend(CPAlert, "alloc"), "init");
    objj_msgSend(self._canCloseAlert, "setDelegate:", self);
    objj_msgSend(self._canCloseAlert, "setAlertStyle:", CPWarningAlertStyle);
    objj_msgSend(self._canCloseAlert, "setTitle:", "Unsaved Document");
    objj_msgSend(self._canCloseAlert, "setMessageText:", "Do you want to save the changes you've made to the document \"" + (objj_msgSend(self, "displayName") || objj_msgSend(self, "fileName")) + "\"?");
    objj_msgSend(self._canCloseAlert, "addButtonWithTitle:", "Save");
    objj_msgSend(self._canCloseAlert, "addButtonWithTitle:", "Cancel");
    objj_msgSend(self._canCloseAlert, "addButtonWithTitle:", "Don't Save");
    self._canCloseAlert._context = {delegate: aDelegate, selector: aSelector, context: context};
    objj_msgSend(self._canCloseAlert, "runModal");
}
,["void","id","SEL","Object"]), new objj_method(sel_getUid("alertDidEnd:returnCode:"), function $CPDocument__alertDidEnd_returnCode_(self, _cmd, alert, returnCode)
{
    if (alert !== self._canCloseAlert)
        return;
    var delegate = alert._context.delegate,
        selector = alert._context.selector,
        context = alert._context.context;
    if (returnCode === 0)
        objj_msgSend(self, "saveDocumentWithDelegate:didSaveSelector:contextInfo:", delegate, selector, context);
    else
        objj_msgSend(delegate, selector, self, returnCode === 2, context);
    self._canCloseAlert = nil;
}
,["void","CPAlert","int"])]);
}var _CPReadSessionMake = function(aType, aDelegate, aDidReadSelector, aContextInfo)
{
    return {fileType: aType, delegate: aDelegate, didReadSelector: aDidReadSelector, contextInfo: aContextInfo};
};
var _CPSaveSessionMake = function(anAbsoluteURL, aSaveOperation, aChangeCount, aDelegate, aDidSaveSelector, aContextInfo, aConnection)
{
    return {absoluteURL: anAbsoluteURL, saveOperation: aSaveOperation, changeCount: aChangeCount, delegate: aDelegate, didSaveSelector: aDidSaveSelector, contextInfo: aContextInfo, connection: aConnection};
};
