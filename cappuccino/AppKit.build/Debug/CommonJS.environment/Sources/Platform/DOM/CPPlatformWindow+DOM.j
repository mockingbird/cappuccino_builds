@STATIC;1.0;I;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;18;Foundation/CPSet.jI;20;Foundation/CPTimer.ji;25;CPApplication_Constants.ji;17;CPCompatibility.ji;10;CPCursor.ji;18;CPDOMWindowLayer.ji;24;CPDragServer_Constants.ji;9;CPEvent.ji;14;CPPasteboard.ji;12;CPPlatform.ji;22;CPPlatformPasteboard.ji;26;CPPlatformWindow+DOMKeys.ji;18;CPPlatformWindow.ji;8;CPText.ji;20;CPWindow_Constants.jt;6339;objj_executeFile("Foundation/CPNotificationCenter.j", NO);objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPRunLoop.j", NO);objj_executeFile("Foundation/CPSet.j", NO);objj_executeFile("Foundation/CPTimer.j", NO);objj_executeFile("CPApplication_Constants.j", YES);objj_executeFile("CPCompatibility.j", YES);objj_executeFile("CPCursor.j", YES);objj_executeFile("CPDOMWindowLayer.j", YES);objj_executeFile("CPDragServer_Constants.j", YES);objj_executeFile("CPEvent.j", YES);objj_executeFile("CPPasteboard.j", YES);objj_executeFile("CPPlatform.j", YES);objj_executeFile("CPPlatformPasteboard.j", YES);objj_executeFile("CPPlatformWindow+DOMKeys.j", YES);objj_executeFile("CPPlatformWindow.j", YES);objj_executeFile("CPText.j", YES);objj_executeFile("CPWindow_Constants.j", YES);var PlatformWindows = objj_msgSend(CPSet, "set");
var CPDOMEventGetClickCount,
    StopDOMEventPropagation,
    StopContextMenuDOMEventPropagation;
var KeyCodesToPrevent = {},
    CharacterKeysToPrevent = {},
    KeyCodesToAllow = {},
    MozKeyCodeToKeyCodeMap = {61: 187, 59: 186},
    KeyCodesToUnicodeMap = {};
KeyCodesToPrevent[CPKeyCodes.A] = YES;
KeyCodesToAllow[CPKeyCodes.F1] = YES;
KeyCodesToAllow[CPKeyCodes.F2] = YES;
KeyCodesToAllow[CPKeyCodes.F3] = YES;
KeyCodesToAllow[CPKeyCodes.F4] = YES;
KeyCodesToAllow[CPKeyCodes.F5] = YES;
KeyCodesToAllow[CPKeyCodes.F6] = YES;
KeyCodesToAllow[CPKeyCodes.F7] = YES;
KeyCodesToAllow[CPKeyCodes.F8] = YES;
KeyCodesToAllow[CPKeyCodes.F9] = YES;
KeyCodesToAllow[CPKeyCodes.F10] = YES;
KeyCodesToAllow[CPKeyCodes.F11] = YES;
KeyCodesToAllow[CPKeyCodes.F12] = YES;
KeyCodesToUnicodeMap[CPKeyCodes.BACKSPACE] = CPDeleteCharacter;
KeyCodesToUnicodeMap[CPKeyCodes.DELETE] = CPDeleteFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.TAB] = CPTabCharacter;
KeyCodesToUnicodeMap[CPKeyCodes.ENTER] = CPCarriageReturnCharacter;
KeyCodesToUnicodeMap[CPKeyCodes.ESC] = CPEscapeFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.PAGE_UP] = CPPageUpFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.PAGE_DOWN] = CPPageDownFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.LEFT] = CPLeftArrowFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.UP] = CPUpArrowFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.RIGHT] = CPRightArrowFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.DOWN] = CPDownArrowFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.HOME] = CPHomeFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.END] = CPEndFunctionKey;
KeyCodesToUnicodeMap[CPKeyCodes.SEMICOLON] = ";";
KeyCodesToUnicodeMap[CPKeyCodes.DASH] = "-";
KeyCodesToUnicodeMap[CPKeyCodes.EQUALS] = "=";
KeyCodesToUnicodeMap[CPKeyCodes.COMMA] = ",";
KeyCodesToUnicodeMap[CPKeyCodes.PERIOD] = ".";
KeyCodesToUnicodeMap[CPKeyCodes.SLASH] = "/";
KeyCodesToUnicodeMap[CPKeyCodes.APOSTROPHE] = "`";
KeyCodesToUnicodeMap[CPKeyCodes.SINGLE_QUOTE] = "'";
KeyCodesToUnicodeMap[CPKeyCodes.OPEN_SQUARE_BRACKET] = "[";
KeyCodesToUnicodeMap[CPKeyCodes.BACKSLASH] = "\\";
KeyCodesToUnicodeMap[CPKeyCodes.CLOSE_SQUARE_BRACKET] = "]";
var ModifierKeyCodes = [CPKeyCodes.META, CPKeyCodes.WEBKIT_RIGHT_META, CPKeyCodes.MAC_FF_META, CPKeyCodes.CTRL, CPKeyCodes.ALT, CPKeyCodes.SHIFT],
    supportsNativeDragAndDrop = objj_msgSend(CPPlatform, "supportsDragAndDrop");
var resizeTimer = nil;
var PreventScroll = true;
var CPEventClass = objj_msgSend(CPEvent, "class");
var _CPEventFromNativeMouseEvent = function(aNativeEvent, anEventType, aPoint, modifierFlags, aTimestamp, aWindowNumber, aGraphicsContext, anEventNumber, aClickCount, aPressure, aMouseDragStart)
{
    aNativeEvent.isa = CPEventClass;
    aNativeEvent._type = anEventType;
    aNativeEvent._location = aPoint;
    aNativeEvent._modifierFlags = modifierFlags;
    aNativeEvent._timestamp = aTimestamp;
    aNativeEvent._windowNumber = aWindowNumber;
    aNativeEvent._window = nil;
    aNativeEvent._context = aGraphicsContext;
    aNativeEvent._eventNumber = anEventNumber;
    aNativeEvent._clickCount = aClickCount;
    aNativeEvent._pressure = aPressure;
    if (anEventType == CPLeftMouseDragged || anEventType == CPRightMouseDragged || anEventType == CPMouseMoved)
    {
        aNativeEvent._deltaX = aPoint.x - aMouseDragStart.x;
        aNativeEvent._deltaY = aPoint.y - aMouseDragStart.y;
    }
    else
    {
        aNativeEvent._deltaX = 0;
        aNativeEvent._deltaY = 0;
    }
    return aNativeEvent;
};
var CLICK_SPACE_DELTA = 5.0,
    CLICK_TIME_DELTA = typeof document != "undefined" && document.addEventListener ? 0.55 : 1.0;
var CPDOMEventGetClickCount = function(aComparisonEvent, aTimestamp, aLocation)
{
    if (!aComparisonEvent)
        return 1;
    var comparisonLocation = objj_msgSend(aComparisonEvent, "locationInWindow");
    return aTimestamp - objj_msgSend(aComparisonEvent, "timestamp") < CLICK_TIME_DELTA && ABS(comparisonLocation.x - aLocation.x) < CLICK_SPACE_DELTA && ABS(comparisonLocation.y - aLocation.y) < CLICK_SPACE_DELTA ? objj_msgSend(aComparisonEvent, "clickCount") + 1 : 1;
};
_CPDOMEventStop = function(aDOMEvent, aPlatformWindow)
{
    if (aDOMEvent.preventDefault)
        aDOMEvent.preventDefault();
    else
        aDOMEvent.returnValue = false;
    if (aDOMEvent.stopPropagation)
        aDOMEvent.stopPropagation();
    else
        aDOMEvent.cancelBubble = true;
};
CPWindowObjectList = function()
{
    var platformWindows = objj_msgSend(CPPlatformWindow, "visiblePlatformWindows"),
        platformWindowEnumerator = objj_msgSend(platformWindows, "objectEnumerator"),
        platformWindow = nil,
        windowObjects = [];
    while ((platformWindow = objj_msgSend(platformWindowEnumerator, "nextObject")) !== nil)
    {
        var levels = platformWindow._windowLevels,
            layers = platformWindow._windowLayers,
            levelCount = levels.length;
        while (levelCount--)
        {
            var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
                windowCount = windows.length;
            while (windowCount--)
                windowObjects.push(windows[windowCount]);
        }
    }
    return windowObjects;
}
CPWindowList = function()
{
    var windowObjectList = CPWindowObjectList(),
        windowList = [];
    for (var i = 0, count = objj_msgSend(windowObjectList, "count"); i < count; i++)
        windowList.push(objj_msgSend(windowObjectList[i], "windowNumber"));
    return windowList;
}
