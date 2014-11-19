@STATIC;1.0;I;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;9;CPAlert.ji;13;CPResponder.ji;13;CPSavePanel.ji;18;CPViewController.ji;20;CPWindowController.jt;32486;objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("CPAlert.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPSavePanel.j", YES);objj_executeFile("CPViewController.j", YES);objj_executeFile("CPWindowController.j", YES);CPSaveOperation = 0;
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
        (self == null ? null : self.isa.objj_msgSend1(self, "setNextResponder:", CPApp));
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithType:error:"), function $CPDocument__initWithType_error_(self, _cmd, aType, anError)
{
    self = (self == null ? null : self.isa.objj_msgSend0(self, "init"));
    if (self)
        (self == null ? null : self.isa.objj_msgSend1(self, "setFileType:", aType));
    return self;
}
,["id","CPString","CPError"]), new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__initWithContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{
    self = (self == null ? null : self.isa.objj_msgSend0(self, "init"));
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setFileURL:", anAbsoluteURL));
        (self == null ? null : self.isa.objj_msgSend1(self, "setFileType:", aType));
        (self == null ? null : self.isa.objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo));
    }
    return self;
}
,["id","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function $CPDocument__initForURL_withContentsOfURL_ofType_delegate_didReadSelector_contextInfo_(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{
    self = (self == null ? null : self.isa.objj_msgSend0(self, "init"));
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setFileURL:", anAbsoluteURL));
        (self == null ? null : self.isa.objj_msgSend1(self, "setFileType:", aType));
        (self == null ? null : self.isa.objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo));
    }
    return self;
}
,["id","CPURL","CPURL","CPString","id","SEL","id"]), new objj_method(sel_getUid("dataOfType:error:"), function $CPDocument__dataOfType_error_(self, _cmd, aType, anError)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "dataOfType:error: must be overridden by the document subclass.");
}
,["CPData","CPString","CPError"]), new objj_method(sel_getUid("readFromData:ofType:error:"), function $CPDocument__readFromData_ofType_error_(self, _cmd, aData, aType, anError)
{
    CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPUnsupportedMethodException, "readFromData:ofType: must be overridden by the document subclass.");
}
,["void","CPData","CPString","CPError"]), new objj_method(sel_getUid("viewControllerWillLoadCib:"), function $CPDocument__viewControllerWillLoadCib_(self, _cmd, aViewController)
{
}
,["void","CPViewController"]), new objj_method(sel_getUid("viewControllerDidLoadCib:"), function $CPDocument__viewControllerDidLoadCib_(self, _cmd, aViewController)
{
}
,["void","CPViewController"]), new objj_method(sel_getUid("makeWindowControllers"), function $CPDocument__makeWindowControllers(self, _cmd)
{
    self.isa.objj_msgSend0(self, "makeViewAndWindowControllers");
}
,["void"]), new objj_method(sel_getUid("makeViewAndWindowControllers"), function $CPDocument__makeViewAndWindowControllers(self, _cmd)
{
    var viewCibName = self.isa.objj_msgSend0(self, "viewCibName"),
        windowCibName = self.isa.objj_msgSend0(self, "windowCibName"),
        viewController = nil,
        windowController = nil;
    if ((viewCibName == null ? null : viewCibName.isa.objj_msgSend0(viewCibName, "length")))
        viewController = ((___r1 = CPViewController.isa.objj_msgSend0(CPViewController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithCibName:bundle:owner:", viewCibName, nil, self));
    if ((windowCibName == null ? null : windowCibName.isa.objj_msgSend0(windowCibName, "length")))
        windowController = ((___r1 = CPWindowController.isa.objj_msgSend0(CPWindowController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithWindowCibName:owner:", windowCibName, self));
    else if (viewController)
    {
        var view = (viewController == null ? null : viewController.isa.objj_msgSend0(viewController, "view")),
            viewFrame = (view == null ? null : view.isa.objj_msgSend0(view, "frame"));
        viewFrame.origin = CGPointMake(50, 50);
        var theWindow = ((___r1 = CPWindow.isa.objj_msgSend0(CPWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", viewFrame, CPTitledWindowMask | CPClosableWindowMask | CPMiniaturizableWindowMask | CPResizableWindowMask));
        windowController = ((___r1 = CPWindowController.isa.objj_msgSend0(CPWindowController, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithWindow:", theWindow));
    }
    if (windowController && viewController)
        (windowController == null ? null : windowController.isa.objj_msgSend1(windowController, "setSupportsMultipleDocuments:", YES));
    if (windowController)
        self.isa.objj_msgSend1(self, "addWindowController:", windowController);
    if (viewController)
        self.isa.objj_msgSend2(self, "addViewController:forWindowController:", viewController, windowController);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("windowControllers"), function $CPDocument__windowControllers(self, _cmd)
{
    return self._windowControllers;
}
,["CPArray"]), new objj_method(sel_getUid("addWindowController:"), function $CPDocument__addWindowController_(self, _cmd, aWindowController)
{
    ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addObject:", aWindowController));
    if ((aWindowController == null ? null : aWindowController.isa.objj_msgSend0(aWindowController, "document")) !== self)
        (aWindowController == null ? null : aWindowController.isa.objj_msgSend1(aWindowController, "setDocument:", self));
    var ___r1;
}
,["void","CPWindowController"]), new objj_method(sel_getUid("removeWindowController:"), function $CPDocument__removeWindowController_(self, _cmd, aWindowController)
{
    if (aWindowController)
        ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", aWindowController));
    if ((aWindowController == null ? null : aWindowController.isa.objj_msgSend0(aWindowController, "document")) === self)
        (aWindowController == null ? null : aWindowController.isa.objj_msgSend1(aWindowController, "setDocument:", nil));
    var ___r1;
}
,["void","CPWindowController"]), new objj_method(sel_getUid("view"), function $CPDocument__view(self, _cmd)
{
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("viewControllers"), function $CPDocument__viewControllers(self, _cmd)
{
    return ((___r1 = self._viewControllersForWindowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allValues"));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("addViewController:forWindowController:"), function $CPDocument__addViewController_forWindowController_(self, _cmd, aViewController, aWindowController)
{
    ((___r1 = self._viewControllersForWindowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", aViewController, (aWindowController == null ? null : aWindowController.isa.objj_msgSend0(aWindowController, "UID"))));
    if ((aWindowController == null ? null : aWindowController.isa.objj_msgSend0(aWindowController, "document")) === self)
        (aWindowController == null ? null : aWindowController.isa.objj_msgSend1(aWindowController, "setViewController:", aViewController));
    var ___r1;
}
,["void","CPViewController","CPWindowController"]), new objj_method(sel_getUid("removeViewController:"), function $CPDocument__removeViewController_(self, _cmd, aViewController)
{
    ((___r1 = self._viewControllersForWindowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObject:", aViewController));
    var ___r1;
}
,["void","CPViewController"]), new objj_method(sel_getUid("viewControllerForWindowController:"), function $CPDocument__viewControllerForWindowController_(self, _cmd, aWindowController)
{
    return ((___r1 = self._viewControllersForWindowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", (aWindowController == null ? null : aWindowController.isa.objj_msgSend0(aWindowController, "UID"))));
    var ___r1;
}
,["CPViewController","CPWindowController"]), new objj_method(sel_getUid("showWindows"), function $CPDocument__showWindows(self, _cmd)
{
    ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocument:"), self));
    ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("showWindow:"), self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("displayName"), function $CPDocument__displayName(self, _cmd)
{
    if (self._fileURL)
        return ((___r1 = self._fileURL), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastPathComponent"));
    if (!self._untitledDocumentIndex)
        self._untitledDocumentIndex = ++CPDocumentUntitledCount;
    if (self._untitledDocumentIndex == 1)
        return "Untitled";
    return "Untitled " + self._untitledDocumentIndex;
    var ___r1;
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
    ((___r1 = self._readConnection), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cancel"));
    self._readConnection = CPURLConnection.isa.objj_msgSend2(CPURLConnection, "connectionWithRequest:delegate:", CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", anAbsoluteURL), self);
    self._readConnection.session = _CPReadSessionMake(aType, aDelegate, aDidReadSelector, aContextInfo);
    var ___r1;
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
    ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeObjectsPerformSelector:", sel_getUid("synchronizeWindowTitleWithDocumentName")));
    var ___r1;
}
,["void","CPURL"]), new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"), function $CPDocument__saveToURL_ofType_forSaveOperation_delegate_didSaveSelector_contextInfo_(self, _cmd, anAbsoluteURL, aTypeName, aSaveOperation, aDelegate, aDidSaveSelector, aContextInfo)
{
    var data = self.isa.objj_msgSend2(self, "dataOfType:error:", self.isa.objj_msgSend0(self, "fileType"), nil),
        oldChangeCount = self._changeCount;
    self._writeRequest = CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", anAbsoluteURL);
    if (CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
        ((___r1 = self._writeRequest), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHTTPMethod:", "POST"));
    else
        ((___r1 = self._writeRequest), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHTTPMethod:", "PUT"));
    ((___r1 = self._writeRequest), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHTTPBody:", (data == null ? null : data.isa.objj_msgSend0(data, "rawString"))));
    ((___r1 = self._writeRequest), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forHTTPHeaderField:", "close", "Connection"));
    if (aSaveOperation === CPSaveOperation)
        ((___r1 = self._writeRequest), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite"));
    if (aSaveOperation !== CPSaveToOperation)
        self.isa.objj_msgSend1(self, "updateChangeCount:", CPChangeCleared);
    var connection = CPURLConnection.isa.objj_msgSend2(CPURLConnection, "connectionWithRequest:delegate:", self._writeRequest, self);
    connection.session = _CPSaveSessionMake(anAbsoluteURL, aSaveOperation, oldChangeCount, aDelegate, aDidSaveSelector, aContextInfo, connection);
    var ___r1;
}
,["void","CPURL","CPString","CPSaveOperationType","id","SEL","id"]), new objj_method(sel_getUid("connection:didReceiveResponse:"), function $CPDocument__connection_didReceiveResponse_(self, _cmd, aConnection, aResponse)
{
    if (!(aResponse == null ? null : aResponse.isa.objj_msgSend1(aResponse, "isKindOfClass:", CPHTTPURLResponse.isa.objj_msgSend0(CPHTTPURLResponse, "class"))))
        return;
    var statusCode = (aResponse == null ? null : aResponse.isa.objj_msgSend0(aResponse, "statusCode"));
    if (statusCode === 200)
        return;
    var session = aConnection.session;
    if (aConnection == self._readConnection)
    {
        (aConnection == null ? null : aConnection.isa.objj_msgSend0(aConnection, "cancel"));
        alert("There was an error retrieving the document.");
        objj_msgSend(session.delegate, session.didReadSelector, self, NO, session.contextInfo);
    }
    else
    {
        if (statusCode == 409)
        {
            (aConnection == null ? null : aConnection.isa.objj_msgSend0(aConnection, "cancel"));
            if (confirm("There already exists a file with that name, would you like to overwrite it?"))
            {
                ((___r1 = self._writeRequest), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite"));
                (aConnection == null ? null : aConnection.isa.objj_msgSend0(aConnection, "start"));
            }
            else
            {
                if (session.saveOperation != CPSaveToOperation)
                {
                    self._changeCount += session.changeCount;
                    ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), self.isa.objj_msgSend0(self, "isDocumentEdited")));
                }
                self._writeRequest = nil;
                objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
                self.isa.objj_msgSend1(self, "_sendDocumentSavedNotification:", NO);
            }
        }
    }
    var ___r1;
}
,["void","CPURLConnection","CPURLResponse"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $CPDocument__connection_didReceiveData_(self, _cmd, aConnection, aData)
{
    var session = aConnection.session;
    if (aConnection == self._readConnection)
    {
        self.isa.objj_msgSend3(self, "readFromData:ofType:error:", CPData.isa.objj_msgSend1(CPData, "dataWithRawString:", aData), session.fileType, nil);
        objj_msgSend(session.delegate, session.didReadSelector, self, YES, session.contextInfo);
    }
    else
    {
        if (session.saveOperation != CPSaveToOperation)
            self.isa.objj_msgSend1(self, "setFileURL:", session.absoluteURL);
        self._writeRequest = nil;
        objj_msgSend(session.delegate, session.didSaveSelector, self, YES, session.contextInfo);
        self.isa.objj_msgSend1(self, "_sendDocumentSavedNotification:", YES);
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
            ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), self.isa.objj_msgSend0(self, "isDocumentEdited")));
        }
        self._writeRequest = nil;
        alert("There was an error saving the document.");
        objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
        self.isa.objj_msgSend1(self, "_sendDocumentSavedNotification:", NO);
    }
    var ___r1;
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
    ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), self.isa.objj_msgSend0(self, "isDocumentEdited")));
    var ___r1;
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
        self.isa.objj_msgSend1(self, "setUndoManager:", nil);
}
,["void","BOOL"]), new objj_method(sel_getUid("_undoManagerWillCloseGroup:"), function $CPDocument___undoManagerWillCloseGroup_(self, _cmd, aNotification)
{
    var undoManager = (aNotification == null ? null : aNotification.isa.objj_msgSend0(aNotification, "object"));
    if ((undoManager == null ? null : undoManager.isa.objj_msgSend0(undoManager, "isUndoing")) || (undoManager == null ? null : undoManager.isa.objj_msgSend0(undoManager, "isRedoing")))
        return;
    self.isa.objj_msgSend1(self, "updateChangeCount:", CPChangeDone);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_undoManagerDidUndoChange:"), function $CPDocument___undoManagerDidUndoChange_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend1(self, "updateChangeCount:", CPChangeUndone);
}
,["void","CPNotification"]), new objj_method(sel_getUid("_undoManagerDidRedoChange:"), function $CPDocument___undoManagerDidRedoChange_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend1(self, "updateChangeCount:", CPChangeDone);
}
,["void","CPNotification"]), new objj_method(sel_getUid("setUndoManager:"), function $CPDocument__setUndoManager_(self, _cmd, anUndoManager)
{
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    if (self._undoManager)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidUndoChangeNotification, self._undoManager));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidRedoChangeNotification, self._undoManager));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerWillCloseUndoGroupNotification, self._undoManager));
    }
    self._undoManager = anUndoManager;
    if (self._undoManager)
    {
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidUndoChange:"), CPUndoManagerDidUndoChangeNotification, self._undoManager));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidRedoChange:"), CPUndoManagerDidRedoChangeNotification, self._undoManager));
        (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerWillCloseGroup:"), CPUndoManagerWillCloseUndoGroupNotification, self._undoManager));
    }
}
,["void","CPUndoManager"]), new objj_method(sel_getUid("undoManager"), function $CPDocument__undoManager(self, _cmd)
{
    if (self._hasUndoManager && !self._undoManager)
        self.isa.objj_msgSend1(self, "setUndoManager:", ((___r1 = CPUndoManager.isa.objj_msgSend0(CPUndoManager, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")));
    return self._undoManager;
    var ___r1;
}
,["CPUndoManager"]), new objj_method(sel_getUid("windowWillReturnUndoManager:"), function $CPDocument__windowWillReturnUndoManager_(self, _cmd, aWindow)
{
    return self.isa.objj_msgSend0(self, "undoManager");
}
,["CPUndoManager","CPWindow"]), new objj_method(sel_getUid("saveDocument:"), function $CPDocument__saveDocument_(self, _cmd, aSender)
{
    self.isa.objj_msgSend3(self, "saveDocumentWithDelegate:didSaveSelector:contextInfo:", nil, nil, nil);
}
,["void","id"]), new objj_method(sel_getUid("saveDocumentWithDelegate:didSaveSelector:contextInfo:"), function $CPDocument__saveDocumentWithDelegate_didSaveSelector_contextInfo_(self, _cmd, delegate, didSaveSelector, contextInfo)
{
    if (self._fileURL)
    {
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPDocumentWillSaveNotification, self));
        self.isa.objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", self._fileURL, self.isa.objj_msgSend0(self, "fileType"), CPSaveOperation, delegate, didSaveSelector, contextInfo);
    }
    else
        self.isa.objj_msgSend3(self, "_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:", delegate, didSaveSelector, contextInfo);
    var ___r1;
}
,["void","id","SEL","Object"]), new objj_method(sel_getUid("saveDocumentAs:"), function $CPDocument__saveDocumentAs_(self, _cmd, aSender)
{
    self.isa.objj_msgSend3(self, "_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:", nil, nil, nil);
}
,["void","id"]), new objj_method(sel_getUid("_saveDocumentAsWithDelegate:didSaveSelector:contextInfo:"), function $CPDocument___saveDocumentAsWithDelegate_didSaveSelector_contextInfo_(self, _cmd, delegate, didSaveSelector, contextInfo)
{
    var savePanel = CPSavePanel.isa.objj_msgSend0(CPSavePanel, "savePanel"),
        response = (savePanel == null ? null : savePanel.isa.objj_msgSend0(savePanel, "runModal"));
    if (!response)
        return;
    var saveURL = (savePanel == null ? null : savePanel.isa.objj_msgSend0(savePanel, "URL"));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPDocumentWillSaveNotification, self));
    self.isa.objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", saveURL, self.isa.objj_msgSend0(self, "fileType"), CPSaveAsOperation, delegate, didSaveSelector, contextInfo);
    var ___r1;
}
,["void","id","SEL","Object"]), new objj_method(sel_getUid("_sendDocumentSavedNotification:"), function $CPDocument___sendDocumentSavedNotification_(self, _cmd, didSave)
{
    if (didSave)
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPDocumentDidSaveNotification, self));
    else
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPDocumentDidFailToSaveNotification, self));
    var ___r1;
}
,["void","BOOL"])]);
}{
var the_class = objj_getClass("CPDocument")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDocument\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("close"), function $CPDocument__close(self, _cmd)
{
    ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("removeDocumentAndCloseIfNecessary:"), self));
    ((___r1 = (CPDocumentController == null ? null : CPDocumentController.isa.objj_msgSend0(CPDocumentController, "sharedDocumentController"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeDocument:", self));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("shouldCloseWindowController:delegate:shouldCloseSelector:contextInfo:"), function $CPDocument__shouldCloseWindowController_delegate_shouldCloseSelector_contextInfo_(self, _cmd, controller, delegate, selector, info)
{
    if ((controller == null ? null : controller.isa.objj_msgSend0(controller, "shouldCloseDocument")) || ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) < 2 && ((___r1 = self._windowControllers), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObject:", controller)) !== CPNotFound)
        self.isa.objj_msgSend3(self, "canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:", self, sel_getUid("_document:shouldClose:context:"), {delegate: delegate, selector: selector, context: info});
    else if ((delegate == null ? null : delegate.isa.objj_msgSend1(delegate, "respondsToSelector:", selector)))
        objj_msgSend(delegate, selector, self, YES, info);
    var ___r1;
}
,["void","CPWindowController","id","SEL","Object"]), new objj_method(sel_getUid("_document:shouldClose:context:"), function $CPDocument___document_shouldClose_context_(self, _cmd, aDocument, shouldClose, context)
{
    if (aDocument === self && shouldClose)
        self.isa.objj_msgSend0(self, "close");
    objj_msgSend(context.delegate, context.selector, aDocument, shouldClose, context.context);
}
,["void","CPDocument","BOOL","Object"]), new objj_method(sel_getUid("canCloseDocumentWithDelegate:shouldCloseSelector:contextInfo:"), function $CPDocument__canCloseDocumentWithDelegate_shouldCloseSelector_contextInfo_(self, _cmd, aDelegate, aSelector, context)
{
    if (!self.isa.objj_msgSend0(self, "isDocumentEdited"))
        return (aDelegate == null ? null : aDelegate.isa.objj_msgSend1(aDelegate, "respondsToSelector:", aSelector)) && objj_msgSend(aDelegate, aSelector, self, YES, context);
    self._canCloseAlert = ((___r1 = CPAlert.isa.objj_msgSend0(CPAlert, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    ((___r1 = self._canCloseAlert), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDelegate:", self));
    ((___r1 = self._canCloseAlert), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlertStyle:", CPWarningAlertStyle));
    ((___r1 = self._canCloseAlert), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", "Unsaved Document"));
    ((___r1 = self._canCloseAlert), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMessageText:", "Do you want to save the changes you've made to the document \"" + (self.isa.objj_msgSend0(self, "displayName") || self.isa.objj_msgSend0(self, "fileName")) + "\"?"));
    ((___r1 = self._canCloseAlert), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addButtonWithTitle:", "Save"));
    ((___r1 = self._canCloseAlert), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addButtonWithTitle:", "Cancel"));
    ((___r1 = self._canCloseAlert), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addButtonWithTitle:", "Don't Save"));
    self._canCloseAlert._context = {delegate: aDelegate, selector: aSelector, context: context};
    ((___r1 = self._canCloseAlert), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "runModal"));
    var ___r1;
}
,["void","id","SEL","Object"]), new objj_method(sel_getUid("alertDidEnd:returnCode:"), function $CPDocument__alertDidEnd_returnCode_(self, _cmd, alert, returnCode)
{
    if (alert !== self._canCloseAlert)
        return;
    var delegate = alert._context.delegate,
        selector = alert._context.selector,
        context = alert._context.context;
    if (returnCode === 0)
        self.isa.objj_msgSend3(self, "saveDocumentWithDelegate:didSaveSelector:contextInfo:", delegate, selector, context);
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
