@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.BinarySearch = type { }
%class.BS = type { [6 x i8 *], { i32, i32 * } *, i32 }
define i32 @main() {
entry0:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = call i8* @malloc ( i32 60)
  %tmp1 = bitcast i8* %tmp2 to %class.BS *
  call void  @$__BS_BS(%class.BS * %tmp1)
  %tmp3 = bitcast %class.BS * %tmp1 to %class.BS *
  %tmp4 = call i32  @__Start_BS(%class.BS * %tmp3, i32 20)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__Start_BS(%class.BS *  %this, i32  %sz) {
entry0:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %aux01 = alloca i32
  %aux02 = alloca i32
  %tmp0 = bitcast %class.BS * %this to %class.BS *
  %tmp1 = load i32 * %sz_tmp
  %tmp2 = call i32  @__Init_BS(%class.BS * %tmp0, i32 %tmp1)
  store i32 %tmp2, i32 * %aux01
  %tmp3 = bitcast %class.BS * %this to %class.BS *
  %tmp4 = call i32  @__Print_BS(%class.BS * %tmp3)
  store i32 %tmp4, i32 * %aux02
  %tmp5 = bitcast %class.BS * %this to %class.BS *
  %tmp6 = call i1  @__Search_BS(%class.BS * %tmp5, i32 8)
  br i1 %tmp6, label %then1, label %else3
then1:
  %tmp7 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp8 = call i32 (i8 *, ...)* @printf(i8 * %tmp7, i32 1)
  br label %cont2
else3:
  %tmp9 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp10 = call i32 (i8 *, ...)* @printf(i8 * %tmp9, i32 0)
  br label %cont2
cont2:
  %tmp11 = bitcast %class.BS * %this to %class.BS *
  %tmp12 = call i1  @__Search_BS(%class.BS * %tmp11, i32 19)
  br i1 %tmp12, label %then4, label %else6
then4:
  %tmp13 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp14 = call i32 (i8 *, ...)* @printf(i8 * %tmp13, i32 1)
  br label %cont5
else6:
  %tmp15 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp16 = call i32 (i8 *, ...)* @printf(i8 * %tmp15, i32 0)
  br label %cont5
cont5:
  %tmp17 = bitcast %class.BS * %this to %class.BS *
  %tmp18 = call i1  @__Search_BS(%class.BS * %tmp17, i32 20)
  br i1 %tmp18, label %then7, label %else9
then7:
  %tmp19 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp20 = call i32 (i8 *, ...)* @printf(i8 * %tmp19, i32 1)
  br label %cont8
else9:
  %tmp21 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp22 = call i32 (i8 *, ...)* @printf(i8 * %tmp21, i32 0)
  br label %cont8
cont8:
  %tmp23 = bitcast %class.BS * %this to %class.BS *
  %tmp24 = call i1  @__Search_BS(%class.BS * %tmp23, i32 21)
  br i1 %tmp24, label %then10, label %else12
then10:
  %tmp25 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp26 = call i32 (i8 *, ...)* @printf(i8 * %tmp25, i32 1)
  br label %cont11
else12:
  %tmp27 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp28 = call i32 (i8 *, ...)* @printf(i8 * %tmp27, i32 0)
  br label %cont11
cont11:
  %tmp29 = bitcast %class.BS * %this to %class.BS *
  %tmp30 = call i1  @__Search_BS(%class.BS * %tmp29, i32 37)
  br i1 %tmp30, label %then13, label %else15
then13:
  %tmp31 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp32 = call i32 (i8 *, ...)* @printf(i8 * %tmp31, i32 1)
  br label %cont14
else15:
  %tmp33 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp34 = call i32 (i8 *, ...)* @printf(i8 * %tmp33, i32 0)
  br label %cont14
cont14:
  %tmp35 = bitcast %class.BS * %this to %class.BS *
  %tmp36 = call i1  @__Search_BS(%class.BS * %tmp35, i32 38)
  br i1 %tmp36, label %then16, label %else18
then16:
  %tmp37 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp38 = call i32 (i8 *, ...)* @printf(i8 * %tmp37, i32 1)
  br label %cont17
else18:
  %tmp39 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp40 = call i32 (i8 *, ...)* @printf(i8 * %tmp39, i32 0)
  br label %cont17
cont17:
  %tmp41 = bitcast %class.BS * %this to %class.BS *
  %tmp42 = call i1  @__Search_BS(%class.BS * %tmp41, i32 39)
  br i1 %tmp42, label %then19, label %else21
then19:
  %tmp43 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp44 = call i32 (i8 *, ...)* @printf(i8 * %tmp43, i32 1)
  br label %cont20
else21:
  %tmp45 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp46 = call i32 (i8 *, ...)* @printf(i8 * %tmp45, i32 0)
  br label %cont20
cont20:
  %tmp47 = bitcast %class.BS * %this to %class.BS *
  %tmp48 = call i1  @__Search_BS(%class.BS * %tmp47, i32 50)
  br i1 %tmp48, label %then22, label %else24
then22:
  %tmp49 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp50 = call i32 (i8 *, ...)* @printf(i8 * %tmp49, i32 1)
  br label %cont23
else24:
  %tmp51 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp52 = call i32 (i8 *, ...)* @printf(i8 * %tmp51, i32 0)
  br label %cont23
cont23:
  ret i32 999
}
define i1 @__Search_BS(%class.BS *  %this, i32  %num) {
entry0:
  %num_tmp = alloca i32
  store i32 %num, i32 * %num_tmp
  %bs01 = alloca i1
  %right = alloca i32
  %left = alloca i32
  %var_cont = alloca i1
  %medium = alloca i32
  %aux01 = alloca i32
  %nt = alloca i32
  store i32 0, i32 * %aux01
  store i1 false, i1 * %bs01
  %tmp0 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp1 = load { i32, i32 * } * * %tmp0
  %tmp2 = getelementptr { i32, i32 * } * %tmp1, i32 0, i32 0
  %tmp3 = load i32 * %tmp2
  store i32 %tmp3, i32 * %right
  %tmp4 = load i32 * %right
  %tmp5 = sub i32 %tmp4, 1
  store i32 %tmp5, i32 * %right
  store i32 0, i32 * %left
  store i1 true, i1 * %var_cont
  br label %while3
while3:
  %tmp6 = load i1 * %var_cont
  br i1 %tmp6, label %do1, label %cont2
do1:
  %tmp7 = load i32 * %left
  %tmp8 = load i32 * %right
  %tmp9 = add i32 %tmp7, %tmp8
  store i32 %tmp9, i32 * %medium
  %tmp10 = bitcast %class.BS * %this to %class.BS *
  %tmp11 = load i32 * %medium
  %tmp12 = call i32  @__Div_BS(%class.BS * %tmp10, i32 %tmp11)
  store i32 %tmp12, i32 * %medium
  %tmp13 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp14 = load { i32, i32 * } * * %tmp13
  %tmp15 = getelementptr { i32, i32 * } * %tmp14, i32 0, i32 1
  %tmp16 = load i32 * * %tmp15
  %tmp18 = load i32 * %medium
  %tmp17 = getelementptr i32 * %tmp16, i32 %tmp18
  %tmp19 = load i32 * %tmp17
  store i32 %tmp19, i32 * %aux01
  %tmp20 = load i32 * %num_tmp
  %tmp21 = load i32 * %aux01
  %tmp22 = icmp slt i32 %tmp20, %tmp21
  br i1 %tmp22, label %then4, label %else6
then4:
  %tmp23 = load i32 * %medium
  %tmp24 = sub i32 %tmp23, 1
  store i32 %tmp24, i32 * %right
  br label %cont5
else6:
  %tmp25 = load i32 * %medium
  %tmp26 = add i32 %tmp25, 1
  store i32 %tmp26, i32 * %left
  br label %cont5
cont5:
  %tmp27 = bitcast %class.BS * %this to %class.BS *
  %tmp28 = load i32 * %aux01
  %tmp29 = load i32 * %num_tmp
  %tmp30 = call i1  @__Compare_BS(%class.BS * %tmp27, i32 %tmp28, i32 %tmp29)
  br i1 %tmp30, label %then7, label %else9
then7:
  store i1 false, i1 * %var_cont
  br label %cont8
else9:
  store i1 true, i1 * %var_cont
  br label %cont8
cont8:
  %tmp31 = load i32 * %right
  %tmp32 = load i32 * %left
  %tmp33 = icmp slt i32 %tmp31, %tmp32
  br i1 %tmp33, label %then10, label %else12
then10:
  store i1 false, i1 * %var_cont
  br label %cont11
else12:
  store i32 0, i32 * %nt
  br label %cont11
cont11:
  br label %while3
cont2:
  %tmp34 = bitcast %class.BS * %this to %class.BS *
  %tmp35 = load i32 * %aux01
  %tmp36 = load i32 * %num_tmp
  %tmp37 = call i1  @__Compare_BS(%class.BS * %tmp34, i32 %tmp35, i32 %tmp36)
  br i1 %tmp37, label %then13, label %else15
then13:
  store i1 true, i1 * %bs01
  br label %cont14
else15:
  store i1 false, i1 * %bs01
  br label %cont14
cont14:
  %tmp38 = load i1 * %bs01
  ret i1 %tmp38
}
define i32 @__Div_BS(%class.BS *  %this, i32  %num) {
entry0:
  %num_tmp = alloca i32
  store i32 %num, i32 * %num_tmp
  %count01 = alloca i32
  %count02 = alloca i32
  %aux03 = alloca i32
  store i32 0, i32 * %count01
  store i32 0, i32 * %count02
  %tmp0 = load i32 * %num_tmp
  %tmp1 = sub i32 %tmp0, 1
  store i32 %tmp1, i32 * %aux03
  br label %while3
while3:
  %tmp2 = load i32 * %count02
  %tmp3 = load i32 * %aux03
  %tmp4 = icmp slt i32 %tmp2, %tmp3
  br i1 %tmp4, label %do1, label %cont2
do1:
  %tmp5 = load i32 * %count01
  %tmp6 = add i32 %tmp5, 1
  store i32 %tmp6, i32 * %count01
  %tmp7 = load i32 * %count02
  %tmp8 = add i32 %tmp7, 2
  store i32 %tmp8, i32 * %count02
  br label %while3
cont2:
  %tmp9 = load i32 * %count01
  ret i32 %tmp9
}
define i1 @__Compare_BS(%class.BS *  %this, i32  %num1, i32  %num2) {
entry0:
  %num1_tmp = alloca i32
  store i32 %num1, i32 * %num1_tmp
  %num2_tmp = alloca i32
  store i32 %num2, i32 * %num2_tmp
  %retval = alloca i1
  %aux02 = alloca i32
  store i1 false, i1 * %retval
  %tmp0 = load i32 * %num2_tmp
  %tmp1 = add i32 %tmp0, 1
  store i32 %tmp1, i32 * %aux02
  %tmp2 = load i32 * %num1_tmp
  %tmp3 = load i32 * %num2_tmp
  %tmp4 = icmp slt i32 %tmp2, %tmp3
  br i1 %tmp4, label %then1, label %else3
then1:
  store i1 false, i1 * %retval
  br label %cont2
else3:
  %tmp5 = load i32 * %num1_tmp
  %tmp6 = load i32 * %aux02
  %tmp7 = icmp slt i32 %tmp5, %tmp6
  %tmp8 = sub i1 1, %tmp7
  br i1 %tmp8, label %then4, label %else6
then4:
  store i1 false, i1 * %retval
  br label %cont5
else6:
  store i1 true, i1 * %retval
  br label %cont5
cont5:
  br label %cont2
cont2:
  %tmp9 = load i1 * %retval
  ret i1 %tmp9
}
define i32 @__Print_BS(%class.BS *  %this) {
entry0:
  %j = alloca i32
  store i32 1, i32 * %j
  br label %while3
while3:
  %tmp0 = load i32 * %j
  %tmp1 = getelementptr %class.BS * %this, i32 0, i32 2
  %tmp2 = load i32 * %tmp1
  %tmp3 = icmp slt i32 %tmp0, %tmp2
  br i1 %tmp3, label %do1, label %cont2
do1:
  %tmp4 = getelementptr %class.BS * %this, i32 0, i32 1
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
  %tmp15 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp16 = call i32 (i8 *, ...)* @printf(i8 * %tmp15, i32 99999)
  ret i32 0
}
define i32 @__Init_BS(%class.BS *  %this, i32  %sz) {
entry0:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %j = alloca i32
  %k = alloca i32
  %aux02 = alloca i32
  %aux01 = alloca i32
  %tmp0 = load i32 * %sz_tmp
  %tmp1 = getelementptr %class.BS * %this, i32 0, i32 2
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
  %tmp10 = getelementptr %class.BS * %this, i32 0, i32 1
  store { i32, i32 * } * %tmp3, { i32, i32 * } * * %tmp10
  store i32 1, i32 * %j
  %tmp11 = getelementptr %class.BS * %this, i32 0, i32 2
  %tmp12 = load i32 * %tmp11
  %tmp13 = add i32 %tmp12, 1
  store i32 %tmp13, i32 * %k
  br label %while3
while3:
  %tmp14 = load i32 * %j
  %tmp15 = getelementptr %class.BS * %this, i32 0, i32 2
  %tmp16 = load i32 * %tmp15
  %tmp17 = icmp slt i32 %tmp14, %tmp16
  br i1 %tmp17, label %do1, label %cont2
do1:
  %tmp18 = load i32 * %j
  %tmp19 = mul i32 2, %tmp18
  store i32 %tmp19, i32 * %aux01
  %tmp20 = load i32 * %k
  %tmp21 = sub i32 %tmp20, 3
  store i32 %tmp21, i32 * %aux02
  %tmp22 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp23 = load { i32, i32 * } * * %tmp22
  %tmp24 = getelementptr { i32, i32 * } * %tmp23, i32 0, i32 1
  %tmp25 = load i32 * * %tmp24
  %tmp27 = load i32 * %j
  %tmp26 = getelementptr i32 * %tmp25, i32 %tmp27
  %tmp28 = load i32 * %aux01
  %tmp29 = load i32 * %aux02
  %tmp30 = add i32 %tmp28, %tmp29
  store i32 %tmp30, i32 * %tmp26
  %tmp31 = load i32 * %j
  %tmp32 = add i32 %tmp31, 1
  store i32 %tmp32, i32 * %j
  %tmp33 = load i32 * %k
  %tmp34 = sub i32 %tmp33, 1
  store i32 %tmp34, i32 * %k
  br label %while3
cont2:
  ret i32 0
}
define void @$__BinarySearch_BinarySearch(%class.BinarySearch *  %this) {
entry0:
  ret void 
}
define void @$__BS_BS(%class.BS *  %this) {
entry0:
  ret void 
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
