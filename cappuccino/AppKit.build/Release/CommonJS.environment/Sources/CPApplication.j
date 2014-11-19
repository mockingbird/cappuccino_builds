@STATIC;1.0;I;21;Foundation/CPBundle.ji;25;CPApplication_Constants.ji;17;CPCompatibility.ji;14;CPColorPanel.ji;10;CPCursor.ji;22;CPDocumentController.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;14;CPThemeBlend.ji;14;CPCibLoading.ji;9;CPPanel.ji;12;CPPlatform.ji;20;CPWindowController.ji;18;_CPPopoverWindow.jt;53769;objj_executeFile("Foundation/CPBundle.j", NO);objj_executeFile("CPApplication_Constants.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPColorPanel.j", YES);objj_executeFile("CPCursor.j", YES);objj_executeFile("CPDocumentController.j", YES);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPMenu.j", YES);objj_executeFile("CPResponder.j", YES);objj_executeFile("CPThemeBlend.j", YES);objj_executeFile("CPCibLoading.j", YES);objj_executeFile("CPPanel.j", YES);objj_executeFile("CPPlatform.j", YES);objj_executeFile("CPWindowController.j", YES);objj_executeFile("_CPPopoverWindow.j", YES);var CPMainCibFile = "CPMainCibFile",
    CPMainCibFileHumanFriendly = "Main cib file base name",
    CPEventModifierFlags = 0;
{var the_protocol = objj_allocateProtocol("CPApplicationDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPApplicationDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}{var the_class = objj_allocateClassPair(CPResponder, "CPApplication"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_eventListeners"), new objj_ivar("_eventListenerInsertionIndex"), new objj_ivar("_currentEvent"), new objj_ivar("_lastMouseMoveWindow"), new objj_ivar("_windows"), new objj_ivar("_keyWindow"), new objj_ivar("_mainWindow"), new objj_ivar("_previousKeyWindow"), new objj_ivar("_previousMainWindow"), new objj_ivar("_documentController"), new objj_ivar("_currentSession"), new objj_ivar("_delegate"), new objj_ivar("_finishedLaunching"), new objj_ivar("_isActive"), new objj_ivar("_namedArgs"), new objj_ivar("_args"), new objj_ivar("_fullArgsString"), new objj_ivar("_applicationIconImage"), new objj_ivar("_aboutPanel"), new objj_ivar("_themeBlend")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("themeBlend"), function $CPApplication__themeBlend(self, _cmd)
{
    return self._themeBlend;
}
,["CPThemeBlend"]), new objj_method(sel_getUid("setThemeBlend:"), function $CPApplication__setThemeBlend_(self, _cmd, newValue)
{
    self._themeBlend = newValue;
}
,["void","CPThemeBlend"]), new objj_method(sel_getUid("init"), function $CPApplication__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPApplication").super_class }, "init");
    CPApp = self;
    if (self)
    {
        self._eventListeners = [];
        self._eventListenerInsertionIndex = 0;
        self._windows = [CPNull.isa.objj_msgSend0(CPNull, "null")];
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPApplication__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate == aDelegate)
        return;
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter"),
        delegateNotifications = [CPApplicationWillFinishLaunchingNotification, sel_getUid("applicationWillFinishLaunching:"), CPApplicationDidFinishLaunchingNotification, sel_getUid("applicationDidFinishLaunching:"), CPApplicationWillBecomeActiveNotification, sel_getUid("applicationWillBecomeActive:"), CPApplicationDidBecomeActiveNotification, sel_getUid("applicationDidBecomeActive:"), CPApplicationWillResignActiveNotification, sel_getUid("applicationWillResignActive:"), CPApplicationDidResignActiveNotification, sel_getUid("applicationDidResignActive:"), CPApplicationWillTerminateNotification, sel_getUid("applicationWillTerminate:"), CPApplicationDidChangeScreenParametersNotification, sel_getUid("applicationDidChangeScreenParameters:")],
        count = (delegateNotifications == null ? null : delegateNotifications.isa.objj_msgSend0(delegateNotifications, "count"));
    if (self._delegate)
    {
        var index = 0;
        for (; index < count; index += 2)
        {
            var notificationName = delegateNotifications[index],
                selector = delegateNotifications[index + 1];
            if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", selector)))
                (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend3(defaultCenter, "removeObserver:name:object:", self._delegate, notificationName, self));
        }
    }
    self._delegate = aDelegate;
    var index = 0;
    for (; index < count; index += 2)
    {
        var notificationName = delegateNotifications[index],
            selector = delegateNotifications[index + 1];
        if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", selector)))
            (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self._delegate, selector, notificationName, self));
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("delegate"), function $CPApplication__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("finishLaunching"), function $CPApplication__finishLaunching(self, _cmd)
{
    ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    var bundle = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle"),
        delegateClassName = (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "objectForInfoDictionaryKey:", "CPApplicationDelegateClass"));
    if (delegateClassName)
    {
        var delegateClass = objj_getClass(delegateClassName);
        if (delegateClass)
            self.isa.objj_msgSend1(self, "setDelegate:", ((___r1 = (delegateClass == null ? null : delegateClass.isa.objj_msgSend0(delegateClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init")));
    }
    var defaultCenter = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter");
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPApplicationWillFinishLaunchingNotification, self));
    var types = (bundle == null ? null : bundle.isa.objj_msgSend1(bundle, "objectForInfoDictionaryKey:", "CPBundleDocumentTypes"));
    if ((types == null ? null : types.isa.objj_msgSend0(types, "count")) > 0)
        self._documentController = CPDocumentController.isa.objj_msgSend0(CPDocumentController, "sharedDocumentController");
    var needsUntitled = !!self._documentController,
        URLStrings = nil;
    var index = 0,
        count = (URLStrings == null ? null : URLStrings.isa.objj_msgSend0(URLStrings, "count"));
    for (; index < count; ++index)
        needsUntitled = !self.isa.objj_msgSend1(self, "_openURL:", CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", URLStrings[index])) && needsUntitled;
    if (needsUntitled && ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("applicationShouldOpenUntitledFile:"))))
        needsUntitled = ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "applicationShouldOpenUntitledFile:", self));
    if (needsUntitled)
        ((___r1 = self._documentController), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "newDocument:", self));
    ((___r1 = self._documentController), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_updateRecentDocumentsMenu"));
    (defaultCenter == null ? null : defaultCenter.isa.objj_msgSend2(defaultCenter, "postNotificationName:object:", CPApplicationDidFinishLaunchingNotification, self));
    ((___r1 = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "currentRunLoop")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "limitDateForMode:", CPDefaultRunLoopMode));
    self._finishedLaunching = YES;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("terminate:"), function $CPApplication__terminate_(self, _cmd, aSender)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPApplicationWillTerminateNotification, self));
    if (!CPPlatform.isa.objj_msgSend0(CPPlatform, "isBrowser"))
    {
        ((___r1 = CPDocumentController.isa.objj_msgSend0(CPDocumentController, "sharedDocumentController")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "closeAllDocumentsWithDelegate:didCloseAllSelector:contextInfo:", self, sel_getUid("_documentController:didCloseAll:context:"), nil));
    }
    else
    {
        ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "keyWindow")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_propagateCurrentDOMEvent:", YES));
    }
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("setApplicationIconImage:"), function $CPApplication__setApplicationIconImage_(self, _cmd, anImage)
{
    self._applicationIconImage = anImage;
}
,["void","CPImage"]), new objj_method(sel_getUid("applicationIconImage"), function $CPApplication__applicationIconImage(self, _cmd)
{
    if (self._applicationIconImage)
        return self._applicationIconImage;
    var imagePath = ((___r1 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForInfoDictionaryKey:", "CPApplicationIcon"));
    if (imagePath)
        self._applicationIconImage = ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentsOfFile:", imagePath));
    return self._applicationIconImage;
    var ___r1;
}
,["CPImage"]), new objj_method(sel_getUid("orderFrontStandardAboutPanel:"), function $CPApplication__orderFrontStandardAboutPanel_(self, _cmd, sender)
{
    self.isa.objj_msgSend1(self, "orderFrontStandardAboutPanelWithOptions:", nil);
}
,["void","id"]), new objj_method(sel_getUid("orderFrontStandardAboutPanelWithOptions:"), function $CPApplication__orderFrontStandardAboutPanelWithOptions_(self, _cmd, options)
{
    if (!self._aboutPanel)
    {
        var mainInfo = ((___r1 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "infoDictionary")),
            applicationTitle = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", "ApplicationName")) || (mainInfo == null ? null : mainInfo.isa.objj_msgSend1(mainInfo, "objectForKey:", "CPBundleName")),
            applicationIcon = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", "ApplicationIcon")) || self.isa.objj_msgSend0(self, "applicationIconImage"),
            version = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", "Version")) || (mainInfo == null ? null : mainInfo.isa.objj_msgSend1(mainInfo, "objectForKey:", "CPBundleVersion")),
            applicationVersion = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", "ApplicationVersion")) || (mainInfo == null ? null : mainInfo.isa.objj_msgSend1(mainInfo, "objectForKey:", "CPBundleShortVersionString")),
            copyright = (options == null ? null : options.isa.objj_msgSend1(options, "objectForKey:", "Copyright")) || (mainInfo == null ? null : mainInfo.isa.objj_msgSend1(mainInfo, "objectForKey:", "CPHumanReadableCopyright"));
        var windowWidth = 275,
            windowHeight = 223,
            imgWidth = 100,
            imgHeight = 100,
            interField = 8,
            aboutPanel = ((___r1 = CPWindow.isa.objj_msgSend0(CPWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", CGRectMake(0, 0, windowWidth, windowHeight), CPClosableWindowMask)),
            imageView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(windowWidth / 2 - imgWidth / 2, interField, imgWidth, imgHeight))),
            applicationLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(17, imgHeight + 16, windowWidth - 34, 24))),
            versionLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(17, imgHeight + 48, windowWidth - 34, 16))),
            copyrightLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(17, imgHeight + 72, windowWidth - 34, 32))),
            contentView = (aboutPanel == null ? null : aboutPanel.isa.objj_msgSend0(aboutPanel, "contentView"));
        (applicationLabel == null ? null : applicationLabel.isa.objj_msgSend1(applicationLabel, "setFont:", CPFont.isa.objj_msgSend1(CPFont, "boldSystemFontOfSize:", CPFont.isa.objj_msgSend0(CPFont, "systemFontSize") + 2)));
        (applicationLabel == null ? null : applicationLabel.isa.objj_msgSend1(applicationLabel, "setAlignment:", CPCenterTextAlignment));
        (versionLabel == null ? null : versionLabel.isa.objj_msgSend1(versionLabel, "setFont:", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", CPFont.isa.objj_msgSend0(CPFont, "systemFontSize") - 1)));
        (versionLabel == null ? null : versionLabel.isa.objj_msgSend1(versionLabel, "setAlignment:", CPCenterTextAlignment));
        (copyrightLabel == null ? null : copyrightLabel.isa.objj_msgSend1(copyrightLabel, "setFont:", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", CPFont.isa.objj_msgSend0(CPFont, "systemFontSize") - 1)));
        (copyrightLabel == null ? null : copyrightLabel.isa.objj_msgSend1(copyrightLabel, "setAlignment:", CPCenterTextAlignment));
        (copyrightLabel == null ? null : copyrightLabel.isa.objj_msgSend1(copyrightLabel, "setLineBreakMode:", CPLineBreakByWordWrapping));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", imageView));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", applicationLabel));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", versionLabel));
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", copyrightLabel));
        var standardPath = ((___r1 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", self.isa.objj_msgSend0(self, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", "standardApplicationIcon.png"));
        (imageView == null ? null : imageView.isa.objj_msgSend1(imageView, "setImage:", applicationIcon || ((___r1 = CPImage.isa.objj_msgSend0(CPImage, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentsOfFile:size:", standardPath, CGSizeMake(256, 256)))));
        (applicationLabel == null ? null : applicationLabel.isa.objj_msgSend1(applicationLabel, "setStringValue:", applicationTitle || ""));
        if (applicationVersion && version)
            (versionLabel == null ? null : versionLabel.isa.objj_msgSend1(versionLabel, "setStringValue:", "Version " + applicationVersion + " (" + version + ")"));
        else if (applicationVersion || version)
            (versionLabel == null ? null : versionLabel.isa.objj_msgSend1(versionLabel, "setStringValue:", "Version " + (applicationVersion || version)));
        else
            (versionLabel == null ? null : versionLabel.isa.objj_msgSend1(versionLabel, "setStringValue:", ""));
        (copyrightLabel == null ? null : copyrightLabel.isa.objj_msgSend1(copyrightLabel, "setStringValue:", copyright || ""));
        (aboutPanel == null ? null : aboutPanel.isa.objj_msgSend0(aboutPanel, "center"));
        self._aboutPanel = aboutPanel;
    }
    ((___r1 = self._aboutPanel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderFront:", self));
    var ___r1;
}
,["void","CPDictionary"]), new objj_method(sel_getUid("_documentController:didCloseAll:context:"), function $CPApplication___documentController_didCloseAll_context_(self, _cmd, docController, didCloseAll, info)
{
    if (didCloseAll)
    {
        if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("applicationShouldTerminate:"))))
            self.isa.objj_msgSend1(self, "replyToApplicationShouldTerminate:", ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "applicationShouldTerminate:", self)));
        else
            self.isa.objj_msgSend1(self, "replyToApplicationShouldTerminate:", YES);
    }
    var ___r1;
}
,["void","CPDocumentController","BOOL","Object"]), new objj_method(sel_getUid("replyToApplicationShouldTerminate:"), function $CPApplication__replyToApplicationShouldTerminate_(self, _cmd, terminate)
{
    if (terminate == CPTerminateNow)
    {
        ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPApplicationWillTerminateNotification, self));
        CPPlatform.isa.objj_msgSend0(CPPlatform, "terminateApplication");
    }
    var ___r1;
}
,["void","BOOL"]), new objj_method(sel_getUid("activateIgnoringOtherApps:"), function $CPApplication__activateIgnoringOtherApps_(self, _cmd, shouldIgnoreOtherApps)
{
    self.isa.objj_msgSend0(self, "_willBecomeActive");
    CPPlatform.isa.objj_msgSend1(CPPlatform, "activateIgnoringOtherApps:", shouldIgnoreOtherApps);
    self._isActive = YES;
    self.isa.objj_msgSend0(self, "_didBecomeActive");
}
,["void","BOOL"]), new objj_method(sel_getUid("deactivate"), function $CPApplication__deactivate(self, _cmd)
{
    self.isa.objj_msgSend0(self, "_willResignActive");
    CPPlatform.isa.objj_msgSend0(CPPlatform, "deactivate");
    self._isActive = NO;
    self.isa.objj_msgSend0(self, "_didResignActive");
}
,["void"]), new objj_method(sel_getUid("isActive"), function $CPApplication__isActive(self, _cmd)
{
    return self._isActive;
}
,["void"]), new objj_method(sel_getUid("hideOtherApplications:"), function $CPApplication__hideOtherApplications_(self, _cmd, aSender)
{
    CPPlatform.isa.objj_msgSend1(CPPlatform, "hideOtherApplications:", self);
}
,["void","id"]), new objj_method(sel_getUid("run"), function $CPApplication__run(self, _cmd)
{
    self.isa.objj_msgSend0(self, "finishLaunching");
}
,["void"]), new objj_method(sel_getUid("runModalForWindow:"), function $CPApplication__runModalForWindow_(self, _cmd, aWindow)
{
    self.isa.objj_msgSend1(self, "runModalSession:", self.isa.objj_msgSend1(self, "beginModalSessionForWindow:", aWindow));
}
,["void","CPWindow"]), new objj_method(sel_getUid("stopModalWithCode:"), function $CPApplication__stopModalWithCode_(self, _cmd, aCode)
{
    if (!self._currentSession)
    {
        return;
    }
    self._currentSession._state = aCode;
    self._currentSession = self._currentSession._previous;
    self.isa.objj_msgSend0(self, "_removeRunModalLoop");
}
,["void","int"]), new objj_method(sel_getUid("_removeRunModalLoop"), function $CPApplication___removeRunModalLoop(self, _cmd)
{
    var count = self._eventListeners.length;
    while (count--)
        if (self._eventListeners[count]._callback === _CPRunModalLoop)
        {
            self._eventListeners.splice(count, 1);
            if (count <= self._eventListenerInsertionIndex)
                self._eventListenerInsertionIndex--;
            return;
        }
}
,["void"]), new objj_method(sel_getUid("stopModal"), function $CPApplication__stopModal(self, _cmd)
{
    self.isa.objj_msgSend1(self, "stopModalWithCode:", CPRunStoppedResponse);
}
,["void"]), new objj_method(sel_getUid("abortModal"), function $CPApplication__abortModal(self, _cmd)
{
    self.isa.objj_msgSend1(self, "stopModalWithCode:", CPRunAbortedResponse);
}
,["void"]), new objj_method(sel_getUid("beginModalSessionForWindow:"), function $CPApplication__beginModalSessionForWindow_(self, _cmd, aWindow)
{
    return _CPModalSessionMake(aWindow, 0);
}
,["CPModalSession","CPWindow"]), new objj_method(sel_getUid("runModalSession:"), function $CPApplication__runModalSession_(self, _cmd, aModalSession)
{
    aModalSession._previous = self._currentSession;
    self._currentSession = aModalSession;
    var theWindow = aModalSession._window;
    (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "center"));
    (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "makeKeyWindow"));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "orderFront:", self));
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", _CPRunModalLoop, CPAnyEventMask, nil, 0, YES));
}
,["void","CPModalSession"]), new objj_method(sel_getUid("modalWindow"), function $CPApplication__modalWindow(self, _cmd)
{
    if (!self._currentSession)
        return nil;
    return self._currentSession._window;
}
,["CPWindow"]), new objj_method(sel_getUid("_handleKeyEquivalent:"), function $CPApplication___handleKeyEquivalent_(self, _cmd, anEvent)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "keyWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performKeyEquivalent:", anEvent)) || ((___r1 = self.isa.objj_msgSend0(self, "mainMenu")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performKeyEquivalent:", anEvent));
    var ___r1;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("sendEvent:"), function $CPApplication__sendEvent_(self, _cmd, anEvent)
{
    self._currentEvent = anEvent;
    CPEventModifierFlags = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags"));
    var theWindow = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window"));
    if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "_couldBeKeyEquivalent")) && self.isa.objj_msgSend1(self, "_handleKeyEquivalent:", anEvent))
        return;
    if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")) == CPMouseMoved)
    {
        if (theWindow !== self._lastMouseMoveWindow)
            ((___r1 = self._lastMouseMoveWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_mouseExitedResizeRect"));
        self._lastMouseMoveWindow = theWindow;
    }
    for (var i = self._eventListeners.length - 1; i >= 0; i--)
    {
        var listener = self._eventListeners[i];
        if (listener._mask & 1 << (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")))
        {
            self._eventListeners.splice(i, 1);
            self._eventListenerInsertionIndex = i;
            listener._callback(anEvent);
            if (listener._dequeue)
            {
                self._eventListenerInsertionIndex = self._eventListeners.length;
                return;
            }
        }
    }
    self._eventListenerInsertionIndex = self._eventListeners.length;
    if (theWindow)
        (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "sendEvent:", anEvent));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("doCommandBySelector:"), function $CPApplication__doCommandBySelector_(self, _cmd, aSelector)
{
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", aSelector)))
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performSelector:", aSelector));
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPApplication").super_class }, "doCommandBySelector:", aSelector);
    var ___r1;
}
,["void","SEL"]), new objj_method(sel_getUid("keyWindow"), function $CPApplication__keyWindow(self, _cmd)
{
    return self._keyWindow;
}
,["CPWindow"]), new objj_method(sel_getUid("mainWindow"), function $CPApplication__mainWindow(self, _cmd)
{
    return self._mainWindow;
}
,["CPWindow"]), new objj_method(sel_getUid("windowWithWindowNumber:"), function $CPApplication__windowWithWindowNumber_(self, _cmd, aWindowNumber)
{
    if (!aWindowNumber)
        return nil;
    return self._windows[aWindowNumber];
}
,["CPWindow","int"]), new objj_method(sel_getUid("windows"), function $CPApplication__windows(self, _cmd)
{
    return ((___r1 = self._windows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "subarrayWithRange:", CPMakeRange(1, ((___r2 = self._windows), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "count")) - 1)));
    var ___r1, ___r2;
}
,["CPArray"]), new objj_method(sel_getUid("orderedWindows"), function $CPApplication__orderedWindows(self, _cmd)
{
    return [];
}
,["CPArray"]), new objj_method(sel_getUid("hide:"), function $CPApplication__hide_(self, _cmd, aSender)
{
    CPPlatform.isa.objj_msgSend1(CPPlatform, "hide:", self);
}
,["void","id"]), new objj_method(sel_getUid("mainMenu"), function $CPApplication__mainMenu(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "menu");
}
,["CPMenu"]), new objj_method(sel_getUid("setMainMenu:"), function $CPApplication__setMainMenu_(self, _cmd, aMenu)
{
    self.isa.objj_msgSend1(self, "setMenu:", aMenu);
}
,["void","CPMenu"]), new objj_method(sel_getUid("setMenu:"), function $CPApplication__setMenu_(self, _cmd, aMenu)
{
    if ((aMenu == null ? null : aMenu.isa.objj_msgSend0(aMenu, "_menuName")) === "CPMainMenu")
    {
        if (self.isa.objj_msgSend0(self, "menu") === aMenu)
            return;
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPApplication").super_class }, "setMenu:", aMenu);
        if (CPPlatform.isa.objj_msgSend0(CPPlatform, "supportsNativeMainMenu"))
            window.cpSetMainMenu(self.isa.objj_msgSend0(self, "menu"));
    }
    else
        (aMenu == null ? null : aMenu.isa.objj_msgSend1(aMenu, "_setMenuName:", "CPMainMenu"));
}
,["void","CPMenu"]), new objj_method(sel_getUid("orderFrontColorPanel:"), function $CPApplication__orderFrontColorPanel_(self, _cmd, aSender)
{
    ((___r1 = CPColorPanel.isa.objj_msgSend0(CPColorPanel, "sharedColorPanel")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderFront:", self));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("tryToPerform:with:"), function $CPApplication__tryToPerform_with_(self, _cmd, anAction, anObject)
{
    if (!anAction)
        return NO;
    if (objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPApplication").super_class }, "tryToPerform:with:", anAction, anObject))
        return YES;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", anAction)))
    {
        ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "performSelector:withObject:", anAction, anObject));
        return YES;
    }
    return NO;
    var ___r1;
}
,["BOOL","SEL","id"]), new objj_method(sel_getUid("sendAction:to:from:"), function $CPApplication__sendAction_to_from_(self, _cmd, anAction, aTarget, aSender)
{
    var target = self.isa.objj_msgSend3(self, "targetForAction:to:from:", anAction, aTarget, aSender);
    if (!target)
        return NO;
    (target == null ? null : target.isa.objj_msgSend2(target, "performSelector:withObject:", anAction, aSender));
    return YES;
}
,["BOOL","SEL","id","id"]), new objj_method(sel_getUid("targetForAction:to:from:"), function $CPApplication__targetForAction_to_from_(self, _cmd, anAction, aTarget, aSender)
{
    if (!anAction)
        return nil;
    if (aTarget)
        return aTarget;
    return self.isa.objj_msgSend1(self, "targetForAction:", anAction);
}
,["id","SEL","id","id"]), new objj_method(sel_getUid("_targetForWindow:action:"), function $CPApplication___targetForWindow_action_(self, _cmd, aWindow, anAction)
{
    var responder = (aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "firstResponder")),
        checkWindow = YES;
    while (responder)
    {
        if ((responder == null ? null : responder.isa.objj_msgSend1(responder, "respondsToSelector:", anAction)))
            return responder;
        if (responder == aWindow)
            checkWindow = NO;
        responder = (responder == null ? null : responder.isa.objj_msgSend0(responder, "nextResponder"));
    }
    if (checkWindow && (aWindow == null ? null : aWindow.isa.objj_msgSend1(aWindow, "respondsToSelector:", anAction)))
        return aWindow;
    var delegate = (aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "delegate"));
    if ((delegate == null ? null : delegate.isa.objj_msgSend1(delegate, "respondsToSelector:", anAction)))
        return delegate;
    var windowController = (aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "windowController"));
    if ((windowController == null ? null : windowController.isa.objj_msgSend1(windowController, "respondsToSelector:", anAction)))
        return windowController;
    var theDocument = (windowController == null ? null : windowController.isa.objj_msgSend0(windowController, "document"));
    if (theDocument !== delegate && (theDocument == null ? null : theDocument.isa.objj_msgSend1(theDocument, "respondsToSelector:", anAction)))
        return theDocument;
    return nil;
}
,["id","CPWindow","SEL"]), new objj_method(sel_getUid("targetForAction:"), function $CPApplication__targetForAction_(self, _cmd, anAction)
{
    if (!anAction)
        return nil;
    var target = self.isa.objj_msgSend2(self, "_targetForWindow:action:", self.isa.objj_msgSend0(self, "keyWindow"), anAction);
    if (target)
        return target;
    target = self.isa.objj_msgSend2(self, "_targetForWindow:action:", self.isa.objj_msgSend0(self, "mainWindow"), anAction);
    if (target)
        return target;
    if (self.isa.objj_msgSend1(self, "respondsToSelector:", anAction))
        return self;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", anAction)))
        return self._delegate;
    if (((___r1 = self._documentController), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", anAction)))
        return self._documentController;
    return nil;
    var ___r1;
}
,["id","SEL"]), new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"), function $CPApplication__setCallback_forNextEventMatchingMask_untilDate_inMode_dequeue_(self, _cmd, aCallback, aMask, anExpiration, aMode, shouldDequeue)
{
    self._eventListeners.splice(self._eventListenerInsertionIndex++, 0, _CPEventListenerMake(aMask, aCallback, shouldDequeue));
}
,["void","Function","unsigned int","CPDate","CPString","BOOL"]), new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"), function $CPApplication__setTarget_selector_forNextEventMatchingMask_untilDate_inMode_dequeue_(self, _cmd, aTarget, aSelector, aMask, anExpiration, aMode, shouldDequeue)
{
    self._eventListeners.splice(self._eventListenerInsertionIndex++, 0, _CPEventListenerMake(aMask, function(anEvent)
    {
        objj_msgSend(aTarget, aSelector, anEvent);
    }, shouldDequeue));
}
,["void","id","SEL","unsigned int","CPDate","CPString","BOOL"]), new objj_method(sel_getUid("currentEvent"), function $CPApplication__currentEvent(self, _cmd)
{
    return self._currentEvent;
}
,["CPEvent"]), new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"), function $CPApplication__beginSheet_modalForWindow_modalDelegate_didEndSelector_contextInfo_(self, _cmd, aSheet, aWindow, aModalDelegate, didEndSelector, contextInfo)
{
    if ((aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "isSheet")))
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, "The target window of beginSheet: cannot be a sheet");
        return;
    }
    if (!(aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "attachedSheet")))
        ((___r1 = aSheet._windowView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_enableSheet:inWindow:", YES, aWindow));
    (aWindow == null ? null : aWindow.isa.objj_msgSend(aWindow, "_attachSheet:modalDelegate:didEndSelector:contextInfo:", aSheet, aModalDelegate, didEndSelector, contextInfo));
    var ___r1;
}
,["void","CPWindow","CPWindow","id","SEL","id"]), new objj_method(sel_getUid("endSheet:returnCode:"), function $CPApplication__endSheet_returnCode_(self, _cmd, sheet, returnCode)
{
    var count = ((___r1 = self._windows), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (--count >= 0)
    {
        var aWindow = ((___r1 = self._windows), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", count)),
            context = aWindow._sheetContext;
        if (context && context["sheet"] === sheet)
        {
            context["returnCode"] = returnCode;
            (aWindow == null ? null : aWindow.isa.objj_msgSend0(aWindow, "_endSheet"));
            return;
        }
    }
    var ___r1;
}
,["void","CPWindow","int"]), new objj_method(sel_getUid("endSheet:"), function $CPApplication__endSheet_(self, _cmd, sheet)
{
    self.isa.objj_msgSend2(self, "endSheet:returnCode:", sheet, 0);
}
,["void","CPWindow"]), new objj_method(sel_getUid("arguments"), function $CPApplication__arguments(self, _cmd)
{
    if (window && window.location && self._fullArgsString !== window.location.hash)
        self.isa.objj_msgSend0(self, "_reloadArguments");
    return self._args;
}
,["CPArray"]), new objj_method(sel_getUid("setArguments:"), function $CPApplication__setArguments_(self, _cmd, args)
{
    if (!args || args.length == 0)
    {
        self._args = [];
        if (window && window.location)
            window.location.hash = "#";
        return;
    }
    if (!(args == null ? null : args.isa.objj_msgSend1(args, "isKindOfClass:", CPArray)))
        args = CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", args);
    self._args = args;
    var toEncode = ((___r1 = self._args), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    for (var i = 0, count = toEncode.length; i < count; i++)
        toEncode[i] = encodeURIComponent(toEncode[i]);
    var hash = (toEncode == null ? null : toEncode.isa.objj_msgSend1(toEncode, "componentsJoinedByString:", "/"));
    if (window && window.location)
        window.location.hash = "#" + hash;
    var ___r1;
}
,["void","CPArray"]), new objj_method(sel_getUid("_reloadArguments"), function $CPApplication___reloadArguments(self, _cmd)
{
    self._fullArgsString = window && window.location ? window.location.hash : "";
    if (self._fullArgsString.length)
    {
        var args = (self._fullArgsString.substring(1)).split("/");
        for (var i = 0, count = args.length; i < count; i++)
            args[i] = decodeURIComponent(args[i]);
        self._args = args;
    }
    else
        self._args = [];
}
,["void"]), new objj_method(sel_getUid("namedArguments"), function $CPApplication__namedArguments(self, _cmd)
{
    return self._namedArgs;
}
,["CPDictionary"]), new objj_method(sel_getUid("_openURL:"), function $CPApplication___openURL_(self, _cmd, aURL)
{
    if (self._delegate && ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("application:openFile:"))))
    {
        CPLog.warn("application:openFile: is deprecated, use application:openURL: instead.");
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "application:openFile:", self, (aURL == null ? null : aURL.isa.objj_msgSend0(aURL, "absoluteString"))));
    }
    if (self._delegate && ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("application:openURL:"))))
        return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "application:openURL:", self, aURL));
    return !!((___r1 = self._documentController), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "openDocumentWithContentsOfURL:display:error:", aURL, YES, NULL));
    var ___r1;
}
,["BOOL","CPURL"]), new objj_method(sel_getUid("_willBecomeActive"), function $CPApplication___willBecomeActive(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPApplicationWillBecomeActiveNotification, self, nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_didBecomeActive"), function $CPApplication___didBecomeActive(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "keyWindow") && self._previousKeyWindow && ((___r1 = self.isa.objj_msgSend0(self, "windows")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", self._previousKeyWindow)) !== CPNotFound)
        ((___r1 = self._previousKeyWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "makeKeyWindow"));
    if (!self.isa.objj_msgSend0(self, "mainWindow") && self._previousMainWindow && ((___r1 = self.isa.objj_msgSend0(self, "windows")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "indexOfObjectIdenticalTo:", self._previousMainWindow)) !== CPNotFound)
        ((___r1 = self._previousMainWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "makeMainWindow"));
    if (self.isa.objj_msgSend0(self, "keyWindow"))
        ((___r1 = self.isa.objj_msgSend0(self, "keyWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderFront:", self));
    else if (self.isa.objj_msgSend0(self, "mainWindow"))
        ((___r1 = self.isa.objj_msgSend0(self, "mainWindow")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeKeyAndOrderFront:", self));
    else if (self.isa.objj_msgSend0(self, "mainMenu"))
        ((___r1 = self.isa.objj_msgSend0(self, "mainMenu")._menuWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "makeKeyWindow"));
    self._previousKeyWindow = nil;
    self._previousMainWindow = nil;
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPApplicationDidBecomeActiveNotification, self, nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_willResignActive"), function $CPApplication___willResignActive(self, _cmd)
{
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPApplicationWillResignActiveNotification, self, nil));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("_didResignActive"), function $CPApplication___didResignActive(self, _cmd)
{
    if (self._activeMenu)
        ((___r1 = self._activeMenu), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "cancelTracking"));
    if (self.isa.objj_msgSend0(self, "keyWindow"))
    {
        self._previousKeyWindow = self.isa.objj_msgSend0(self, "keyWindow");
        ((___r1 = self._previousKeyWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "resignKeyWindow"));
    }
    if (self.isa.objj_msgSend0(self, "mainWindow"))
    {
        self._previousMainWindow = self.isa.objj_msgSend0(self, "mainWindow");
        ((___r1 = self._previousMainWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "resignMainWindow"));
    }
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "postNotificationName:object:userInfo:", CPApplicationDidResignActiveNotification, self, nil));
    var ___r1;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedApplication"), function $CPApplication__sharedApplication(self, _cmd)
{
    if (!CPApp)
        CPApp = ((___r1 = CPApplication.isa.objj_msgSend0(CPApplication, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return CPApp;
    var ___r1;
}
,["CPApplication"]), new objj_method(sel_getUid("defaultThemeName"), function $CPApplication__defaultThemeName(self, _cmd)
{
    return ((___r1 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForInfoDictionaryKey:", "CPDefaultTheme")) || "Aristo2";
    var ___r1;
}
,["CPString"])]);
}var _CPModalSessionMake = function(aWindow, aStopCode)
{
    return {_window: aWindow, _state: CPRunContinuesResponse, _previous: nil};
};
var _CPEventListenerMake = function(anEventMask, aCallback, shouldDequeue)
{
    return {_mask: anEventMask, _callback: aCallback, _dequeue: shouldDequeue};
};
_CPRunModalLoop = function(anEvent)
{
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:", _CPRunModalLoop, CPAnyEventMask, nil, 0, YES));
    var theWindow = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "window")),
        modalSession = CPApp._currentSession;
    if (theWindow == modalSession._window || (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "worksWhenModal")) || (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "attachedSheet")) == modalSession._window || (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "isKindOfClass:", _CPPopoverWindow)) && ((___r1 = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "targetView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "window")) === modalSession._window)
    {
        (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "sendEvent:", anEvent));
    }
    var ___r1;
};
CPApplicationMain = function(args, namedArgs)
{
    var mainBundle = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle"),
        principalClass = (mainBundle == null ? null : mainBundle.isa.objj_msgSend0(mainBundle, "principalClass"));
    if (!principalClass)
        principalClass = CPApplication.isa.objj_msgSend0(CPApplication, "class");
    (principalClass == null ? null : principalClass.isa.objj_msgSend0(principalClass, "sharedApplication"));
    if ((args == null ? null : args.isa.objj_msgSend1(args, "containsObject:", "debug")))
        CPLogRegister(CPLogPopup);
    CPApp._args = args;
    CPApp._namedArgs = namedArgs;
    (_CPAppBootstrapper == null ? null : _CPAppBootstrapper.isa.objj_msgSend0(_CPAppBootstrapper, "performActions"));
}
var _CPAppBootstrapperActions = nil;
{var the_class = objj_allocateClassPair(CPObject, "_CPAppBootstrapper"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("actions"), function $_CPAppBootstrapper__actions(self, _cmd)
{
    return [sel_getUid("bootstrapPlatform"), sel_getUid("loadDefaultTheme"), sel_getUid("loadMainCibFile")];
}
,["CPArray"]), new objj_method(sel_getUid("performActions"), function $_CPAppBootstrapper__performActions(self, _cmd)
{
    if (!_CPAppBootstrapperActions)
        _CPAppBootstrapperActions = self.isa.objj_msgSend0(self, "actions");
    while (_CPAppBootstrapperActions.length)
    {
        var action = _CPAppBootstrapperActions.shift();
        if (objj_msgSend(self, action))
            return;
    }
    (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "run"));
}
,["void"]), new objj_method(sel_getUid("bootstrapPlatform"), function $_CPAppBootstrapper__bootstrapPlatform(self, _cmd)
{
    return CPPlatform.isa.objj_msgSend0(CPPlatform, "bootstrap");
}
,["BOOL"]), new objj_method(sel_getUid("loadDefaultTheme"), function $_CPAppBootstrapper__loadDefaultTheme(self, _cmd)
{
    var defaultThemeName = CPApplication.isa.objj_msgSend0(CPApplication, "defaultThemeName"),
        themeURL = nil;
    if (defaultThemeName === "Aristo" || defaultThemeName === "Aristo2")
        themeURL = ((___r1 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", CPApplication.isa.objj_msgSend0(CPApplication, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", defaultThemeName + ".blend"));
    else
        themeURL = ((___r1 = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", defaultThemeName + ".blend"));
    var blend = ((___r1 = CPThemeBlend.isa.objj_msgSend0(CPThemeBlend, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithContentsOfURL:", themeURL));
    (blend == null ? null : blend.isa.objj_msgSend1(blend, "loadWithDelegate:", self));
    return YES;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("blendDidFinishLoading:"), function $_CPAppBootstrapper__blendDidFinishLoading_(self, _cmd, aThemeBlend)
{
    ((___r1 = CPApplication.isa.objj_msgSend0(CPApplication, "sharedApplication")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setThemeBlend:", aThemeBlend));
    CPTheme.isa.objj_msgSend1(CPTheme, "setDefaultTheme:", CPTheme.isa.objj_msgSend1(CPTheme, "themeNamed:", CPApplication.isa.objj_msgSend0(CPApplication, "defaultThemeName")));
    self.isa.objj_msgSend0(self, "performActions");
    var ___r1;
}
,["void","CPThemeBlend"]), new objj_method(sel_getUid("loadMainCibFile"), function $_CPAppBootstrapper__loadMainCibFile(self, _cmd)
{
    var mainBundle = CPBundle.isa.objj_msgSend0(CPBundle, "mainBundle"),
        mainCibFile = (mainBundle == null ? null : mainBundle.isa.objj_msgSend1(mainBundle, "objectForInfoDictionaryKey:", CPMainCibFile)) || (mainBundle == null ? null : mainBundle.isa.objj_msgSend1(mainBundle, "objectForInfoDictionaryKey:", CPMainCibFileHumanFriendly));
    if (mainCibFile)
    {
        (mainBundle == null ? null : mainBundle.isa.objj_msgSend3(mainBundle, "loadCibFile:externalNameTable:loadDelegate:", mainCibFile, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPApp, CPCibOwner), self));
        return YES;
    }
    else
        self.isa.objj_msgSend0(self, "loadCiblessBrowserMainMenu");
    return NO;
}
,["BOOL"]), new objj_method(sel_getUid("loadCiblessBrowserMainMenu"), function $_CPAppBootstrapper__loadCiblessBrowserMainMenu(self, _cmd)
{
    var mainMenu = ((___r1 = CPMenu.isa.objj_msgSend0(CPMenu, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTitle:", "MainMenu"));
    (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "setAutoenablesItems:", NO));
    var newMenuItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "New", sel_getUid("newDocument:"), "n"));
    (newMenuItem == null ? null : newMenuItem.isa.objj_msgSend1(newMenuItem, "setImage:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-general-icon-new", _CPMenuView))));
    (newMenuItem == null ? null : newMenuItem.isa.objj_msgSend1(newMenuItem, "setAlternateImage:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "valueForAttributeWithName:inState:forClass:", "menu-general-icon-new", CPThemeStateHighlighted, _CPMenuView))));
    (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "addItem:", newMenuItem));
    var openMenuItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Open", sel_getUid("openDocument:"), "o"));
    (openMenuItem == null ? null : openMenuItem.isa.objj_msgSend1(openMenuItem, "setImage:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-general-icon-open", _CPMenuView))));
    (openMenuItem == null ? null : openMenuItem.isa.objj_msgSend1(openMenuItem, "setAlternateImage:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "valueForAttributeWithName:inState:forClass:", "menu-general-icon-open", CPThemeStateHighlighted, _CPMenuView))));
    (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "addItem:", openMenuItem));
    var saveMenu = ((___r1 = CPMenu.isa.objj_msgSend0(CPMenu, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTitle:", "Save")),
        saveMenuItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Save", sel_getUid("saveDocument:"), nil));
    (saveMenuItem == null ? null : saveMenuItem.isa.objj_msgSend1(saveMenuItem, "setImage:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "valueForAttributeWithName:forClass:", "menu-general-icon-save", _CPMenuView))));
    (saveMenuItem == null ? null : saveMenuItem.isa.objj_msgSend1(saveMenuItem, "setAlternateImage:", ((___r1 = CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "valueForAttributeWithName:inState:forClass:", "menu-general-icon-save", CPThemeStateHighlighted, _CPMenuView))));
    (saveMenu == null ? null : saveMenu.isa.objj_msgSend1(saveMenu, "addItem:", ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Save", sel_getUid("saveDocument:"), "s"))));
    (saveMenu == null ? null : saveMenu.isa.objj_msgSend1(saveMenu, "addItem:", ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Save As", sel_getUid("saveDocumentAs:"), nil))));
    (saveMenuItem == null ? null : saveMenuItem.isa.objj_msgSend1(saveMenuItem, "setSubmenu:", saveMenu));
    (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "addItem:", saveMenuItem));
    var editMenuItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Edit", nil, nil)),
        editMenu = ((___r1 = CPMenu.isa.objj_msgSend0(CPMenu, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTitle:", "Edit")),
        undoMenuItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Undo", sel_getUid("undo:"), CPUndoKeyEquivalent)),
        redoMenuItem = ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Redo", sel_getUid("redo:"), CPRedoKeyEquivalent));
    (undoMenuItem == null ? null : undoMenuItem.isa.objj_msgSend1(undoMenuItem, "setKeyEquivalentModifierMask:", CPUndoKeyEquivalentModifierMask));
    (redoMenuItem == null ? null : redoMenuItem.isa.objj_msgSend1(redoMenuItem, "setKeyEquivalentModifierMask:", CPRedoKeyEquivalentModifierMask));
    (editMenu == null ? null : editMenu.isa.objj_msgSend1(editMenu, "addItem:", undoMenuItem));
    (editMenu == null ? null : editMenu.isa.objj_msgSend1(editMenu, "addItem:", redoMenuItem));
    (editMenu == null ? null : editMenu.isa.objj_msgSend1(editMenu, "addItem:", ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Cut", sel_getUid("cut:"), "x"))));
    (editMenu == null ? null : editMenu.isa.objj_msgSend1(editMenu, "addItem:", ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Copy", sel_getUid("copy:"), "c"))));
    (editMenu == null ? null : editMenu.isa.objj_msgSend1(editMenu, "addItem:", ((___r1 = CPMenuItem.isa.objj_msgSend0(CPMenuItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "initWithTitle:action:keyEquivalent:", "Paste", sel_getUid("paste:"), "v"))));
    (editMenuItem == null ? null : editMenuItem.isa.objj_msgSend1(editMenuItem, "setSubmenu:", editMenu));
    (editMenuItem == null ? null : editMenuItem.isa.objj_msgSend1(editMenuItem, "setHidden:", YES));
    (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "addItem:", editMenuItem));
    (mainMenu == null ? null : mainMenu.isa.objj_msgSend1(mainMenu, "addItem:", CPMenuItem.isa.objj_msgSend0(CPMenuItem, "separatorItem")));
    (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "setMainMenu:", mainMenu));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("cibDidFinishLoading:"), function $_CPAppBootstrapper__cibDidFinishLoading_(self, _cmd, aCib)
{
    self.isa.objj_msgSend0(self, "performActions");
}
,["void","CPCib"]), new objj_method(sel_getUid("cibDidFailToLoad:"), function $_CPAppBootstrapper__cibDidFailToLoad_(self, _cmd, aCib)
{
    throw new Error("Could not load main cib file. Did you forget to nib2cib it?");
}
,["void","CPCib"]), new objj_method(sel_getUid("reset"), function $_CPAppBootstrapper__reset(self, _cmd)
{
    _CPAppBootstrapperActions = nil;
}
,["void"])]);
}{
var the_class = objj_getClass("CPEvent")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPEvent\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("modifierFlags"), function $CPEvent__modifierFlags(self, _cmd)
{
    return CPEventModifierFlags;
}
,["unsigned"])]);
}