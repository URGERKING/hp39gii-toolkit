// xor(n1,n2)
//
// input:
//   n1, n2: integers consisting of 0s and 1s.
// output:
//   A string consisting of 0s and 1s, which 
//   is the xor result of n1 and n2 READ AS
//   BINARY INTERGER.
//
// NOTE:
//   - n1 and n2 are consisting of 0s and 1s in
//     deciaml, like 11, 111 or 1010. `sxor(10,11)`
//     will output `"01"` but NOT `"0001"`.
//   - If n1 and n2 have different digit numbers
//     the function will extend the shorter one at
//     left to match the lenght, for instance 
//     `sxor(10,1)` will output `"11"` (which is 
//     `0b10 ^ 0b01`).
//   - Because of the accuracy limit on integer
//     literal, the input could has most 12 digits,
//     which means n1 and n2 must be less or equal
//     than `111111111111`.

exasc_help(ns,d,col)
BEGIN
IF col <= d THEN
  RETURN 48;
ELSE
  RETURN ns(col-d);
END;
END;

exasc(s, maxlen)
BEGIN
LOCAL slen,ns,d;
slen := dim(s);
IF slen < maxlen THEN
  ns := asc(s);
  d := maxlen - slen;
  ns := MAKEMAT(exasc_help(ns,d,I),1,maxlen);
  ns := ns(1);
  RETURN ns;
ELSE
  RETURN asc(s);
END;
END;

EXPORT sxor(n1,n2)
BEGIN
LOCAL s1,s2,ns1,ns2,maxlen,xorvec,k;
s1 := string(n1);
s2 := string(n2);
maxlen := MAX(dim(s1),dim(s2));
ns1 := exasc(s1,maxlen);
ns2 := exasc(s2,maxlen);
xorvec := MAKEMAT(48,1,maxlen);
xorvec := xorvec(1);
FOR k FROM 1 TO maxlen DO
  IF ns1(k) == ns2(k) THEN
    xorvec(k) := 48;
  ELSE
    xorvec(k) := 49;
  END;
END;
RETURN char(xorvec);
END;
