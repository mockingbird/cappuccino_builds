@STATIC;1.0;i;10;CPObject.ji;10;CPString.ji;13;CPException.jt;9435;objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPException.j", YES);var CPDateReferenceDate = new Date(Date.UTC(2001, 0, 1, 0, 0, 0, 0));
{var the_class = objj_allocateClassPair(CPObject, "CPDate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTimeIntervalSinceNow:"), function $CPDate__initWithTimeIntervalSinceNow_(self, _cmd, seconds)
{
    self = new Date((new Date()).getTime() + seconds * 1000);
    return self;
}
,["id","CPTimeInterval"]), new objj_method(sel_getUid("initWithTimeIntervalSince1970:"), function $CPDate__initWithTimeIntervalSince1970_(self, _cmd, seconds)
{
    self = new Date(seconds * 1000);
    return self;
}
,["id","CPTimeInterval"]), new objj_method(sel_getUid("initWithTimeIntervalSinceReferenceDate:"), function $CPDate__initWithTimeIntervalSinceReferenceDate_(self, _cmd, seconds)
{
    self = (self == null ? null : self.isa.objj_msgSend2(self, "initWithTimeInterval:sinceDate:", seconds, CPDateReferenceDate));
    return self;
}
,["id","CPTimeInterval"]), new objj_method(sel_getUid("initWithTimeInterval:sinceDate:"), function $CPDate__initWithTimeInterval_sinceDate_(self, _cmd, seconds, refDate)
{
    self = new Date(refDate.getTime() + seconds * 1000);
    return self;
}
,["id","CPTimeInterval","CPDate"]), new objj_method(sel_getUid("initWithString:"), function $CPDate__initWithString_(self, _cmd, description)
{
    var format = /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2}) ([-+])(\d{2})(\d{2})/,
        d = description.match(new RegExp(format));
    if (!d || d.length != 10)
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "initWithString: the string must be in YYYY-MM-DD HH:MM:SS ±HHMM format");
    var date = new Date(d[1], d[2] - 1, d[3]),
        timeZoneOffset = (Number(d[8]) * 60 + Number(d[9])) * (d[7] === '-' ? 1 : -1);
    date.setHours(d[4]);
    date.setMinutes(d[5]);
    date.setSeconds(d[6]);
    self = new Date(date.getTime() + (timeZoneOffset - date.getTimezoneOffset()) * 60 * 1000);
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("timeIntervalSinceDate:"), function $CPDate__timeIntervalSinceDate_(self, _cmd, anotherDate)
{
    return (self.getTime() - anotherDate.getTime()) / 1000.0;
}
,["CPTimeInterval","CPDate"]), new objj_method(sel_getUid("timeIntervalSinceNow"), function $CPDate__timeIntervalSinceNow(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "timeIntervalSinceDate:", CPDate.isa.objj_msgSend0(CPDate, "date"));
}
,["CPTimeInterval"]), new objj_method(sel_getUid("timeIntervalSince1970"), function $CPDate__timeIntervalSince1970(self, _cmd)
{
    return self.getTime() / 1000.0;
}
,["CPTimeInterval"]), new objj_method(sel_getUid("timeIntervalSinceReferenceDate"), function $CPDate__timeIntervalSinceReferenceDate(self, _cmd)
{
    return (self.getTime() - CPDateReferenceDate.getTime()) / 1000.0;
}
,["CPTimeInterval"]), new objj_method(sel_getUid("dateByAddingTimeInterval:"), function $CPDate__dateByAddingTimeInterval_(self, _cmd, seconds)
{
    return ((___r1 = CPDate.isa.objj_msgSend0(CPDate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithTimeInterval:sinceDate:", seconds, self));
    var ___r1;
}
,["id","CPTimeInterval"]), new objj_method(sel_getUid("isEqual:"), function $CPDate__isEqual_(self, _cmd, aDate)
{
    if (self === aDate)
        return YES;
    if (!aDate || !(aDate == null ? null : aDate.isa.objj_msgSend1(aDate, "isKindOfClass:", CPDate.isa.objj_msgSend0(CPDate, "class"))))
        return NO;
    return self.isa.objj_msgSend1(self, "isEqualToDate:", aDate);
}
,["BOOL","CPDate"]), new objj_method(sel_getUid("isEqualToDate:"), function $CPDate__isEqualToDate_(self, _cmd, aDate)
{
    if (!aDate)
        return NO;
    return !(self < aDate || self > aDate);
}
,["BOOL","CPDate"]), new objj_method(sel_getUid("compare:"), function $CPDate__compare_(self, _cmd, anotherDate)
{
    return self > anotherDate ? CPOrderedDescending : self < anotherDate ? CPOrderedAscending : CPOrderedSame;
}
,["CPComparisonResult","CPDate"]), new objj_method(sel_getUid("earlierDate:"), function $CPDate__earlierDate_(self, _cmd, anotherDate)
{
    return self < anotherDate ? self : anotherDate;
}
,["CPDate","CPDate"]), new objj_method(sel_getUid("laterDate:"), function $CPDate__laterDate_(self, _cmd, anotherDate)
{
    return self > anotherDate ? self : anotherDate;
}
,["CPDate","CPDate"]), new objj_method(sel_getUid("description"), function $CPDate__description(self, _cmd)
{
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "%04d-%02d-%02d %02d:%02d:%02d %s", self.getFullYear(), self.getMonth() + 1, self.getDate(), self.getHours(), self.getMinutes(), self.getSeconds(), CPDate.isa.objj_msgSend1(CPDate, "timezoneOffsetString:", self.getTimezoneOffset()));
}
,["CPString"]), new objj_method(sel_getUid("copy"), function $CPDate__copy(self, _cmd)
{
    return new Date(self.getTime());
}
,["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function $CPDate__alloc(self, _cmd)
{
    var result = new Date();
    result.isa = self.isa.objj_msgSend0(self, "class");
    return result;
}
,["id"]), new objj_method(sel_getUid("date"), function $CPDate__date(self, _cmd)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    var ___r1;
}
,["id"]), new objj_method(sel_getUid("dateWithTimeIntervalSinceNow:"), function $CPDate__dateWithTimeIntervalSinceNow_(self, _cmd, seconds)
{
    return ((___r1 = CPDate.isa.objj_msgSend0(CPDate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTimeIntervalSinceNow:", seconds));
    var ___r1;
}
,["id","CPTimeInterval"]), new objj_method(sel_getUid("dateWithTimeIntervalSince1970:"), function $CPDate__dateWithTimeIntervalSince1970_(self, _cmd, seconds)
{
    return ((___r1 = CPDate.isa.objj_msgSend0(CPDate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTimeIntervalSince1970:", seconds));
    var ___r1;
}
,["id","CPTimeInterval"]), new objj_method(sel_getUid("dateWithTimeIntervalSinceReferenceDate:"), function $CPDate__dateWithTimeIntervalSinceReferenceDate_(self, _cmd, seconds)
{
    return ((___r1 = CPDate.isa.objj_msgSend0(CPDate, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithTimeIntervalSinceReferenceDate:", seconds));
    var ___r1;
}
,["id","CPTimeInterval"]), new objj_method(sel_getUid("distantPast"), function $CPDate__distantPast(self, _cmd)
{
    return CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceReferenceDate:", -63113817600.0);
}
,["id"]), new objj_method(sel_getUid("distantFuture"), function $CPDate__distantFuture(self, _cmd)
{
    return CPDate.isa.objj_msgSend1(CPDate, "dateWithTimeIntervalSinceReferenceDate:", 63113990400.0);
}
,["id"]), new objj_method(sel_getUid("timeIntervalSinceReferenceDate"), function $CPDate__timeIntervalSinceReferenceDate(self, _cmd)
{
    return ((___r1 = CPDate.isa.objj_msgSend0(CPDate, "date")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "timeIntervalSinceReferenceDate"));
    var ___r1;
}
,["CPTimeInterval"]), new objj_method(sel_getUid("timezoneOffsetString:"), function $CPDate__timezoneOffsetString_(self, _cmd, timezoneOffset)
{
    var offset = -timezoneOffset,
        positive = offset >= 0,
        hours = positive ? FLOOR(offset / 60) : CEIL(offset / 60),
        minutes = offset - hours * 60;
    return CPString.isa.objj_msgSend(CPString, "stringWithFormat:", "%s%02d%02d", positive ? "+" : "-", ABS(hours), ABS(minutes));
}
,["CPString","int"])]);
}var CPDateTimeKey = "CPDateTimeKey";
{
var the_class = objj_getClass("CPDate")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPDate__initWithCoder_(self, _cmd, aCoder)
{
    if (self)
    {
        self.setTime((aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeIntForKey:", CPDateTimeKey)));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPDate__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeInt:forKey:", self.getTime(), CPDateTimeKey));
}
,["void","CPCoder"])]);
}var numericKeys = [1, 4, 5, 6, 7, 10, 11];
Date.parseISO8601 = function(date)
{
    var timestamp,
        struct,
        minutesOffset = 0;
    timestamp = Date.parse(date);
    if (isNaN(timestamp) && (struct = /^(\d{4}|[+\-]\d{6})(?:-(\d{2})(?:-(\d{2}))?)?(?:T(\d{2}):(\d{2})(?::(\d{2})(?:\.(\d{3}))?)?(?:(Z)|([+\-])(\d{2})(?::(\d{2}))?)?)?$/.exec(date)))
    {
        for (var i = 0, k; k = numericKeys[i]; ++i)
            struct[k] = +struct[k] || 0;
        struct[2] = (+struct[2] || 1) - 1;
        struct[3] = +struct[3] || 1;
        if (struct[8] !== 'Z' && struct[9] !== undefined)
        {
            minutesOffset = struct[10] * 60 + struct[11];
            if (struct[9] === '+')
                minutesOffset = 0 - minutesOffset;
        }
        return Date.UTC(struct[1], struct[2], struct[3], struct[4], struct[5] + minutesOffset, struct[6], struct[7]);
    }
    return timestamp;
};
Date.prototype.isa = CPDate;
