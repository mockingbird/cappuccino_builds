@STATIC;1.0;i;10;CPButton.ji;10;CPCookie.ji;9;CPPanel.ji;14;CPPasteboard.ji;8;CPView.ji;15;CPColorPicker.ji;21;CPSliderColorPicker.jt;22709;objj_executeFile("CPButton.j", YES);objj_executeFile("CPCookie.j", YES);objj_executeFile("CPPanel.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPView.j", YES);CPWheelColorPickerMode = 1;
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
        objj_msgSend(self, "setTitle:", "Color Panel");
        objj_msgSend(self, "setLevel:", CPFloatingWindowLevel);
        objj_msgSend(self, "setFloatingPanel:", YES);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        objj_msgSend(self, "setMinSize:", CGSizeMake(219.0, 363.0));
        objj_msgSend(self, "setMaxSize:", CGSizeMake(323.0, 537.0));
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("setColor:"), function $CPColorPanel__setColor_(self, _cmd, aColor)
{
    self._color = aColor;
    objj_msgSend(self._previewView, "setBackgroundColor:", self._color);
    objj_msgSend(CPApp, "sendAction:to:from:", sel_getUid("changeColor:"), nil, self);
    if (self._target && self._action)
        objj_msgSend(CPApp, "sendAction:to:from:", self._action, self._target, self);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPColorPanelColorDidChangeNotification, self);
    objj_msgSend(self._activePicker, "setColor:", self._color);
    objj_msgSend(self._opacitySlider, "setFloatValue:", objj_msgSend(self._color, "alphaComponent"));
}
,["void","CPColor"]), new objj_method(sel_getUid("setColor:updatePicker:"), function $CPColorPanel__setColor_updatePicker_(self, _cmd, aColor, bool)
{
    objj_msgSend(self, "setColor:", aColor);
    if (bool)
        objj_msgSend(self._activePicker, "setColor:", self._color);
}
,["void","CPColor","BOOL"]), new objj_method(sel_getUid("color"), function $CPColorPanel__color(self, _cmd)
{
    return self._color;
}
,["CPColor"]), new objj_method(sel_getUid("opacity"), function $CPColorPanel__opacity(self, _cmd)
{
    return objj_msgSend(self._opacitySlider, "floatValue");
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
    var picker = self._colorPickers[objj_msgSend(sender, "tag")],
        view = objj_msgSend(picker, "provideNewView:", NO);
    if (!view)
        view = objj_msgSend(picker, "provideNewView:", YES);
    if (view == self._currentView)
        return;
    if (self._currentView)
        objj_msgSend(view, "setFrame:", objj_msgSend(self._currentView, "frame"));
    else
    {
        var height = TOOLBAR_HEIGHT + 10 + PREVIEW_HEIGHT + 5 + SWATCH_HEIGHT + 32,
            bounds = objj_msgSend(objj_msgSend(self, "contentView"), "bounds");
        objj_msgSend(view, "setFrameSize:", CGSizeMake(bounds.size.width - 10, bounds.size.height - height));
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(5, height));
    }
    objj_msgSend(self._currentView, "removeFromSuperview");
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", view);
    self._currentView = view;
    self._activePicker = picker;
    objj_msgSend(picker, "setColor:", objj_msgSend(self, "color"));
}
,["void","id"]), new objj_method(sel_getUid("mode"), function $CPColorPanel__mode(self, _cmd)
{
    return self._mode;
}
,["CPColorPanelMode"]), new objj_method(sel_getUid("orderFront:"), function $CPColorPanel__orderFront_(self, _cmd, aSender)
{
    objj_msgSend(self, "_loadContentsIfNecessary");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPanel").super_class }, "orderFront:", aSender);
}
,["void","id"]), new objj_method(sel_getUid("_loadContentsIfNecessary"), function $CPColorPanel___loadContentsIfNecessary(self, _cmd)
{
    if (self._toolbar)
        return;
    if (!self._color)
        self._color = objj_msgSend(CPColor, "whiteColor");
    self._colorPickers = [];
    var count = objj_msgSend(ColorPickerClasses, "count");
    for (var i = 0; i < count; i++)
    {
        var currentPickerClass = ColorPickerClasses[i],
            currentPicker = objj_msgSend(objj_msgSend(currentPickerClass, "alloc"), "initWithPickerMask:colorPanel:", 0, self);
        self._colorPickers.push(currentPicker);
    }
    var contentView = objj_msgSend(self, "contentView"),
        bounds = objj_msgSend(contentView, "bounds");
    self._toolbar = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 6, CGRectGetWidth(bounds), TOOLBAR_HEIGHT));
    objj_msgSend(self._toolbar, "setAutoresizingMask:", CPViewWidthSizable);
    var totalToolbarWidth = count * ICON_WIDTH + (count - 1) * ICON_PADDING,
        leftOffset = (CGRectGetWidth(bounds) - totalToolbarWidth) / 2.0,
        buttonForLater = nil;
    for (var i = 0; i < count; i++)
    {
        var image = objj_msgSend(self._colorPickers[i], "provideNewButtonImage"),
            highlightImage = objj_msgSend(self._colorPickers[i], "provideNewAlternateButtonImage"),
            button = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(leftOffset + i * (ICON_WIDTH + ICON_PADDING), 0, ICON_WIDTH, ICON_WIDTH));
        objj_msgSend(button, "setTag:", i);
        objj_msgSend(button, "setTarget:", self);
        objj_msgSend(button, "setAction:", sel_getUid("_setPicker:"));
        objj_msgSend(button, "setBordered:", NO);
        objj_msgSend(button, "setAutoresizingMask:", CPViewMinXMargin | CPViewMaxXMargin);
        objj_msgSend(button, "setImage:", image);
        objj_msgSend(button, "setAlternateImage:", highlightImage);
        objj_msgSend(self._toolbar, "addSubview:", button);
        if (!buttonForLater)
            buttonForLater = button;
    }
    var previewBox = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + 10, CGRectGetWidth(bounds) - 86, PREVIEW_HEIGHT));
    self._previewView = objj_msgSend(objj_msgSend(_CPColorPanelPreview, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(previewBox, "bounds"), 2.0, 2.0));
    objj_msgSend(self._previewView, "setColorPanel:", self);
    objj_msgSend(self._previewView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(previewBox, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithWhite:alpha:", 0.8, 1.0));
    objj_msgSend(previewBox, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(previewBox, "addSubview:", self._previewView);
    var _previewLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(10, TOOLBAR_HEIGHT + 10, 60, 15));
    objj_msgSend(_previewLabel, "setStringValue:", "Preview:");
    objj_msgSend(_previewLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(_previewLabel, "setAlignment:", CPRightTextAlignment);
    var swatchBox = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + 10 + PREVIEW_HEIGHT + 5, CGRectGetWidth(bounds) - 86, SWATCH_HEIGHT + 2.0));
    objj_msgSend(swatchBox, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithWhite:alpha:", 0.8, 1.0));
    objj_msgSend(swatchBox, "setAutoresizingMask:", CPViewWidthSizable);
    self._swatchView = objj_msgSend(objj_msgSend(_CPColorPanelSwatches, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(swatchBox, "bounds"), 1.0, 1.0));
    objj_msgSend(self._swatchView, "setColorPanel:", self);
    objj_msgSend(self._swatchView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(swatchBox, "addSubview:", self._swatchView);
    var _swatchLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(10, TOOLBAR_HEIGHT + 8 + PREVIEW_HEIGHT + 6, 60, 15));
    objj_msgSend(_swatchLabel, "setStringValue:", "Swatches:");
    objj_msgSend(_swatchLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(_swatchLabel, "setAlignment:", CPRightTextAlignment);
    var opacityLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(10, TOOLBAR_HEIGHT + PREVIEW_HEIGHT + 35, 60, 20));
    objj_msgSend(opacityLabel, "setStringValue:", "Opacity:");
    objj_msgSend(opacityLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(opacityLabel, "setAlignment:", CPRightTextAlignment);
    self._opacitySlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + PREVIEW_HEIGHT + 34, CGRectGetWidth(bounds) - 86, 20.0));
    objj_msgSend(self._opacitySlider, "setMinValue:", 0.0);
    objj_msgSend(self._opacitySlider, "setMaxValue:", 1.0);
    objj_msgSend(self._opacitySlider, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(self._opacitySlider, "setTarget:", self);
    objj_msgSend(self._opacitySlider, "setAction:", sel_getUid("setOpacity:"));
    objj_msgSend(contentView, "addSubview:", self._toolbar);
    objj_msgSend(contentView, "addSubview:", previewBox);
    objj_msgSend(contentView, "addSubview:", _previewLabel);
    objj_msgSend(contentView, "addSubview:", swatchBox);
    objj_msgSend(contentView, "addSubview:", _swatchLabel);
    objj_msgSend(contentView, "addSubview:", opacityLabel);
    objj_msgSend(contentView, "addSubview:", self._opacitySlider);
    self._target = nil;
    self._action = nil;
    self._activePicker = nil;
    objj_msgSend(self._previewView, "setBackgroundColor:", self._color);
    if (buttonForLater)
        objj_msgSend(self, "_setPicker:", buttonForLater);
}
,["void"]), new objj_method(sel_getUid("setOpacity:"), function $CPColorPanel__setOpacity_(self, _cmd, sender)
{
    var components = objj_msgSend(objj_msgSend(self, "color"), "components"),
        alpha = objj_msgSend(sender, "floatValue");
    objj_msgSend(self, "setColor:updatePicker:", objj_msgSend(self._color, "colorWithAlphaComponent:", alpha), YES);
}
,["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("provideColorPickerClass:"), function $CPColorPanel__provideColorPickerClass_(self, _cmd, aColorPickerSubclass)
{
    ColorPickerClasses.push(aColorPickerSubclass);
}
,["void","Class"]), new objj_method(sel_getUid("sharedColorPanel"), function $CPColorPanel__sharedColorPanel(self, _cmd)
{
    if (!SharedColorPanel)
        SharedColorPanel = objj_msgSend(objj_msgSend(CPColorPanel, "alloc"), "init");
    return SharedColorPanel;
}
,["CPColorPanel"]), new objj_method(sel_getUid("setPickerMode:"), function $CPColorPanel__setPickerMode_(self, _cmd, mode)
{
    var panel = objj_msgSend(CPColorPanel, "sharedColorPanel");
    objj_msgSend(panel, "setMode:", mode);
}
,["void","CPColorPanelMode"])]);
}CPColorDragType = "CPColorDragType";
var CPColorPanelSwatchesCookie = "CPColorPanelSwatchesCookie";
{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelSwatches"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_swatches"), new objj_ivar("_dragColor"), new objj_ivar("_colorPanel"), new objj_ivar("_swatchCookie")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPColorPanelSwatches__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPColorPanelSwatches").super_class }, "initWithFrame:", aFrame);
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPColorDragType));
    var whiteColor = objj_msgSend(CPColor, "whiteColor");
    self._swatchCookie = objj_msgSend(objj_msgSend(CPCookie, "alloc"), "initWithName:", CPColorPanelSwatchesCookie);
    var colorList = objj_msgSend(self, "startingColorList");
    self._swatches = [];
    for (var i = 0; i < 50; i++)
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(13 * i + 1, 1, 12, 12)),
            fillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(view, "bounds"), 1.0, 1.0));
        objj_msgSend(view, "setBackgroundColor:", whiteColor);
        objj_msgSend(fillView, "setBackgroundColor:", i < colorList.length ? colorList[i] : whiteColor);
        objj_msgSend(view, "addSubview:", fillView);
        objj_msgSend(self, "addSubview:", view);
        self._swatches.push(view);
    }
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("isOpaque"), function $_CPColorPanelSwatches__isOpaque(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("startingColorList"), function $_CPColorPanelSwatches__startingColorList(self, _cmd)
{
    var cookieValue = objj_msgSend(self._swatchCookie, "value");
    if (!cookieValue)
    {
        return [objj_msgSend(CPColor, "blackColor"), objj_msgSend(CPColor, "darkGrayColor"), objj_msgSend(CPColor, "grayColor"), objj_msgSend(CPColor, "lightGrayColor"), objj_msgSend(CPColor, "whiteColor"), objj_msgSend(CPColor, "redColor"), objj_msgSend(CPColor, "greenColor"), objj_msgSend(CPColor, "blueColor"), objj_msgSend(CPColor, "yellowColor")];
    }
    var cookieValue = eval(cookieValue),
        result = [];
    for (var i = 0; i < cookieValue.length; i++)
        result.push(objj_msgSend(CPColor, "colorWithHexString:", cookieValue[i]));
    return result;
}
,["CPArray"]), new objj_method(sel_getUid("saveColorList"), function $_CPColorPanelSwatches__saveColorList(self, _cmd)
{
    var result = [];
    for (var i = 0; i < self._swatches.length; i++)
        result.push(objj_msgSend(objj_msgSend(objj_msgSend(self._swatches[i], "subviews")[0], "backgroundColor"), "hexString"));
    var future = new Date();
    future.setYear(2019);
    objj_msgSend(self._swatchCookie, "setValue:expires:domain:", JSON.stringify(result), future, nil);
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
    return objj_msgSend(objj_msgSend(self._swatches[index], "subviews")[0], "backgroundColor");
}
,["CPColor","int"]), new objj_method(sel_getUid("setColor:atIndex:"), function $_CPColorPanelSwatches__setColor_atIndex_(self, _cmd, aColor, index)
{
    objj_msgSend(objj_msgSend(self._swatches[index], "subviews")[0], "setBackgroundColor:", aColor);
    objj_msgSend(self, "saveColorList");
}
,["void","CPColor","int"]), new objj_method(sel_getUid("mouseUp:"), function $_CPColorPanelSwatches__mouseUp_(self, _cmd, anEvent)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        bounds = objj_msgSend(self, "bounds");
    if (!CGRectContainsPoint(bounds, point) || point.x > objj_msgSend(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    objj_msgSend(self._colorPanel, "setColor:updatePicker:", objj_msgSend(self, "colorAtIndex:", FLOOR(point.x / 13)), YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseDragged:"), function $_CPColorPanelSwatches__mouseDragged_(self, _cmd, anEvent)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if (point.x > objj_msgSend(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", CPColorDragType), self);
    var swatch = self._swatches[FLOOR(point.x / 13)];
    self._dragColor = objj_msgSend(objj_msgSend(swatch, "subviews")[0], "backgroundColor");
    var bounds = CGRectMakeCopy(objj_msgSend(swatch, "bounds"));
    var dragView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", bounds),
        dragFillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(bounds, 1.0, 1.0));
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(dragFillView, "setBackgroundColor:", self._dragColor);
    objj_msgSend(dragView, "addSubview:", dragFillView);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", dragView, CGPointMake(point.x - bounds.size.width / 2.0, point.y - bounds.size.height / 2.0), CGPointMake(0.0, 0.0), anEvent, nil, self, YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $_CPColorPanelSwatches__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{
    if (aType == CPColorDragType)
        objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", self._dragColor), aType);
}
,["void","CPPasteboard","CPString"]), new objj_method(sel_getUid("performDragOperation:"), function $_CPColorPanelSwatches__performDragOperation_(self, _cmd, aSender)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(aSender, "draggingLocation"), nil),
        pasteboard = objj_msgSend(aSender, "draggingPasteboard"),
        swatch = nil;
    if (!objj_msgSend(pasteboard, "availableTypeFromArray:", [CPColorDragType]) || location.x > objj_msgSend(self, "bounds").size.width - 1 || location.x < 1)
        return NO;
    objj_msgSend(self, "setColor:atIndex:", objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(pasteboard, "dataForType:", CPColorDragType)), FLOOR(location.x / 13));
}
,["void","id"])]);
}{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelPreview"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_colorPanel")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPColorPanelPreview__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPColorPanelPreview").super_class }, "initWithFrame:", aFrame);
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPColorDragType));
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
    var pasteboard = objj_msgSend(aSender, "draggingPasteboard");
    if (!objj_msgSend(pasteboard, "availableTypeFromArray:", [CPColorDragType]))
        return NO;
    var color = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(pasteboard, "dataForType:", CPColorDragType));
    objj_msgSend(self._colorPanel, "setColor:updatePicker:", color, YES);
}
,["void","id"]), new objj_method(sel_getUid("isOpaque"), function $_CPColorPanelPreview__isOpaque(self, _cmd)
{
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("mouseDragged:"), function $_CPColorPanelPreview__mouseDragged_(self, _cmd, anEvent)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", [CPColorDragType], self);
    var bounds = CGRectMake(0, 0, 15, 15);
    var dragView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", bounds),
        dragFillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(bounds, 1.0, 1.0));
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(dragFillView, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    objj_msgSend(dragView, "addSubview:", dragFillView);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", dragView, CGPointMake(point.x - bounds.size.width / 2.0, point.y - bounds.size.height / 2.0), CGPointMake(0.0, 0.0), anEvent, nil, self, YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function $_CPColorPanelPreview__pasteboard_provideDataForType_(self, _cmd, aPasteboard, aType)
{
    if (aType == CPColorDragType)
        objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", objj_msgSend(self, "backgroundColor")), aType);
}
,["void","CPPasteboard","CPString"])]);
}objj_executeFile("CPColorPicker.j", YES);objj_executeFile("CPSliderColorPicker.j", YES);objj_msgSend(CPColorPanel, "provideColorPickerClass:", CPColorWheelColorPicker);
objj_msgSend(CPColorPanel, "provideColorPickerClass:", CPSliderColorPicker);
