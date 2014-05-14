@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.Fac = type { [1 x i8 *] }
%class.Factorial = type { }
define i32 @main() {
entry0:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = call i8* @malloc ( i32 8)
  %tmp1 = bitcast i8* %tmp2 to %class.Fac *
  call void  @$__Fac_Fac(%class.Fac * %tmp1)
  %tmp3 = bitcast %class.Fac * %tmp1 to %class.Fac *
  %tmp4 = call i32  @__ComputeFac_Fac(%class.Fac * %tmp3, i32 10)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__ComputeFac_Fac(%class.Fac *  %this, i32  %num) {
entry0:
  %num_tmp = alloca i32
  store i32 %num, i32 * %num_tmp
  %num_aux = alloca i32
  %tmp0 = load i32 * %num_tmp
  %tmp1 = icmp slt i32 %tmp0, 1
  br i1 %tmp1, label %then1, label %else3
then1:
  store i32 1, i32 * %num_aux
  br label %cont2
else3:
  %tmp2 = load i32 * %num_tmp
  %tmp3 = bitcast %class.Fac * %this to %class.Fac *
  %tmp4 = load i32 * %num_tmp
  %tmp5 = sub i32 %tmp4, 1
  %tmp6 = call i32  @__ComputeFac_Fac(%class.Fac * %tmp3, i32 %tmp5)
  %tmp7 = mul i32 %tmp2, %tmp6
  store i32 %tmp7, i32 * %num_aux
  br label %cont2
cont2:
  %tmp8 = load i32 * %num_aux
  ret i32 %tmp8
}
define void @$__Fac_Fac(%class.Fac *  %this) {
entry0:
  ret void 
}
define void @$__Factorial_Factorial(%class.Factorial *  %this) {
entry0:
  ret void 
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
