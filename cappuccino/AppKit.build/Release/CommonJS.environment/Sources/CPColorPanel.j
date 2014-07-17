@STATIC;1.0;i;10;CPButton.ji;10;CPCookie.ji;9;CPPanel.ji;14;CPPasteboard.ji;8;CPView.ji;15;CPColorPicker.ji;21;CPSliderColorPicker.jt;30658;objj_executeFile("CPButton.j", YES);objj_executeFile("CPCookie.j", YES);objj_executeFile("CPPanel.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPView.j", YES);CPWheelColorPickerMode = 1;
CPSliderColorPickerMode = 2;
CPColorPickerViewWidth = 265;
CPColorPickerViewHeight = 370;
CPColorPanelColorDidChangeNotification = "CPColorPanelColorDidChangeNotification";
var PREVIEW_HEIGHT = 20.0,
    TOOLBAR_HEIGHT = 32.0,
    SWATCH_HEIGHT = 14.0,
    ICON_WIDTH = 32.0,
    ICON_PADDING = 12.0;
var SharedColorPanel = nil,
    ColorPickerClasses = [];
{var the_class = objj_allocateClassPair(CPPanel, "CPColorPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbar"), new objj_ivar("_swatchView"), new objj_ivar("_previewView"), new objj_ivar("_opacitySlider"), new objj_ivar("_colorPickers"), new objj_ivar("_currentView"), new objj_ivar("_activePicker"), new objj_ivar("_color"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_mode")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPColorPanel__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPanel").super_class }, "initWithContentRect:styleMask:", CGRectMake(500.0, 50.0, 219.0, 370.0), CPTitledWindowMask | CPClosableWindowMask | CPResizableWindowMask);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setTitle:", "Color Panel"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setLevel:", CPFloatingWindowLevel));
        (self == null ? null : self.isa.objj_msgSend1(self, "setFloatingPanel:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setBecomesKeyOnlyIfNeeded:", YES));
        (self == null ? null : self.isa.objj_msgSend1(self, "setMinSize:", CGSizeMake(219.0, 363.0)));
        (self == null ? null : self.isa.objj_msgSend1(self, "setMaxSize:", CGSizeMake(323.0, 537.0)));
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("setColor:"), function $CPColorPanel__setColor_(self, _cmd, aColor)
{
    self._color = aColor;
    ((___r1 = self._previewView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", self._color));
    (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "sendAction:to:from:", sel_getUid("changeColor:"), nil, self));
    if (self._target && self._action)
        (CPApp == null ? null : CPApp.isa.objj_msgSend3(CPApp, "sendAction:to:from:", self._action, self._target, self));
    ((___r1 = CPNotificationCenter.isa.objj_msgSend0(CPNotificationCenter, "defaultCenter")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "postNotificationName:object:", CPColorPanelColorDidChangeNotification, self));
    ((___r1 = self._activePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", self._color));
    ((___r1 = self._opacitySlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", ((___r2 = self._color), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alphaComponent"))));
    var ___r1, ___r2;
}
,["void","CPColor"]), new objj_method(sel_getUid("setColor:updatePicker:"), function $CPColorPanel__setColor_updatePicker_(self, _cmd, aColor, bool)
{
    self.isa.objj_msgSend1(self, "setColor:", aColor);
    if (bool)
        ((___r1 = self._activePicker), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColor:", self._color));
    var ___r1;
}
,["void","CPColor","BOOL"]), new objj_method(sel_getUid("color"), function $CPColorPanel__color(self, _cmd)
{
    return self._color;
}
,["CPColor"]), new objj_method(sel_getUid("opacity"), function $CPColorPanel__opacity(self, _cmd)
{
    return ((___r1 = self._opacitySlider), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue"));
    var ___r1;
}
,["float"]), new objj_method(sel_getUid("setTarget:"), function $CPColorPanel__setTarget_(self, _cmd, aTarget)
{
    self._target = aTarget;
}
,["void","id"]), new objj_method(sel_getUid("target"), function $CPColorPanel__target(self, _cmd)
{
    return self._target;
}
,["id"]), new objj_method(sel_getUid("setAction:"), function $CPColorPanel__setAction_(self, _cmd, anAction)
{
    self._action = anAction;
}
,["void","selector"]), new objj_method(sel_getUid("action"), function $CPColorPanel__action(self, _cmd)
{
    return self._action;
}
,["selector"]), new objj_method(sel_getUid("setMode:"), function $CPColorPanel__setMode_(self, _cmd, mode)
{
    self._mode = mode;
}
,["void","CPColorPanelMode"]), new objj_method(sel_getUid("_setPicker:"), function $CPColorPanel___setPicker_(self, _cmd, sender)
{
    var picker = self._colorPickers[(sender == null ? null : sender.isa.objj_msgSend0(sender, "tag"))],
        view = (picker == null ? null : picker.isa.objj_msgSend1(picker, "provideNewView:", NO));
    if (!view)
        view = (picker == null ? null : picker.isa.objj_msgSend1(picker, "provideNewView:", YES));
    if (view == self._currentView)
        return;
    if (self._currentView)
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrame:", ((___r1 = self._currentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame"))));
    else
    {
        var height = TOOLBAR_HEIGHT + 10 + PREVIEW_HEIGHT + 5 + SWATCH_HEIGHT + 32,
            bounds = ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "bounds"));
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrameSize:", CGSizeMake(bounds.size.width - 10, bounds.size.height - height)));
        (view == null ? null : view.isa.objj_msgSend1(view, "setFrameOrigin:", CGPointMake(5, height)));
    }
    ((___r1 = self._currentView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
    ((___r1 = self.isa.objj_msgSend0(self, "contentView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", view));
    self._currentView = view;
    self._activePicker = picker;
    (picker == null ? null : picker.isa.objj_msgSend1(picker, "setColor:", self.isa.objj_msgSend0(self, "color")));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("mode"), function $CPColorPanel__mode(self, _cmd)
{
    return self._mode;
}
,["CPColorPanelMode"]), new objj_method(sel_getUid("orderFront:"), function $CPColorPanel__orderFront_(self, _cmd, aSender)
{
    self.isa.objj_msgSend0(self, "_loadContentsIfNecessary");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPanel").super_class }, "orderFront:", aSender);
}
,["void","id"]), new objj_method(sel_getUid("_loadContentsIfNecessary"), function $CPColorPanel___loadContentsIfNecessary(self, _cmd)
{
    if (self._toolbar)
        return;
    if (!self._color)
        self._color = CPColor.isa.objj_msgSend0(CPColor, "whiteColor");
    self._colorPickers = [];
    var count = (ColorPickerClasses == null ? null : ColorPickerClasses.isa.objj_msgSend0(ColorPickerClasses, "count"));
    for (var i = 0; i < count; i++)
    {
        var currentPickerClass = ColorPickerClasses[i],
            currentPicker = ((___r1 = (currentPickerClass == null ? null : currentPickerClass.isa.objj_msgSend0(currentPickerClass, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithPickerMask:colorPanel:", 0, self));
        self._colorPickers.push(currentPicker);
    }
    var contentView = self.isa.objj_msgSend0(self, "contentView"),
        bounds = (contentView == null ? null : contentView.isa.objj_msgSend0(contentView, "bounds"));
    self._toolbar = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(0, 6, CGRectGetWidth(bounds), TOOLBAR_HEIGHT)));
    ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    var totalToolbarWidth = count * ICON_WIDTH + (count - 1) * ICON_PADDING,
        leftOffset = (CGRectGetWidth(bounds) - totalToolbarWidth) / 2.0,
        buttonForLater = nil;
    for (var i = 0; i < count; i++)
    {
        var image = ((___r1 = self._colorPickers[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "provideNewButtonImage")),
            highlightImage = ((___r1 = self._colorPickers[i]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "provideNewAlternateButtonImage")),
            button = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(leftOffset + i * (ICON_WIDTH + ICON_PADDING), 0, ICON_WIDTH, ICON_WIDTH)));
        (button == null ? null : button.isa.objj_msgSend1(button, "setTag:", i));
        (button == null ? null : button.isa.objj_msgSend1(button, "setTarget:", self));
        (button == null ? null : button.isa.objj_msgSend1(button, "setAction:", sel_getUid("_setPicker:")));
        (button == null ? null : button.isa.objj_msgSend1(button, "setBordered:", NO));
        (button == null ? null : button.isa.objj_msgSend1(button, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin));
        (button == null ? null : button.isa.objj_msgSend1(button, "setImage:", image));
        (button == null ? null : button.isa.objj_msgSend1(button, "setAlternateImage:", highlightImage));
        ((___r1 = self._toolbar), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", button));
        if (!buttonForLater)
            buttonForLater = button;
    }
    var previewBox = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + 10, CGRectGetWidth(bounds) - 86, PREVIEW_HEIGHT)));
    self._previewView = ((___r1 = (_CPColorPanelPreview == null ? null : _CPColorPanelPreview.isa.objj_msgSend0(_CPColorPanelPreview, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectInset((previewBox == null ? null : previewBox.isa.objj_msgSend0(previewBox, "bounds")), 2.0, 2.0)));
    ((___r1 = self._previewView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColorPanel:", self));
    ((___r1 = self._previewView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    (previewBox == null ? null : previewBox.isa.objj_msgSend1(previewBox, "setBackgroundColor:", CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 0.8, 1.0)));
    (previewBox == null ? null : previewBox.isa.objj_msgSend1(previewBox, "setAutoresizingMask:", CPViewWidthSizable));
    (previewBox == null ? null : previewBox.isa.objj_msgSend1(previewBox, "addSubview:", self._previewView));
    var _previewLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(10, TOOLBAR_HEIGHT + 10, 60, 15)));
    (_previewLabel == null ? null : _previewLabel.isa.objj_msgSend1(_previewLabel, "setStringValue:", "Preview:"));
    (_previewLabel == null ? null : _previewLabel.isa.objj_msgSend1(_previewLabel, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    (_previewLabel == null ? null : _previewLabel.isa.objj_msgSend1(_previewLabel, "setAlignment:", CPRightTextAlignment));
    var swatchBox = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + 10 + PREVIEW_HEIGHT + 5, CGRectGetWidth(bounds) - 86, SWATCH_HEIGHT + 2.0)));
    (swatchBox == null ? null : swatchBox.isa.objj_msgSend1(swatchBox, "setBackgroundColor:", CPColor.isa.objj_msgSend2(CPColor, "colorWithWhite:alpha:", 0.8, 1.0)));
    (swatchBox == null ? null : swatchBox.isa.objj_msgSend1(swatchBox, "setAutoresizingMask:", CPViewWidthSizable));
    self._swatchView = ((___r1 = (_CPColorPanelSwatches == null ? null : _CPColorPanelSwatches.isa.objj_msgSend0(_CPColorPanelSwatches, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectInset((swatchBox == null ? null : swatchBox.isa.objj_msgSend0(swatchBox, "bounds")), 1.0, 1.0)));
    ((___r1 = self._swatchView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setColorPanel:", self));
    ((___r1 = self._swatchView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    (swatchBox == null ? null : swatchBox.isa.objj_msgSend1(swatchBox, "addSubview:", self._swatchView));
    var _swatchLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(10, TOOLBAR_HEIGHT + 8 + PREVIEW_HEIGHT + 6, 60, 15)));
    (_swatchLabel == null ? null : _swatchLabel.isa.objj_msgSend1(_swatchLabel, "setStringValue:", "Swatches:"));
    (_swatchLabel == null ? null : _swatchLabel.isa.objj_msgSend1(_swatchLabel, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    (_swatchLabel == null ? null : _swatchLabel.isa.objj_msgSend1(_swatchLabel, "setAlignment:", CPRightTextAlignment));
    var opacityLabel = ((___r1 = CPTextField.isa.objj_msgSend0(CPTextField, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(10, TOOLBAR_HEIGHT + PREVIEW_HEIGHT + 35, 60, 20)));
    (opacityLabel == null ? null : opacityLabel.isa.objj_msgSend1(opacityLabel, "setStringValue:", "Opacity:"));
    (opacityLabel == null ? null : opacityLabel.isa.objj_msgSend1(opacityLabel, "setTextColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    (opacityLabel == null ? null : opacityLabel.isa.objj_msgSend1(opacityLabel, "setAlignment:", CPRightTextAlignment));
    self._opacitySlider = ((___r1 = (CPSlider == null ? null : CPSlider.isa.objj_msgSend0(CPSlider, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + PREVIEW_HEIGHT + 34, CGRectGetWidth(bounds) - 86, 20.0)));
    ((___r1 = self._opacitySlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMinValue:", 0.0));
    ((___r1 = self._opacitySlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setMaxValue:", 1.0));
    ((___r1 = self._opacitySlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    ((___r1 = self._opacitySlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTarget:", self));
    ((___r1 = self._opacitySlider), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAction:", sel_getUid("setOpacity:")));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._toolbar));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", previewBox));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", _previewLabel));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", swatchBox));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", _swatchLabel));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", opacityLabel));
    (contentView == null ? null : contentView.isa.objj_msgSend1(contentView, "addSubview:", self._opacitySlider));
    self._target = nil;
    self._action = nil;
    self._activePicker = nil;
    ((___r1 = self._previewView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", self._color));
    if (buttonForLater)
        self.isa.objj_msgSend1(self, "_setPicker:", buttonForLater);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setOpacity:"), function $CPColorPanel__setOpacity_(self, _cmd, sender)
{
    var components = ((___r1 = self.isa.objj_msgSend0(self, "color")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "components")),
        alpha = (sender == null ? null : sender.isa.objj_msgSend0(sender, "floatValue"));
    self.isa.objj_msgSend2(self, "setColor:updatePicker:", ((___r1 = self._color), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "colorWithAlphaComponent:", alpha)), YES);
    var ___r1;
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("provideColorPickerClass:"), function $CPColorPanel__provideColorPickerClass_(self, _cmd, aColorPickerSubclass)
{
    ColorPickerClasses.push(aColorPickerSubclass);
}
,["void","Class"]), new objj_method(sel_getUid("sharedColorPanel"), function $CPColorPanel__sharedColorPanel(self, _cmd)
{
    if (!SharedColorPanel)
        SharedColorPanel = ((___r1 = CPColorPanel.isa.objj_msgSend0(CPColorPanel, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    return SharedColorPanel;
    var ___r1;
}
,["CPColorPanel"]), new objj_method(sel_getUid("setPickerMode:"), function $CPColorPanel__setPickerMode_(self, _cmd, mode)
{
    var panel = CPColorPanel.isa.objj_msgSend0(CPColorPanel, "sharedColorPanel");
    (panel == null ? null : panel.isa.objj_msgSend1(panel, "setMode:", mode));
}
,["void","CPColorPanelMode"])]);
}CPColorDragType = "CPColorDragType";
var CPColorPanelSwatchesCookie = "CPColorPanelSwatchesCookie";
{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelSwatches"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_swatches"), new objj_ivar("_dragColor"), new objj_ivar("_colorPanel"), new objj_ivar("_swatchCookie")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPColorPanelSwatches__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPColorPanelSwatches").super_class }, "initWithFrame:", aFrame);
    (self == null ? null : self.isa.objj_msgSend1(self, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "grayColor")));
    (self == null ? null : self.isa.objj_msgSend1(self, "registerForDraggedTypes:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithObjects:", CPColorDragType)));
    var whiteColor = CPColor.isa.objj_msgSend0(CPColor, "whiteColor");
    self._swatchCookie = ((___r1 = CPCookie.isa.objj_msgSend0(CPCookie, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithName:", CPColorPanelSwatchesCookie));
    var colorList = (self == null ? null : self.isa.objj_msgSend0(self, "startingColorList"));
    self._swatches = [];
    for (var i = 0; i < 50; i++)
    {
        var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(13 * i + 1, 1, 12, 12))),
            fillView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectInset((view == null ? null : view.isa.objj_msgSend0(view, "bounds")), 1.0, 1.0)));
        (view == null ? null : view.isa.objj_msgSend1(view, "setBackgroundColor:", whiteColor));
        (fillView == null ? null : fillView.isa.objj_msgSend1(fillView, "setBackgroundColor:", i < colorList.length ? colorList[i] : whiteColor));
        (view == null ? null : view.isa.objj_msgSend1(view, "addSubview:", fillView));
        (self == null ? null : self.isa.objj_msgSend1(self, "addSubview:", view));
        self._swatches.push(view);
    }
    return self;
    var ___r1;
}
,["id","CGRect"]), new objj_method(sel_getUid("isOpaque"), function $_CPColorPanelSwatches__isOpaque(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("startingColorList"), function $_CPColorPanelSwatches__startingColorList(self, _cmd)
{
    var cookieValue = ((___r1 = self._swatchCookie), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "value"));
    if (!cookieValue)
    {
        return [CPColor.isa.objj_msgSend0(CPColor, "blackColor"), CPColor.isa.objj_msgSend0(CPColor, "darkGrayColor"), CPColor.isa.objj_msgSend0(CPColor, "grayColor"), CPColor.isa.objj_msgSend0(CPColor, "lightGrayColor"), CPColor.isa.objj_msgSend0(CPColor, "whiteColor"), CPColor.isa.objj_msgSend0(CPColor, "redColor"), CPColor.isa.objj_msgSend0(CPColor, "greenColor"), CPColor.isa.objj_msgSend0(CPColor, "blueColor"), CPColor.isa.objj_msgSend0(CPColor, "yellowColor")];
    }
    var cookieValue = eval(cookieValue),
        result = [];
    for (var i = 0; i < cookieValue.length; i++)
        result.push(CPColor.isa.objj_msgSend1(CPColor, "colorWithHexString:", cookieValue[i]));
    return result;
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("saveColorList"), function $_CPColorPanelSwatches__saveColorList(self, _cmd)
{
    var result = [];
    for (var i = 0; i < self._swatches.length; i++)
        result.push(((___r1 = ((___r2 = ((___r3 = self._swatches[i]), ___r3 == null ? null : ___r3.isa.objj_msgSend0(___r3, "subviews"))[0]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "backgroundColor"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "hexString")));
    var future = new Date();
    future.setYear(2019);
    ((___r1 = self._swatchCookie), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "setValue:expires:domain:", JSON.stringify(result), future, nil));
    var ___r1, ___r2, ___r3;
}
,["CPArray"]), new objj_method(sel_getUid("setColorPanel:"), function $_CPColorPanelSwatches__setColorPanel_(self, _cmd, panel)
{
    self._colorPanel = panel;
}
,["void","CPColorPanel"]), new objj_method(sel_getUid("colorPanel"), function $_CPColorPanelSwatches__colorPanel(self, _cmd)
{
    return self._colorPanel;
}
,["CPColorPanel"]), new objj_method(sel_getUid("colorAtIndex:"), function $_CPColorPanelSwatches__colorAtIndex_(self, _cmd, index)
{
    return ((___r1 = ((___r2 = self._swatches[index]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "subviews"))[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "backgroundColor"));
    var ___r1, ___r2;
}
,["CPColor","int"]), new objj_method(sel_getUid("setColor:atIndex:"), function $_CPColorPanelSwatches__setColor_atIndex_(self, _cmd, aColor, index)
{
    ((___r1 = ((___r2 = self._swatches[index]), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "subviews"))[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", aColor));
    self.isa.objj_msgSend0(self, "saveColorList");
    var ___r1, ___r2;
}
,["void","CPColor","int"]), new objj_method(sel_getUid("mouseUp:"), function $_CPColorPanelSwatches__mouseUp_(self, _cmd, anEvent)
{
    var point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil),
        bounds = self.isa.objj_msgSend0(self, "bounds");
    if (!CGRectContainsPoint(bounds, point) || point.x > self.isa.objj_msgSend0(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    ((___r1 = self._colorPanel), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setColor:updatePicker:", self.isa.objj_msgSend1(self, "colorAtIndex:", FLOOR(point.x / 13)), YES));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $_CPColorPanelSwatches__mouseDragged_(self, _cmd, anEvent)
{
    var point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil);
    if (point.x > self.isa.objj_msgSend0(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    ((___r1 = CPPasteboard.isa.objj_msgSend1(CPPasteboard, "pasteboardWithName:", CPDragPboard)), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "declareTypes:owner:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithObject:", CPColorDragType), self));
    var swatch = self._swatches[FLOOR(point.x / 13)];
    self._dragColor = ((___r1 = (swatch == null ? null : swatch.isa.objj_msgSend0(swatch, "subviews"))[0]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "backgroundColor"));
    var bounds = CGRectMakeCopy((swatch == null ? null : swatch.isa.objj_msgSend0(swatch, "bounds")));
    var dragView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", bounds)),
        dragFillView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectInset(bounds, 1.0, 1.0)));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    (dragFillView == null ? null : dragFillView.isa.objj_msgSend1(dragFillView, "setBackgroundColor:", self._dragColor));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "addSubview:", dragFillView));
    self.isa.objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", dragView, CGPointMake(point.x - bounds.size.width / 2.0, point.y - bounds.size.height / 2.0), CGPointMake(0.0, 0.0), anEvent, nil, self, YES);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $_CPColorPanelSwatches__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{
    if (aType == CPColorDragType)
        (aPasteboard == null ? null : aPasteboard.isa.objj_msgSend2(aPasteboard, "setData:forType:", CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", self._dragColor), aType));
}
,["void","CPPasteboard","CPString"]), new objj_method(sel_getUid("performDragOperation:"), function $_CPColorPanelSwatches__performDragOperation_(self, _cmd, aSender)
{
    var location = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (aSender == null ? null : aSender.isa.objj_msgSend0(aSender, "draggingLocation")), nil),
        pasteboard = (aSender == null ? null : aSender.isa.objj_msgSend0(aSender, "draggingPasteboard")),
        swatch = nil;
    if (!(pasteboard == null ? null : pasteboard.isa.objj_msgSend1(pasteboard, "availableTypeFromArray:", [CPColorDragType])) || location.x > self.isa.objj_msgSend0(self, "bounds").size.width - 1 || location.x < 1)
        return NO;
    self.isa.objj_msgSend2(self, "setColor:atIndex:", CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", (pasteboard == null ? null : pasteboard.isa.objj_msgSend1(pasteboard, "dataForType:", CPColorDragType))), FLOOR(location.x / 13));
}
,["void","id"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelPreview"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_colorPanel")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPColorPanelPreview__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPColorPanelPreview").super_class }, "initWithFrame:", aFrame);
    (self == null ? null : self.isa.objj_msgSend1(self, "registerForDraggedTypes:", CPArray.isa.objj_msgSend1(CPArray, "arrayWithObjects:", CPColorDragType)));
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("setColorPanel:"), function $_CPColorPanelPreview__setColorPanel_(self, _cmd, aPanel)
{
    self._colorPanel = aPanel;
}
,["void","CPColorPanel"]), new objj_method(sel_getUid("colorPanel"), function $_CPColorPanelPreview__colorPanel(self, _cmd)
{
    return self._colorPanel;
}
,["CPColorPanel"]), new objj_method(sel_getUid("performDragOperation:"), function $_CPColorPanelPreview__performDragOperation_(self, _cmd, aSender)
{
    var pasteboard = (aSender == null ? null : aSender.isa.objj_msgSend0(aSender, "draggingPasteboard"));
    if (!(pasteboard == null ? null : pasteboard.isa.objj_msgSend1(pasteboard, "availableTypeFromArray:", [CPColorDragType])))
        return NO;
    var color = CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", (pasteboard == null ? null : pasteboard.isa.objj_msgSend1(pasteboard, "dataForType:", CPColorDragType)));
    ((___r1 = self._colorPanel), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setColor:updatePicker:", color, YES));
    var ___r1;
}
,["void","id"]), new objj_method(sel_getUid("isOpaque"), function $_CPColorPanelPreview__isOpaque(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("mouseDragged:"), function $_CPColorPanelPreview__mouseDragged_(self, _cmd, anEvent)
{
    var point = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "locationInWindow")), nil);
    ((___r1 = CPPasteboard.isa.objj_msgSend1(CPPasteboard, "pasteboardWithName:", CPDragPboard)), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "declareTypes:owner:", [CPColorDragType], self));
    var bounds = CGRectMake(0, 0, 15, 15);
    var dragView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", bounds)),
        dragFillView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectInset(bounds, 1.0, 1.0)));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "blackColor")));
    (dragFillView == null ? null : dragFillView.isa.objj_msgSend1(dragFillView, "setBackgroundColor:", self.isa.objj_msgSend0(self, "backgroundColor")));
    (dragView == null ? null : dragView.isa.objj_msgSend1(dragView, "addSubview:", dragFillView));
    self.isa.objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", dragView, CGPointMake(point.x - bounds.size.width / 2.0, point.y - bounds.size.height / 2.0), CGPointMake(0.0, 0.0), anEvent, nil, self, YES);
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $_CPColorPanelPreview__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{
    if (aType == CPColorDragType)
        (aPasteboard == null ? null : aPasteboard.isa.objj_msgSend2(aPasteboard, "setData:forType:", CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", self.isa.objj_msgSend0(self, "backgroundColor")), aType));
}
,["void","CPPasteboard","CPString"])]);
}objj_executeFile("CPColorPicker.j", YES);objj_executeFile("CPSliderColorPicker.j", YES);CPColorPanel.isa.objj_msgSend1(CPColorPanel, "provideColorPickerClass:", CPColorWheelColorPicker);
CPColorPanel.isa.objj_msgSend1(CPColorPanel, "provideColorPickerClass:", CPSliderColorPicker);
