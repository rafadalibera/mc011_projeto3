@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.BBS = type { [4 x i8 *], { i32, i32 * } *, i32 }
%class.BubbleSort = type { }
define i32 @main() {
entry0:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = call i8* @malloc ( i32 44)
  %tmp1 = bitcast i8* %tmp2 to %class.BBS *
  call void  @$__BBS_BBS(%class.BBS * %tmp1)
  %tmp3 = bitcast %class.BBS * %tmp1 to %class.BBS *
  %tmp4 = call i32  @__Start_BBS(%class.BBS * %tmp3, i32 10)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__Start_BBS(%class.BBS *  %this, i32  %sz) {
entry0:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %aux01 = alloca i32
  %tmp0 = bitcast %class.BBS * %this to %class.BBS *
  %tmp1 = load i32 * %sz_tmp
  %tmp2 = call i32  @__Init_BBS(%class.BBS * %tmp0, i32 %tmp1)
  store i32 %tmp2, i32 * %aux01
  %tmp3 = bitcast %class.BBS * %this to %class.BBS *
  %tmp4 = call i32  @__Print_BBS(%class.BBS * %tmp3)
  store i32 %tmp4, i32 * %aux01
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 99999)
  %tmp7 = bitcast %class.BBS * %this to %class.BBS *
  %tmp8 = call i32  @__Sort_BBS(%class.BBS * %tmp7)
  store i32 %tmp8, i32 * %aux01
  %tmp9 = bitcast %class.BBS * %this to %class.BBS *
  %tmp10 = call i32  @__Print_BBS(%class.BBS * %tmp9)
  store i32 %tmp10, i32 * %aux01
  ret i32 0
}
define i32 @__Sort_BBS(%class.BBS *  %this) {
entry0:
  %nt = alloca i32
  %i = alloca i32
  %aux02 = alloca i32
  %aux04 = alloca i32
  %aux05 = alloca i32
  %aux06 = alloca i32
  %aux07 = alloca i32
  %j = alloca i32
  %t = alloca i32
  %tmp0 = getelementptr %class.BBS * %this, i32 0, i32 2
  %tmp1 = load i32 * %tmp0
  %tmp2 = sub i32 %tmp1, 1
  store i32 %tmp2, i32 * %i
  %tmp3 = sub i32 0, 1
  store i32 %tmp3, i32 * %aux02
  br label %while3
while3:
  %tmp4 = load i32 * %aux02
  %tmp5 = load i32 * %i
  %tmp6 = icmp slt i32 %tmp4, %tmp5
  br i1 %tmp6, label %do1, label %cont2
do1:
  store i32 1, i32 * %j
  br label %while6
while6:
  %tmp7 = load i32 * %j
  %tmp8 = load i32 * %i
  %tmp9 = add i32 %tmp8, 1
  %tmp10 = icmp slt i32 %tmp7, %tmp9
  br i1 %tmp10, label %do4, label %cont5
do4:
  %tmp11 = load i32 * %j
  %tmp12 = sub i32 %tmp11, 1
  store i32 %tmp12, i32 * %aux07
  %tmp13 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp14 = load { i32, i32 * } * * %tmp13
  %tmp15 = getelementptr { i32, i32 * } * %tmp14, i32 0, i32 1
  %tmp16 = load i32 * * %tmp15
  %tmp18 = load i32 * %aux07
  %tmp17 = getelementptr i32 * %tmp16, i32 %tmp18
  %tmp19 = load i32 * %tmp17
  store i32 %tmp19, i32 * %aux04
  %tmp20 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp21 = load { i32, i32 * } * * %tmp20
  %tmp22 = getelementptr { i32, i32 * } * %tmp21, i32 0, i32 1
  %tmp23 = load i32 * * %tmp22
  %tmp25 = load i32 * %j
  %tmp24 = getelementptr i32 * %tmp23, i32 %tmp25
  %tmp26 = load i32 * %tmp24
  store i32 %tmp26, i32 * %aux05
  %tmp27 = load i32 * %aux05
  %tmp28 = load i32 * %aux04
  %tmp29 = icmp slt i32 %tmp27, %tmp28
  br i1 %tmp29, label %then7, label %else9
then7:
  %tmp30 = load i32 * %j
  %tmp31 = sub i32 %tmp30, 1
  store i32 %tmp31, i32 * %aux06
  %tmp32 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp33 = load { i32, i32 * } * * %tmp32
  %tmp34 = getelementptr { i32, i32 * } * %tmp33, i32 0, i32 1
  %tmp35 = load i32 * * %tmp34
  %tmp37 = load i32 * %aux06
  %tmp36 = getelementptr i32 * %tmp35, i32 %tmp37
  %tmp38 = load i32 * %tmp36
  store i32 %tmp38, i32 * %t
  %tmp39 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp40 = load { i32, i32 * } * * %tmp39
  %tmp41 = getelementptr { i32, i32 * } * %tmp40, i32 0, i32 1
  %tmp42 = load i32 * * %tmp41
  %tmp44 = load i32 * %aux06
  %tmp43 = getelementptr i32 * %tmp42, i32 %tmp44
  %tmp45 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp46 = load { i32, i32 * } * * %tmp45
  %tmp47 = getelementptr { i32, i32 * } * %tmp46, i32 0, i32 1
  %tmp48 = load i32 * * %tmp47
  %tmp50 = load i32 * %j
  %tmp49 = getelementptr i32 * %tmp48, i32 %tmp50
  %tmp51 = load i32 * %tmp49
  store i32 %tmp51, i32 * %tmp43
  %tmp52 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp53 = load { i32, i32 * } * * %tmp52
  %tmp54 = getelementptr { i32, i32 * } * %tmp53, i32 0, i32 1
  %tmp55 = load i32 * * %tmp54
  %tmp57 = load i32 * %j
  %tmp56 = getelementptr i32 * %tmp55, i32 %tmp57
  %tmp58 = load i32 * %t
  store i32 %tmp58, i32 * %tmp56
  br label %cont8
else9:
  store i32 0, i32 * %nt
  br label %cont8
cont8:
  %tmp59 = load i32 * %j
  %tmp60 = add i32 %tmp59, 1
  store i32 %tmp60, i32 * %j
  br label %while6
cont5:
  %tmp61 = load i32 * %i
  %tmp62 = sub i32 %tmp61, 1
  store i32 %tmp62, i32 * %i
  br label %while3
cont2:
  ret i32 0
}
define i32 @__Print_BBS(%class.BBS *  %this) {
entry0:
  %j = alloca i32
  store i32 0, i32 * %j
  br label %while3
while3:
  %tmp0 = load i32 * %j
  %tmp1 = getelementptr %class.BBS * %this, i32 0, i32 2
  %tmp2 = load i32 * %tmp1
  %tmp3 = icmp slt i32 %tmp0, %tmp2
  br i1 %tmp3, label %do1, label %cont2
do1:
  %tmp4 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp5 = load { i32, i32 * } * * %tmp4
  %tmp6 = getelementptr { i32, i32 * } * %tmp5, i32 0, i32 1
  %tmp7 = load i32 * * %tmp6
  %tmp9 = load i32 * %j
  %tmp8 = getelementptr i32 * %tmp7, i32 %tmp9
  %tmp10 = load i32 * %tmp8
  %tmp11 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp12 = call i32 (i8 *, ...)* @printf(i8 * %tmp11, i32 %tmp10)
  %tmp13 = load i32 * %j
  %tmp14 = add i32 %tmp13, 1
  store i32 %tmp14, i32 * %j
  br label %while3
cont2:
  ret i32 0
}
define i32 @__Init_BBS(%class.BBS *  %this, i32  %sz) {
entry0:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %tmp0 = load i32 * %sz_tmp
  %tmp1 = getelementptr %class.BBS * %this, i32 0, i32 2
  store i32 %tmp0, i32 * %tmp1
  %tmp2 = load i32 * %sz_tmp
  %tmp4 = call i8* @malloc ( i32 12)
  %tmp3 = bitcast i8* %tmp4 to { i32, i32 * } *
  %tmp5 = getelementptr { i32, i32 * } * %tmp3, i32 0, i32 0
  store i32 %tmp2, i32 * %tmp5
  %tmp7 = mul i32 %tmp2, 4
  %tmp8 = call i8* @malloc ( i32 %tmp7)
  %tmp6 = bitcast i8* %tmp8 to i32 *
  %tmp9 = getelementptr { i32, i32 * } * %tmp3, i32 0, i32 1
  store i32 * %tmp6, i32 * * %tmp9
  %tmp10 = getelementptr %class.BBS * %this, i32 0, i32 1
  store { i32, i32 * } * %tmp3, { i32, i32 * } * * %tmp10
  %tmp11 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp12 = load { i32, i32 * } * * %tmp11
  %tmp13 = getelementptr { i32, i32 * } * %tmp12, i32 0, i32 1
  %tmp14 = load i32 * * %tmp13
  %tmp15 = getelementptr i32 * %tmp14, i32 0
  store i32 20, i32 * %tmp15
  %tmp16 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp17 = load { i32, i32 * } * * %tmp16
  %tmp18 = getelementptr { i32, i32 * } * %tmp17, i32 0, i32 1
  %tmp19 = load i32 * * %tmp18
  %tmp20 = getelementptr i32 * %tmp19, i32 1
  store i32 7, i32 * %tmp20
  %tmp21 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp22 = load { i32, i32 * } * * %tmp21
  %tmp23 = getelementptr { i32, i32 * } * %tmp22, i32 0, i32 1
  %tmp24 = load i32 * * %tmp23
  %tmp25 = getelementptr i32 * %tmp24, i32 2
  store i32 12, i32 * %tmp25
  %tmp26 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp27 = load { i32, i32 * } * * %tmp26
  %tmp28 = getelementptr { i32, i32 * } * %tmp27, i32 0, i32 1
  %tmp29 = load i32 * * %tmp28
  %tmp30 = getelementptr i32 * %tmp29, i32 3
  store i32 18, i32 * %tmp30
  %tmp31 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp32 = load { i32, i32 * } * * %tmp31
  %tmp33 = getelementptr { i32, i32 * } * %tmp32, i32 0, i32 1
  %tmp34 = load i32 * * %tmp33
  %tmp35 = getelementptr i32 * %tmp34, i32 4
  store i32 2, i32 * %tmp35
  %tmp36 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp37 = load { i32, i32 * } * * %tmp36
  %tmp38 = getelementptr { i32, i32 * } * %tmp37, i32 0, i32 1
  %tmp39 = load i32 * * %tmp38
  %tmp40 = getelementptr i32 * %tmp39, i32 5
  store i32 11, i32 * %tmp40
  %tmp41 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp42 = load { i32, i32 * } * * %tmp41
  %tmp43 = getelementptr { i32, i32 * } * %tmp42, i32 0, i32 1
  %tmp44 = load i32 * * %tmp43
  %tmp45 = getelementptr i32 * %tmp44, i32 6
  store i32 6, i32 * %tmp45
  %tmp46 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp47 = load { i32, i32 * } * * %tmp46
  %tmp48 = getelementptr { i32, i32 * } * %tmp47, i32 0, i32 1
  %tmp49 = load i32 * * %tmp48
  %tmp50 = getelementptr i32 * %tmp49, i32 7
  store i32 9, i32 * %tmp50
  %tmp51 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp52 = load { i32, i32 * } * * %tmp51
  %tmp53 = getelementptr { i32, i32 * } * %tmp52, i32 0, i32 1
  %tmp54 = load i32 * * %tmp53
  %tmp55 = getelementptr i32 * %tmp54, i32 8
  store i32 19, i32 * %tmp55
  %tmp56 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp57 = load { i32, i32 * } * * %tmp56
  %tmp58 = getelementptr { i32, i32 * } * %tmp57, i32 0, i32 1
  %tmp59 = load i32 * * %tmp58
  %tmp60 = getelementptr i32 * %tmp59, i32 9
  store i32 5, i32 * %tmp60
  ret i32 0
}
define void @$__BBS_BBS(%class.BBS *  %this) {
entry0:
  ret void 
}
define void @$__BubbleSort_BubbleSort(%class.BubbleSort *  %this) {
entry0:
  ret void 
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
