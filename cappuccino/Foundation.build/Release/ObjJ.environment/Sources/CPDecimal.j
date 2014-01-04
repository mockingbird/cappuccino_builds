@STATIC;1.0;i;9;CPArray.ji;10;CPNumber.jt;17139;
objj_executeFile("CPArray.j",YES);
objj_executeFile("CPNumber.j",YES);
CPDecimalMaxDigits=38;
CPDecimalMaxExponent=127;
CPDecimalMinExponent=-128;
CPDecimalNoScale=128;
CPCalculationNoError=0;
CPCalculationLossOfPrecision=1;
CPCalculationOverflow=2;
CPCalculationUnderflow=3;
CPCalculationDivideByZero=4;
CPRoundPlain=1;
CPRoundDown=2;
CPRoundUp=3;
CPRoundBankers=4;
_CPRoundHalfDown=5;
CPDecimalNumberOverflowException="CPDecimalNumberOverflowException";
CPDecimalNumberUnderflowException="CPDecimalNumberUnderflowException";
CPDecimalNumberExactnessException="CPDecimalNumberExactnessException";
CPDecimalNumberDivideByZeroException="CPDecimalNumberDivideByZeroException";
CPDecimalMakeWithString=function(_1,_2){
if(!_1){
return CPDecimalMakeNaN();
}
var _3=_1.match(/^([+\-]?)((?:0|[1-9]\d*)?)(?:\.(\d*))?(?:[eE]([+\-]?)(\d+))?$/);
if(!_3){
return CPDecimalMakeNaN();
}
var ds=_3[1],_4=_3[2],_5=_3[3],es=_3[4],_6=_3[5];
var _7=NO;
if(ds&&ds==="-"){
_7=YES;
}
var _8=0;
if(_6){
_8=parseInt(_6)*((es&&es==="-")?-1:1);
}
if(_5){
_8-=_5.length;
}
var _9=(_4?_4.length:0)+(_5?_5.length:0);
if(_9>CPDecimalMaxDigits){
_8+=_9-CPDecimalMaxDigits;
}else{
if(_9===0){
return CPDecimalMakeNaN();
}
}
if(_8>CPDecimalMaxExponent||_8<CPDecimalMinExponent){
return CPDecimalMakeNaN();
}
var m=[],i=0;
for(;i<(_4?_4.length:0);i++){
if(i>=CPDecimalMaxDigits){
break;
}
Array.prototype.push.call(m,parseInt(_4.charAt(i)));
}
var j=0;
for(;j<(_5?_5.length:0);j++){
if((i+j)>=CPDecimalMaxDigits){
break;
}
Array.prototype.push.call(m,parseInt(_5.charAt(j)));
}
var _a={_exponent:_8,_isNegative:_7,_isCompact:NO,_isNaN:NO,_mantissa:m};
CPDecimalCompact(_a);
return _a;
};
CPDecimalMakeWithParts=function(_b,_c){
var m=[],_d=NO;
if(_b<0){
_d=YES;
_b=ABS(_b);
}
if(_b==0){
Array.prototype.push.call(m,0);
}
if(_c>CPDecimalMaxExponent||_c<CPDecimalMinExponent){
return CPDecimalMakeNaN();
}
while((_b>0)&&(m.length<CPDecimalMaxDigits)){
Array.prototype.unshift.call(m,parseInt(_b%10));
_b=FLOOR(_b/10);
}
var _e={_exponent:_c,_isNegative:_d,_isCompact:YES,_isNaN:NO,_mantissa:m};
CPDecimalCompact(_e);
return _e;
};
CPDecimalMakeZero=function(){
return CPDecimalMakeWithParts(0,0);
};
CPDecimalMakeOne=function(){
return CPDecimalMakeWithParts(1,0);
};
CPDecimalMakeNaN=function(){
var d=CPDecimalMakeWithParts(0,0);
d._isNaN=YES;
return d;
};
_CPDecimalMakeMaximum=function(){
var s="",i=0;
for(;i<CPDecimalMaxDigits;i++){
s+="9";
}
s+="e"+CPDecimalMaxExponent;
return CPDecimalMakeWithString(s);
};
_CPDecimalMakeMinimum=function(){
var s="-",i=0;
for(;i<CPDecimalMaxDigits;i++){
s+="9";
}
s+="e"+CPDecimalMaxExponent;
return CPDecimalMakeWithString(s);
};
CPDecimalIsZero=function(_f){
if(!_f._isNaN){
for(var i=0;i<_f._mantissa.length;i++){
if(_f._mantissa[i]!==0){
return NO;
}
}
return YES;
}
return NO;
};
CPDecimalIsOne=function(dcm){
CPDecimalCompact(dcm);
if(!dcm._isNaN){
if(dcm._mantissa&&(dcm._mantissa.length==1)&&(dcm._mantissa[0]==1)){
return YES;
}
}
return NO;
};
_CPDecimalSet=function(t,s){
t._exponent=s._exponent;
t._isNegative=s._isNegative;
t._isCompact=s._isCompact;
t._isNaN=s._isNaN;
t._mantissa=Array.prototype.slice.call(s._mantissa,0);
};
_CPDecimalSetZero=function(_10){
_10._mantissa=[0];
_10._exponent=0;
_10._isNegative=NO;
_10._isCompact=YES;
_10._isNaN=NO;
};
_CPDecimalSetOne=function(_11){
_11._mantissa=[1];
_11._exponent=0;
_11._isNegative=NO;
_11._isCompact=YES;
_11._isNaN=NO;
};
CPDecimalIsNotANumber=function(dcm){
return (dcm._isNaN)?YES:NO;
};
CPDecimalCopy=function(dcm){
return {_exponent:dcm._exponent,_isNegative:dcm._isNegative,_isCompact:dcm._isCompact,_isNaN:dcm._isNaN,_mantissa:Array.prototype.slice.call(dcm._mantissa,0)};
};
CPDecimalCompare=function(_12,_13){
if(_12._isNaN&&_13._isNaN){
return CPOrderedSame;
}
if(_12._isNegative!=_13._isNegative){
if(_13._isNegative){
return CPOrderedDescending;
}else{
return CPOrderedAscending;
}
}
var _14=(_12._mantissa.length==1&&_12._mantissa[0]==0),_15=(_13._mantissa.length==1&&_13._mantissa[0]==0),s1=_12._exponent+_12._mantissa.length,s2=_13._exponent+_13._mantissa.length;
if(_14||s1<s2){
if(_13._isNegative){
return CPOrderedDescending;
}else{
return CPOrderedAscending;
}
}
if(_15||s1>s2){
if(_13._isNegative){
return CPOrderedAscending;
}else{
return CPOrderedDescending;
}
}
var l=MIN(_12._mantissa.length,_13._mantissa.length),i=0;
for(;i<l;i++){
var d=_13._mantissa[i]-_12._mantissa[i];
if(d>0){
if(_13._isNegative){
return CPOrderedDescending;
}else{
return CPOrderedAscending;
}
}
if(d<0){
if(_13._isNegative){
return CPOrderedAscending;
}else{
return CPOrderedDescending;
}
}
}
if(_12._mantissa.length>_13._mantissa.length){
if(_13._isNegative){
return CPOrderedAscending;
}else{
return CPOrderedDescending;
}
}
if(_12._mantissa.length<_13._mantissa.length){
if(_13._isNegative){
return CPOrderedDescending;
}else{
return CPOrderedAscending;
}
}
return CPOrderedSame;
};
_SimpleAdd=function(_16,_17,_18,_19,_1a){
var _1b=(_1a)?2:1;
_CPDecimalSet(_16,_17);
var j=_17._mantissa.length-_18._mantissa.length,l=_18._mantissa.length,i=l-1,_1c=0,_1d=CPCalculationNoError;
for(;i>=0;i--){
var d=_18._mantissa[i]+_16._mantissa[i+j]+_1c;
if(d>=10){
d=d%10;
_1c=1;
}else{
_1c=0;
}
_16._mantissa[i+j]=d;
}
if(_1c){
for(i=j-1;i>=0;i--){
if(_16._mantissa[i]!=9){
_16._mantissa[i]++;
_1c=0;
break;
}
_16._mantissa[i]=0;
}
if(_1c){
Array.prototype.splice.call(_16._mantissa,0,0,1);
if((CPDecimalMaxDigits*_1b)==_17._mantissa.length){
var _1e=-_16._exponent-1;
CPDecimalRound(_16,_16,_1e,_19);
}
if(CPDecimalMaxExponent<_16._exponent){
_16._isNaN=YES;
_1d=CPCalculationOverflow;
_16._exponent=CPDecimalMaxExponent;
}
}
}
return _1d;
};
CPDecimalAdd=function(_1f,_20,_21,_22,_23){
if(_20._isNaN||_21._isNaN){
_1f._isNaN=YES;
return CPCalculationNoError;
}
if(CPDecimalIsZero(_20)){
_CPDecimalSet(_1f,_21);
return CPCalculationNoError;
}
if(CPDecimalIsZero(_21)){
_CPDecimalSet(_1f,_20);
return CPCalculationNoError;
}
var n1=CPDecimalCopy(_20),n2=CPDecimalCopy(_21);
if(_20._isNegative!=_21._isNegative){
if(_20._isNegative){
n1._isNegative=NO;
return CPDecimalSubtract(_1f,_21,n1,_22);
}else{
n2._isNegative=NO;
return CPDecimalSubtract(_1f,_20,n2,_22);
}
}
var _24=CPDecimalNormalize(n1,n2,_22,_23);
var _25=0,ll=n1._mantissa.length,lr=n2._mantissa.length;
if(ll==lr){
_25=CPOrderedSame;
}else{
if(ll>lr){
_25=CPOrderedDescending;
}else{
_25=CPOrderedAscending;
}
}
if(_20._isNegative){
n1._isNegative=NO;
n2._isNegative=NO;
if(_25==CPOrderedDescending){
adderror=_SimpleAdd(_1f,n1,n2,_22,_23);
}else{
adderror=_SimpleAdd(_1f,n2,n1,_22,_23);
}
_1f._isNegative=YES;
if(CPCalculationUnderflow==adderror){
adderror=CPCalculationOverflow;
}else{
if(CPCalculationUnderflow==adderror){
adderror=CPCalculationUnderflow;
}
}
}else{
if(_25==CPOrderedAscending){
adderror=_SimpleAdd(_1f,n2,n1,_22,_23);
}else{
adderror=_SimpleAdd(_1f,n1,n2,_22,_23);
}
}
CPDecimalCompact(_1f);
if(adderror==CPCalculationNoError){
return _24;
}else{
return adderror;
}
};
_SimpleSubtract=function(_26,_27,_28,_29){
var _2a=CPCalculationNoError,_2b=0,l=_28._mantissa.length,j=_27._mantissa.length-l,i=l-1;
_CPDecimalSet(_26,_27);
for(;i>=0;i--){
var d=_26._mantissa[i+j]-_28._mantissa[i]-_2b;
if(d<0){
d=d+10;
_2b=1;
}else{
_2b=0;
}
_26._mantissa[i+j]=d;
}
if(_2b){
for(i=j-1;i>=0;i--){
if(_26._mantissa[i]!=0){
_26._mantissa[i]--;
break;
}
_26._mantissa[i]=9;
}
if(-1==i){
_2a=nil;
}
}
return _2a;
};
CPDecimalSubtract=function(_2c,_2d,_2e,_2f){
if(_2d._isNaN||_2e._isNaN){
_2c._isNaN=YES;
return CPCalculationNoError;
}
if(CPDecimalIsZero(_2d)){
_CPDecimalSet(_2c,_2e);
_2c._isNegative=!_2c._isNegative;
return CPCalculationNoError;
}
if(CPDecimalIsZero(_2e)){
_CPDecimalSet(_2c,_2d);
return CPCalculationNoError;
}
var n1=CPDecimalCopy(_2d),n2=CPDecimalCopy(_2e),_30=CPCalculationNoError;
if(_2d._isNegative!=_2e._isNegative){
if(_2d._isNegative){
n1._isNegative=NO;
_30=CPDecimalAdd(_2c,n1,_2e,_2f);
_2c._isNegative=YES;
if(_30==CPCalculationUnderflow){
_30=CPCalculationOverflow;
}else{
if(_30==CPCalculationOverflow){
_30=CPCalculationUnderflow;
}
}
return _30;
}else{
n2._isNegative=NO;
return CPDecimalAdd(_2c,_2d,n2,_2f);
}
}
var _31=CPDecimalNormalize(n1,n2,_2f),_32=CPDecimalCompare(_2d,_2e);
if(_32==CPOrderedSame){
_CPDecimalSetZero(_2c);
return CPCalculationNoError;
}
if(_2d._isNegative){
n1._isNegative=NO;
n2._isNegative=NO;
if(_32==CPOrderedAscending){
_30=_SimpleSubtract(_2c,n1,n2,_2f);
_2c._isNegative=YES;
}else{
_30=_SimpleSubtract(_2c,n2,n1,_2f);
}
}else{
if(_32==CPOrderedAscending){
_30=_SimpleSubtract(_2c,n2,n1,_2f);
_2c._isNegative=YES;
}else{
_30=_SimpleSubtract(_2c,n1,n2,_2f);
}
}
CPDecimalCompact(_2c);
if(_30==CPCalculationNoError){
return _31;
}else{
return _30;
}
};
_SimpleDivide=function(_33,_34,_35,_36){
var _37=CPCalculationNoError,n1=CPDecimalMakeZero(),k=0,_38=YES,_39=CPDecimalMaxDigits+1,_3a=0;
_CPDecimalSetZero(_33);
n1._mantissa=[];
while((_3a<_34._mantissa.length)||(n1._mantissa.length&&!((n1._mantissa.length==1)&&(n1._mantissa[0]==0)))){
while(CPOrderedAscending==CPDecimalCompare(n1,_35)){
if(_39==k){
break;
}
if(n1._exponent){
Array.prototype.push.call(n1._mantissa,0);
n1._exponent--;
n1._isCompact=NO;
}else{
if(_3a<_34._mantissa.length){
if(n1._mantissa.length||_34._mantissa[_3a]){
Array.prototype.push.call(n1._mantissa,(_34._mantissa[_3a]));
n1._isCompact=NO;
}
_3a++;
}else{
if(_33._exponent==CPDecimalMinExponent){
k=_39;
break;
}
Array.prototype.push.call(n1._mantissa,0);
_33._exponent--;
}
if(!_38){
k++;
_33._mantissa[k-1]=0;
}
}
}
if(_39==k){
_37=CPCalculationLossOfPrecision;
break;
}
if(_38){
_38=NO;
k++;
}
error1=CPDecimalSubtract(n1,n1,_35,_36);
if(error1!=CPCalculationNoError){
_37=error1;
}
_33._mantissa[k-1]++;
}
return _37;
};
CPDecimalDivide=function(_3b,_3c,_3d,_3e){
var _3f=CPCalculationNoError,exp=_3c._exponent-_3d._exponent,neg=(_3c._isNegative!=_3d._isNegative);
if(_3c._isNaN||_3d._isNaN){
_3b._isNaN=YES;
return CPCalculationNoError;
}
if(CPDecimalIsZero(_3d)){
_3b._isNaN=YES;
return CPCalculationDivideByZero;
}
if(CPDecimalIsZero(_3c)){
_CPDecimalSetZero(_3b);
return CPCalculationNoError;
}
var n1=CPDecimalCopy(_3c),n2=CPDecimalCopy(_3d);
n1._exponent=0;
n1._isNegative=NO;
n2._exponent=0;
n2._isNegative=NO;
_3f=_SimpleDivide(_3b,n1,n2,_3e);
CPDecimalCompact(_3b);
if(_3b._exponent+exp>CPDecimalMaxExponent){
_3b._isNaN=YES;
if(neg){
return CPCalculationUnderflow;
}else{
return CPCalculationOverflow;
}
}else{
if(_3b._exponent+exp<CPDecimalMinExponent){
CPDecimalRound(_3b,_3b,exp+CPDecimalMaxExponent+1,_3e);
_3f=CPCalculationLossOfPrecision;
if(_3b._exponent+exp<CPDecimalMinExponent){
CPDecimalSetZero(_3b);
return _3f;
}
}
}
_3b._exponent+=exp;
_3b._isNegative=neg;
return _3f;
};
_SimpleMultiply=function(_40,_41,_42,_43,_44){
var _45=CPCalculationNoError,_46=0,exp=0,n=CPDecimalMakeZero();
_CPDecimalSetZero(_40);
var i=0;
for(;i<_42._mantissa.length;i++){
_CPDecimalSetZero(n);
n._exponent=_42._mantissa.length-i-1;
_46=0;
d=_42._mantissa[i];
if(d==0){
continue;
}
var j=0;
for(j=_41._mantissa.length-1;j>=0;j--){
e=_41._mantissa[j]*d+_46;
if(e>=10){
_46=FLOOR(e/10);
e=e%10;
}else{
_46=0;
}
n._mantissa[j+1]=e;
}
n._mantissa[0]=_46;
CPDecimalCompact(n);
error1=CPDecimalAdd(_40,_40,n,_43,YES);
if(error1!=CPCalculationNoError){
_45=error1;
}
}
if(_40._exponent+exp>CPDecimalMaxExponent){
_40._isNaN=YES;
return CPCalculationOverflow;
}
_40._exponent+=exp;
if(_40._mantissa.length>CPDecimalMaxDigits&&!_44){
_40._isCompact=NO;
var _47=CPDecimalMaxDigits-(_40._mantissa.length+_40._exponent);
CPDecimalRound(_40,_40,_47,_43);
_45=CPCalculationLossOfPrecision;
}
return _45;
};
CPDecimalMultiply=function(_48,_49,_4a,_4b,_4c){
var _4d=CPCalculationNoError,exp=_49._exponent+_4a._exponent,neg=(_49._isNegative!=_4a._isNegative);
if(_49._isNaN||_4a._isNaN){
_48._isNaN=YES;
return CPCalculationNoError;
}
if(CPDecimalIsZero(_4a)||CPDecimalIsZero(_49)){
_CPDecimalSetZero(_48);
return CPCalculationNoError;
}
if(exp>CPDecimalMaxExponent){
_48._isNaN=YES;
if(neg){
return CPCalculationUnderflow;
}else{
return CPCalculationOverflow;
}
}
var n1=CPDecimalCopy(_49),n2=CPDecimalCopy(_4a);
n1._exponent=0;
n2._exponent=0;
n1._isNegative=NO;
n2._isNegative=NO;
var _4e=0,ll=n1._mantissa.length,lr=n2._mantissa.length;
if(ll==lr){
_4e=CPOrderedSame;
}else{
if(ll>lr){
_4e=CPOrderedDescending;
}else{
_4e=CPOrderedAscending;
}
}
if(_4e==CPOrderedDescending){
_4d=_SimpleMultiply(_48,n1,n2,_4b,_4c);
}else{
_4d=_SimpleMultiply(_48,n2,n1,_4b,_4c);
}
CPDecimalCompact(_48);
if(_48._exponent+exp>CPDecimalMaxExponent){
_48._isNaN=YES;
if(neg){
return CPCalculationUnderflow;
}else{
return CPCalculationOverflow;
}
}else{
if(_48._exponent+exp<CPDecimalMinExponent){
CPDecimalRound(_48,_48,exp+CPDecimalMaxExponent+1,_4b);
_4d=CPCalculationLossOfPrecision;
if(_48._exponent+exp<CPDecimalMinExponent){
_CPDecimalSetZero(_48);
return _4d;
}
}
}
_48._exponent+=exp;
_48._isNegative=neg;
return _4d;
};
CPDecimalMultiplyByPowerOf10=function(_4f,dcm,_50,_51){
_CPDecimalSet(_4f,dcm);
var p=_4f._exponent+_50;
if(p>CPDecimalMaxExponent){
_4f._isNaN=YES;
return CPCalculationOverflow;
}
if(p<CPDecimalMinExponent){
_4f._isNaN=YES;
return CPCalculationUnderflow;
}
_4f._exponent+=_50;
return CPCalculationNoError;
};
CPDecimalPower=function(_52,dcm,_53,_54){
var _55=CPCalculationNoError,neg=(dcm._isNegative&&(_53%2)),n1=CPDecimalCopy(dcm);
n1._isNegative=NO;
_CPDecimalSetOne(_52);
var e=_53;
while(e){
if(e&1){
_55=CPDecimalMultiply(_52,_52,n1,_54);
}
_55=CPDecimalMultiply(n1,n1,n1,_54);
e>>=1;
if(_55>CPCalculationLossOfPrecision){
break;
}
}
_52._isNegative=neg;
CPDecimalCompact(_52);
return _55;
};
CPDecimalNormalize=function(_56,_57,_58,_59){
var _5a=(_59)?2:1;
if(_56._isNaN||_57._isNaN){
return CPCalculationNoError;
}
if(!_56._isCompact){
CPDecimalCompact(_56);
}
if(!_57._isCompact){
CPDecimalCompact(_57);
}
if(_56._exponent==_57._exponent){
return CPCalculationNoError;
}
var e1=_56._exponent,e2=_57._exponent;
var l2=_57._mantissa.length,l1=_56._mantissa.length,l=0;
var e=0;
if(e2>e1&&e1>=0&&e2>=0){
e=e2-e1;
}else{
if(e2>e1&&e1<0&&e2>=0){
e=e2-e1;
}else{
if(e2>e1&&e1<0&&e2<0){
e=e2-e1;
}else{
if(e2<e1&&e1>=0&&e2>=0){
e=e1-e2;
}else{
if(e2<e1&&e1>=0&&e2<0){
e=e1-e2;
}else{
if(e2<e1&&e1<0&&e2<0){
e=e1-e2;
}
}
}
}
}
}
if(e2>e1){
l=MIN((CPDecimalMaxDigits*_5a)-l2,e);
}else{
l=MIN((CPDecimalMaxDigits*_5a)-l1,e);
}
for(var i=0;i<l;i++){
if(e2>e1){
Array.prototype.push.call(_57._mantissa,0);
}else{
Array.prototype.push.call(_56._mantissa,0);
}
}
if(e2>e1){
_57._exponent-=l;
_57._isCompact=NO;
}else{
_56._exponent-=l;
_56._isCompact=NO;
}
if(l!=ABS(e2-e1)){
if(e2>e1){
CPDecimalRound(_56,_56,-_57._exponent,_58);
l1=CPDecimalIsZero(_56);
}else{
CPDecimalRound(_57,_57,-_56._exponent,_58);
l2=CPDecimalIsZero(_57);
}
if((_56._exponent!=_57._exponent)&&((!l1)||(!l2))){
if(e2>e1){
l1=_56._mantissa.length;
l=MIN((CPDecimalMaxDigits*_5a)-l1,ABS(_56._exponent-_57._exponent));
for(var i=0;i<l;i++){
_56._mantissa[i+l1]=0;
}
_56._isCompact=NO;
_56._exponent=_57._exponent;
}else{
l2=_57._mantissa.length;
l=MIN((CPDecimalMaxDigits*_5a)-l2,ABS(_57._exponent-_56._exponent));
for(var i=0;i<l;i++){
_57._mantissa[i+l2]=0;
}
_57._exponent=_56._exponent;
_57._isCompact=NO;
}
}
return CPCalculationLossOfPrecision;
}
return CPCalculationNoError;
};
CPDecimalRound=function(_5b,dcm,_5c,_5d){
if(dcm._isNaN){
return;
}
if(!dcm._isCompact){
CPDecimalCompact(dcm);
}
if(_5c==CPDecimalNoScale){
return;
}
_CPDecimalSet(_5b,dcm);
var mc=_5b._mantissa.length,l=mc+_5c+_5b._exponent;
if(mc<=l){
return;
}else{
if(l<=0){
_CPDecimalSetZero(_5b);
return;
}else{
var c=0,n=0,up=0;
_5b._exponent+=mc-l;
switch(_5d){
case CPRoundDown:
up=_5b._isNegative;
break;
case CPRoundUp:
up=!_5b._isNegative;
break;
case CPRoundPlain:
n=_5b._mantissa[l];
up=(n>=5);
break;
case _CPRoundHalfDown:
n=_5b._mantissa[l];
up=(n>5);
break;
case CPRoundBankers:
n=_5b._mantissa[l];
if(n>5){
up=YES;
}else{
if(n<5){
up=NO;
}else{
if(l==0){
c=0;
}else{
c=_5b._mantissa[l-1];
}
up=((c%2)!=0);
}
}
break;
default:
up=NO;
break;
}
_5b._mantissa=Array.prototype.slice.call(_5b._mantissa,0,l);
if(up){
for(var i=l-1;i>=0;i--){
if(_5b._mantissa[i]!=9){
_5b._mantissa[i]++;
break;
}
_5b._mantissa[i]=0;
}
if(i==-1){
_5b._mantissa[0]=1;
if(_5b._exponent>=CPDecimalMaxExponent){
Array.prototype.push.call(_5b._mantissa,0);
}else{
_5b._exponent++;
}
}
}
}
}
CPDecimalCompact(_5b);
};
CPDecimalCompact=function(dcm){
if(!dcm||dcm._mantissa.length==0||CPDecimalIsNotANumber(dcm)){
return;
}
if(CPDecimalIsZero(dcm)){
_CPDecimalSetZero(dcm);
return;
}
while(dcm._mantissa[0]===0){
Array.prototype.shift.call(dcm._mantissa);
}
while(dcm._mantissa[dcm._mantissa.length-1]===0){
Array.prototype.pop.call(dcm._mantissa);
dcm._exponent++;
if(dcm._exponent+1>CPDecimalMaxExponent){
break;
}
}
dcm._isCompact=YES;
};
CPDecimalString=function(dcm,_5e){
if(dcm._isNaN){
return "NaN";
}
var _5f="",i=0;
if(dcm._isNegative){
_5f+="-";
}
var k=dcm._mantissa.length,l=((dcm._exponent<0)?dcm._exponent:0)+k;
if(l<0){
_5f+="0.";
for(i=0;i<ABS(l);i++){
_5f+="0";
}
l=k;
}else{
if(l==0){
_5f+="0";
}
}
for(i=0;i<l;i++){
_5f+=dcm._mantissa[i];
}
if(l<k){
_5f+=".";
for(i=l;i<k;i++){
_5f+=dcm._mantissa[i];
}
}
for(i=0;i<dcm._exponent;i++){
_5f+="0";
}
return _5f;
};
