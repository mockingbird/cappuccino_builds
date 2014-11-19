@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;10;CPButton.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;13;CPImageView.ji;9;CPPanel.ji;8;CPText.ji;13;CPTextField.jt;41889;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("CPButton.j", YES);objj_executeFile("CPColor.j", YES);objj_executeFile("CPFont.j", YES);objj_executeFile("CPImage.j", YES);objj_executeFile("CPImageView.j", YES);objj_executeFile("CPPanel.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPTextField.j", YES);var CPAlertDelegate_alertShowHelp_ = 1 << 0,
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
        self._themeView = (_CPAlertThemeView == null ? null : _CPAlertThemeView.isa.objj_msgSend0(_CPAlertThemeView, "new"));
        self._messageLabel = CPTextField.isa.objj_msgSend1(CPTextField, "labelWithTitle:", "Alert");
        self._alertImageView = ((___r1 = CPImageView.isa.objj_msgSend0(CPImageView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        self._informativeLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
        self._suppressionButton = (CPCheckBox == null ? null : CPCheckBox.isa.objj_msgSend1(CPCheckBox, "checkBoxWithTitle:", "Do not show this message again"));
        self._alertHelpButton = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0.0, 0.0, 16.0, 16.0)));
        ((___r1 = self._alertHelpButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
        ((___r1 = self._alertHelpButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("_showHelp:")));
    }
    return self;
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPAlert__setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate === aDelegate)
        return;
    self._delegate = aDelegate;
    self._implementedDelegateMethods = 0;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("alertShowHelp:"))))
        self._implementedDelegateMethods |= CPAlertDelegate_alertShowHelp_;
    if (((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "respondsToSelector:", sel_getUid("alertDidEnd:returnCode:"))))
        self._implementedDelegateMethods |= CPAlertDelegate_alertDidEnd_returnCode_;
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("theme"), function $CPAlert__theme(self, _cmd)
{
    return ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "theme"));
    var ___r1;
}
,["CPTheme"]), new objj_method(sel_getUid("setTheme:"), function $CPAlert__setTheme_(self, _cmd, aTheme)
{
    if (aTheme === self.isa.objj_msgSend0(self, "theme"))
        return;
    if (aTheme === CPTheme.isa.objj_msgSend0(CPTheme, "defaultHudTheme"))
        self._defaultWindowStyle = CPTitledWindowMask | CPHUDBackgroundWindowMask;
    else
        self._defaultWindowStyle = CPTitledWindowMask;
    self._window = nil;
    self._needsLayout = YES;
    ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTheme:", aTheme));
    var ___r1;
}
,["void","CPTheme"]), new objj_method(sel_getUid("setValue:forThemeAttribute:"), function $CPAlert__setValue_forThemeAttribute_(self, _cmd, aValue, aName)
{
    ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setValue:forThemeAttribute:", aValue, aName));
    var ___r1;
}
,["void","id","CPString"]), new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"), function $CPAlert__setValue_forThemeAttribute_inState_(self, _cmd, aValue, aName, aState)
{
    ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:forThemeAttribute:inState:", aValue, aName, aState));
    var ___r1;
}
,["void","id","CPString","ThemeState"]), new objj_method(sel_getUid("setWindowStyle:"), function $CPAlert__setWindowStyle_(self, _cmd, style)
{
    CPLog.warn("DEPRECATED: setWindowStyle: is deprecated. use setTheme: instead");
    self.isa.objj_msgSend1(self, "setTheme:", style === CPHUDBackgroundWindowMask ? CPTheme.isa.objj_msgSend0(CPTheme, "defaultHudTheme") : CPTheme.isa.objj_msgSend0(CPTheme, "defaultTheme"));
}
,["void","int"]), new objj_method(sel_getUid("windowStyle"), function $CPAlert__windowStyle(self, _cmd)
{
    CPLog.warn("DEPRECATED: windowStyle: is deprecated. use theme instead");
    return self._defaultWindowStyle;
}
,["int"]), new objj_method(sel_getUid("setMessageText:"), function $CPAlert__setMessageText_(self, _cmd, text)
{
    ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", text));
    self._needsLayout = YES;
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("messageText"), function $CPAlert__messageText(self, _cmd)
{
    return ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stringValue"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("setInformativeText:"), function $CPAlert__setInformativeText_(self, _cmd, text)
{
    ((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", text));
    self._needsLayout = YES;
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("informativeText"), function $CPAlert__informativeText(self, _cmd)
{
    return ((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "stringValue"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("setTitle:"), function $CPAlert__setTitle_(self, _cmd, aTitle)
{
    self._title = aTitle;
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", aTitle));
    var ___r1;
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
    var bounds = ((___r1 = ((___r2 = self._window), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds")),
        count = ((___r1 = self._buttons), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")),
        button = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTitle:", aTitle));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTag:", count));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTarget:", self));
    (button == null ? null : button.isa.objj_msgSend1(button, "setAction:", sel_getUid("_takeReturnCodeFrom:")));
    ((___r1 = ((___r2 = self._window), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", button));
    if (count == 0)
        (button == null ? null : button.isa.objj_msgSend1(button, "setKeyEquivalent:", CPCarriageReturnCharacter));
    else if ((aTitle == null ? null : aTitle.isa.objj_msgSend0(aTitle, "lowercaseString")) === "cancel")
        (button == null ? null : button.isa.objj_msgSend1(button, "setKeyEquivalent:", CPEscapeFunctionKey));
    ((___r1 = self._buttons), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", button, 0));
    var ___r1, ___r2;
}
,["void","CPString"]), new objj_method(sel_getUid("_layoutMessageView"), function $CPAlert___layoutMessageView(self, _cmd)
{
    var inset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "content-inset")),
        sizeWithFontCorrection = 6.0,
        messageLabelWidth,
        messageLabelTextSize;
    ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "message-text-color"))));
    ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "message-text-font"))));
    ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "message-text-shadow-color"))));
    ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "message-text-shadow-offset"))));
    ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "message-text-alignment"))));
    ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", CPLineBreakByWordWrapping));
    messageLabelWidth = CGRectGetWidth(((___r1 = ((___r2 = self._window), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))) - inset.left - inset.right;
    messageLabelTextSize = ((___r1 = ((___r2 = self._messageLabel), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "stringValue"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "sizeWithFont:inWidth:", ((___r2 = self._messageLabel), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "font")), messageLabelWidth));
    ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(inset.left, inset.top, messageLabelTextSize.width, messageLabelTextSize.height + sizeWithFontCorrection)));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_layoutInformativeView"), function $CPAlert___layoutInformativeView(self, _cmd)
{
    var inset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "content-inset")),
        defaultElementsMargin = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "default-elements-margin")),
        sizeWithFontCorrection = 6.0,
        informativeLabelWidth,
        informativeLabelOriginY,
        informativeLabelTextSize;
    ((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "informative-text-color"))));
    ((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "informative-text-font"))));
    ((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "informative-text-shadow-color"))));
    ((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "informative-text-shadow-offset"))));
    ((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "informative-text-alignment"))));
    ((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", CPLineBreakByWordWrapping));
    informativeLabelWidth = CGRectGetWidth(((___r1 = ((___r2 = self._window), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))) - inset.left - inset.right;
    informativeLabelOriginY = ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameOrigin")).y + ((___r1 = self._messageLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frameSize")).height + defaultElementsMargin;
    informativeLabelTextSize = ((___r1 = ((___r2 = self._informativeLabel), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "stringValue"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "sizeWithFont:inWidth:", ((___r2 = self._informativeLabel), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "font")), informativeLabelWidth));
    ((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(inset.left, informativeLabelOriginY, informativeLabelTextSize.width, informativeLabelTextSize.height + sizeWithFontCorrection)));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_layoutAccessoryView"), function $CPAlert___layoutAccessoryView(self, _cmd)
{
    if (!self._accessoryView)
        return;
    var inset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "content-inset")),
        defaultElementsMargin = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "default-elements-margin")),
        accessoryViewWidth = CGRectGetWidth(((___r1 = ((___r2 = self._window), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))) - inset.left - inset.right,
        accessoryViewOriginY = CGRectGetMaxY(((___r1 = self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))) + defaultElementsMargin;
    ((___r1 = self._accessoryView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(inset.left, accessoryViewOriginY)));
    ((___r1 = ((___r2 = self._window), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._accessoryView));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_layoutSuppressionButton"), function $CPAlert___layoutSuppressionButton(self, _cmd)
{
    if (!self._showSuppressionButton)
        return;
    var inset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "content-inset")),
        suppressionViewXOffset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "suppression-button-x-offset")),
        suppressionViewYOffset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "suppression-button-y-offset")),
        defaultElementsMargin = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "default-elements-margin")),
        suppressionButtonViewOriginY = CGRectGetMaxY(((___r1 = self._accessoryView || self._informativeLabel), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))) + defaultElementsMargin + suppressionViewYOffset;
    ((___r1 = self._suppressionButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "suppression-button-text-color"))));
    ((___r1 = self._suppressionButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "suppression-button-text-font"))));
    ((___r1 = self._suppressionButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "suppression-button-text-shadow-color"))));
    ((___r1 = self._suppressionButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", ((___r2 = self._themeView), ___r2 == null ? null : ___r2.isa.objj_msgSend1(___r2, "currentValueForThemeAttribute:", "suppression-button-text-shadow-offset"))));
    ((___r1 = self._suppressionButton), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    ((___r1 = self._suppressionButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameOrigin:", CGPointMake(inset.left + suppressionViewXOffset, suppressionButtonViewOriginY)));
    ((___r1 = ((___r2 = self._window), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", self._suppressionButton));
    var ___r1, ___r2;
}
,["void"]), new objj_method(sel_getUid("_layoutButtonsFromView:"), function $CPAlert___layoutButtonsFromView_(self, _cmd, lastView)
{
    var inset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "content-inset")),
        minimumSize = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "size")),
        buttonOffset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "button-offset")),
        helpLeftOffset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "help-image-left-offset")),
        aRepresentativeButton = ((___r1 = self._buttons), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0)),
        defaultElementsMargin = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "default-elements-margin")),
        panelSize = ((___r1 = ((___r2 = self._window), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size,
        buttonsOriginY,
        buttonMarginY,
        buttonMarginX,
        theme = self.isa.objj_msgSend0(self, "theme"),
        offsetX;
    (aRepresentativeButton == null ? null : aRepresentativeButton.isa.objj_msgSend1(aRepresentativeButton, "setTheme:", self.isa.objj_msgSend0(self, "theme")));
    (aRepresentativeButton == null ? null : aRepresentativeButton.isa.objj_msgSend0(aRepresentativeButton, "sizeToFit"));
    panelSize.height = CGRectGetMaxY((lastView == null ? null : lastView.isa.objj_msgSend0(lastView, "frame"))) + defaultElementsMargin + (aRepresentativeButton == null ? null : aRepresentativeButton.isa.objj_msgSend0(aRepresentativeButton, "frameSize")).height;
    if (panelSize.height < minimumSize.height)
        panelSize.height = minimumSize.height;
    buttonsOriginY = panelSize.height - (aRepresentativeButton == null ? null : aRepresentativeButton.isa.objj_msgSend0(aRepresentativeButton, "frameSize")).height + buttonOffset;
    offsetX = panelSize.width - inset.right;
    switch(((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "styleMask"))) {
    case _CPModalWindowMask:
        buttonMarginY = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "modal-window-button-margin-y"));
        buttonMarginX = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "modal-window-button-margin-x"));
        break;
default:
        buttonMarginY = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "standard-window-button-margin-y"));
        buttonMarginX = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "standard-window-button-margin-x"));
        break;
    }
    for (var i = ((___r1 = self._buttons), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) - 1; i >= 0; i--)
    {
        var button = self._buttons[i];
        (button == null ? null : button.isa.objj_msgSend1(button, "setTheme:", self.isa.objj_msgSend0(self, "theme")));
        (button == null ? null : button.isa.objj_msgSend0(button, "sizeToFit"));
        var buttonFrame = (button == null ? null : button.isa.objj_msgSend0(button, "frame")),
            width = MAX(80.0, CGRectGetWidth(buttonFrame)),
            height = CGRectGetHeight(buttonFrame);
        offsetX -= width;
        (button == null ? null : button.isa.objj_msgSend1(button, "setFrame:", CGRectMake(offsetX + buttonMarginX, buttonsOriginY + buttonMarginY, width, height)));
        offsetX -= 10;
    }
    if (self._showHelp)
    {
        var helpImage = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "help-image")),
            helpImagePressed = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "help-image-pressed")),
            helpImageSize = helpImage ? (helpImage == null ? null : helpImage.isa.objj_msgSend0(helpImage, "size")) : CGSizeMakeZero(),
            helpFrame = CGRectMake(helpLeftOffset, buttonsOriginY, helpImageSize.width, helpImageSize.height);
        ((___r1 = self._alertHelpButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", helpImage));
        ((___r1 = self._alertHelpButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlternateImage:", helpImagePressed));
        ((___r1 = self._alertHelpButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBordered:", NO));
        ((___r1 = self._alertHelpButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", helpFrame));
    }
    panelSize.height += (aRepresentativeButton == null ? null : aRepresentativeButton.isa.objj_msgSend0(aRepresentativeButton, "frameSize")).height + inset.bottom + buttonOffset;
    return panelSize;
    var ___r1, ___r2;
}
,["CGSize","CPView"]), new objj_method(sel_getUid("layout"), function $CPAlert__layout(self, _cmd)
{
    if (!self._needsLayout)
        return;
    if (!self._window)
        self.isa.objj_msgSend1(self, "_createWindowWithStyle:", nil);
    var iconOffset = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "image-offset")),
        theImage = self._icon,
        finalSize;
    if (!theImage)
        switch(self._alertStyle) {
        case CPWarningAlertStyle:
            theImage = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "warning-image"));
            break;
        case CPInformationalAlertStyle:
            theImage = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "information-image"));
            break;
        case CPCriticalAlertStyle:
            theImage = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "error-image"));
            break;
        }
    ((___r1 = self._alertImageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", theImage));
    var imageSize = theImage ? (theImage == null ? null : theImage.isa.objj_msgSend0(theImage, "size")) : CGSizeMakeZero();
    ((___r1 = self._alertImageView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(iconOffset.x, iconOffset.y, imageSize.width, imageSize.height)));
    self.isa.objj_msgSend0(self, "_layoutMessageView");
    self.isa.objj_msgSend0(self, "_layoutInformativeView");
    self.isa.objj_msgSend0(self, "_layoutAccessoryView");
    self.isa.objj_msgSend0(self, "_layoutSuppressionButton");
    var lastView = self._informativeLabel;
    if (self._showSuppressionButton)
        lastView = self._suppressionButton;
    else if (self._accessoryView)
        lastView = self._accessoryView;
    finalSize = self.isa.objj_msgSend1(self, "_layoutButtonsFromView:", lastView);
    if (((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "styleMask")) & CPDocModalWindowMask)
        finalSize.height -= 26;
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrameSize:", finalSize));
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "center"));
    if (((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "styleMask")) & _CPModalWindowMask || ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "styleMask")) & CPHUDBackgroundWindowMask)
    {
        ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMovable:", YES));
        ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMovableByWindowBackground:", YES));
    }
    self._needsLayout = NO;
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("runModal"), function $CPAlert__runModal(self, _cmd)
{
    if (!(((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "styleMask")) & self._defaultWindowStyle))
    {
        self._needsLayout = YES;
        self.isa.objj_msgSend1(self, "_createWindowWithStyle:", self._defaultWindowStyle);
    }
    self.isa.objj_msgSend0(self, "layout");
    (CPApp == null ? null : CPApp.isa.objj_msgSend1(CPApp, "runModalForWindow:", self._window));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("runModalWithDidEndBlock:"), function $CPAlert__runModalWithDidEndBlock_(self, _cmd, block)
{
    self._didEndBlock = block;
    self.isa.objj_msgSend0(self, "runModal");
}
,["void","Function"]), new objj_method(sel_getUid("beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:"), function $CPAlert__beginSheetModalForWindow_modalDelegate_didEndSelector_contextInfo_(self, _cmd, aWindow, modalDelegate, alertDidEndSelector, contextInfo)
{
    if (!(((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "styleMask")) & CPDocModalWindowMask))
    {
        self._needsLayout = YES;
        self.isa.objj_msgSend1(self, "_createWindowWithStyle:", CPDocModalWindowMask);
    }
    self.isa.objj_msgSend0(self, "layout");
    self._modalDelegate = modalDelegate;
    self._didEndSelector = alertDidEndSelector;
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:", self._window, aWindow, self, sel_getUid("_alertDidEnd:returnCode:contextInfo:"), contextInfo));
    var ___r1;
}
,["void","CPWindow","id","SEL","id"]), new objj_method(sel_getUid("beginSheetModalForWindow:"), function $CPAlert__beginSheetModalForWindow_(self, _cmd, aWindow)
{
    self.isa.objj_msgSend(self, "beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:", aWindow, nil, nil, nil);
}
,["void","CPWindow"]), new objj_method(sel_getUid("beginSheetModalForWindow:didEndBlock:"), function $CPAlert__beginSheetModalForWindow_didEndBlock_(self, _cmd, aWindow, block)
{
    self._didEndBlock = block;
    self.isa.objj_msgSend(self, "beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:", aWindow, nil, nil, nil);
}
,["void","CPWindow","Function"]), new objj_method(sel_getUid("_createWindowWithStyle:"), function $CPAlert___createWindowWithStyle_(self, _cmd, forceStyle)
{
    var frame = CGRectMakeZero();
    frame.size = ((___r1 = self._themeView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "currentValueForThemeAttribute:", "size"));
    self._window = ((___r1 = CPPanel.isa.objj_msgSend0(CPPanel, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", frame, forceStyle || self._defaultWindowStyle));
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLevel:", CPStatusWindowLevel));
    ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setPlatformWindow:", ((___r2 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "keyWindow"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "platformWindow"))));
    if (self._title)
        ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", self._title));
    var contentView = ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "contentView")),
        count = ((___r1 = self._buttons), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    if (count)
        while (count--)
            (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._buttons[count]));
    else
        self.isa.objj_msgSend1(self, "addButtonWithTitle:", "OK");
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._messageLabel));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._alertImageView));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._informativeLabel));
    if (self._showHelp)
        (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._alertHelpButton));
    var ___r1, ___r2;
}
,["void","int"]), new objj_method(sel_getUid("_showHelp:"), function $CPAlert___showHelp_(self, _cmd, aSender)
{
    self.isa.objj_msgSend0(self, "_sendDelegateAlertShowHelp");
}
,["void","id"]), new objj_method(sel_getUid("_takeReturnCodeFrom:"), function $CPAlert___takeReturnCodeFrom_(self, _cmd, aSender)
{
    if (((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isSheet")))
    {
        ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderOut:", nil));
        (CPApp == null ? null : CPApp.isa.objj_msgSend2(CPApp, "endSheet:returnCode:", self._window, (aSender == null ? null : aSender.isa.objj_msgSend0(aSender, "tag"))));
    }
    else
    {
        (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "abortModal"));
        ((___r1 = self._window), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "close"));
        self.isa.objj_msgSend3(self, "_alertDidEnd:returnCode:contextInfo:", self._window, (aSender == null ? null : aSender.isa.objj_msgSend0(aSender, "tag")), nil);
    }
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("_alertDidEnd:returnCode:contextInfo:"), function $CPAlert___alertDidEnd_returnCode_contextInfo_(self, _cmd, aWindow, returnCode, contextInfo)
{
    if (self._didEndBlock)
    {
        if (typeof self._didEndBlock === "function")
            self._didEndBlock(self, returnCode);
        else
            CPLog.warn("%s: didEnd block is not a function", self.isa.objj_msgSend0(self, "description"));
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
            self.isa.objj_msgSend1(self, "_sendDelegateAlertDidEndReturnCode:", returnCode);
    }
}
,["void","CPWindow","int","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alertWithMessageText:defaultButton:alternateButton:otherButton:informativeTextWithFormat:"), function $CPAlert__alertWithMessageText_defaultButton_alternateButton_otherButton_informativeTextWithFormat_(self, _cmd, aMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, informativeText)
{
    var newAlert = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (newAlert == null ? null : newAlert.isa.objj_msgSend1(newAlert, "setMessageText:", aMessage));
    (newAlert == null ? null : newAlert.isa.objj_msgSend1(newAlert, "addButtonWithTitle:", defaultButtonTitle));
    if (alternateButtonTitle)
        (newAlert == null ? null : newAlert.isa.objj_msgSend1(newAlert, "addButtonWithTitle:", alternateButtonTitle));
    if (otherButtonTitle)
        (newAlert == null ? null : newAlert.isa.objj_msgSend1(newAlert, "addButtonWithTitle:", otherButtonTitle));
    if (informativeText)
        (newAlert == null ? null : newAlert.isa.objj_msgSend1(newAlert, "setInformativeText:", informativeText));
    return newAlert;
    var ___r1;
}
,["CPAlert","CPString","CPString","CPString","CPString","CPString"]), new objj_method(sel_getUid("alertWithError:"), function $CPAlert__alertWithError_(self, _cmd, anErrorMessage)
{
    var newAlert = ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    (newAlert == null ? null : newAlert.isa.objj_msgSend1(newAlert, "setMessageText:", anErrorMessage));
    (newAlert == null ? null : newAlert.isa.objj_msgSend1(newAlert, "setAlertStyle:", CPCriticalAlertStyle));
    return newAlert;
    var ___r1;
}
,["CPAlert","CPString"])]);
}{
var the_class = objj_getClass("CPAlert")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPAlert\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_sendDelegateAlertDidEndReturnCode:"), function $CPAlert___sendDelegateAlertDidEndReturnCode_(self, _cmd, returnCode)
{
    if (!(self._implementedDelegateMethods & CPAlertDelegate_alertDidEnd_returnCode_))
        return;
    ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "alertDidEnd:returnCode:", self, returnCode));
    var ___r1;
}
,["void","int"]), new objj_method(sel_getUid("_sendDelegateAlertShowHelp"), function $CPAlert___sendDelegateAlertShowHelp(self, _cmd)
{
    if (!(self._implementedDelegateMethods & CPAlertDelegate_alertShowHelp_))
        return YES;
    return ((___r1 = self._delegate), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "alertShowHelp:", self));
    var ___r1;
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
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CGSizeMake(400.0, 110.0), "size", CGInsetMake(15, 15, 15, 50), "content-inset", 6, "informative-offset", 10, "button-offset", CPJustifiedTextAlignment, "message-text-alignment", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "message-text-color", CPFont.isa.objj_msgSend1(CPFont, "boldSystemFontOfSize:", 13.0), "message-text-font", CPNull.isa.objj_msgSend0(CPNull, "null"), "message-text-shadow-color", CGSizeMakeZero(), "message-text-shadow-offset", CPJustifiedTextAlignment, "informative-text-alignment", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "informative-text-color", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", 12.0), "informative-text-font", CPNull.isa.objj_msgSend0(CPNull, "null"), "informative-text-shadow-color", CGSizeMakeZero(), "informative-text-shadow-offset", CGPointMake(15, 12), "image-offset", CPNull.isa.objj_msgSend0(CPNull, "null"), "information-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "warning-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "error-image", CPNull.isa.objj_msgSend0(CPNull, "null"), "help-image", 15, "help-image-left-offset", CPNull.isa.objj_msgSend0(CPNull, "null"), "help-image-pressed", 0.0, "suppression-button-y-offset", 0.0, "suppression-button-x-offset", 3.0, "default-elements-margin", CPColor.isa.objj_msgSend0(CPColor, "blackColor"), "suppression-button-text-color", CPFont.isa.objj_msgSend1(CPFont, "systemFontOfSize:", 12.0), "suppression-button-text-font", CPNull.isa.objj_msgSend0(CPNull, "null"), "suppression-button-text-shadow-color", 0.0, "suppression-button-text-shadow-offset", 0.0, "modal-window-button-margin-y", 0.0, "modal-window-button-margin-x", 0.0, "standard-window-button-margin-y", 0.0, "standard-window-button-margin-x");
}
,["CPDictionary"])]);
}