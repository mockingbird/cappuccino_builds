@STATIC;1.0;I;23;Foundation/CPIndexSet.ji;10;CPCursor.ji;14;CPPasteboard.ji;15;CPTableColumn.ji;8;CPView.ji;21;_CPImageAndTextView.jt;42716;objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("CPCursor.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPTableColumn.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPTableColumnHeaderView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_textField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPTableColumnHeaderView__initWithFrame_(self, _cmd, frame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTableColumnHeaderView").super_class }, "initWithFrame:", frame);
    if (self)
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $_CPTableColumnHeaderView___init(self, _cmd)
{
    self._textField = ((___r1 = _CPImageAndTextView.isa.objj_msgSend0(_CPImageAndTextView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", CPLineBreakByTruncatingTail));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", CPLeftTextAlignment));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setVerticalAlignment:", CPCenterVerticalTextAlignment));
    self.isa.objj_msgSend1(self, "addSubview:", self._textField);
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTableColumnHeaderView__layoutSubviews(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "background-color"));
    var inset = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-inset"),
        bounds = self.isa.objj_msgSend0(self, "bounds");
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(inset.right, inset.top, bounds.size.width - inset.right - inset.left, bounds.size.height - inset.top - inset.bottom)));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-color")));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFont:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "font")));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-shadow-color")));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextShadowOffset:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-shadow-offset")));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAlignment:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-alignment")));
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setLineBreakMode:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "line-break-mode")));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setStringValue:"), function $_CPTableColumnHeaderView__setStringValue_(self, _cmd, string)
{
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setText:", string));
    var ___r1;
}
,["void","CPString"]), new objj_method(sel_getUid("stringValue"), function $_CPTableColumnHeaderView__stringValue(self, _cmd)
{
    return ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "text"));
    var ___r1;
}
,["CPString"]), new objj_method(sel_getUid("textField"), function $_CPTableColumnHeaderView__textField(self, _cmd)
{
    return self._textField;
}
,["void"]), new objj_method(sel_getUid("sizeToFit"), function $_CPTableColumnHeaderView__sizeToFit(self, _cmd)
{
    ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "sizeToFit"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("setFont:"), function $_CPTableColumnHeaderView__setFont_(self, _cmd, aFont)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", aFont, "font");
}
,["void","CPFont"]), new objj_method(sel_getUid("font"), function $_CPTableColumnHeaderView__font(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "font");
}
,["CPFont"]), new objj_method(sel_getUid("setAlignment:"), function $_CPTableColumnHeaderView__setAlignment_(self, _cmd, alignment)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", alignment, "text-alignment");
}
,["void","CPTextAlignment"]), new objj_method(sel_getUid("alignment"), function $_CPTableColumnHeaderView__alignment(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-alignment");
}
,["CPTextAlignment"]), new objj_method(sel_getUid("setLineBreakMode:"), function $_CPTableColumnHeaderView__setLineBreakMode_(self, _cmd, mode)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", mode, "line-break-mode");
}
,["void","CPLineBreakMode"]), new objj_method(sel_getUid("lineBreakMode"), function $_CPTableColumnHeaderView__lineBreakMode(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "line-break-mode");
}
,["CPLineBreakMode"]), new objj_method(sel_getUid("setTextColor:"), function $_CPTableColumnHeaderView__setTextColor_(self, _cmd, aColor)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", aColor, "text-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $_CPTableColumnHeaderView__textColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-color");
}
,["CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPTableColumnHeaderView__setTextShadowColor_(self, _cmd, aColor)
{
    self.isa.objj_msgSend2(self, "setValue:forThemeAttribute:", aColor, "text-shadow-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPTableColumnHeaderView__textShadowColor(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "text-shadow-color");
}
,["CPColor"]), new objj_method(sel_getUid("_setIndicatorImage:"), function $_CPTableColumnHeaderView___setIndicatorImage_(self, _cmd, anImage)
{
    if (anImage)
    {
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImage:", anImage));
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImagePosition:", CPImageRight));
    }
    else
    {
        ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setImagePosition:", CPNoImage));
    }
    var ___r1;
}
,["void","CPImage"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPTableColumnHeaderView__defaultThemeClass(self, _cmd)
{
    return "columnHeader";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPTableColumnHeaderView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "background-color", CPLeftTextAlignment, "text-alignment", CPLineBreakByTruncatingTail, "line-break-mode", CGInsetMakeZero(), "text-inset", CPNull.isa.objj_msgSend0(CPNull, "null"), "text-color", CPNull.isa.objj_msgSend0(CPNull, "null"), "font", CPNull.isa.objj_msgSend0(CPNull, "null"), "text-shadow-color", CGSizeMakeZero(), "text-shadow-offset");
}
,["CPDictionary"])]);
}var _CPTableColumnHeaderViewStringValueKey = "_CPTableColumnHeaderViewStringValueKey",
    _CPTableColumnHeaderViewFontKey = "_CPTableColumnHeaderViewFontKey",
    _CPTableColumnHeaderViewTextColorKey = "_CPTableColumnHeaderViewTextColorKey",
    _CPTableColumnHeaderViewTextShadowColorKey = "_CPTableColumnHeaderViewTextShadowColorKey",
    _CPTableColumnHeaderViewAlignmentKey = "_CPTableColumnHeaderViewAlignmentKey",
    _CPTableColumnHeaderViewLineBreakModeKey = "_CPTableColumnHeaderViewLineBreakModeKey",
    _CPTableColumnHeaderViewImageKey = "_CPTableColumnHeaderViewImageKey";
{
var the_class = objj_getClass("_CPTableColumnHeaderView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPTableColumnHeaderView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $_CPTableColumnHeaderView__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTableColumnHeaderView").super_class }, "initWithCoder:", aCoder))
    {
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
        (self == null ? null : self.isa.objj_msgSend1(self, "_setIndicatorImage:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewImageKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setStringValue:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewStringValueKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setFont:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewFontKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTextColor:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewTextColorKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTextShadowColor:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewTextShadowColorKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlignment:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", _CPTableColumnHeaderViewAlignmentKey))));
        (self == null ? null : self.isa.objj_msgSend1(self, "setLineBreakMode:", (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", _CPTableColumnHeaderViewLineBreakModeKey))));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPTableColumnHeaderView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTableColumnHeaderView").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "text")), _CPTableColumnHeaderViewStringValueKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", ((___r1 = self._textField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "image")), _CPTableColumnHeaderViewImageKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "font"), _CPTableColumnHeaderViewFontKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "textColor"), _CPTableColumnHeaderViewTextColorKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self.isa.objj_msgSend0(self, "textShadowColor"), _CPTableColumnHeaderViewTextShadowColorKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self.isa.objj_msgSend0(self, "alignment"), _CPTableColumnHeaderViewAlignmentKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self.isa.objj_msgSend0(self, "lineBreakMode"), _CPTableColumnHeaderViewLineBreakModeKey));
    var ___r1;
}
,["void","CPCoder"])]);
}{var the_class = objj_allocateClassPair(CPView, "CPTableHeaderView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_mouseDownLocation"), new objj_ivar("_previousTrackingLocation"), new objj_ivar("_activeColumn"), new objj_ivar("_pressedColumn"), new objj_ivar("_lastDragDestinationColumnIndex"), new objj_ivar("_isResizing"), new objj_ivar("_isDragging"), new objj_ivar("_isTrackingColumn"), new objj_ivar("_drawsColumnLines"), new objj_ivar("_columnOldWidth"), new objj_ivar("_tableView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("tableView"), function $CPTableHeaderView__tableView(self, _cmd)
{
    return self._tableView;
}
,["CPTableView"]), new objj_method(sel_getUid("setTableView:"), function $CPTableHeaderView__setTableView_(self, _cmd, newValue)
{
    self._tableView = newValue;
}
,["void","CPTableView"]), new objj_method(sel_getUid("_init"), function $CPTableHeaderView___init(self, _cmd)
{
    self._mouseDownLocation = CGPointMakeZero();
    self._previousTrackingLocation = CGPointMakeZero();
    self._activeColumn = -1;
    self._pressedColumn = -1;
    self._isResizing = NO;
    self._isDragging = NO;
    self._isTrackingColumn = NO;
    self._drawsColumnLines = YES;
    self._columnOldWidth = 0.0;
    self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "background-color"));
}
,["void"]), new objj_method(sel_getUid("initWithFrame:"), function $CPTableHeaderView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableHeaderView").super_class }, "initWithFrame:", aFrame);
    if (self)
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("columnAtPoint:"), function $CPTableHeaderView__columnAtPoint_(self, _cmd, aPoint)
{
    return ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "columnAtPoint:", CGPointMake(aPoint.x, aPoint.y)));
    var ___r1;
}
,["int","CGPoint"]), new objj_method(sel_getUid("headerRectOfColumn:"), function $CPTableHeaderView__headerRectOfColumn_(self, _cmd, aColumnIndex)
{
    var headerRect = CGRectMakeCopy(self.isa.objj_msgSend0(self, "bounds")),
        columnRect = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "rectOfColumn:", aColumnIndex));
    headerRect.origin.x = CGRectGetMinX(columnRect);
    headerRect.size.width = CGRectGetWidth(columnRect);
    return headerRect;
    var ___r1;
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("setDrawsColumnLines:"), function $CPTableHeaderView__setDrawsColumnLines_(self, _cmd, aFlag)
{
    self._drawsColumnLines = aFlag;
}
,["void","BOOL"]), new objj_method(sel_getUid("drawsColumnLines"), function $CPTableHeaderView__drawsColumnLines(self, _cmd)
{
    return self._drawsColumnLines;
}
,["BOOL"]), new objj_method(sel_getUid("_cursorRectForColumn:"), function $CPTableHeaderView___cursorRectForColumn_(self, _cmd, column)
{
    if (column == -1 || !(((___r1 = self._tableView._tableColumns[column]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "resizingMask")) & CPTableColumnUserResizingMask))
        return CGRectMakeZero();
    var rect = self.isa.objj_msgSend1(self, "headerRectOfColumn:", column);
    rect.origin.x = CGRectGetMaxX(rect) - 5;
    rect.size.width = 20;
    return rect;
    var ___r1;
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("_setPressedColumn:"), function $CPTableHeaderView___setPressedColumn_(self, _cmd, column)
{
    if (self._pressedColumn != -1)
    {
        var headerView = ((___r1 = self._tableView._tableColumns[self._pressedColumn]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "headerView"));
        (headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "unsetThemeState:", CPThemeStateHighlighted));
    }
    if (column != -1)
    {
        var headerView = ((___r1 = self._tableView._tableColumns[column]), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "headerView"));
        (headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "setThemeState:", CPThemeStateHighlighted));
        if (self._tableView._editingCellIndex || self._tableView._editingColumn == column)
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeFirstResponder:", self._tableView));
    }
    self._pressedColumn = column;
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("mouseDown:"), function $CPTableHeaderView__mouseDown_(self, _cmd, theEvent)
{
    self.isa.objj_msgSend1(self, "trackMouse:", theEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("trackMouse:"), function $CPTableHeaderView__trackMouse_(self, _cmd, theEvent)
{
    var type = (theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "type")),
        currentLocation = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "locationInWindow")), nil);
    currentLocation.x -= 5.0;
    var columnIndex = self.isa.objj_msgSend1(self, "columnAtPoint:", currentLocation),
        shouldResize = self.isa.objj_msgSend2(self, "shouldResizeTableColumn:at:", columnIndex, CGPointMake(currentLocation.x + 5.0, currentLocation.y));
    if (type === CPLeftMouseUp)
    {
        if (shouldResize)
            self.isa.objj_msgSend2(self, "stopResizingTableColumn:at:", self._activeColumn, currentLocation);
        else if (self.isa.objj_msgSend2(self, "_shouldStopTrackingTableColumn:at:", columnIndex, currentLocation))
        {
            ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_didClickTableColumn:modifierFlags:", columnIndex, (theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "modifierFlags"))));
            self.isa.objj_msgSend2(self, "stopTrackingTableColumn:at:", columnIndex, currentLocation);
            self._isTrackingColumn = NO;
        }
        self.isa.objj_msgSend1(self, "_updateResizeCursor:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")));
        self._activeColumn = CPNotFound;
        return;
    }
    if (type === CPLeftMouseDown)
    {
        if (columnIndex === -1)
            return;
        self._mouseDownLocation = currentLocation;
        self._activeColumn = columnIndex;
        ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_sendDelegateMouseDownInHeaderOfTableColumn:", columnIndex));
        if (shouldResize)
            self.isa.objj_msgSend2(self, "startResizingTableColumn:at:", columnIndex, currentLocation);
        else
        {
            self.isa.objj_msgSend2(self, "startTrackingTableColumn:at:", columnIndex, currentLocation);
            self._isTrackingColumn = YES;
        }
    }
    else if (type === CPLeftMouseDragged)
    {
        if (shouldResize)
            self.isa.objj_msgSend2(self, "continueResizingTableColumn:at:", self._activeColumn, currentLocation);
        else
        {
            if (self._activeColumn === columnIndex && CGRectContainsPoint(self.isa.objj_msgSend1(self, "headerRectOfColumn:", columnIndex), currentLocation))
            {
                if (self._isTrackingColumn && self._pressedColumn !== -1)
                {
                    if (!self.isa.objj_msgSend2(self, "continueTrackingTableColumn:at:", columnIndex, currentLocation))
                        return;
                }
                else
                    self.isa.objj_msgSend2(self, "startTrackingTableColumn:at:", columnIndex, currentLocation);
            }
            else if (self._isTrackingColumn && self._pressedColumn !== -1)
                self.isa.objj_msgSend2(self, "stopTrackingTableColumn:at:", self._activeColumn, currentLocation);
        }
    }
    self._previousTrackingLocation = currentLocation;
    (CPApp == null ? null : CPApp.isa.objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMouse:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("startTrackingTableColumn:at:"), function $CPTableHeaderView__startTrackingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    self._lastDragDestinationColumnIndex = -1;
    self.isa.objj_msgSend1(self, "_setPressedColumn:", aColumnIndex);
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("continueTrackingTableColumn:at:"), function $CPTableHeaderView__continueTrackingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    if (self.isa.objj_msgSend2(self, "_shouldDragTableColumn:at:", aColumnIndex, aPoint))
    {
        var columnRect = self.isa.objj_msgSend1(self, "headerRectOfColumn:", aColumnIndex),
            offset = CGPointMakeZero(),
            view = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "_dragViewForColumn:event:offset:", aColumnIndex, (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")), offset)),
            viewLocation = CGPointMakeZero();
        viewLocation.x = CGRectGetMinX(columnRect) + offset.x + (aPoint.x - self._mouseDownLocation.x);
        viewLocation.y = CGRectGetMinY(columnRect) + offset.y;
        self.isa.objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", view, viewLocation, CGSizeMakeZero(), (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")), CPPasteboard.isa.objj_msgSend1(CPPasteboard, "pasteboardWithName:", CPDragPboard), self, YES);
        return NO;
    }
    return YES;
    var ___r1;
}
,["BOOL","CPInteger","CGPoint"]), new objj_method(sel_getUid("_shouldStopTrackingTableColumn:at:"), function $CPTableHeaderView___shouldStopTrackingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    return self._isTrackingColumn && self._activeColumn === aColumnIndex && CGRectContainsPoint(self.isa.objj_msgSend1(self, "headerRectOfColumn:", aColumnIndex), aPoint);
}
,["BOOL","CPInteger","CGPoint"]), new objj_method(sel_getUid("stopTrackingTableColumn:at:"), function $CPTableHeaderView__stopTrackingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    self.isa.objj_msgSend1(self, "_setPressedColumn:", CPNotFound);
    self.isa.objj_msgSend1(self, "_updateResizeCursor:", (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "currentEvent")));
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("_shouldDragTableColumn:at:"), function $CPTableHeaderView___shouldDragTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    return ABS(aPoint.x - self._mouseDownLocation.x) >= 10.0 && ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_sendDelegateShouldReorderColumn:toColumn:", aColumnIndex, -1));
    var ___r1;
}
,["BOOL","CPInteger","CGPoint"]), new objj_method(sel_getUid("_headerRectOfLastVisibleColumn"), function $CPTableHeaderView___headerRectOfLastVisibleColumn(self, _cmd)
{
    var tableColumns = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tableColumns")),
        columnIndex = (tableColumns == null ? null : tableColumns.isa.objj_msgSend0(tableColumns, "count"));
    while (columnIndex--)
    {
        var tableColumn = (tableColumns == null ? null : tableColumns.isa.objj_msgSend1(tableColumns, "objectAtIndex:", columnIndex));
        if (!(tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "isHidden")))
            return self.isa.objj_msgSend1(self, "headerRectOfColumn:", columnIndex);
    }
    return nil;
    var ___r1;
}
,["CGRect"]), new objj_method(sel_getUid("_constrainDragView:at:"), function $CPTableHeaderView___constrainDragView_at_(self, _cmd, theDragView, aPoint)
{
    var tableColumns = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tableColumns")),
        lastColumnRect = self.isa.objj_msgSend0(self, "_headerRectOfLastVisibleColumn"),
        activeColumnRect = self.isa.objj_msgSend1(self, "headerRectOfColumn:", self._activeColumn),
        dragWindow = (theDragView == null ? null : theDragView.isa.objj_msgSend0(theDragView, "window")),
        frame = (dragWindow == null ? null : dragWindow.isa.objj_msgSend0(dragWindow, "frame"));
    frame.origin = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertGlobalToBase:", frame.origin));
    frame.origin = self.isa.objj_msgSend2(self, "convertPoint:fromView:", frame.origin, nil);
    frame.origin.x = MAX(0.0, MIN(CGRectGetMinX(frame), CGRectGetMaxX(lastColumnRect) - CGRectGetWidth(activeColumnRect)));
    frame.origin.y = CGRectGetMinY(lastColumnRect);
    frame.origin = self.isa.objj_msgSend2(self, "convertPoint:toView:", frame.origin, nil);
    frame.origin = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertBaseToGlobal:", frame.origin));
    (dragWindow == null ? null : dragWindow.isa.objj_msgSend1(dragWindow, "setFrame:", frame));
    var ___r1;
}
,["void","CPView","CGPoint"]), new objj_method(sel_getUid("_moveColumn:toColumn:"), function $CPTableHeaderView___moveColumn_toColumn_(self, _cmd, aFromIndex, aToIndex)
{
    if (((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_sendDelegateShouldReorderColumn:toColumn:", aFromIndex, aToIndex)))
    {
        ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "moveColumn:toColumn:", aFromIndex, aToIndex));
        self._activeColumn = aToIndex;
        self._pressedColumn = self._activeColumn;
    }
    var ___r1;
}
,["void","CPInteger","CPInteger"]), new objj_method(sel_getUid("draggedView:beganAt:"), function $CPTableHeaderView__draggedView_beganAt_(self, _cmd, aView, aPoint)
{
    self._isDragging = YES;
    var column = ((___r1 = ((___r2 = self._tableView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableColumns"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", self._activeColumn));
    ((___r1 = (column == null ? null : column.isa.objj_msgSend0(column, "headerView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", YES));
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setDraggedColumn:", column));
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    var ___r1, ___r2;
}
,["void","CPView","CGPoint"]), new objj_method(sel_getUid("draggedView:movedTo:"), function $CPTableHeaderView__draggedView_movedTo_(self, _cmd, aView, aPoint)
{
    self.isa.objj_msgSend2(self, "_constrainDragView:at:", aView, aPoint);
    var dragWindow = (aView == null ? null : aView.isa.objj_msgSend0(aView, "window")),
        dragWindowFrame = (dragWindow == null ? null : dragWindow.isa.objj_msgSend0(dragWindow, "frame"));
    var hoverPoint = CGPointCreateCopy(aPoint);
    if (aPoint.x < self._previousTrackingLocation.x)
        hoverPoint = CGPointMake(CGRectGetMinX(dragWindowFrame), CGRectGetMinY(dragWindowFrame));
    else if (aPoint.x > self._previousTrackingLocation.x)
        hoverPoint = CGPointMake(CGRectGetMaxX(dragWindowFrame), CGRectGetMinY(dragWindowFrame));
    hoverPoint = ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "convertGlobalToBase:", hoverPoint));
    hoverPoint = self.isa.objj_msgSend2(self, "convertPoint:fromView:", hoverPoint, nil);
    var hoveredColumn = self.isa.objj_msgSend1(self, "columnAtPoint:", hoverPoint);
    if (hoveredColumn !== self._lastDragDestinationColumnIndex && hoveredColumn !== -1)
    {
        var columnRect = self.isa.objj_msgSend1(self, "headerRectOfColumn:", hoveredColumn),
            columnCenterPoint = self.isa.objj_msgSend2(self, "convertPoint:fromView:", CGPointMake(CGRectGetMidX(columnRect), CGRectGetMidY(columnRect)), self);
        if (hoveredColumn < self._activeColumn && hoverPoint.x < columnCenterPoint.x)
        {
            self.isa.objj_msgSend2(self, "_moveColumn:toColumn:", self._activeColumn, hoveredColumn);
            self._lastDragDestinationColumnIndex = hoveredColumn;
        }
        else if (hoveredColumn > self._activeColumn && hoverPoint.x > columnCenterPoint.x)
        {
            self.isa.objj_msgSend2(self, "_moveColumn:toColumn:", self._activeColumn, hoveredColumn);
            self._lastDragDestinationColumnIndex = hoveredColumn;
        }
    }
    self._previousTrackingLocation = aPoint;
    var ___r1;
}
,["void","CPView","CGPoint"]), new objj_method(sel_getUid("draggedView:endedAt:operation:"), function $CPTableHeaderView__draggedView_endedAt_operation_(self, _cmd, aView, aLocation, anOperation)
{
    self._isDragging = NO;
    self._isTrackingColumn = NO;
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "_setDraggedColumn:", nil));
    ((___r1 = ((___r2 = ((___r3 = ((___r4 = self._tableView), ___r4 == null ? null : ___r4.isa.objj_msgSend0(___r4, "tableColumns"))), ___r3 == null ? null : ___r3.isa.objj_msgSend1(___r3, "objectAtIndex:", self._activeColumn))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "headerView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setHidden:", NO));
    self.isa.objj_msgSend2(self, "stopTrackingTableColumn:at:", self._activeColumn, aLocation);
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "_enqueueDraggingViews"));
    var ___r1, ___r2, ___r3, ___r4;
}
,["void","CPImage","CGPoint","CPDragOperation"]), new objj_method(sel_getUid("shouldResizeTableColumn:at:"), function $CPTableHeaderView__shouldResizeTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    if (self._isResizing)
        return YES;
    if (self._isTrackingColumn)
        return NO;
    return ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allowsColumnResizing")) && CGRectContainsPoint(self.isa.objj_msgSend1(self, "_cursorRectForColumn:", aColumnIndex), aPoint);
    var ___r1;
}
,["BOOL","CPInteger","CGPoint"]), new objj_method(sel_getUid("startResizingTableColumn:at:"), function $CPTableHeaderView__startResizingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    self._isResizing = YES;
    var tableColumn = ((___r1 = ((___r2 = self._tableView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableColumns"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aColumnIndex));
    (tableColumn == null ? null : tableColumn.isa.objj_msgSend1(tableColumn, "setDisableResizingPosting:", YES));
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDisableAutomaticResizing:", YES));
    var ___r1, ___r2;
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("continueResizingTableColumn:at:"), function $CPTableHeaderView__continueResizingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    var tableColumn = ((___r1 = ((___r2 = self._tableView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableColumns"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aColumnIndex)),
        newWidth = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "width")) + aPoint.x - self._previousTrackingLocation.x;
    if (newWidth < (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "minWidth")))
        ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "resizeRightCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    else if (newWidth > (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "maxWidth")))
        ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "resizeLeftCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    else
    {
        self._tableView._lastColumnShouldSnap = NO;
        (tableColumn == null ? null : tableColumn.isa.objj_msgSend1(tableColumn, "setWidth:", newWidth));
        ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "resizeLeftRightCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        self.isa.objj_msgSend0(self, "setNeedsLayout");
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    }
    var ___r1, ___r2;
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("stopResizingTableColumn:at:"), function $CPTableHeaderView__stopResizingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    var tableColumn = ((___r1 = ((___r2 = self._tableView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableColumns"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", aColumnIndex));
    (tableColumn == null ? null : tableColumn.isa.objj_msgSend1(tableColumn, "_postDidResizeNotificationWithOldWidth:", self._columnOldWidth));
    (tableColumn == null ? null : tableColumn.isa.objj_msgSend1(tableColumn, "setDisableResizingPosting:", NO));
    ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDisableAutomaticResizing:", NO));
    self._isResizing = NO;
    var ___r1, ___r2;
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("_updateResizeCursor:"), function $CPTableHeaderView___updateResizeCursor_(self, _cmd, theEvent)
{
    if (!((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "allowsColumnResizing")) || (theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "type")) === CPLeftMouseUp && !((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "acceptsMouseMovedEvents")))
    {
        ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        return;
    }
    var mouseLocation = self.isa.objj_msgSend2(self, "convertPoint:fromView:", (theEvent == null ? null : theEvent.isa.objj_msgSend0(theEvent, "locationInWindow")), nil),
        mouseOverLocation = CGPointMake(mouseLocation.x - 5, mouseLocation.y),
        overColumn = self.isa.objj_msgSend1(self, "columnAtPoint:", mouseOverLocation);
    if (overColumn >= 0 && CGRectContainsPoint(self.isa.objj_msgSend1(self, "_cursorRectForColumn:", overColumn), mouseLocation))
    {
        var tableColumn = ((___r1 = ((___r2 = self._tableView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "tableColumns"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", overColumn)),
            width = (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "width"));
        if (width == (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "minWidth")))
            ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "resizeRightCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else if (width == (tableColumn == null ? null : tableColumn.isa.objj_msgSend0(tableColumn, "maxWidth")))
            ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "resizeLeftCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
        else
            ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "resizeLeftRightCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    }
    else
        ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    var ___r1, ___r2;
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseEntered:"), function $CPTableHeaderView__mouseEntered_(self, _cmd, theEvent)
{
    self.isa.objj_msgSend1(self, "_updateResizeCursor:", theEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseMoved:"), function $CPTableHeaderView__mouseMoved_(self, _cmd, theEvent)
{
    self.isa.objj_msgSend1(self, "_updateResizeCursor:", theEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $CPTableHeaderView__mouseExited_(self, _cmd, theEvent)
{
    ((___r1 = CPCursor.isa.objj_msgSend0(CPCursor, "arrowCursor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    var ___r1;
}
,["void","CPEvent"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTableHeaderView__layoutSubviews(self, _cmd)
{
    var tableColumns = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tableColumns")),
        count = (tableColumns == null ? null : tableColumns.isa.objj_msgSend0(tableColumns, "count")),
        lineThickness = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "divider-thickness");
    for (var i = 0; i < count; i++)
    {
        var column = (tableColumns == null ? null : tableColumns.isa.objj_msgSend1(tableColumns, "objectAtIndex:", i)),
            headerView = (column == null ? null : column.isa.objj_msgSend0(column, "headerView")),
            frame = self.isa.objj_msgSend1(self, "headerRectOfColumn:", i);
        frame.origin.x -= 0.5;
        frame.size.width -= lineThickness;
        frame.size.height -= 0.5;
        (headerView == null ? null : headerView.isa.objj_msgSend1(headerView, "setFrame:", frame));
        if ((headerView == null ? null : headerView.isa.objj_msgSend0(headerView, "superview")) != self)
            self.isa.objj_msgSend1(self, "addSubview:", headerView);
    }
    self.isa.objj_msgSend1(self, "setBackgroundColor:", self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "background-color"));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("drawRect:"), function $CPTableHeaderView__drawRect_(self, _cmd, aRect)
{
    if (!self._tableView || !self.isa.objj_msgSend0(self, "drawsColumnLines"))
        return;
    var context = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort")),
        exposedColumnIndexes = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "columnIndexesInRect:", aRect)),
        columnsArray = [],
        tableColumns = ((___r1 = self._tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tableColumns")),
        exposedTableColumns = self._tableView._exposedColumns,
        firstIndex = (exposedTableColumns == null ? null : exposedTableColumns.isa.objj_msgSend0(exposedTableColumns, "firstIndex")),
        exposedRange = CPMakeRange(firstIndex, (exposedTableColumns == null ? null : exposedTableColumns.isa.objj_msgSend0(exposedTableColumns, "lastIndex")) - firstIndex + 1),
        lineThickness = self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "divider-thickness");
    CGContextSetLineWidth(context, lineThickness);
    CGContextSetStrokeColor(context, self.isa.objj_msgSend1(self, "currentValueForThemeAttribute:", "divider-color"));
    (exposedColumnIndexes == null ? null : exposedColumnIndexes.isa.objj_msgSend3(exposedColumnIndexes, "getIndexes:maxCount:inIndexRange:", columnsArray, -1, exposedRange));
    var columnArrayIndex = 0,
        columnArrayCount = columnsArray.length,
        columnMaxX;
    CGContextBeginPath(context);
    for (; columnArrayIndex < columnArrayCount; columnArrayIndex++)
    {
        var columnIndex = columnsArray[columnArrayIndex],
            columnToStroke = self.isa.objj_msgSend1(self, "headerRectOfColumn:", columnIndex);
        columnMaxX = CGRectGetMaxX(columnToStroke);
        CGContextMoveToPoint(context, FLOOR(columnMaxX) - 0.5 * lineThickness, ROUND(CGRectGetMinY(columnToStroke)));
        CGContextAddLineToPoint(context, FLOOR(columnMaxX) - 0.5 * lineThickness, ROUND(CGRectGetMaxY(columnToStroke)) - 1.0);
    }
    CGContextClosePath(context);
    CGContextStrokePath(context);
    var ___r1;
}
,["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPTableHeaderView__defaultThemeClass(self, _cmd)
{
    return "tableHeaderRow";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPTableHeaderView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPNull.isa.objj_msgSend0(CPNull, "null"), "background-color", CPColor.isa.objj_msgSend0(CPColor, "grayColor"), "divider-color", 1.0, "divider-thickness");
}
,["CPDictionary"])]);
}var CPTableHeaderViewTableViewKey = "CPTableHeaderViewTableViewKey",
    CPTableHeaderViewDrawsColumnLines = "CPTableHeaderViewDrawsColumnLines";
{
var the_class = objj_getClass("CPTableHeaderView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTableHeaderView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTableHeaderView__initWithCoder_(self, _cmd, aCoder)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableHeaderView").super_class }, "initWithCoder:", aCoder))
    {
        (self == null ? null : self.isa.objj_msgSend0(self, "_init"));
        self._tableView = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTableHeaderViewTableViewKey));
        if ((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "containsValueForKey:", CPTableHeaderViewDrawsColumnLines)))
            self._drawsColumnLines = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeBoolForKey:", CPTableHeaderViewDrawsColumnLines));
        else
        {
            self._drawsColumnLines = YES;
            CPLog.warn("The tableview header being decoded is using an old cib. Please run Nib2Cib.");
        }
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTableHeaderView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableHeaderView").super_class }, "encodeWithCoder:", aCoder);
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._tableView, CPTableHeaderViewTableViewKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeBool:forKey:", self._drawsColumnLines, CPTableHeaderViewDrawsColumnLines));
}
,["void","CPCoder"])]);
}