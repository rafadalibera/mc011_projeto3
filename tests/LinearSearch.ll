@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.LinearSearch = type { }
%class.LS = type { [4 x i8 *], { i32, i32 * } *, i32 }
define i32 @main() {
entry0:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = call i8* @malloc ( i32 44)
  %tmp1 = bitcast i8* %tmp2 to %class.LS *
  call void  @$__LS_LS(%class.LS * %tmp1)
  %tmp3 = bitcast %class.LS * %tmp1 to %class.LS *
  %tmp4 = call i32  @__Start_LS(%class.LS * %tmp3, i32 10)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__Start_LS(%class.LS *  %this, i32  %sz) {
entry0:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %aux01 = alloca i32
  %aux02 = alloca i32
  %tmp0 = bitcast %class.LS * %this to %class.LS *
  %tmp1 = load i32 * %sz_tmp
  %tmp2 = call i32  @__Init_LS(%class.LS * %tmp0, i32 %tmp1)
  store i32 %tmp2, i32 * %aux01
  %tmp3 = bitcast %class.LS * %this to %class.LS *
  %tmp4 = call i32  @__Print_LS(%class.LS * %tmp3)
  store i32 %tmp4, i32 * %aux02
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 9999)
  %tmp7 = bitcast %class.LS * %this to %class.LS *
  %tmp8 = call i32  @__Search_LS(%class.LS * %tmp7, i32 8)
  %tmp9 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp10 = call i32 (i8 *, ...)* @printf(i8 * %tmp9, i32 %tmp8)
  %tmp11 = bitcast %class.LS * %this to %class.LS *
  %tmp12 = call i32  @__Search_LS(%class.LS * %tmp11, i32 12)
  %tmp13 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp14 = call i32 (i8 *, ...)* @printf(i8 * %tmp13, i32 %tmp12)
  %tmp15 = bitcast %class.LS * %this to %class.LS *
  %tmp16 = call i32  @__Search_LS(%class.LS * %tmp15, i32 17)
  %tmp17 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp18 = call i32 (i8 *, ...)* @printf(i8 * %tmp17, i32 %tmp16)
  %tmp19 = bitcast %class.LS * %this to %class.LS *
  %tmp20 = call i32  @__Search_LS(%class.LS * %tmp19, i32 50)
  %tmp21 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp22 = call i32 (i8 *, ...)* @printf(i8 * %tmp21, i32 %tmp20)
  ret i32 55
}
define i32 @__Print_LS(%class.LS *  %this) {
entry0:
  %j = alloca i32
  store i32 1, i32 * %j
  br label %while3
while3:
  %tmp0 = load i32 * %j
  %tmp1 = getelementptr %class.LS * %this, i32 0, i32 2
  %tmp2 = load i32 * %tmp1
  %tmp3 = icmp slt i32 %tmp0, %tmp2
  br i1 %tmp3, label %do1, label %cont2
do1:
  %tmp4 = getelementptr %class.LS * %this, i32 0, i32 1
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
define i32 @__Search_LS(%class.LS *  %this, i32  %num) {
entry0:
  %num_tmp = alloca i32
  store i32 %num, i32 * %num_tmp
  %j = alloca i32
  %ls01 = alloca i1
  %ifound = alloca i32
  %aux01 = alloca i32
  %aux02 = alloca i32
  %nt = alloca i32
  store i32 1, i32 * %j
  store i1 false, i1 * %ls01
  store i32 0, i32 * %ifound
  br label %while3
while3:
  %tmp0 = load i32 * %j
  %tmp1 = getelementptr %class.LS * %this, i32 0, i32 2
  %tmp2 = load i32 * %tmp1
  %tmp3 = icmp slt i32 %tmp0, %tmp2
  br i1 %tmp3, label %do1, label %cont2
do1:
  %tmp4 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp5 = load { i32, i32 * } * * %tmp4
  %tmp6 = getelementptr { i32, i32 * } * %tmp5, i32 0, i32 1
  %tmp7 = load i32 * * %tmp6
  %tmp9 = load i32 * %j
  %tmp8 = getelementptr i32 * %tmp7, i32 %tmp9
  %tmp10 = load i32 * %tmp8
  store i32 %tmp10, i32 * %aux01
  %tmp11 = load i32 * %num_tmp
  %tmp12 = add i32 %tmp11, 1
  store i32 %tmp12, i32 * %aux02
  %tmp13 = load i32 * %aux01
  %tmp14 = load i32 * %num_tmp
  %tmp15 = icmp slt i32 %tmp13, %tmp14
  br i1 %tmp15, label %then4, label %else6
then4:
  store i32 0, i32 * %nt
  br label %cont5
else6:
  %tmp16 = load i32 * %aux01
  %tmp17 = load i32 * %aux02
  %tmp18 = icmp slt i32 %tmp16, %tmp17
  %tmp19 = sub i1 1, %tmp18
  br i1 %tmp19, label %then7, label %else9
then7:
  store i32 0, i32 * %nt
  br label %cont8
else9:
  store i1 true, i1 * %ls01
  store i32 1, i32 * %ifound
  %tmp20 = getelementptr %class.LS * %this, i32 0, i32 2
  %tmp21 = load i32 * %tmp20
  store i32 %tmp21, i32 * %j
  br label %cont8
cont8:
  br label %cont5
cont5:
  %tmp22 = load i32 * %j
  %tmp23 = add i32 %tmp22, 1
  store i32 %tmp23, i32 * %j
  br label %while3
cont2:
  %tmp24 = load i32 * %ifound
  ret i32 %tmp24
}
define i32 @__Init_LS(%class.LS *  %this, i32  %sz) {
entry0:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %j = alloca i32
  %k = alloca i32
  %aux01 = alloca i32
  %aux02 = alloca i32
  %tmp0 = load i32 * %sz_tmp
  %tmp1 = getelementptr %class.LS * %this, i32 0, i32 2
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
  %tmp10 = getelementptr %class.LS * %this, i32 0, i32 1
  store { i32, i32 * } * %tmp3, { i32, i32 * } * * %tmp10
  store i32 1, i32 * %j
  %tmp11 = getelementptr %class.LS * %this, i32 0, i32 2
  %tmp12 = load i32 * %tmp11
  %tmp13 = add i32 %tmp12, 1
  store i32 %tmp13, i32 * %k
  br label %while3
while3:
  %tmp14 = load i32 * %j
  %tmp15 = getelementptr %class.LS * %this, i32 0, i32 2
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
  %tmp22 = getelementptr %class.LS * %this, i32 0, i32 1
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
define void @$__LinearSearch_LinearSearch(%class.LinearSearch *  %this) {
entry0:
  ret void 
}
define void @$__LS_LS(%class.LS *  %this) {
entry0:
  ret void 
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
