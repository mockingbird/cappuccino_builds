@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;10;CPButton.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;13;CPImageView.ji;9;CPPanel.ji;8;CPText.ji;13;CPTextField.jt;31856;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPButton.j", YES);objj_executeFile("CPColor.j", YES);objj_executeFile("CPFont.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPPanel.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPTextField.j", YES);var CPAlertDelegate_alertShowHelp_ = 1 << 0,
    CPAlertDelegate_alertDidEnd_returnCode_ = 1 << 1;
CPWarningAlertStyle = 0;
CPInformationalAlertStyle = 1;
CPCriticalAlertStyle = 2;
var bottomHeight = 71;
{var the_protocol = objj_allocateProtocol("CPAlertDelegate");
var aProtocol = objj_getProtocol("CPObject");
if (!aProtocol) throw new SyntaxError("*** Could not find definition for protocol \"CPAlertDelegate\"");
protocol_addProtocol(the_protocol, aProtocol);
objj_registerProtocol(the_protocol);
}{var the_class = objj_allocateClassPair(CPObject, "CPAlert"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_showHelp"), new objj_ivar("_showSuppressionButton"), new objj_ivar("_alertStyle"), new objj_ivar("_title"), new objj_ivar("_accessoryView"), new objj_ivar("_icon"), new objj_ivar("_buttons"), new objj_ivar("_suppressionButton"), new objj_ivar("_delegate"), new objj_ivar("_modalDelegate"), new objj_ivar("_didEndSelector"), new objj_ivar("_didEndBlock"), new objj_ivar("_implementedDelegateMethods"), new objj_ivar("_themeView"), new objj_ivar("_window"), new objj_ivar("_defaultWindowStyle"), new objj_ivar("_alertImageView"), new objj_ivar("_informativeLabel"), new objj_ivar("_messageLabel"), new objj_ivar("_alertHelpButton"), new objj_ivar("_needsLayout")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("showsHelp"), function $CPAlert__showsHelp(self, _cmd)
{
    return self._showHelp;
}
,["BOOL"]), new objj_method(sel_getUid("setShowsHelp:"), function $CPAlert__setShowsHelp_(self, _cmd, newValue)
{
    self._showHelp = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("showsSuppressionButton"), function $CPAlert__showsSuppressionButton(self, _cmd)
{
    return self._showSuppressionButton;
}
,["BOOL"]), new objj_method(sel_getUid("setShowsSuppressionButton:"), function $CPAlert__setShowsSuppressionButton_(self, _cmd, newValue)
{
    self._showSuppressionButton = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("alertStyle"), function $CPAlert__alertStyle(self, _cmd)
{
    return self._alertStyle;
}
,["CPAlertStyle"]), new objj_method(sel_getUid("setAlertStyle:"), function $CPAlert__setAlertStyle_(self, _cmd, newValue)
{
    self._alertStyle = newValue;
}
,["void","CPAlertStyle"]), new objj_method(sel_getUid("title"), function $CPAlert__title(self, _cmd)
{
    return self._title;
}
,["CPString"]), new objj_method(sel_getUid("setTitle:"), function $CPAlert__setTitle_(self, _cmd, newValue)
{
    self._title = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("accessoryView"), function $CPAlert__accessoryView(self, _cmd)
{
    return self._accessoryView;
}
,["CPView"]), new objj_method(sel_getUid("setAccessoryView:"), function $CPAlert__setAccessoryView_(self, _cmd, newValue)
{
    self._accessoryView = newValue;
}
,["void","CPView"]), new objj_method(sel_getUid("icon"), function $CPAlert__icon(self, _cmd)
{
    return self._icon;
}
,["CPImage"]), new objj_method(sel_getUid("setIcon:"), function $CPAlert__setIcon_(self, _cmd, newValue)
{
    self._icon = newValue;
}
,["void","CPImage"]), new objj_method(sel_getUid("buttons"), function $CPAlert__buttons(self, _cmd)
{
    return self._buttons;
}
,["CPArray"]), new objj_method(sel_getUid("suppressionButton"), function $CPAlert__suppressionButton(self, _cmd)
{
    return self._suppressionButton;
}
,["CPCheckBox"]), new objj_method(sel_getUid("delegate"), function $CPAlert__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPAlert__setDelegate_(self, _cmd, newValue)
{
    self._delegate = newValue;
}
,["void","id"]), new objj_method(sel_getUid("didEndSelector"), function $CPAlert__didEndSelector(self, _cmd)
{
    return self._didEndSelector;
}
,["SEL"]), new objj_method(sel_getUid("setDidEndSelector:"), function $CPAlert__setDidEndSelector_(self, _cmd, newValue)
{
    self._didEndSelector = newValue;
}
,["void","SEL"]), new objj_method(sel_getUid("themeView"), function $CPAlert__themeView(self, _cmd)
{
    return self._themeView;
}
,["_CPAlertThemeView"]), new objj_method(sel_getUid("window"), function $CPAlert__window(self, _cmd)
{
    return self._window;
}
,["CPWindow"]), new objj_method(sel_getUid("init"), function $CPAlert__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAlert").super_class }, "init");
    if (self)
    {
        self._buttons = [];
        self._alertStyle = CPWarningAlertStyle;
        self._showHelp = NO;
        self._needsLayout = YES;
        self._defaultWindowStyle = _CPModalWindowMask;
        self._themeView = objj_msgSend(_CPAlertThemeView, "new");
        self._messageLabel = objj_msgSend(CPTextField, "labelWithTitle:", "Alert");
        self._alertImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "init");
        self._informativeLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "init");
        self._suppressionButton = objj_msgSend(CPCheckBox, "checkBoxWithTitle:", "Do not show this message again");
        self._alertHelpButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 16.0, 16.0));
        objj_msgSend(self._alertHelpButton, "setTarget:", self);
        objj_msgSend(self._alertHelpButton, "setAction:", sel_getUid("_showHelp:"));
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPAlert__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("alertShowHelp:")))
        self._implementedDelegateMethods |= CPAlertDelegate_alertShowHelp_;
    if (objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("alertDidEnd:returnCode:")))
        self._implementedDelegateMethods |= CPAlertDelegate_alertDidEnd_returnCode_;
}
,["void","id"]), new objj_method(sel_getUid("theme"), function $CPAlert__theme(self, _cmd)
{
    return objj_msgSend(self._themeView, "theme");
}
,["CPTheme"]), new objj_method(sel_getUid("setTheme:"), function $CPAlert__setTheme_(self, _cmd, aTheme)
{
    if (aTheme === objj_msgSend(self, "theme"))
        return;
    if (aTheme === objj_msgSend(CPTheme, "defaultHudTheme"))
        self._defaultWindowStyle = CPTitledWindowMask | CPHUDBackgroundWindowMask;
    else
        self._defaultWindowStyle = CPTitledWindowMask;
    self._window = nil;
    self._needsLayout = YES;
    objj_msgSend(self._themeView, "setTheme:", aTheme);
}
,["void","CPTheme"]), new objj_method(sel_getUid("setValue:forThemeAttribute:"), function $CPAlert__setValue_forThemeAttribute_(self, _cmd, aValue, aName)
{
    objj_msgSend(self._themeView, "setValue:forThemeAttribute:", aValue, aName);
}
,["void","id","CPString"]), new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"), function $CPAlert__setValue_forThemeAttribute_inState_(self, _cmd, aValue, aName, aState)
{
    objj_msgSend(self._themeView, "setValue:forThemeAttribute:inState:", aValue, aName, aState);
}
,["void","id","CPString","CPThemeState"]), new objj_method(sel_getUid("setWindowStyle:"), function $CPAlert__setWindowStyle_(self, _cmd, style)
{
    CPLog.warn("DEPRECATED: setWindowStyle: is deprecated. use setTheme: instead");
    objj_msgSend(self, "setTheme:", style === CPHUDBackgroundWindowMask ? objj_msgSend(CPTheme, "defaultHudTheme") : objj_msgSend(CPTheme, "defaultTheme"));
}
,["void","int"]), new objj_method(sel_getUid("windowStyle"), function $CPAlert__windowStyle(self, _cmd)
{
    CPLog.warn("DEPRECATED: windowStyle: is deprecated. use theme instead");
    return self._defaultWindowStyle;
}
,["int"]), new objj_method(sel_getUid("setMessageText:"), function $CPAlert__setMessageText_(self, _cmd, text)
{
    objj_msgSend(self._messageLabel, "setStringValue:", text);
    self._needsLayout = YES;
}
,["void","CPString"]), new objj_method(sel_getUid("messageText"), function $CPAlert__messageText(self, _cmd)
{
    return objj_msgSend(self._messageLabel, "stringValue");
}
,["CPString"]), new objj_method(sel_getUid("setInformativeText:"), function $CPAlert__setInformativeText_(self, _cmd, text)
{
    objj_msgSend(self._informativeLabel, "setStringValue:", text);
    self._needsLayout = YES;
}
,["void","CPString"]), new objj_method(sel_getUid("informativeText"), function $CPAlert__informativeText(self, _cmd)
{
    return objj_msgSend(self._informativeLabel, "stringValue");
}
,["CPString"]), new objj_method(sel_getUid("setTitle:"), function $CPAlert__setTitle_(self, _cmd, aTitle)
{
    self._title = aTitle;
    objj_msgSend(self._window, "setTitle:", aTitle);
}
,["void","CPString"]), new objj_method(sel_getUid("setAccessoryView:"), function $CPAlert__setAccessoryView_(self, _cmd, aView)
{
    self._accessoryView = aView;
    self._needsLayout = YES;
}
,["void","CPView"]), new objj_method(sel_getUid("setShowsSuppressionButton:"), function $CPAlert__setShowsSuppressionButton_(self, _cmd, shouldShowSuppressionButton)
{
    self._showSuppressionButton = shouldShowSuppressionButton;
    self._needsLayout = YES;
}
,["void","BOOL"]), new objj_method(sel_getUid("addButtonWithTitle:"), function $CPAlert__addButtonWithTitle_(self, _cmd, aTitle)
{
    var bounds = objj_msgSend(objj_msgSend(self._window, "contentView"), "bounds"),
        count = objj_msgSend(self._buttons, "count"),
        button = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(button, "setTitle:", aTitle);
    objj_msgSend(button, "setTag:", count);
    objj_msgSend(button, "setTarget:", self);
    objj_msgSend(button, "setAction:", sel_getUid("_takeReturnCodeFrom:"));
    objj_msgSend(objj_msgSend(self._window, "contentView"), "addSubview:", button);
    if (count == 0)
        objj_msgSend(button, "setKeyEquivalent:", CPCarriageReturnCharacter);
    else if (objj_msgSend(aTitle, "lowercaseString") === "cancel")
        objj_msgSend(button, "setKeyEquivalent:", CPEscapeFunctionKey);
    objj_msgSend(self._buttons, "insertObject:atIndex:", button, 0);
}
,["void","CPString"]), new objj_method(sel_getUid("_layoutMessageView"), function $CPAlert___layoutMessageView(self, _cmd)
{
    var inset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "content-inset"),
        sizeWithFontCorrection = 6.0,
        messageLabelWidth,
        messageLabelTextSize;
    objj_msgSend(self._messageLabel, "setTextColor:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "message-text-color"));
    objj_msgSend(self._messageLabel, "setFont:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "message-text-font"));
    objj_msgSend(self._messageLabel, "setTextShadowColor:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "message-text-shadow-color"));
    objj_msgSend(self._messageLabel, "setTextShadowOffset:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "message-text-shadow-offset"));
    objj_msgSend(self._messageLabel, "setAlignment:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "message-text-alignment"));
    objj_msgSend(self._messageLabel, "setLineBreakMode:", CPLineBreakByWordWrapping);
    messageLabelWidth = CGRectGetWidth(objj_msgSend(objj_msgSend(self._window, "contentView"), "frame")) - inset.left - inset.right;
    messageLabelTextSize = objj_msgSend(objj_msgSend(self._messageLabel, "stringValue"), "sizeWithFont:inWidth:", objj_msgSend(self._messageLabel, "font"), messageLabelWidth);
    objj_msgSend(self._messageLabel, "setFrame:", CGRectMake(inset.left, inset.top, messageLabelTextSize.width, messageLabelTextSize.height + sizeWithFontCorrection));
}
,["void"]), new objj_method(sel_getUid("_layoutInformativeView"), function $CPAlert___layoutInformativeView(self, _cmd)
{
    var inset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "content-inset"),
        defaultElementsMargin = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "default-elements-margin"),
        sizeWithFontCorrection = 6.0,
        informativeLabelWidth,
        informativeLabelOriginY,
        informativeLabelTextSize;
    objj_msgSend(self._informativeLabel, "setTextColor:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "informative-text-color"));
    objj_msgSend(self._informativeLabel, "setFont:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "informative-text-font"));
    objj_msgSend(self._informativeLabel, "setTextShadowColor:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "informative-text-shadow-color"));
    objj_msgSend(self._informativeLabel, "setTextShadowOffset:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "informative-text-shadow-offset"));
    objj_msgSend(self._informativeLabel, "setAlignment:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "informative-text-alignment"));
    objj_msgSend(self._informativeLabel, "setLineBreakMode:", CPLineBreakByWordWrapping);
    informativeLabelWidth = CGRectGetWidth(objj_msgSend(objj_msgSend(self._window, "contentView"), "frame")) - inset.left - inset.right;
    informativeLabelOriginY = objj_msgSend(self._messageLabel, "frameOrigin").y + objj_msgSend(self._messageLabel, "frameSize").height + defaultElementsMargin;
    informativeLabelTextSize = objj_msgSend(objj_msgSend(self._informativeLabel, "stringValue"), "sizeWithFont:inWidth:", objj_msgSend(self._informativeLabel, "font"), informativeLabelWidth);
    objj_msgSend(self._informativeLabel, "setFrame:", CGRectMake(inset.left, informativeLabelOriginY, informativeLabelTextSize.width, informativeLabelTextSize.height + sizeWithFontCorrection));
}
,["void"]), new objj_method(sel_getUid("_layoutAccessoryView"), function $CPAlert___layoutAccessoryView(self, _cmd)
{
    if (!self._accessoryView)
        return;
    var inset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "content-inset"),
        defaultElementsMargin = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "default-elements-margin"),
        accessoryViewWidth = CGRectGetWidth(objj_msgSend(objj_msgSend(self._window, "contentView"), "frame")) - inset.left - inset.right,
        accessoryViewOriginY = CGRectGetMaxY(objj_msgSend(self._informativeLabel, "frame")) + defaultElementsMargin;
    objj_msgSend(self._accessoryView, "setFrameOrigin:", CGPointMake(inset.left, accessoryViewOriginY));
    objj_msgSend(objj_msgSend(self._window, "contentView"), "addSubview:", self._accessoryView);
}
,["void"]), new objj_method(sel_getUid("_layoutSuppressionButton"), function $CPAlert___layoutSuppressionButton(self, _cmd)
{
    if (!self._showSuppressionButton)
        return;
    var inset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "content-inset"),
        suppressionViewXOffset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "suppression-button-x-offset"),
        suppressionViewYOffset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "suppression-button-y-offset"),
        defaultElementsMargin = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "default-elements-margin"),
        suppressionButtonViewOriginY = CGRectGetMaxY(objj_msgSend(self._accessoryView || self._informativeLabel, "frame")) + defaultElementsMargin + suppressionViewYOffset;
    objj_msgSend(self._suppressionButton, "setTextColor:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "suppression-button-text-color"));
    objj_msgSend(self._suppressionButton, "setFont:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "suppression-button-text-font"));
    objj_msgSend(self._suppressionButton, "setTextShadowColor:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "suppression-button-text-shadow-color"));
    objj_msgSend(self._suppressionButton, "setTextShadowOffset:", objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "suppression-button-text-shadow-offset"));
    objj_msgSend(self._suppressionButton, "sizeToFit");
    objj_msgSend(self._suppressionButton, "setFrameOrigin:", CGPointMake(inset.left + suppressionViewXOffset, suppressionButtonViewOriginY));
    objj_msgSend(objj_msgSend(self._window, "contentView"), "addSubview:", self._suppressionButton);
}
,["void"]), new objj_method(sel_getUid("_layoutButtonsFromView:"), function $CPAlert___layoutButtonsFromView_(self, _cmd, lastView)
{
    var inset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "content-inset"),
        minimumSize = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "size"),
        buttonOffset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "button-offset"),
        helpLeftOffset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "help-image-left-offset"),
        aRepresentativeButton = objj_msgSend(self._buttons, "objectAtIndex:", 0),
        defaultElementsMargin = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "default-elements-margin"),
        panelSize = objj_msgSend(objj_msgSend(self._window, "contentView"), "frame").size,
        buttonsOriginY,
        buttonMarginY,
        buttonMarginX,
        theme = objj_msgSend(self, "theme"),
        offsetX;
    objj_msgSend(aRepresentativeButton, "setTheme:", objj_msgSend(self, "theme"));
    objj_msgSend(aRepresentativeButton, "sizeToFit");
    panelSize.height = CGRectGetMaxY(objj_msgSend(lastView, "frame")) + defaultElementsMargin + objj_msgSend(aRepresentativeButton, "frameSize").height;
    if (panelSize.height < minimumSize.height)
        panelSize.height = minimumSize.height;
    buttonsOriginY = panelSize.height - objj_msgSend(aRepresentativeButton, "frameSize").height + buttonOffset;
    offsetX = panelSize.width - inset.right;
    switch(objj_msgSend(self._window, "styleMask")) {
    case _CPModalWindowMask:
        buttonMarginY = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "modal-window-button-margin-y");
        buttonMarginX = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "modal-window-button-margin-x");
        break;
default:
        buttonMarginY = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "standard-window-button-margin-y");
        buttonMarginX = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "standard-window-button-margin-x");
        break;
    }
    for (var i = objj_msgSend(self._buttons, "count") - 1; i >= 0; i--)
    {
        var button = self._buttons[i];
        objj_msgSend(button, "setTheme:", objj_msgSend(self, "theme"));
        objj_msgSend(button, "sizeToFit");
        var buttonFrame = objj_msgSend(button, "frame"),
            width = MAX(80.0, CGRectGetWidth(buttonFrame)),
            height = CGRectGetHeight(buttonFrame);
        offsetX -= width;
        objj_msgSend(button, "setFrame:", CGRectMake(offsetX + buttonMarginX, buttonsOriginY + buttonMarginY, width, height));
        offsetX -= 10;
    }
    if (self._showHelp)
    {
        var helpImage = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "help-image"),
            helpImagePressed = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "help-image-pressed"),
            helpImageSize = helpImage ? objj_msgSend(helpImage, "size") : CGSizeMakeZero(),
            helpFrame = CGRectMake(helpLeftOffset, buttonsOriginY, helpImageSize.width, helpImageSize.height);
        objj_msgSend(self._alertHelpButton, "setImage:", helpImage);
        objj_msgSend(self._alertHelpButton, "setAlternateImage:", helpImagePressed);
        objj_msgSend(self._alertHelpButton, "setBordered:", NO);
        objj_msgSend(self._alertHelpButton, "setFrame:", helpFrame);
    }
    panelSize.height += objj_msgSend(aRepresentativeButton, "frameSize").height + inset.bottom + buttonOffset;
    return panelSize;
}
,["CGSize","CPView"]), new objj_method(sel_getUid("layout"), function $CPAlert__layout(self, _cmd)
{
    if (!self._needsLayout)
        return;
    if (!self._window)
        objj_msgSend(self, "_createWindowWithStyle:", nil);
    var iconOffset = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "image-offset"),
        theImage = self._icon,
        finalSize;
    if (!theImage)
        switch(self._alertStyle) {
        case CPWarningAlertStyle:
            theImage = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "warning-image");
            break;
        case CPInformationalAlertStyle:
            theImage = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "information-image");
            break;
        case CPCriticalAlertStyle:
            theImage = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "error-image");
            break;
        }
    objj_msgSend(self._alertImageView, "setImage:", theImage);
    var imageSize = theImage ? objj_msgSend(theImage, "size") : CGSizeMakeZero();
    objj_msgSend(self._alertImageView, "setFrame:", CGRectMake(iconOffset.x, iconOffset.y, imageSize.width, imageSize.height));
    objj_msgSend(self, "_layoutMessageView");
    objj_msgSend(self, "_layoutInformativeView");
    objj_msgSend(self, "_layoutAccessoryView");
    objj_msgSend(self, "_layoutSuppressionButton");
    var lastView = self._informativeLabel;
    if (self._showSuppressionButton)
        lastView = self._suppressionButton;
    else if (self._accessoryView)
        lastView = self._accessoryView;
    finalSize = objj_msgSend(self, "_layoutButtonsFromView:", lastView);
    if (objj_msgSend(self._window, "styleMask") & CPDocModalWindowMask)
        finalSize.height -= 26;
    objj_msgSend(self._window, "setFrameSize:", finalSize);
    objj_msgSend(self._window, "center");
    if (objj_msgSend(self._window, "styleMask") & _CPModalWindowMask || objj_msgSend(self._window, "styleMask") & CPHUDBackgroundWindowMask)
    {
        objj_msgSend(self._window, "setMovable:", YES);
        objj_msgSend(self._window, "setMovableByWindowBackground:", YES);
    }
    self._needsLayout = NO;
}
,["void"]), new objj_method(sel_getUid("runModal"), function $CPAlert__runModal(self, _cmd)
{
    if (!(objj_msgSend(self._window, "styleMask") & self._defaultWindowStyle))
    {
        self._needsLayout = YES;
        objj_msgSend(self, "_createWindowWithStyle:", self._defaultWindowStyle);
    }
    objj_msgSend(self, "layout");
    objj_msgSend(CPApp, "runModalForWindow:", self._window);
}
,["void"]), new objj_method(sel_getUid("runModalWithDidEndBlock:"), function $CPAlert__runModalWithDidEndBlock_(self, _cmd, block)
{
    self._didEndBlock = block;
    objj_msgSend(self, "runModal");
}
,["void","Function"]), new objj_method(sel_getUid("beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:"), function $CPAlert__beginSheetModalForWindow_modalDelegate_didEndSelector_contextInfo_(self, _cmd, aWindow, modalDelegate, alertDidEndSelector, contextInfo)
{
    if (!(objj_msgSend(self._window, "styleMask") & CPDocModalWindowMask))
    {
        self._needsLayout = YES;
        objj_msgSend(self, "_createWindowWithStyle:", CPDocModalWindowMask);
    }
    objj_msgSend(self, "layout");
    self._modalDelegate = modalDelegate;
    self._didEndSelector = alertDidEndSelector;
    objj_msgSend(CPApp, "beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:", self._window, aWindow, self, sel_getUid("_alertDidEnd:returnCode:contextInfo:"), contextInfo);
}
,["void","CPWindow","id","SEL","id"]), new objj_method(sel_getUid("beginSheetModalForWindow:"), function $CPAlert__beginSheetModalForWindow_(self, _cmd, aWindow)
{
    objj_msgSend(self, "beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:", aWindow, nil, nil, nil);
}
,["void","CPWindow"]), new objj_method(sel_getUid("beginSheetModalForWindow:didEndBlock:"), function $CPAlert__beginSheetModalForWindow_didEndBlock_(self, _cmd, aWindow, block)
{
    self._didEndBlock = block;
    objj_msgSend(self, "beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:", aWindow, nil, nil, nil);
}
,["void","CPWindow","Function"]), new objj_method(sel_getUid("_createWindowWithStyle:"), function $CPAlert___createWindowWithStyle_(self, _cmd, forceStyle)
{
    var frame = CGRectMakeZero();
    frame.size = objj_msgSend(self._themeView, "currentValueForThemeAttribute:", "size");
    self._window = objj_msgSend(objj_msgSend(CPPanel, "alloc"), "initWithContentRect:styleMask:", frame, forceStyle || self._defaultWindowStyle);
    objj_msgSend(self._window, "setLevel:", CPStatusWindowLevel);
    objj_msgSend(self._window, "setPlatformWindow:", objj_msgSend(objj_msgSend(CPApp, "keyWindow"), "platformWindow"));
    if (self._title)
        objj_msgSend(self._window, "setTitle:", self._title);
    var contentView = objj_msgSend(self._window, "contentView"),
        count = objj_msgSend(self._buttons, "count");
    if (count)
        while (count--)
            objj_msgSend(contentView, "addSubview:", self._buttons[count]);
    else
        objj_msgSend(self, "addButtonWithTitle:", "OK");
    objj_msgSend(contentView, "addSubview:", self._messageLabel);
    objj_msgSend(contentView, "addSubview:", self._alertImageView);
    objj_msgSend(contentView, "addSubview:", self._informativeLabel);
    if (self._showHelp)
        objj_msgSend(contentView, "addSubview:", self._alertHelpButton);
}
,["void","int"]), new objj_method(sel_getUid("_showHelp:"), function $CPAlert___showHelp_(self, _cmd, aSender)
{
    objj_msgSend(self, "_sendDelegateAlertShowHelp");
}
,["void","id"]), new objj_method(sel_getUid("_takeReturnCodeFrom:"), function $CPAlert___takeReturnCodeFrom_(self, _cmd, aSender)
{
    if (objj_msgSend(self._window, "isSheet"))
    {
        objj_msgSend(self._window, "orderOut:", nil);
        objj_msgSend(CPApp, "endSheet:returnCode:", self._window, objj_msgSend(aSender, "tag"));
    }
    else
    {
        objj_msgSend(CPApp, "abortModal");
        objj_msgSend(self._window, "close");
        objj_msgSend(self, "_alertDidEnd:returnCode:contextInfo:", self._window, objj_msgSend(aSender, "tag"), nil);
    }
}
,["void","id"]), new objj_method(sel_getUid("_alertDidEnd:returnCode:contextInfo:"), function $CPAlert___alertDidEnd_returnCode_contextInfo_(self, _cmd, aWindow, returnCode, contextInfo)
{
    if (self._didEndBlock)
    {
        if (typeof self._didEndBlock === "function")
            self._didEndBlock(self, returnCode);
        else
            CPLog.warn("%s: didEnd block is not a function", objj_msgSend(self, "description"));
        self._didEndBlock = nil;
    }
    else if (self._modalDelegate)
    {
        if (self._didEndSelector)
            objj_msgSend(self._modalDelegate, self._didEndSelector, self, returnCode, contextInfo);
    }
    else if (self._delegate)
    {
        if (self._didEndSelector)
            objj_msgSend(self._delegate, self._didEndSelector, self, returnCode);
        else
            objj_msgSend(self, "_sendDelegateAlertDidEndReturnCode:", returnCode);
    }
}
,["void","CPWindow","int","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alertWithMessageText:defaultButton:alternateButton:otherButton:informativeTextWithFormat:"), function $CPAlert__alertWithMessageText_defaultButton_alternateButton_otherButton_informativeTextWithFormat_(self, _cmd, aMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, informativeText)
{
    var newAlert = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    objj_msgSend(newAlert, "setMessageText:", aMessage);
    objj_msgSend(newAlert, "addButtonWithTitle:", defaultButtonTitle);
    if (alternateButtonTitle)
        objj_msgSend(newAlert, "addButtonWithTitle:", alternateButtonTitle);
    if (otherButtonTitle)
        objj_msgSend(newAlert, "addButtonWithTitle:", otherButtonTitle);
    if (informativeText)
        objj_msgSend(newAlert, "setInformativeText:", informativeText);
    return newAlert;
}
,["CPAlert","CPString","CPString","CPString","CPString","CPString"]), new objj_method(sel_getUid("alertWithError:"), function $CPAlert__alertWithError_(self, _cmd, anErrorMessage)
{
    var newAlert = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    objj_msgSend(newAlert, "setMessageText:", anErrorMessage);
    objj_msgSend(newAlert, "setAlertStyle:", CPCriticalAlertStyle);
    return newAlert;
}
,["CPAlert","CPString"])]);
}{
var the_class = objj_getClass("CPAlert")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPAlert\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_sendDelegateAlertDidEndReturnCode:"), function $CPAlert___sendDelegateAlertDidEndReturnCode_(self, _cmd, returnCode)
{
    if (!(self._implementedDelegateMethods & CPAlertDelegate_alertDidEnd_returnCode_))
        return;
    objj_msgSend(self._delegate, "alertDidEnd:returnCode:", self, returnCode);
}
,["void","int"]), new objj_method(sel_getUid("_sendDelegateAlertShowHelp"), function $CPAlert___sendDelegateAlertShowHelp(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPAlertDelegate_alertShowHelp_))
        return YES;
    return objj_msgSend(self._delegate, "alertShowHelp:", self);
}
,["BOOL"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPAlertThemeView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPAlertThemeView__defaultThemeClass(self, _cmd)
{
    return "alert";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPAlertThemeView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGSizeMake(400.0, 110.0), "size", CGInsetMake(15, 15, 15, 50), "content-inset", 6, "informative-offset", 10, "button-offset", CPJustifiedTextAlignment, "message-text-alignment", objj_msgSend(CPColor, "blackColor"), "message-text-color", objj_msgSend(CPFont, "boldSystemFontOfSize:", 13.0), "message-text-font", objj_msgSend(CPNull, "null"), "message-text-shadow-color", CGSizeMakeZero(), "message-text-shadow-offset", CPJustifiedTextAlignment, "informative-text-alignment", objj_msgSend(CPColor, "blackColor"), "informative-text-color", objj_msgSend(CPFont, "systemFontOfSize:", 12.0), "informative-text-font", objj_msgSend(CPNull, "null"), "informative-text-shadow-color", CGSizeMakeZero(), "informative-text-shadow-offset", CGPointMake(15, 12), "image-offset", objj_msgSend(CPNull, "null"), "information-image", objj_msgSend(CPNull, "null"), "warning-image", objj_msgSend(CPNull, "null"), "error-image", objj_msgSend(CPNull, "null"), "help-image", 15, "help-image-left-offset", objj_msgSend(CPNull, "null"), "help-image-pressed", 0.0, "suppression-button-y-offset", 0.0, "suppression-button-x-offset", 3.0, "default-elements-margin", objj_msgSend(CPColor, "blackColor"), "suppression-button-text-color", objj_msgSend(CPFont, "systemFontOfSize:", 12.0), "suppression-button-text-font", objj_msgSend(CPNull, "null"), "suppression-button-text-shadow-color", 0.0, "suppression-button-text-shadow-offset", 0.0, "modal-window-button-margin-y", 0.0, "modal-window-button-margin-x", 0.0, "standard-window-button-margin-y", 0.0, "standard-window-button-margin-x");
}
,["CPDictionary"])]);
}