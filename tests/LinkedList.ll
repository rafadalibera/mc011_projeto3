@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.LinkedList = type { }
%class.LL = type { [1 x i8 *] }
%class.List = type { [10 x i8 *], %class.Element *, %class.List *, i1 }
%class.Element = type { [6 x i8 *], i32, i32, i1 }
define i32 @main() {
entry0:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = call i8* @malloc ( i32 8)
  %tmp1 = bitcast i8* %tmp2 to %class.LL *
  call void  @$__LL_LL(%class.LL * %tmp1)
  %tmp3 = bitcast %class.LL * %tmp1 to %class.LL *
  %tmp4 = call i32  @__Start_LL(%class.LL * %tmp3)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i1 @__Init_Element(%class.Element *  %this, i32  %v_Age, i32  %v_Salary, i1  %v_Married) {
entry0:
  %v_Age_tmp = alloca i32
  store i32 %v_Age, i32 * %v_Age_tmp
  %v_Salary_tmp = alloca i32
  store i32 %v_Salary, i32 * %v_Salary_tmp
  %v_Married_tmp = alloca i1
  store i1 %v_Married, i1 * %v_Married_tmp
  %tmp0 = load i32 * %v_Age_tmp
  %tmp1 = getelementptr %class.Element * %this, i32 0, i32 1
  store i32 %tmp0, i32 * %tmp1
  %tmp2 = load i32 * %v_Salary_tmp
  %tmp3 = getelementptr %class.Element * %this, i32 0, i32 2
  store i32 %tmp2, i32 * %tmp3
  %tmp4 = load i1 * %v_Married_tmp
  %tmp5 = getelementptr %class.Element * %this, i32 0, i32 3
  store i1 %tmp4, i1 * %tmp5
  ret i1 true
}
define i32 @__GetAge_Element(%class.Element *  %this) {
entry0:
  %tmp0 = getelementptr %class.Element * %this, i32 0, i32 1
  %tmp1 = load i32 * %tmp0
  ret i32 %tmp1
}
define i32 @__GetSalary_Element(%class.Element *  %this) {
entry0:
  %tmp0 = getelementptr %class.Element * %this, i32 0, i32 2
  %tmp1 = load i32 * %tmp0
  ret i32 %tmp1
}
define i1 @__GetMarried_Element(%class.Element *  %this) {
entry0:
  %tmp0 = getelementptr %class.Element * %this, i32 0, i32 3
  %tmp1 = load i1 * %tmp0
  ret i1 %tmp1
}
define i1 @__Equal_Element(%class.Element *  %this, %class.Element *  %other) {
entry0:
  %other_tmp = alloca %class.Element *
  store %class.Element * %other, %class.Element * * %other_tmp
  %ret_val = alloca i1
  %aux01 = alloca i32
  %aux02 = alloca i32
  %nt = alloca i32
  store i1 true, i1 * %ret_val
  %tmp0 = load %class.Element * * %other_tmp
  %tmp1 = bitcast %class.Element * %tmp0 to %class.Element *
  %tmp2 = call i32  @__GetAge_Element(%class.Element * %tmp1)
  store i32 %tmp2, i32 * %aux01
  %tmp3 = bitcast %class.Element * %this to %class.Element *
  %tmp4 = load i32 * %aux01
  %tmp5 = getelementptr %class.Element * %this, i32 0, i32 1
  %tmp6 = load i32 * %tmp5
  %tmp7 = call i1  @__Compare_Element(%class.Element * %tmp3, i32 %tmp4, i32 %tmp6)
  %tmp8 = sub i1 1, %tmp7
  br i1 %tmp8, label %then1, label %else3
then1:
  store i1 false, i1 * %ret_val
  br label %cont2
else3:
  %tmp9 = load %class.Element * * %other_tmp
  %tmp10 = bitcast %class.Element * %tmp9 to %class.Element *
  %tmp11 = call i32  @__GetSalary_Element(%class.Element * %tmp10)
  store i32 %tmp11, i32 * %aux02
  %tmp12 = bitcast %class.Element * %this to %class.Element *
  %tmp13 = load i32 * %aux02
  %tmp14 = getelementptr %class.Element * %this, i32 0, i32 2
  %tmp15 = load i32 * %tmp14
  %tmp16 = call i1  @__Compare_Element(%class.Element * %tmp12, i32 %tmp13, i32 %tmp15)
  %tmp17 = sub i1 1, %tmp16
  br i1 %tmp17, label %then4, label %else6
then4:
  store i1 false, i1 * %ret_val
  br label %cont5
else6:
  %tmp18 = getelementptr %class.Element * %this, i32 0, i32 3
  %tmp19 = load i1 * %tmp18
  br i1 %tmp19, label %then7, label %else9
then7:
  %tmp20 = load %class.Element * * %other_tmp
  %tmp21 = bitcast %class.Element * %tmp20 to %class.Element *
  %tmp22 = call i1  @__GetMarried_Element(%class.Element * %tmp21)
  %tmp23 = sub i1 1, %tmp22
  br i1 %tmp23, label %then10, label %else12
then10:
  store i1 false, i1 * %ret_val
  br label %cont11
else12:
  store i32 0, i32 * %nt
  br label %cont11
cont11:
  br label %cont8
else9:
  %tmp24 = load %class.Element * * %other_tmp
  %tmp25 = bitcast %class.Element * %tmp24 to %class.Element *
  %tmp26 = call i1  @__GetMarried_Element(%class.Element * %tmp25)
  br i1 %tmp26, label %then13, label %else15
then13:
  store i1 false, i1 * %ret_val
  br label %cont14
else15:
  store i32 0, i32 * %nt
  br label %cont14
cont14:
  br label %cont8
cont8:
  br label %cont5
cont5:
  br label %cont2
cont2:
  %tmp27 = load i1 * %ret_val
  ret i1 %tmp27
}
define i1 @__Compare_Element(%class.Element *  %this, i32  %num1, i32  %num2) {
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
define i1 @__Init_List(%class.List *  %this) {
entry0:
  %tmp0 = getelementptr %class.List * %this, i32 0, i32 3
  store i1 true, i1 * %tmp0
  ret i1 true
}
define i1 @__InitNew_List(%class.List *  %this, %class.Element *  %v_elem, %class.List *  %v_next, i1  %v_end) {
entry0:
  %v_elem_tmp = alloca %class.Element *
  store %class.Element * %v_elem, %class.Element * * %v_elem_tmp
  %v_next_tmp = alloca %class.List *
  store %class.List * %v_next, %class.List * * %v_next_tmp
  %v_end_tmp = alloca i1
  store i1 %v_end, i1 * %v_end_tmp
  %tmp0 = load i1 * %v_end_tmp
  %tmp1 = getelementptr %class.List * %this, i32 0, i32 3
  store i1 %tmp0, i1 * %tmp1
  %tmp2 = load %class.Element * * %v_elem_tmp
  %tmp3 = getelementptr %class.List * %this, i32 0, i32 1
  store %class.Element * %tmp2, %class.Element * * %tmp3
  %tmp4 = load %class.List * * %v_next_tmp
  %tmp5 = getelementptr %class.List * %this, i32 0, i32 2
  store %class.List * %tmp4, %class.List * * %tmp5
  ret i1 true
}
define %class.List * @__Insert_List(%class.List *  %this, %class.Element *  %new_elem) {
entry0:
  %new_elem_tmp = alloca %class.Element *
  store %class.Element * %new_elem, %class.Element * * %new_elem_tmp
  %ret_val = alloca i1
  %aux03 = alloca %class.List *
  %aux02 = alloca %class.List *
  store %class.List * %this, %class.List * * %aux03
  %tmp1 = call i8* @malloc ( i32 97)
  %tmp0 = bitcast i8* %tmp1 to %class.List *
  call void  @$__List_List(%class.List * %tmp0)
  store %class.List * %tmp0, %class.List * * %aux02
  %tmp2 = load %class.List * * %aux02
  %tmp3 = bitcast %class.List * %tmp2 to %class.List *
  %tmp4 = load %class.Element * * %new_elem_tmp
  %tmp5 = load %class.List * * %aux03
  %tmp6 = call i1  @__InitNew_List(%class.List * %tmp3, %class.Element * %tmp4, %class.List * %tmp5, i1 false)
  store i1 %tmp6, i1 * %ret_val
  %tmp7 = load %class.List * * %aux02
  ret %class.List * %tmp7
}
define i1 @__SetNext_List(%class.List *  %this, %class.List *  %v_next) {
entry0:
  %v_next_tmp = alloca %class.List *
  store %class.List * %v_next, %class.List * * %v_next_tmp
  %tmp0 = load %class.List * * %v_next_tmp
  %tmp1 = getelementptr %class.List * %this, i32 0, i32 2
  store %class.List * %tmp0, %class.List * * %tmp1
  ret i1 true
}
define %class.List * @__Delete_List(%class.List *  %this, %class.Element *  %e) {
entry0:
  %e_tmp = alloca %class.Element *
  store %class.Element * %e, %class.Element * * %e_tmp
  %my_head = alloca %class.List *
  %ret_val = alloca i1
  %aux05 = alloca i1
  %aux01 = alloca %class.List *
  %prev = alloca %class.List *
  %var_end = alloca i1
  %var_elem = alloca %class.Element *
  %aux04 = alloca i32
  %nt = alloca i32
  store %class.List * %this, %class.List * * %my_head
  store i1 false, i1 * %ret_val
  %tmp0 = sub i32 0, 1
  store i32 %tmp0, i32 * %aux04
  store %class.List * %this, %class.List * * %aux01
  store %class.List * %this, %class.List * * %prev
  %tmp1 = getelementptr %class.List * %this, i32 0, i32 3
  %tmp2 = load i1 * %tmp1
  store i1 %tmp2, i1 * %var_end
  %tmp3 = getelementptr %class.List * %this, i32 0, i32 1
  %tmp4 = load %class.Element * * %tmp3
  store %class.Element * %tmp4, %class.Element * * %var_elem
  br label %while3
while3:
  %tmp5 = alloca i1
  %tmp6 = load i1 * %var_end
  %tmp7 = sub i1 1, %tmp6
  br i1 %tmp7, label %and4, label %false5
and4:
  %tmp8 = load i1 * %ret_val
  %tmp9 = sub i1 1, %tmp8
  store i1 %tmp9, i1 * %tmp5
  br label %cont6
false5:
  store i1 %tmp7, i1 * %tmp5
  br label %cont6
cont6:
  %tmp10 = load i1 * %tmp5
  br i1 %tmp10, label %do1, label %cont2
do1:
  %tmp11 = load %class.Element * * %e_tmp
  %tmp12 = bitcast %class.Element * %tmp11 to %class.Element *
  %tmp13 = load %class.Element * * %var_elem
  %tmp14 = call i1  @__Equal_Element(%class.Element * %tmp12, %class.Element * %tmp13)
  br i1 %tmp14, label %then7, label %else9
then7:
  store i1 true, i1 * %ret_val
  %tmp15 = load i32 * %aux04
  %tmp16 = icmp slt i32 %tmp15, 0
  br i1 %tmp16, label %then10, label %else12
then10:
  %tmp17 = load %class.List * * %aux01
  %tmp18 = bitcast %class.List * %tmp17 to %class.List *
  %tmp19 = call %class.List *  @__GetNext_List(%class.List * %tmp18)
  store %class.List * %tmp19, %class.List * * %my_head
  br label %cont11
else12:
  %tmp20 = sub i32 0, 555
  %tmp21 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp22 = call i32 (i8 *, ...)* @printf(i8 * %tmp21, i32 %tmp20)
  %tmp23 = load %class.List * * %prev
  %tmp24 = bitcast %class.List * %tmp23 to %class.List *
  %tmp25 = load %class.List * * %aux01
  %tmp26 = bitcast %class.List * %tmp25 to %class.List *
  %tmp27 = call %class.List *  @__GetNext_List(%class.List * %tmp26)
  %tmp28 = call i1  @__SetNext_List(%class.List * %tmp24, %class.List * %tmp27)
  store i1 %tmp28, i1 * %aux05
  %tmp29 = sub i32 0, 555
  %tmp30 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp31 = call i32 (i8 *, ...)* @printf(i8 * %tmp30, i32 %tmp29)
  br label %cont11
cont11:
  br label %cont8
else9:
  store i32 0, i32 * %nt
  br label %cont8
cont8:
  %tmp32 = load i1 * %ret_val
  %tmp33 = sub i1 1, %tmp32
  br i1 %tmp33, label %then13, label %else15
then13:
  %tmp34 = load %class.List * * %aux01
  store %class.List * %tmp34, %class.List * * %prev
  %tmp35 = load %class.List * * %aux01
  %tmp36 = bitcast %class.List * %tmp35 to %class.List *
  %tmp37 = call %class.List *  @__GetNext_List(%class.List * %tmp36)
  store %class.List * %tmp37, %class.List * * %aux01
  %tmp38 = load %class.List * * %aux01
  %tmp39 = bitcast %class.List * %tmp38 to %class.List *
  %tmp40 = call i1  @__GetEnd_List(%class.List * %tmp39)
  store i1 %tmp40, i1 * %var_end
  %tmp41 = load %class.List * * %aux01
  %tmp42 = bitcast %class.List * %tmp41 to %class.List *
  %tmp43 = call %class.Element *  @__GetElem_List(%class.List * %tmp42)
  store %class.Element * %tmp43, %class.Element * * %var_elem
  store i32 1, i32 * %aux04
  br label %cont14
else15:
  store i32 0, i32 * %nt
  br label %cont14
cont14:
  br label %while3
cont2:
  %tmp44 = load %class.List * * %my_head
  ret %class.List * %tmp44
}
define i32 @__Search_List(%class.List *  %this, %class.Element *  %e) {
entry0:
  %e_tmp = alloca %class.Element *
  store %class.Element * %e, %class.Element * * %e_tmp
  %int_ret_val = alloca i32
  %aux01 = alloca %class.List *
  %var_elem = alloca %class.Element *
  %var_end = alloca i1
  %nt = alloca i32
  store i32 0, i32 * %int_ret_val
  store %class.List * %this, %class.List * * %aux01
  %tmp0 = getelementptr %class.List * %this, i32 0, i32 3
  %tmp1 = load i1 * %tmp0
  store i1 %tmp1, i1 * %var_end
  %tmp2 = getelementptr %class.List * %this, i32 0, i32 1
  %tmp3 = load %class.Element * * %tmp2
  store %class.Element * %tmp3, %class.Element * * %var_elem
  br label %while3
while3:
  %tmp4 = load i1 * %var_end
  %tmp5 = sub i1 1, %tmp4
  br i1 %tmp5, label %do1, label %cont2
do1:
  %tmp6 = load %class.Element * * %e_tmp
  %tmp7 = bitcast %class.Element * %tmp6 to %class.Element *
  %tmp8 = load %class.Element * * %var_elem
  %tmp9 = call i1  @__Equal_Element(%class.Element * %tmp7, %class.Element * %tmp8)
  br i1 %tmp9, label %then4, label %else6
then4:
  store i32 1, i32 * %int_ret_val
  br label %cont5
else6:
  store i32 0, i32 * %nt
  br label %cont5
cont5:
  %tmp10 = load %class.List * * %aux01
  %tmp11 = bitcast %class.List * %tmp10 to %class.List *
  %tmp12 = call %class.List *  @__GetNext_List(%class.List * %tmp11)
  store %class.List * %tmp12, %class.List * * %aux01
  %tmp13 = load %class.List * * %aux01
  %tmp14 = bitcast %class.List * %tmp13 to %class.List *
  %tmp15 = call i1  @__GetEnd_List(%class.List * %tmp14)
  store i1 %tmp15, i1 * %var_end
  %tmp16 = load %class.List * * %aux01
  %tmp17 = bitcast %class.List * %tmp16 to %class.List *
  %tmp18 = call %class.Element *  @__GetElem_List(%class.List * %tmp17)
  store %class.Element * %tmp18, %class.Element * * %var_elem
  br label %while3
cont2:
  %tmp19 = load i32 * %int_ret_val
  ret i32 %tmp19
}
define i1 @__GetEnd_List(%class.List *  %this) {
entry0:
  %tmp0 = getelementptr %class.List * %this, i32 0, i32 3
  %tmp1 = load i1 * %tmp0
  ret i1 %tmp1
}
define %class.Element * @__GetElem_List(%class.List *  %this) {
entry0:
  %tmp0 = getelementptr %class.List * %this, i32 0, i32 1
  %tmp1 = load %class.Element * * %tmp0
  ret %class.Element * %tmp1
}
define %class.List * @__GetNext_List(%class.List *  %this) {
entry0:
  %tmp0 = getelementptr %class.List * %this, i32 0, i32 2
  %tmp1 = load %class.List * * %tmp0
  ret %class.List * %tmp1
}
define i1 @__Print_List(%class.List *  %this) {
entry0:
  %aux01 = alloca %class.List *
  %var_end = alloca i1
  %var_elem = alloca %class.Element *
  store %class.List * %this, %class.List * * %aux01
  %tmp0 = getelementptr %class.List * %this, i32 0, i32 3
  %tmp1 = load i1 * %tmp0
  store i1 %tmp1, i1 * %var_end
  %tmp2 = getelementptr %class.List * %this, i32 0, i32 1
  %tmp3 = load %class.Element * * %tmp2
  store %class.Element * %tmp3, %class.Element * * %var_elem
  br label %while3
while3:
  %tmp4 = load i1 * %var_end
  %tmp5 = sub i1 1, %tmp4
  br i1 %tmp5, label %do1, label %cont2
do1:
  %tmp6 = load %class.Element * * %var_elem
  %tmp7 = bitcast %class.Element * %tmp6 to %class.Element *
  %tmp8 = call i32  @__GetAge_Element(%class.Element * %tmp7)
  %tmp9 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp10 = call i32 (i8 *, ...)* @printf(i8 * %tmp9, i32 %tmp8)
  %tmp11 = load %class.List * * %aux01
  %tmp12 = bitcast %class.List * %tmp11 to %class.List *
  %tmp13 = call %class.List *  @__GetNext_List(%class.List * %tmp12)
  store %class.List * %tmp13, %class.List * * %aux01
  %tmp14 = load %class.List * * %aux01
  %tmp15 = bitcast %class.List * %tmp14 to %class.List *
  %tmp16 = call i1  @__GetEnd_List(%class.List * %tmp15)
  store i1 %tmp16, i1 * %var_end
  %tmp17 = load %class.List * * %aux01
  %tmp18 = bitcast %class.List * %tmp17 to %class.List *
  %tmp19 = call %class.Element *  @__GetElem_List(%class.List * %tmp18)
  store %class.Element * %tmp19, %class.Element * * %var_elem
  br label %while3
cont2:
  ret i1 true
}
define i32 @__Start_LL(%class.LL *  %this) {
entry0:
  %head = alloca %class.List *
  %last_elem = alloca %class.List *
  %aux01 = alloca i1
  %el01 = alloca %class.Element *
  %el02 = alloca %class.Element *
  %el03 = alloca %class.Element *
  %tmp1 = call i8* @malloc ( i32 97)
  %tmp0 = bitcast i8* %tmp1 to %class.List *
  call void  @$__List_List(%class.List * %tmp0)
  store %class.List * %tmp0, %class.List * * %last_elem
  %tmp2 = load %class.List * * %last_elem
  %tmp3 = bitcast %class.List * %tmp2 to %class.List *
  %tmp4 = call i1  @__Init_List(%class.List * %tmp3)
  store i1 %tmp4, i1 * %aux01
  %tmp5 = load %class.List * * %last_elem
  store %class.List * %tmp5, %class.List * * %head
  %tmp6 = load %class.List * * %head
  %tmp7 = bitcast %class.List * %tmp6 to %class.List *
  %tmp8 = call i1  @__Init_List(%class.List * %tmp7)
  store i1 %tmp8, i1 * %aux01
  %tmp9 = load %class.List * * %head
  %tmp10 = bitcast %class.List * %tmp9 to %class.List *
  %tmp11 = call i1  @__Print_List(%class.List * %tmp10)
  store i1 %tmp11, i1 * %aux01
  %tmp13 = call i8* @malloc ( i32 57)
  %tmp12 = bitcast i8* %tmp13 to %class.Element *
  call void  @$__Element_Element(%class.Element * %tmp12)
  store %class.Element * %tmp12, %class.Element * * %el01
  %tmp14 = load %class.Element * * %el01
  %tmp15 = bitcast %class.Element * %tmp14 to %class.Element *
  %tmp16 = call i1  @__Init_Element(%class.Element * %tmp15, i32 25, i32 37000, i1 false)
  store i1 %tmp16, i1 * %aux01
  %tmp17 = load %class.List * * %head
  %tmp18 = bitcast %class.List * %tmp17 to %class.List *
  %tmp19 = load %class.Element * * %el01
  %tmp20 = call %class.List *  @__Insert_List(%class.List * %tmp18, %class.Element * %tmp19)
  store %class.List * %tmp20, %class.List * * %head
  %tmp21 = load %class.List * * %head
  %tmp22 = bitcast %class.List * %tmp21 to %class.List *
  %tmp23 = call i1  @__Print_List(%class.List * %tmp22)
  store i1 %tmp23, i1 * %aux01
  %tmp24 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp25 = call i32 (i8 *, ...)* @printf(i8 * %tmp24, i32 10000000)
  %tmp27 = call i8* @malloc ( i32 57)
  %tmp26 = bitcast i8* %tmp27 to %class.Element *
  call void  @$__Element_Element(%class.Element * %tmp26)
  store %class.Element * %tmp26, %class.Element * * %el01
  %tmp28 = load %class.Element * * %el01
  %tmp29 = bitcast %class.Element * %tmp28 to %class.Element *
  %tmp30 = call i1  @__Init_Element(%class.Element * %tmp29, i32 39, i32 42000, i1 true)
  store i1 %tmp30, i1 * %aux01
  %tmp31 = load %class.Element * * %el01
  store %class.Element * %tmp31, %class.Element * * %el02
  %tmp32 = load %class.List * * %head
  %tmp33 = bitcast %class.List * %tmp32 to %class.List *
  %tmp34 = load %class.Element * * %el01
  %tmp35 = call %class.List *  @__Insert_List(%class.List * %tmp33, %class.Element * %tmp34)
  store %class.List * %tmp35, %class.List * * %head
  %tmp36 = load %class.List * * %head
  %tmp37 = bitcast %class.List * %tmp36 to %class.List *
  %tmp38 = call i1  @__Print_List(%class.List * %tmp37)
  store i1 %tmp38, i1 * %aux01
  %tmp39 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp40 = call i32 (i8 *, ...)* @printf(i8 * %tmp39, i32 10000000)
  %tmp42 = call i8* @malloc ( i32 57)
  %tmp41 = bitcast i8* %tmp42 to %class.Element *
  call void  @$__Element_Element(%class.Element * %tmp41)
  store %class.Element * %tmp41, %class.Element * * %el01
  %tmp43 = load %class.Element * * %el01
  %tmp44 = bitcast %class.Element * %tmp43 to %class.Element *
  %tmp45 = call i1  @__Init_Element(%class.Element * %tmp44, i32 22, i32 34000, i1 false)
  store i1 %tmp45, i1 * %aux01
  %tmp46 = load %class.List * * %head
  %tmp47 = bitcast %class.List * %tmp46 to %class.List *
  %tmp48 = load %class.Element * * %el01
  %tmp49 = call %class.List *  @__Insert_List(%class.List * %tmp47, %class.Element * %tmp48)
  store %class.List * %tmp49, %class.List * * %head
  %tmp50 = load %class.List * * %head
  %tmp51 = bitcast %class.List * %tmp50 to %class.List *
  %tmp52 = call i1  @__Print_List(%class.List * %tmp51)
  store i1 %tmp52, i1 * %aux01
  %tmp54 = call i8* @malloc ( i32 57)
  %tmp53 = bitcast i8* %tmp54 to %class.Element *
  call void  @$__Element_Element(%class.Element * %tmp53)
  store %class.Element * %tmp53, %class.Element * * %el03
  %tmp55 = load %class.Element * * %el03
  %tmp56 = bitcast %class.Element * %tmp55 to %class.Element *
  %tmp57 = call i1  @__Init_Element(%class.Element * %tmp56, i32 27, i32 34000, i1 false)
  store i1 %tmp57, i1 * %aux01
  %tmp58 = load %class.List * * %head
  %tmp59 = bitcast %class.List * %tmp58 to %class.List *
  %tmp60 = load %class.Element * * %el02
  %tmp61 = call i32  @__Search_List(%class.List * %tmp59, %class.Element * %tmp60)
  %tmp62 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp63 = call i32 (i8 *, ...)* @printf(i8 * %tmp62, i32 %tmp61)
  %tmp64 = load %class.List * * %head
  %tmp65 = bitcast %class.List * %tmp64 to %class.List *
  %tmp66 = load %class.Element * * %el03
  %tmp67 = call i32  @__Search_List(%class.List * %tmp65, %class.Element * %tmp66)
  %tmp68 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp69 = call i32 (i8 *, ...)* @printf(i8 * %tmp68, i32 %tmp67)
  %tmp70 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp71 = call i32 (i8 *, ...)* @printf(i8 * %tmp70, i32 10000000)
  %tmp73 = call i8* @malloc ( i32 57)
  %tmp72 = bitcast i8* %tmp73 to %class.Element *
  call void  @$__Element_Element(%class.Element * %tmp72)
  store %class.Element * %tmp72, %class.Element * * %el01
  %tmp74 = load %class.Element * * %el01
  %tmp75 = bitcast %class.Element * %tmp74 to %class.Element *
  %tmp76 = call i1  @__Init_Element(%class.Element * %tmp75, i32 28, i32 35000, i1 false)
  store i1 %tmp76, i1 * %aux01
  %tmp77 = load %class.List * * %head
  %tmp78 = bitcast %class.List * %tmp77 to %class.List *
  %tmp79 = load %class.Element * * %el01
  %tmp80 = call %class.List *  @__Insert_List(%class.List * %tmp78, %class.Element * %tmp79)
  store %class.List * %tmp80, %class.List * * %head
  %tmp81 = load %class.List * * %head
  %tmp82 = bitcast %class.List * %tmp81 to %class.List *
  %tmp83 = call i1  @__Print_List(%class.List * %tmp82)
  store i1 %tmp83, i1 * %aux01
  %tmp84 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp85 = call i32 (i8 *, ...)* @printf(i8 * %tmp84, i32 2220000)
  %tmp86 = load %class.List * * %head
  %tmp87 = bitcast %class.List * %tmp86 to %class.List *
  %tmp88 = load %class.Element * * %el02
  %tmp89 = call %class.List *  @__Delete_List(%class.List * %tmp87, %class.Element * %tmp88)
  store %class.List * %tmp89, %class.List * * %head
  %tmp90 = load %class.List * * %head
  %tmp91 = bitcast %class.List * %tmp90 to %class.List *
  %tmp92 = call i1  @__Print_List(%class.List * %tmp91)
  store i1 %tmp92, i1 * %aux01
  %tmp93 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp94 = call i32 (i8 *, ...)* @printf(i8 * %tmp93, i32 33300000)
  %tmp95 = load %class.List * * %head
  %tmp96 = bitcast %class.List * %tmp95 to %class.List *
  %tmp97 = load %class.Element * * %el01
  %tmp98 = call %class.List *  @__Delete_List(%class.List * %tmp96, %class.Element * %tmp97)
  store %class.List * %tmp98, %class.List * * %head
  %tmp99 = load %class.List * * %head
  %tmp100 = bitcast %class.List * %tmp99 to %class.List *
  %tmp101 = call i1  @__Print_List(%class.List * %tmp100)
  store i1 %tmp101, i1 * %aux01
  %tmp102 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp103 = call i32 (i8 *, ...)* @printf(i8 * %tmp102, i32 44440000)
  ret i32 0
}
define void @$__LinkedList_LinkedList(%class.LinkedList *  %this) {
entry0:
  ret void 
}
define void @$__LL_LL(%class.LL *  %this) {
entry0:
  ret void 
}
define void @$__List_List(%class.List *  %this) {
entry0:
  ret void 
}
define void @$__Element_Element(%class.Element *  %this) {
entry0:
  ret void 
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
