@STATIC;1.0;I;23;Foundation/CPIndexSet.ji;10;CPCursor.ji;14;CPPasteboard.ji;15;CPTableColumn.ji;8;CPView.ji;21;_CPImageAndTextView.jt;34328;objj_executeFile("Foundation/CPIndexSet.j", NO);objj_executeFile("CPCursor.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPTableColumn.j", YES);objj_executeFile("CPView.j", YES);objj_executeFile("_CPImageAndTextView.j", YES);{var the_class = objj_allocateClassPair(CPView, "_CPTableColumnHeaderView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_textField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $_CPTableColumnHeaderView__initWithFrame_(self, _cmd, frame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTableColumnHeaderView").super_class }, "initWithFrame:", frame);
    if (self)
        objj_msgSend(self, "_init");
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("_init"), function $_CPTableColumnHeaderView___init(self, _cmd)
{
    self._textField = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(self._textField, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self._textField, "setLineBreakMode:", CPLineBreakByTruncatingTail);
    objj_msgSend(self._textField, "setAlignment:", CPLeftTextAlignment);
    objj_msgSend(self._textField, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
    objj_msgSend(self, "addSubview:", self._textField);
}
,["void"]), new objj_method(sel_getUid("layoutSubviews"), function $_CPTableColumnHeaderView__layoutSubviews(self, _cmd)
{
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "background-color"));
    var inset = objj_msgSend(self, "currentValueForThemeAttribute:", "text-inset"),
        bounds = objj_msgSend(self, "bounds");
    objj_msgSend(self._textField, "setFrame:", CGRectMake(inset.right, inset.top, bounds.size.width - inset.right - inset.left, bounds.size.height - inset.top - inset.bottom));
    objj_msgSend(self._textField, "setTextColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-color"));
    objj_msgSend(self._textField, "setFont:", objj_msgSend(self, "currentValueForThemeAttribute:", "font"));
    objj_msgSend(self._textField, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-color"));
    objj_msgSend(self._textField, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-offset"));
    objj_msgSend(self._textField, "setAlignment:", objj_msgSend(self, "currentValueForThemeAttribute:", "text-alignment"));
    objj_msgSend(self._textField, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemeAttribute:", "line-break-mode"));
}
,["void"]), new objj_method(sel_getUid("setStringValue:"), function $_CPTableColumnHeaderView__setStringValue_(self, _cmd, string)
{
    objj_msgSend(self._textField, "setText:", string);
}
,["void","CPString"]), new objj_method(sel_getUid("stringValue"), function $_CPTableColumnHeaderView__stringValue(self, _cmd)
{
    return objj_msgSend(self._textField, "text");
}
,["CPString"]), new objj_method(sel_getUid("textField"), function $_CPTableColumnHeaderView__textField(self, _cmd)
{
    return self._textField;
}
,["void"]), new objj_method(sel_getUid("sizeToFit"), function $_CPTableColumnHeaderView__sizeToFit(self, _cmd)
{
    objj_msgSend(self._textField, "sizeToFit");
}
,["void"]), new objj_method(sel_getUid("setFont:"), function $_CPTableColumnHeaderView__setFont_(self, _cmd, aFont)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", aFont, "font");
}
,["void","CPFont"]), new objj_method(sel_getUid("font"), function $_CPTableColumnHeaderView__font(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "font");
}
,["CPFont"]), new objj_method(sel_getUid("setAlignment:"), function $_CPTableColumnHeaderView__setAlignment_(self, _cmd, alignment)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", alignment, "text-alignment");
}
,["void","CPTextAlignment"]), new objj_method(sel_getUid("alignment"), function $_CPTableColumnHeaderView__alignment(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "text-alignment");
}
,["CPTextAlignment"]), new objj_method(sel_getUid("setLineBreakMode:"), function $_CPTableColumnHeaderView__setLineBreakMode_(self, _cmd, mode)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", mode, "line-break-mode");
}
,["void","CPLineBreakMode"]), new objj_method(sel_getUid("lineBreakMode"), function $_CPTableColumnHeaderView__lineBreakMode(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "line-break-mode");
}
,["CPLineBreakMode"]), new objj_method(sel_getUid("setTextColor:"), function $_CPTableColumnHeaderView__setTextColor_(self, _cmd, aColor)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", aColor, "text-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("textColor"), function $_CPTableColumnHeaderView__textColor(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "text-color");
}
,["CPColor"]), new objj_method(sel_getUid("setTextShadowColor:"), function $_CPTableColumnHeaderView__setTextShadowColor_(self, _cmd, aColor)
{
    objj_msgSend(self, "setValue:forThemeAttribute:", aColor, "text-shadow-color");
}
,["void","CPColor"]), new objj_method(sel_getUid("textShadowColor"), function $_CPTableColumnHeaderView__textShadowColor(self, _cmd)
{
    return objj_msgSend(self, "currentValueForThemeAttribute:", "text-shadow-color");
}
,["CPColor"]), new objj_method(sel_getUid("_setIndicatorImage:"), function $_CPTableColumnHeaderView___setIndicatorImage_(self, _cmd, anImage)
{
    if (anImage)
    {
        objj_msgSend(self._textField, "setImage:", anImage);
        objj_msgSend(self._textField, "setImagePosition:", CPImageRight);
    }
    else
    {
        objj_msgSend(self._textField, "setImagePosition:", CPNoImage);
    }
}
,["void","CPImage"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPTableColumnHeaderView__defaultThemeClass(self, _cmd)
{
    return "columnHeader";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPTableColumnHeaderView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "background-color", CPLeftTextAlignment, "text-alignment", CPLineBreakByTruncatingTail, "line-break-mode", CGInsetMakeZero(), "text-inset", objj_msgSend(CPNull, "null"), "text-color", objj_msgSend(CPNull, "null"), "font", objj_msgSend(CPNull, "null"), "text-shadow-color", CGSizeMakeZero(), "text-shadow-offset");
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
        objj_msgSend(self, "_init");
        objj_msgSend(self, "_setIndicatorImage:", objj_msgSend(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewImageKey));
        objj_msgSend(self, "setStringValue:", objj_msgSend(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewStringValueKey));
        objj_msgSend(self, "setFont:", objj_msgSend(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewFontKey));
        objj_msgSend(self, "setTextColor:", objj_msgSend(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewTextColorKey));
        objj_msgSend(self, "setTextShadowColor:", objj_msgSend(aCoder, "decodeObjectForKey:", _CPTableColumnHeaderViewTextShadowColorKey));
        objj_msgSend(self, "setAlignment:", objj_msgSend(aCoder, "decodeIntForKey:", _CPTableColumnHeaderViewAlignmentKey));
        objj_msgSend(self, "setLineBreakMode:", objj_msgSend(aCoder, "decodeIntForKey:", _CPTableColumnHeaderViewLineBreakModeKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPTableColumnHeaderView__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPTableColumnHeaderView").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self._textField, "text"), _CPTableColumnHeaderViewStringValueKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self._textField, "image"), _CPTableColumnHeaderViewImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "font"), _CPTableColumnHeaderViewFontKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "textColor"), _CPTableColumnHeaderViewTextColorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "textShadowColor"), _CPTableColumnHeaderViewTextShadowColorKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", objj_msgSend(self, "alignment"), _CPTableColumnHeaderViewAlignmentKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", objj_msgSend(self, "lineBreakMode"), _CPTableColumnHeaderViewLineBreakModeKey);
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
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "background-color"));
}
,["void"]), new objj_method(sel_getUid("initWithFrame:"), function $CPTableHeaderView__initWithFrame_(self, _cmd, aFrame)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableHeaderView").super_class }, "initWithFrame:", aFrame);
    if (self)
        objj_msgSend(self, "_init");
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("columnAtPoint:"), function $CPTableHeaderView__columnAtPoint_(self, _cmd, aPoint)
{
    return objj_msgSend(self._tableView, "columnAtPoint:", CGPointMake(aPoint.x, aPoint.y));
}
,["int","CGPoint"]), new objj_method(sel_getUid("headerRectOfColumn:"), function $CPTableHeaderView__headerRectOfColumn_(self, _cmd, aColumnIndex)
{
    var headerRect = CGRectMakeCopy(objj_msgSend(self, "bounds")),
        columnRect = objj_msgSend(self._tableView, "rectOfColumn:", aColumnIndex);
    headerRect.origin.x = CGRectGetMinX(columnRect);
    headerRect.size.width = CGRectGetWidth(columnRect);
    return headerRect;
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
    if (column == -1 || !(objj_msgSend(self._tableView._tableColumns[column], "resizingMask") & CPTableColumnUserResizingMask))
        return CGRectMakeZero();
    var rect = objj_msgSend(self, "headerRectOfColumn:", column);
    rect.origin.x = CGRectGetMaxX(rect) - 5;
    rect.size.width = 20;
    return rect;
}
,["CGRect","CPInteger"]), new objj_method(sel_getUid("_setPressedColumn:"), function $CPTableHeaderView___setPressedColumn_(self, _cmd, column)
{
    if (self._pressedColumn != -1)
    {
        var headerView = objj_msgSend(self._tableView._tableColumns[self._pressedColumn], "headerView");
        objj_msgSend(headerView, "unsetThemeState:", CPThemeStateHighlighted);
    }
    if (column != -1)
    {
        var headerView = objj_msgSend(self._tableView._tableColumns[column], "headerView");
        objj_msgSend(headerView, "setThemeState:", CPThemeStateHighlighted);
        if (self._tableView._editingCellIndex || self._tableView._editingColumn == column)
            objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self._tableView);
    }
    self._pressedColumn = column;
}
,["void","CPInteger"]), new objj_method(sel_getUid("mouseDown:"), function $CPTableHeaderView__mouseDown_(self, _cmd, theEvent)
{
    objj_msgSend(self, "trackMouse:", theEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("trackMouse:"), function $CPTableHeaderView__trackMouse_(self, _cmd, theEvent)
{
    var type = objj_msgSend(theEvent, "type"),
        currentLocation = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(theEvent, "locationInWindow"), nil);
    currentLocation.x -= 5.0;
    var columnIndex = objj_msgSend(self, "columnAtPoint:", currentLocation),
        shouldResize = objj_msgSend(self, "shouldResizeTableColumn:at:", columnIndex, CGPointMake(currentLocation.x + 5.0, currentLocation.y));
    if (type === CPLeftMouseUp)
    {
        if (shouldResize)
            objj_msgSend(self, "stopResizingTableColumn:at:", self._activeColumn, currentLocation);
        else if (objj_msgSend(self, "_shouldStopTrackingTableColumn:at:", columnIndex, currentLocation))
        {
            objj_msgSend(self._tableView, "_didClickTableColumn:modifierFlags:", columnIndex, objj_msgSend(theEvent, "modifierFlags"));
            objj_msgSend(self, "stopTrackingTableColumn:at:", columnIndex, currentLocation);
            self._isTrackingColumn = NO;
        }
        objj_msgSend(self, "_updateResizeCursor:", objj_msgSend(CPApp, "currentEvent"));
        self._activeColumn = CPNotFound;
        return;
    }
    if (type === CPLeftMouseDown)
    {
        if (columnIndex === -1)
            return;
        self._mouseDownLocation = currentLocation;
        self._activeColumn = columnIndex;
        objj_msgSend(self._tableView, "_sendDelegateMouseDownInHeaderOfTableColumn:", columnIndex);
        if (shouldResize)
            objj_msgSend(self, "startResizingTableColumn:at:", columnIndex, currentLocation);
        else
        {
            objj_msgSend(self, "startTrackingTableColumn:at:", columnIndex, currentLocation);
            self._isTrackingColumn = YES;
        }
    }
    else if (type === CPLeftMouseDragged)
    {
        if (shouldResize)
            objj_msgSend(self, "continueResizingTableColumn:at:", self._activeColumn, currentLocation);
        else
        {
            if (self._activeColumn === columnIndex && CGRectContainsPoint(objj_msgSend(self, "headerRectOfColumn:", columnIndex), currentLocation))
            {
                if (self._isTrackingColumn && self._pressedColumn !== -1)
                {
                    if (!objj_msgSend(self, "continueTrackingTableColumn:at:", columnIndex, currentLocation))
                        return;
                }
                else
                    objj_msgSend(self, "startTrackingTableColumn:at:", columnIndex, currentLocation);
            }
            else if (self._isTrackingColumn && self._pressedColumn !== -1)
                objj_msgSend(self, "stopTrackingTableColumn:at:", self._activeColumn, currentLocation);
        }
    }
    self._previousTrackingLocation = currentLocation;
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMouse:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
,["void","CPEvent"]), new objj_method(sel_getUid("startTrackingTableColumn:at:"), function $CPTableHeaderView__startTrackingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    self._lastDragDestinationColumnIndex = -1;
    objj_msgSend(self, "_setPressedColumn:", aColumnIndex);
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("continueTrackingTableColumn:at:"), function $CPTableHeaderView__continueTrackingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    if (objj_msgSend(self, "_shouldDragTableColumn:at:", aColumnIndex, aPoint))
    {
        var columnRect = objj_msgSend(self, "headerRectOfColumn:", aColumnIndex),
            offset = CGPointMakeZero(),
            view = objj_msgSend(self._tableView, "_dragViewForColumn:event:offset:", aColumnIndex, objj_msgSend(CPApp, "currentEvent"), offset),
            viewLocation = CGPointMakeZero();
        viewLocation.x = CGRectGetMinX(columnRect) + offset.x + (aPoint.x - self._mouseDownLocation.x);
        viewLocation.y = CGRectGetMinY(columnRect) + offset.y;
        objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:", view, viewLocation, CGSizeMakeZero(), objj_msgSend(CPApp, "currentEvent"), objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), self, YES);
        return NO;
    }
    return YES;
}
,["BOOL","CPInteger","CGPoint"]), new objj_method(sel_getUid("_shouldStopTrackingTableColumn:at:"), function $CPTableHeaderView___shouldStopTrackingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    return self._isTrackingColumn && self._activeColumn === aColumnIndex && CGRectContainsPoint(objj_msgSend(self, "headerRectOfColumn:", aColumnIndex), aPoint);
}
,["BOOL","CPInteger","CGPoint"]), new objj_method(sel_getUid("stopTrackingTableColumn:at:"), function $CPTableHeaderView__stopTrackingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    objj_msgSend(self, "_setPressedColumn:", CPNotFound);
    objj_msgSend(self, "_updateResizeCursor:", objj_msgSend(CPApp, "currentEvent"));
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("_shouldDragTableColumn:at:"), function $CPTableHeaderView___shouldDragTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    return ABS(aPoint.x - self._mouseDownLocation.x) >= 10.0 && objj_msgSend(self._tableView, "_sendDelegateShouldReorderColumn:toColumn:", aColumnIndex, -1);
}
,["BOOL","CPInteger","CGPoint"]), new objj_method(sel_getUid("_headerRectOfLastVisibleColumn"), function $CPTableHeaderView___headerRectOfLastVisibleColumn(self, _cmd)
{
    var tableColumns = objj_msgSend(self._tableView, "tableColumns"),
        columnIndex = objj_msgSend(tableColumns, "count");
    while (columnIndex--)
    {
        var tableColumn = objj_msgSend(tableColumns, "objectAtIndex:", columnIndex);
        if (!objj_msgSend(tableColumn, "isHidden"))
            return objj_msgSend(self, "headerRectOfColumn:", columnIndex);
    }
    return nil;
}
,["CGRect"]), new objj_method(sel_getUid("_constrainDragView:at:"), function $CPTableHeaderView___constrainDragView_at_(self, _cmd, theDragView, aPoint)
{
    var tableColumns = objj_msgSend(self._tableView, "tableColumns"),
        lastColumnRect = objj_msgSend(self, "_headerRectOfLastVisibleColumn"),
        activeColumnRect = objj_msgSend(self, "headerRectOfColumn:", self._activeColumn),
        dragWindow = objj_msgSend(theDragView, "window"),
        frame = objj_msgSend(dragWindow, "frame");
    frame.origin = objj_msgSend(objj_msgSend(self, "window"), "convertGlobalToBase:", frame.origin);
    frame.origin = objj_msgSend(self, "convertPoint:fromView:", frame.origin, nil);
    frame.origin.x = MAX(0.0, MIN(CGRectGetMinX(frame), CGRectGetMaxX(lastColumnRect) - CGRectGetWidth(activeColumnRect)));
    frame.origin.y = CGRectGetMinY(lastColumnRect);
    frame.origin = objj_msgSend(self, "convertPoint:toView:", frame.origin, nil);
    frame.origin = objj_msgSend(objj_msgSend(self, "window"), "convertBaseToGlobal:", frame.origin);
    objj_msgSend(dragWindow, "setFrame:", frame);
}
,["void","CPView","CGPoint"]), new objj_method(sel_getUid("_moveColumn:toColumn:"), function $CPTableHeaderView___moveColumn_toColumn_(self, _cmd, aFromIndex, aToIndex)
{
    if (objj_msgSend(self._tableView, "_sendDelegateShouldReorderColumn:toColumn:", aFromIndex, aToIndex))
    {
        objj_msgSend(self._tableView, "moveColumn:toColumn:", aFromIndex, aToIndex);
        self._activeColumn = aToIndex;
        self._pressedColumn = self._activeColumn;
    }
}
,["void","CPInteger","CPInteger"]), new objj_method(sel_getUid("draggedView:beganAt:"), function $CPTableHeaderView__draggedView_beganAt_(self, _cmd, aView, aPoint)
{
    self._isDragging = YES;
    var column = objj_msgSend(objj_msgSend(self._tableView, "tableColumns"), "objectAtIndex:", self._activeColumn);
    objj_msgSend(objj_msgSend(column, "headerView"), "setHidden:", YES);
    objj_msgSend(self._tableView, "_setDraggedColumn:", column);
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
,["void","CPView","CGPoint"]), new objj_method(sel_getUid("draggedView:movedTo:"), function $CPTableHeaderView__draggedView_movedTo_(self, _cmd, aView, aPoint)
{
    objj_msgSend(self, "_constrainDragView:at:", aView, aPoint);
    var dragWindow = objj_msgSend(aView, "window"),
        dragWindowFrame = objj_msgSend(dragWindow, "frame");
    var hoverPoint = CGPointCreateCopy(aPoint);
    if (aPoint.x < self._previousTrackingLocation.x)
        hoverPoint = CGPointMake(CGRectGetMinX(dragWindowFrame), CGRectGetMinY(dragWindowFrame));
    else if (aPoint.x > self._previousTrackingLocation.x)
        hoverPoint = CGPointMake(CGRectGetMaxX(dragWindowFrame), CGRectGetMinY(dragWindowFrame));
    hoverPoint = objj_msgSend(objj_msgSend(self, "window"), "convertGlobalToBase:", hoverPoint);
    hoverPoint = objj_msgSend(self, "convertPoint:fromView:", hoverPoint, nil);
    var hoveredColumn = objj_msgSend(self, "columnAtPoint:", hoverPoint);
    if (hoveredColumn !== self._lastDragDestinationColumnIndex && hoveredColumn !== -1)
    {
        var columnRect = objj_msgSend(self, "headerRectOfColumn:", hoveredColumn),
            columnCenterPoint = objj_msgSend(self, "convertPoint:fromView:", CGPointMake(CGRectGetMidX(columnRect), CGRectGetMidY(columnRect)), self);
        if (hoveredColumn < self._activeColumn && hoverPoint.x < columnCenterPoint.x)
        {
            objj_msgSend(self, "_moveColumn:toColumn:", self._activeColumn, hoveredColumn);
            self._lastDragDestinationColumnIndex = hoveredColumn;
        }
        else if (hoveredColumn > self._activeColumn && hoverPoint.x > columnCenterPoint.x)
        {
            objj_msgSend(self, "_moveColumn:toColumn:", self._activeColumn, hoveredColumn);
            self._lastDragDestinationColumnIndex = hoveredColumn;
        }
    }
    self._previousTrackingLocation = aPoint;
}
,["void","CPView","CGPoint"]), new objj_method(sel_getUid("draggedView:endedAt:operation:"), function $CPTableHeaderView__draggedView_endedAt_operation_(self, _cmd, aView, aLocation, anOperation)
{
    self._isDragging = NO;
    self._isTrackingColumn = NO;
    objj_msgSend(self._tableView, "_setDraggedColumn:", nil);
    objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(self._tableView, "tableColumns"), "objectAtIndex:", self._activeColumn), "headerView"), "setHidden:", NO);
    objj_msgSend(self, "stopTrackingTableColumn:at:", self._activeColumn, aLocation);
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self._tableView, "_enqueueDraggingViews");
}
,["void","CPImage","CGPoint","CPDragOperation"]), new objj_method(sel_getUid("shouldResizeTableColumn:at:"), function $CPTableHeaderView__shouldResizeTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    if (self._isResizing)
        return YES;
    if (self._isTrackingColumn)
        return NO;
    return objj_msgSend(self._tableView, "allowsColumnResizing") && CGRectContainsPoint(objj_msgSend(self, "_cursorRectForColumn:", aColumnIndex), aPoint);
}
,["BOOL","CPInteger","CGPoint"]), new objj_method(sel_getUid("startResizingTableColumn:at:"), function $CPTableHeaderView__startResizingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    self._isResizing = YES;
    var tableColumn = objj_msgSend(objj_msgSend(self._tableView, "tableColumns"), "objectAtIndex:", aColumnIndex);
    objj_msgSend(tableColumn, "setDisableResizingPosting:", YES);
    objj_msgSend(self._tableView, "setDisableAutomaticResizing:", YES);
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("continueResizingTableColumn:at:"), function $CPTableHeaderView__continueResizingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    var tableColumn = objj_msgSend(objj_msgSend(self._tableView, "tableColumns"), "objectAtIndex:", aColumnIndex),
        newWidth = objj_msgSend(tableColumn, "width") + aPoint.x - self._previousTrackingLocation.x;
    if (newWidth < objj_msgSend(tableColumn, "minWidth"))
        objj_msgSend(objj_msgSend(CPCursor, "resizeRightCursor"), "set");
    else if (newWidth > objj_msgSend(tableColumn, "maxWidth"))
        objj_msgSend(objj_msgSend(CPCursor, "resizeLeftCursor"), "set");
    else
    {
        self._tableView._lastColumnShouldSnap = NO;
        objj_msgSend(tableColumn, "setWidth:", newWidth);
        objj_msgSend(objj_msgSend(CPCursor, "resizeLeftRightCursor"), "set");
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("stopResizingTableColumn:at:"), function $CPTableHeaderView__stopResizingTableColumn_at_(self, _cmd, aColumnIndex, aPoint)
{
    var tableColumn = objj_msgSend(objj_msgSend(self._tableView, "tableColumns"), "objectAtIndex:", aColumnIndex);
    objj_msgSend(tableColumn, "_postDidResizeNotificationWithOldWidth:", self._columnOldWidth);
    objj_msgSend(tableColumn, "setDisableResizingPosting:", NO);
    objj_msgSend(self._tableView, "setDisableAutomaticResizing:", NO);
    self._isResizing = NO;
}
,["void","CPInteger","CGPoint"]), new objj_method(sel_getUid("_updateResizeCursor:"), function $CPTableHeaderView___updateResizeCursor_(self, _cmd, theEvent)
{
    if (!objj_msgSend(self._tableView, "allowsColumnResizing") || objj_msgSend(theEvent, "type") === CPLeftMouseUp && !objj_msgSend(objj_msgSend(self, "window"), "acceptsMouseMovedEvents"))
    {
        objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
        return;
    }
    var mouseLocation = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(theEvent, "locationInWindow"), nil),
        mouseOverLocation = CGPointMake(mouseLocation.x - 5, mouseLocation.y),
        overColumn = objj_msgSend(self, "columnAtPoint:", mouseOverLocation);
    if (overColumn >= 0 && CGRectContainsPoint(objj_msgSend(self, "_cursorRectForColumn:", overColumn), mouseLocation))
    {
        var tableColumn = objj_msgSend(objj_msgSend(self._tableView, "tableColumns"), "objectAtIndex:", overColumn),
            width = objj_msgSend(tableColumn, "width");
        if (width == objj_msgSend(tableColumn, "minWidth"))
            objj_msgSend(objj_msgSend(CPCursor, "resizeRightCursor"), "set");
        else if (width == objj_msgSend(tableColumn, "maxWidth"))
            objj_msgSend(objj_msgSend(CPCursor, "resizeLeftCursor"), "set");
        else
            objj_msgSend(objj_msgSend(CPCursor, "resizeLeftRightCursor"), "set");
    }
    else
        objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseEntered:"), function $CPTableHeaderView__mouseEntered_(self, _cmd, theEvent)
{
    objj_msgSend(self, "_updateResizeCursor:", theEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseMoved:"), function $CPTableHeaderView__mouseMoved_(self, _cmd, theEvent)
{
    objj_msgSend(self, "_updateResizeCursor:", theEvent);
}
,["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $CPTableHeaderView__mouseExited_(self, _cmd, theEvent)
{
    objj_msgSend(objj_msgSend(CPCursor, "arrowCursor"), "set");
}
,["void","CPEvent"]), new objj_method(sel_getUid("layoutSubviews"), function $CPTableHeaderView__layoutSubviews(self, _cmd)
{
    var tableColumns = objj_msgSend(self._tableView, "tableColumns"),
        count = objj_msgSend(tableColumns, "count"),
        lineThickness = objj_msgSend(self, "currentValueForThemeAttribute:", "divider-thickness");
    for (var i = 0; i < count; i++)
    {
        var column = objj_msgSend(tableColumns, "objectAtIndex:", i),
            headerView = objj_msgSend(column, "headerView"),
            frame = objj_msgSend(self, "headerRectOfColumn:", i);
        frame.origin.x -= 0.5;
        frame.size.width -= lineThickness;
        frame.size.height -= 0.5;
        objj_msgSend(headerView, "setFrame:", frame);
        if (objj_msgSend(headerView, "superview") != self)
            objj_msgSend(self, "addSubview:", headerView);
    }
    objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemeAttribute:", "background-color"));
}
,["void"]), new objj_method(sel_getUid("drawRect:"), function $CPTableHeaderView__drawRect_(self, _cmd, aRect)
{
    if (!self._tableView || !objj_msgSend(self, "drawsColumnLines"))
        return;
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"),
        exposedColumnIndexes = objj_msgSend(self._tableView, "columnIndexesInRect:", aRect),
        columnsArray = [],
        tableColumns = objj_msgSend(self._tableView, "tableColumns"),
        exposedTableColumns = self._tableView._exposedColumns,
        firstIndex = objj_msgSend(exposedTableColumns, "firstIndex"),
        exposedRange = CPMakeRange(firstIndex, objj_msgSend(exposedTableColumns, "lastIndex") - firstIndex + 1),
        lineThickness = objj_msgSend(self, "currentValueForThemeAttribute:", "divider-thickness");
    CGContextSetLineWidth(context, lineThickness);
    CGContextSetStrokeColor(context, objj_msgSend(self, "currentValueForThemeAttribute:", "divider-color"));
    objj_msgSend(exposedColumnIndexes, "getIndexes:maxCount:inIndexRange:", columnsArray, -1, exposedRange);
    var columnArrayIndex = 0,
        columnArrayCount = columnsArray.length,
        columnMaxX;
    CGContextBeginPath(context);
    for (; columnArrayIndex < columnArrayCount; columnArrayIndex++)
    {
        var columnIndex = columnsArray[columnArrayIndex],
            columnToStroke = objj_msgSend(self, "headerRectOfColumn:", columnIndex);
        columnMaxX = CGRectGetMaxX(columnToStroke);
        CGContextMoveToPoint(context, FLOOR(columnMaxX) - 0.5 * lineThickness, ROUND(CGRectGetMinY(columnToStroke)));
        CGContextAddLineToPoint(context, FLOOR(columnMaxX) - 0.5 * lineThickness, ROUND(CGRectGetMaxY(columnToStroke)) - 1.0);
    }
    CGContextClosePath(context);
    CGContextStrokePath(context);
}
,["void","CGRect"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $CPTableHeaderView__defaultThemeClass(self, _cmd)
{
    return "tableHeaderRow";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $CPTableHeaderView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPNull, "null"), "background-color", objj_msgSend(CPColor, "grayColor"), "divider-color", 1.0, "divider-thickness");
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
        objj_msgSend(self, "_init");
        self._tableView = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableHeaderViewTableViewKey);
        if (objj_msgSend(aCoder, "containsValueForKey:", CPTableHeaderViewDrawsColumnLines))
            self._drawsColumnLines = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableHeaderViewDrawsColumnLines);
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
    objj_msgSend(aCoder, "encodeObject:forKey:", self._tableView, CPTableHeaderViewTableViewKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", self._drawsColumnLines, CPTableHeaderViewDrawsColumnLines);
}
,["void","CPCoder"])]);
}