@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.QuickSort = type { }
%class.QS = type { [4 x i8 *], { i32, i32 * } *, i32 }
define i32 @main() {
entry0:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = call i8* @malloc ( i32 44)
  %tmp1 = bitcast i8* %tmp2 to %class.QS *
  call void  @__QS_QS(%class.QS * %tmp1)
  %tmp3 = call i32  @__Start_QS(%class.QS * %tmp1, i32 10)
  %tmp4 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp5 = call i32 (i8 *, ...)* @printf(i8 * %tmp4, i32 %tmp3)
  %tmp6 = load i32 * %tmp0
  ret i32 %tmp6
}
define i32 @__Start_QS(%class.QS *  %this, i32  %sz) {
entry0:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %aux01 = alloca i32
  %tmp0 = bitcast %class.QS * %this to %class.QS *
  %tmp1 = load i32 * %sz_tmp
  %tmp2 = call i32  @__Init_QS(%class.QS * %tmp0, i32 %tmp1)
  store i32 %tmp2, i32 * %aux01
  %tmp3 = bitcast %class.QS * %this to %class.QS *
  %tmp4 = call i32  @__Print_QS(%class.QS * %tmp3)
  store i32 %tmp4, i32 * %aux01
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 9999)
  %tmp7 = getelementptr %class.QS * %this, i32 0, i32 2
  %tmp8 = load i32 * %tmp7
  %tmp9 = sub i32 %tmp8, 1
  store i32 %tmp9, i32 * %aux01
  %tmp10 = bitcast %class.QS * %this to %class.QS *
  %tmp11 = load i32 * %aux01
  %tmp12 = call i32  @__Sort_QS(%class.QS * %tmp10, i32 0, i32 %tmp11)
  store i32 %tmp12, i32 * %aux01
  %tmp13 = bitcast %class.QS * %this to %class.QS *
  %tmp14 = call i32  @__Print_QS(%class.QS * %tmp13)
  store i32 %tmp14, i32 * %aux01
  ret i32 0
}
define i32 @__Sort_QS(%class.QS *  %this, i32  %left, i32  %right) {
entry0:
  %left_tmp = alloca i32
  store i32 %left, i32 * %left_tmp
  %right_tmp = alloca i32
  store i32 %right, i32 * %right_tmp
  %v = alloca i32
  %i = alloca i32
  %j = alloca i32
  %nt = alloca i32
  %t = alloca i32
  %cont01 = alloca i1
  %cont02 = alloca i1
  %aux03 = alloca i32
  store i32 0, i32 * %t
  %tmp0 = load i32 * %left_tmp
  %tmp1 = load i32 * %right_tmp
  %tmp2 = icmp slt i32 %tmp0, %tmp1
  br i1 %tmp2, label %then1, label %else3
then1:
  %tmp3 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp4 = load { i32, i32 * } * * %tmp3
  %tmp5 = getelementptr { i32, i32 * } * %tmp4, i32 0, i32 1
  %tmp6 = load i32 * * %tmp5
  %tmp8 = load i32 * %right_tmp
  %tmp7 = getelementptr i32 * %tmp6, i32 %tmp8
  %tmp9 = load i32 * %tmp7
  store i32 %tmp9, i32 * %v
  %tmp10 = load i32 * %left_tmp
  %tmp11 = sub i32 %tmp10, 1
  store i32 %tmp11, i32 * %i
  %tmp12 = load i32 * %right_tmp
  store i32 %tmp12, i32 * %j
  store i1 true, i1 * %cont01
  br label %while6
while6:
  %tmp13 = load i1 * %cont01
  br i1 %tmp13, label %do4, label %cont5
do4:
  store i1 true, i1 * %cont02
  br label %while9
while9:
  %tmp14 = load i1 * %cont02
  br i1 %tmp14, label %do7, label %cont8
do7:
  %tmp15 = load i32 * %i
  %tmp16 = add i32 %tmp15, 1
  store i32 %tmp16, i32 * %i
  %tmp17 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp18 = load { i32, i32 * } * * %tmp17
  %tmp19 = getelementptr { i32, i32 * } * %tmp18, i32 0, i32 1
  %tmp20 = load i32 * * %tmp19
  %tmp22 = load i32 * %i
  %tmp21 = getelementptr i32 * %tmp20, i32 %tmp22
  %tmp23 = load i32 * %tmp21
  store i32 %tmp23, i32 * %aux03
  %tmp24 = load i32 * %aux03
  %tmp25 = load i32 * %v
  %tmp26 = icmp slt i32 %tmp24, %tmp25
  %tmp27 = sub i1 1, %tmp26
  br i1 %tmp27, label %then10, label %else12
then10:
  store i1 false, i1 * %cont02
  br label %cont11
else12:
  store i1 true, i1 * %cont02
  br label %cont11
cont11:
  br label %while9
cont8:
  store i1 true, i1 * %cont02
  br label %while15
while15:
  %tmp28 = load i1 * %cont02
  br i1 %tmp28, label %do13, label %cont14
do13:
  %tmp29 = load i32 * %j
  %tmp30 = sub i32 %tmp29, 1
  store i32 %tmp30, i32 * %j
  %tmp31 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp32 = load { i32, i32 * } * * %tmp31
  %tmp33 = getelementptr { i32, i32 * } * %tmp32, i32 0, i32 1
  %tmp34 = load i32 * * %tmp33
  %tmp36 = load i32 * %j
  %tmp35 = getelementptr i32 * %tmp34, i32 %tmp36
  %tmp37 = load i32 * %tmp35
  store i32 %tmp37, i32 * %aux03
  %tmp38 = load i32 * %v
  %tmp39 = load i32 * %aux03
  %tmp40 = icmp slt i32 %tmp38, %tmp39
  %tmp41 = sub i1 1, %tmp40
  br i1 %tmp41, label %then16, label %else18
then16:
  store i1 false, i1 * %cont02
  br label %cont17
else18:
  store i1 true, i1 * %cont02
  br label %cont17
cont17:
  br label %while15
cont14:
  %tmp42 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp43 = load { i32, i32 * } * * %tmp42
  %tmp44 = getelementptr { i32, i32 * } * %tmp43, i32 0, i32 1
  %tmp45 = load i32 * * %tmp44
  %tmp47 = load i32 * %i
  %tmp46 = getelementptr i32 * %tmp45, i32 %tmp47
  %tmp48 = load i32 * %tmp46
  store i32 %tmp48, i32 * %t
  %tmp49 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp50 = load { i32, i32 * } * * %tmp49
  %tmp51 = getelementptr { i32, i32 * } * %tmp50, i32 0, i32 1
  %tmp52 = load i32 * * %tmp51
  %tmp54 = load i32 * %i
  %tmp53 = getelementptr i32 * %tmp52, i32 %tmp54
  %tmp55 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp56 = load { i32, i32 * } * * %tmp55
  %tmp57 = getelementptr { i32, i32 * } * %tmp56, i32 0, i32 1
  %tmp58 = load i32 * * %tmp57
  %tmp60 = load i32 * %j
  %tmp59 = getelementptr i32 * %tmp58, i32 %tmp60
  %tmp61 = load i32 * %tmp59
  store i32 %tmp61, i32 * %tmp53
  %tmp62 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp63 = load { i32, i32 * } * * %tmp62
  %tmp64 = getelementptr { i32, i32 * } * %tmp63, i32 0, i32 1
  %tmp65 = load i32 * * %tmp64
  %tmp67 = load i32 * %j
  %tmp66 = getelementptr i32 * %tmp65, i32 %tmp67
  %tmp68 = load i32 * %t
  store i32 %tmp68, i32 * %tmp66
  %tmp69 = load i32 * %j
  %tmp70 = load i32 * %i
  %tmp71 = add i32 %tmp70, 1
  %tmp72 = icmp slt i32 %tmp69, %tmp71
  br i1 %tmp72, label %then19, label %else21
then19:
  store i1 false, i1 * %cont01
  br label %cont20
else21:
  store i1 true, i1 * %cont01
  br label %cont20
cont20:
  br label %while6
cont5:
  %tmp73 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp74 = load { i32, i32 * } * * %tmp73
  %tmp75 = getelementptr { i32, i32 * } * %tmp74, i32 0, i32 1
  %tmp76 = load i32 * * %tmp75
  %tmp78 = load i32 * %j
  %tmp77 = getelementptr i32 * %tmp76, i32 %tmp78
  %tmp79 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp80 = load { i32, i32 * } * * %tmp79
  %tmp81 = getelementptr { i32, i32 * } * %tmp80, i32 0, i32 1
  %tmp82 = load i32 * * %tmp81
  %tmp84 = load i32 * %i
  %tmp83 = getelementptr i32 * %tmp82, i32 %tmp84
  %tmp85 = load i32 * %tmp83
  store i32 %tmp85, i32 * %tmp77
  %tmp86 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp87 = load { i32, i32 * } * * %tmp86
  %tmp88 = getelementptr { i32, i32 * } * %tmp87, i32 0, i32 1
  %tmp89 = load i32 * * %tmp88
  %tmp91 = load i32 * %i
  %tmp90 = getelementptr i32 * %tmp89, i32 %tmp91
  %tmp92 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp93 = load { i32, i32 * } * * %tmp92
  %tmp94 = getelementptr { i32, i32 * } * %tmp93, i32 0, i32 1
  %tmp95 = load i32 * * %tmp94
  %tmp97 = load i32 * %right_tmp
  %tmp96 = getelementptr i32 * %tmp95, i32 %tmp97
  %tmp98 = load i32 * %tmp96
  store i32 %tmp98, i32 * %tmp90
  %tmp99 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp100 = load { i32, i32 * } * * %tmp99
  %tmp101 = getelementptr { i32, i32 * } * %tmp100, i32 0, i32 1
  %tmp102 = load i32 * * %tmp101
  %tmp104 = load i32 * %right_tmp
  %tmp103 = getelementptr i32 * %tmp102, i32 %tmp104
  %tmp105 = load i32 * %t
  store i32 %tmp105, i32 * %tmp103
  %tmp106 = bitcast %class.QS * %this to %class.QS *
  %tmp107 = load i32 * %left_tmp
  %tmp108 = load i32 * %i
  %tmp109 = sub i32 %tmp108, 1
  %tmp110 = call i32  @__Sort_QS(%class.QS * %tmp106, i32 %tmp107, i32 %tmp109)
  store i32 %tmp110, i32 * %nt
  %tmp111 = bitcast %class.QS * %this to %class.QS *
  %tmp112 = load i32 * %i
  %tmp113 = add i32 %tmp112, 1
  %tmp114 = load i32 * %right_tmp
  %tmp115 = call i32  @__Sort_QS(%class.QS * %tmp111, i32 %tmp113, i32 %tmp114)
  store i32 %tmp115, i32 * %nt
  br label %cont2
else3:
  store i32 0, i32 * %nt
  br label %cont2
cont2:
  ret i32 0
}
define i32 @__Print_QS(%class.QS *  %this) {
entry0:
  %j = alloca i32
  store i32 0, i32 * %j
  br label %while3
while3:
  %tmp0 = load i32 * %j
  %tmp1 = getelementptr %class.QS * %this, i32 0, i32 2
  %tmp2 = load i32 * %tmp1
  %tmp3 = icmp slt i32 %tmp0, %tmp2
  br i1 %tmp3, label %do1, label %cont2
do1:
  %tmp4 = getelementptr %class.QS * %this, i32 0, i32 1
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
define i32 @__Init_QS(%class.QS *  %this, i32  %sz) {
entry0:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %tmp0 = load i32 * %sz_tmp
  %tmp1 = getelementptr %class.QS * %this, i32 0, i32 2
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
  %tmp10 = getelementptr %class.QS * %this, i32 0, i32 1
  store { i32, i32 * } * %tmp3, { i32, i32 * } * * %tmp10
  %tmp11 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp12 = load { i32, i32 * } * * %tmp11
  %tmp13 = getelementptr { i32, i32 * } * %tmp12, i32 0, i32 1
  %tmp14 = load i32 * * %tmp13
  %tmp15 = getelementptr i32 * %tmp14, i32 0
  store i32 20, i32 * %tmp15
  %tmp16 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp17 = load { i32, i32 * } * * %tmp16
  %tmp18 = getelementptr { i32, i32 * } * %tmp17, i32 0, i32 1
  %tmp19 = load i32 * * %tmp18
  %tmp20 = getelementptr i32 * %tmp19, i32 1
  store i32 7, i32 * %tmp20
  %tmp21 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp22 = load { i32, i32 * } * * %tmp21
  %tmp23 = getelementptr { i32, i32 * } * %tmp22, i32 0, i32 1
  %tmp24 = load i32 * * %tmp23
  %tmp25 = getelementptr i32 * %tmp24, i32 2
  store i32 12, i32 * %tmp25
  %tmp26 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp27 = load { i32, i32 * } * * %tmp26
  %tmp28 = getelementptr { i32, i32 * } * %tmp27, i32 0, i32 1
  %tmp29 = load i32 * * %tmp28
  %tmp30 = getelementptr i32 * %tmp29, i32 3
  store i32 18, i32 * %tmp30
  %tmp31 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp32 = load { i32, i32 * } * * %tmp31
  %tmp33 = getelementptr { i32, i32 * } * %tmp32, i32 0, i32 1
  %tmp34 = load i32 * * %tmp33
  %tmp35 = getelementptr i32 * %tmp34, i32 4
  store i32 2, i32 * %tmp35
  %tmp36 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp37 = load { i32, i32 * } * * %tmp36
  %tmp38 = getelementptr { i32, i32 * } * %tmp37, i32 0, i32 1
  %tmp39 = load i32 * * %tmp38
  %tmp40 = getelementptr i32 * %tmp39, i32 5
  store i32 11, i32 * %tmp40
  %tmp41 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp42 = load { i32, i32 * } * * %tmp41
  %tmp43 = getelementptr { i32, i32 * } * %tmp42, i32 0, i32 1
  %tmp44 = load i32 * * %tmp43
  %tmp45 = getelementptr i32 * %tmp44, i32 6
  store i32 6, i32 * %tmp45
  %tmp46 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp47 = load { i32, i32 * } * * %tmp46
  %tmp48 = getelementptr { i32, i32 * } * %tmp47, i32 0, i32 1
  %tmp49 = load i32 * * %tmp48
  %tmp50 = getelementptr i32 * %tmp49, i32 7
  store i32 9, i32 * %tmp50
  %tmp51 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp52 = load { i32, i32 * } * * %tmp51
  %tmp53 = getelementptr { i32, i32 * } * %tmp52, i32 0, i32 1
  %tmp54 = load i32 * * %tmp53
  %tmp55 = getelementptr i32 * %tmp54, i32 8
  store i32 19, i32 * %tmp55
  %tmp56 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp57 = load { i32, i32 * } * * %tmp56
  %tmp58 = getelementptr { i32, i32 * } * %tmp57, i32 0, i32 1
  %tmp59 = load i32 * * %tmp58
  %tmp60 = getelementptr i32 * %tmp59, i32 9
  store i32 5, i32 * %tmp60
  ret i32 0
}
define void @__QuickSort_QuickSort(%class.QuickSort *  %this) {
entry0:
  ret void 
}
define void @__QS_QS(%class.QS *  %this) {
entry0:
  ret void 
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
