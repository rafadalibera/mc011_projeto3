@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.Visitor = type { [1 x i8 *], %class.Tree *, %class.Tree * }
%class.Tree = type { [21 x i8 *], %class.Tree *, %class.Tree *, i32, i1, i1, %class.Tree * }
%class.MyVisitor = type { [1 x i8 *], %class.Visitor }
%class.TreeVisitor = type { }
%class.TV = type { [1 x i8 *] }
define i32 @main() {
entry0:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = call i8* @malloc ( i32 8)
  %tmp1 = bitcast i8* %tmp2 to %class.TV *
  call void  @$__TV_TV(%class.TV * %tmp1)
  %tmp3 = bitcast %class.TV * %tmp1 to %class.TV *
  %tmp4 = call i32  @__Start_TV(%class.TV * %tmp3)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__Start_TV(%class.TV *  %this) {
entry0:
  %root = alloca %class.Tree *
  %ntb = alloca i1
  %nti = alloca i32
  %v = alloca %class.MyVisitor *
  %tmp1 = call i8* @malloc ( i32 198)
  %tmp0 = bitcast i8* %tmp1 to %class.Tree *
  call void  @$__Tree_Tree(%class.Tree * %tmp0)
  store %class.Tree * %tmp0, %class.Tree * * %root
  %tmp2 = load %class.Tree * * %root
  %tmp3 = bitcast %class.Tree * %tmp2 to %class.Tree *
  %tmp4 = call i1  @__Init_Tree(%class.Tree * %tmp3, i32 16)
  store i1 %tmp4, i1 * %ntb
  %tmp5 = load %class.Tree * * %root
  %tmp6 = bitcast %class.Tree * %tmp5 to %class.Tree *
  %tmp7 = call i1  @__Print_Tree(%class.Tree * %tmp6)
  store i1 %tmp7, i1 * %ntb
  %tmp8 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp9 = call i32 (i8 *, ...)* @printf(i8 * %tmp8, i32 100000000)
  %tmp10 = load %class.Tree * * %root
  %tmp11 = bitcast %class.Tree * %tmp10 to %class.Tree *
  %tmp12 = call i1  @__Insert_Tree(%class.Tree * %tmp11, i32 8)
  store i1 %tmp12, i1 * %ntb
  %tmp13 = load %class.Tree * * %root
  %tmp14 = bitcast %class.Tree * %tmp13 to %class.Tree *
  %tmp15 = call i1  @__Insert_Tree(%class.Tree * %tmp14, i32 24)
  store i1 %tmp15, i1 * %ntb
  %tmp16 = load %class.Tree * * %root
  %tmp17 = bitcast %class.Tree * %tmp16 to %class.Tree *
  %tmp18 = call i1  @__Insert_Tree(%class.Tree * %tmp17, i32 4)
  store i1 %tmp18, i1 * %ntb
  %tmp19 = load %class.Tree * * %root
  %tmp20 = bitcast %class.Tree * %tmp19 to %class.Tree *
  %tmp21 = call i1  @__Insert_Tree(%class.Tree * %tmp20, i32 12)
  store i1 %tmp21, i1 * %ntb
  %tmp22 = load %class.Tree * * %root
  %tmp23 = bitcast %class.Tree * %tmp22 to %class.Tree *
  %tmp24 = call i1  @__Insert_Tree(%class.Tree * %tmp23, i32 20)
  store i1 %tmp24, i1 * %ntb
  %tmp25 = load %class.Tree * * %root
  %tmp26 = bitcast %class.Tree * %tmp25 to %class.Tree *
  %tmp27 = call i1  @__Insert_Tree(%class.Tree * %tmp26, i32 28)
  store i1 %tmp27, i1 * %ntb
  %tmp28 = load %class.Tree * * %root
  %tmp29 = bitcast %class.Tree * %tmp28 to %class.Tree *
  %tmp30 = call i1  @__Insert_Tree(%class.Tree * %tmp29, i32 14)
  store i1 %tmp30, i1 * %ntb
  %tmp31 = load %class.Tree * * %root
  %tmp32 = bitcast %class.Tree * %tmp31 to %class.Tree *
  %tmp33 = call i1  @__Print_Tree(%class.Tree * %tmp32)
  store i1 %tmp33, i1 * %ntb
  %tmp34 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp35 = call i32 (i8 *, ...)* @printf(i8 * %tmp34, i32 100000000)
  %tmp37 = call i8* @malloc ( i32 32)
  %tmp36 = bitcast i8* %tmp37 to %class.MyVisitor *
  call void  @$__MyVisitor_MyVisitor(%class.MyVisitor * %tmp36)
  store %class.MyVisitor * %tmp36, %class.MyVisitor * * %v
  %tmp38 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp39 = call i32 (i8 *, ...)* @printf(i8 * %tmp38, i32 50000000)
  %tmp40 = load %class.Tree * * %root
  %tmp41 = bitcast %class.Tree * %tmp40 to %class.Tree *
  %tmp42 = load %class.MyVisitor * * %v
  %tmp43 = bitcast %class.MyVisitor * %tmp42 to %class.Visitor *
  %tmp44 = call i32  @__accept_Tree(%class.Tree * %tmp41, %class.Visitor * %tmp43)
  store i32 %tmp44, i32 * %nti
  %tmp45 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp46 = call i32 (i8 *, ...)* @printf(i8 * %tmp45, i32 100000000)
  %tmp47 = load %class.Tree * * %root
  %tmp48 = bitcast %class.Tree * %tmp47 to %class.Tree *
  %tmp49 = call i32  @__Search_Tree(%class.Tree * %tmp48, i32 24)
  %tmp50 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp51 = call i32 (i8 *, ...)* @printf(i8 * %tmp50, i32 %tmp49)
  %tmp52 = load %class.Tree * * %root
  %tmp53 = bitcast %class.Tree * %tmp52 to %class.Tree *
  %tmp54 = call i32  @__Search_Tree(%class.Tree * %tmp53, i32 12)
  %tmp55 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp56 = call i32 (i8 *, ...)* @printf(i8 * %tmp55, i32 %tmp54)
  %tmp57 = load %class.Tree * * %root
  %tmp58 = bitcast %class.Tree * %tmp57 to %class.Tree *
  %tmp59 = call i32  @__Search_Tree(%class.Tree * %tmp58, i32 16)
  %tmp60 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp61 = call i32 (i8 *, ...)* @printf(i8 * %tmp60, i32 %tmp59)
  %tmp62 = load %class.Tree * * %root
  %tmp63 = bitcast %class.Tree * %tmp62 to %class.Tree *
  %tmp64 = call i32  @__Search_Tree(%class.Tree * %tmp63, i32 50)
  %tmp65 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp66 = call i32 (i8 *, ...)* @printf(i8 * %tmp65, i32 %tmp64)
  %tmp67 = load %class.Tree * * %root
  %tmp68 = bitcast %class.Tree * %tmp67 to %class.Tree *
  %tmp69 = call i32  @__Search_Tree(%class.Tree * %tmp68, i32 12)
  %tmp70 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp71 = call i32 (i8 *, ...)* @printf(i8 * %tmp70, i32 %tmp69)
  %tmp72 = load %class.Tree * * %root
  %tmp73 = bitcast %class.Tree * %tmp72 to %class.Tree *
  %tmp74 = call i1  @__Delete_Tree(%class.Tree * %tmp73, i32 12)
  store i1 %tmp74, i1 * %ntb
  %tmp75 = load %class.Tree * * %root
  %tmp76 = bitcast %class.Tree * %tmp75 to %class.Tree *
  %tmp77 = call i1  @__Print_Tree(%class.Tree * %tmp76)
  store i1 %tmp77, i1 * %ntb
  %tmp78 = load %class.Tree * * %root
  %tmp79 = bitcast %class.Tree * %tmp78 to %class.Tree *
  %tmp80 = call i32  @__Search_Tree(%class.Tree * %tmp79, i32 12)
  %tmp81 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp82 = call i32 (i8 *, ...)* @printf(i8 * %tmp81, i32 %tmp80)
  ret i32 0
}
define i1 @__Init_Tree(%class.Tree *  %this, i32  %v_key) {
entry0:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %tmp0 = load i32 * %v_key_tmp
  %tmp1 = getelementptr %class.Tree * %this, i32 0, i32 3
  store i32 %tmp0, i32 * %tmp1
  %tmp2 = getelementptr %class.Tree * %this, i32 0, i32 4
  store i1 false, i1 * %tmp2
  %tmp3 = getelementptr %class.Tree * %this, i32 0, i32 5
  store i1 false, i1 * %tmp3
  ret i1 true
}
define i1 @__SetRight_Tree(%class.Tree *  %this, %class.Tree *  %rn) {
entry0:
  %rn_tmp = alloca %class.Tree *
  store %class.Tree * %rn, %class.Tree * * %rn_tmp
  %tmp0 = load %class.Tree * * %rn_tmp
  %tmp1 = getelementptr %class.Tree * %this, i32 0, i32 2
  store %class.Tree * %tmp0, %class.Tree * * %tmp1
  ret i1 true
}
define i1 @__SetLeft_Tree(%class.Tree *  %this, %class.Tree *  %ln) {
entry0:
  %ln_tmp = alloca %class.Tree *
  store %class.Tree * %ln, %class.Tree * * %ln_tmp
  %tmp0 = load %class.Tree * * %ln_tmp
  %tmp1 = getelementptr %class.Tree * %this, i32 0, i32 1
  store %class.Tree * %tmp0, %class.Tree * * %tmp1
  ret i1 true
}
define %class.Tree * @__GetRight_Tree(%class.Tree *  %this) {
entry0:
  %tmp0 = getelementptr %class.Tree * %this, i32 0, i32 2
  %tmp1 = load %class.Tree * * %tmp0
  ret %class.Tree * %tmp1
}
define %class.Tree * @__GetLeft_Tree(%class.Tree *  %this) {
entry0:
  %tmp0 = getelementptr %class.Tree * %this, i32 0, i32 1
  %tmp1 = load %class.Tree * * %tmp0
  ret %class.Tree * %tmp1
}
define i32 @__GetKey_Tree(%class.Tree *  %this) {
entry0:
  %tmp0 = getelementptr %class.Tree * %this, i32 0, i32 3
  %tmp1 = load i32 * %tmp0
  ret i32 %tmp1
}
define i1 @__SetKey_Tree(%class.Tree *  %this, i32  %v_key) {
entry0:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %tmp0 = load i32 * %v_key_tmp
  %tmp1 = getelementptr %class.Tree * %this, i32 0, i32 3
  store i32 %tmp0, i32 * %tmp1
  ret i1 true
}
define i1 @__GetHas_Right_Tree(%class.Tree *  %this) {
entry0:
  %tmp0 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp1 = load i1 * %tmp0
  ret i1 %tmp1
}
define i1 @__GetHas_Left_Tree(%class.Tree *  %this) {
entry0:
  %tmp0 = getelementptr %class.Tree * %this, i32 0, i32 4
  %tmp1 = load i1 * %tmp0
  ret i1 %tmp1
}
define i1 @__SetHas_Left_Tree(%class.Tree *  %this, i1  %val) {
entry0:
  %val_tmp = alloca i1
  store i1 %val, i1 * %val_tmp
  %tmp0 = load i1 * %val_tmp
  %tmp1 = getelementptr %class.Tree * %this, i32 0, i32 4
  store i1 %tmp0, i1 * %tmp1
  ret i1 true
}
define i1 @__SetHas_Right_Tree(%class.Tree *  %this, i1  %val) {
entry0:
  %val_tmp = alloca i1
  store i1 %val, i1 * %val_tmp
  %tmp0 = load i1 * %val_tmp
  %tmp1 = getelementptr %class.Tree * %this, i32 0, i32 5
  store i1 %tmp0, i1 * %tmp1
  ret i1 true
}
define i1 @__Compare_Tree(%class.Tree *  %this, i32  %num1, i32  %num2) {
entry0:
  %num1_tmp = alloca i32
  store i32 %num1, i32 * %num1_tmp
  %num2_tmp = alloca i32
  store i32 %num2, i32 * %num2_tmp
  %ntb = alloca i1
  %nti = alloca i32
  store i1 false, i1 * %ntb
  %tmp0 = load i32 * %num2_tmp
  %tmp1 = add i32 %tmp0, 1
  store i32 %tmp1, i32 * %nti
  %tmp2 = load i32 * %num1_tmp
  %tmp3 = load i32 * %num2_tmp
  %tmp4 = icmp slt i32 %tmp2, %tmp3
  br i1 %tmp4, label %then1, label %else3
then1:
  store i1 false, i1 * %ntb
  br label %cont2
else3:
  %tmp5 = load i32 * %num1_tmp
  %tmp6 = load i32 * %nti
  %tmp7 = icmp slt i32 %tmp5, %tmp6
  %tmp8 = sub i1 1, %tmp7
  br i1 %tmp8, label %then4, label %else6
then4:
  store i1 false, i1 * %ntb
  br label %cont5
else6:
  store i1 true, i1 * %ntb
  br label %cont5
cont5:
  br label %cont2
cont2:
  %tmp9 = load i1 * %ntb
  ret i1 %tmp9
}
define i1 @__Insert_Tree(%class.Tree *  %this, i32  %v_key) {
entry0:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %new_node = alloca %class.Tree *
  %ntb = alloca i1
  %current_node = alloca %class.Tree *
  %cont = alloca i1
  %key_aux = alloca i32
  %tmp1 = call i8* @malloc ( i32 198)
  %tmp0 = bitcast i8* %tmp1 to %class.Tree *
  call void  @$__Tree_Tree(%class.Tree * %tmp0)
  store %class.Tree * %tmp0, %class.Tree * * %new_node
  %tmp2 = load %class.Tree * * %new_node
  %tmp3 = bitcast %class.Tree * %tmp2 to %class.Tree *
  %tmp4 = load i32 * %v_key_tmp
  %tmp5 = call i1  @__Init_Tree(%class.Tree * %tmp3, i32 %tmp4)
  store i1 %tmp5, i1 * %ntb
  store %class.Tree * %this, %class.Tree * * %current_node
  store i1 true, i1 * %cont
  br label %while3
while3:
  %tmp6 = load i1 * %cont
  br i1 %tmp6, label %do1, label %cont2
do1:
  %tmp7 = load %class.Tree * * %current_node
  %tmp8 = bitcast %class.Tree * %tmp7 to %class.Tree *
  %tmp9 = call i32  @__GetKey_Tree(%class.Tree * %tmp8)
  store i32 %tmp9, i32 * %key_aux
  %tmp10 = load i32 * %v_key_tmp
  %tmp11 = load i32 * %key_aux
  %tmp12 = icmp slt i32 %tmp10, %tmp11
  br i1 %tmp12, label %then4, label %else6
then4:
  %tmp13 = load %class.Tree * * %current_node
  %tmp14 = bitcast %class.Tree * %tmp13 to %class.Tree *
  %tmp15 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp14)
  br i1 %tmp15, label %then7, label %else9
then7:
  %tmp16 = load %class.Tree * * %current_node
  %tmp17 = bitcast %class.Tree * %tmp16 to %class.Tree *
  %tmp18 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp17)
  store %class.Tree * %tmp18, %class.Tree * * %current_node
  br label %cont8
else9:
  store i1 false, i1 * %cont
  %tmp19 = load %class.Tree * * %current_node
  %tmp20 = bitcast %class.Tree * %tmp19 to %class.Tree *
  %tmp21 = call i1  @__SetHas_Left_Tree(%class.Tree * %tmp20, i1 true)
  store i1 %tmp21, i1 * %ntb
  %tmp22 = load %class.Tree * * %current_node
  %tmp23 = bitcast %class.Tree * %tmp22 to %class.Tree *
  %tmp24 = load %class.Tree * * %new_node
  %tmp25 = call i1  @__SetLeft_Tree(%class.Tree * %tmp23, %class.Tree * %tmp24)
  store i1 %tmp25, i1 * %ntb
  br label %cont8
cont8:
  br label %cont5
else6:
  %tmp26 = load %class.Tree * * %current_node
  %tmp27 = bitcast %class.Tree * %tmp26 to %class.Tree *
  %tmp28 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp27)
  br i1 %tmp28, label %then10, label %else12
then10:
  %tmp29 = load %class.Tree * * %current_node
  %tmp30 = bitcast %class.Tree * %tmp29 to %class.Tree *
  %tmp31 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp30)
  store %class.Tree * %tmp31, %class.Tree * * %current_node
  br label %cont11
else12:
  store i1 false, i1 * %cont
  %tmp32 = load %class.Tree * * %current_node
  %tmp33 = bitcast %class.Tree * %tmp32 to %class.Tree *
  %tmp34 = call i1  @__SetHas_Right_Tree(%class.Tree * %tmp33, i1 true)
  store i1 %tmp34, i1 * %ntb
  %tmp35 = load %class.Tree * * %current_node
  %tmp36 = bitcast %class.Tree * %tmp35 to %class.Tree *
  %tmp37 = load %class.Tree * * %new_node
  %tmp38 = call i1  @__SetRight_Tree(%class.Tree * %tmp36, %class.Tree * %tmp37)
  store i1 %tmp38, i1 * %ntb
  br label %cont11
cont11:
  br label %cont5
cont5:
  br label %while3
cont2:
  ret i1 true
}
define i1 @__Delete_Tree(%class.Tree *  %this, i32  %v_key) {
entry0:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %current_node = alloca %class.Tree *
  %parent_node = alloca %class.Tree *
  %cont = alloca i1
  %found = alloca i1
  %ntb = alloca i1
  %is_root = alloca i1
  %key_aux = alloca i32
  store %class.Tree * %this, %class.Tree * * %current_node
  store %class.Tree * %this, %class.Tree * * %parent_node
  store i1 true, i1 * %cont
  store i1 false, i1 * %found
  store i1 true, i1 * %is_root
  br label %while3
while3:
  %tmp0 = load i1 * %cont
  br i1 %tmp0, label %do1, label %cont2
do1:
  %tmp1 = load %class.Tree * * %current_node
  %tmp2 = bitcast %class.Tree * %tmp1 to %class.Tree *
  %tmp3 = call i32  @__GetKey_Tree(%class.Tree * %tmp2)
  store i32 %tmp3, i32 * %key_aux
  %tmp4 = load i32 * %v_key_tmp
  %tmp5 = load i32 * %key_aux
  %tmp6 = icmp slt i32 %tmp4, %tmp5
  br i1 %tmp6, label %then4, label %else6
then4:
  %tmp7 = load %class.Tree * * %current_node
  %tmp8 = bitcast %class.Tree * %tmp7 to %class.Tree *
  %tmp9 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp8)
  br i1 %tmp9, label %then7, label %else9
then7:
  %tmp10 = load %class.Tree * * %current_node
  store %class.Tree * %tmp10, %class.Tree * * %parent_node
  %tmp11 = load %class.Tree * * %current_node
  %tmp12 = bitcast %class.Tree * %tmp11 to %class.Tree *
  %tmp13 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp12)
  store %class.Tree * %tmp13, %class.Tree * * %current_node
  br label %cont8
else9:
  store i1 false, i1 * %cont
  br label %cont8
cont8:
  br label %cont5
else6:
  %tmp14 = load i32 * %key_aux
  %tmp15 = load i32 * %v_key_tmp
  %tmp16 = icmp slt i32 %tmp14, %tmp15
  br i1 %tmp16, label %then10, label %else12
then10:
  %tmp17 = load %class.Tree * * %current_node
  %tmp18 = bitcast %class.Tree * %tmp17 to %class.Tree *
  %tmp19 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp18)
  br i1 %tmp19, label %then13, label %else15
then13:
  %tmp20 = load %class.Tree * * %current_node
  store %class.Tree * %tmp20, %class.Tree * * %parent_node
  %tmp21 = load %class.Tree * * %current_node
  %tmp22 = bitcast %class.Tree * %tmp21 to %class.Tree *
  %tmp23 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp22)
  store %class.Tree * %tmp23, %class.Tree * * %current_node
  br label %cont14
else15:
  store i1 false, i1 * %cont
  br label %cont14
cont14:
  br label %cont11
else12:
  %tmp24 = load i1 * %is_root
  br i1 %tmp24, label %then16, label %else18
then16:
  %tmp25 = alloca i1
  %tmp26 = load %class.Tree * * %current_node
  %tmp27 = bitcast %class.Tree * %tmp26 to %class.Tree *
  %tmp28 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp27)
  %tmp29 = sub i1 1, %tmp28
  br i1 %tmp29, label %and19, label %false20
and19:
  %tmp30 = load %class.Tree * * %current_node
  %tmp31 = bitcast %class.Tree * %tmp30 to %class.Tree *
  %tmp32 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp31)
  %tmp33 = sub i1 1, %tmp32
  store i1 %tmp33, i1 * %tmp25
  br label %cont21
false20:
  store i1 %tmp29, i1 * %tmp25
  br label %cont21
cont21:
  %tmp34 = load i1 * %tmp25
  br i1 %tmp34, label %then22, label %else24
then22:
  store i1 true, i1 * %ntb
  br label %cont23
else24:
  %tmp35 = bitcast %class.Tree * %this to %class.Tree *
  %tmp36 = load %class.Tree * * %parent_node
  %tmp37 = load %class.Tree * * %current_node
  %tmp38 = call i1  @__Remove_Tree(%class.Tree * %tmp35, %class.Tree * %tmp36, %class.Tree * %tmp37)
  store i1 %tmp38, i1 * %ntb
  br label %cont23
cont23:
  br label %cont17
else18:
  %tmp39 = bitcast %class.Tree * %this to %class.Tree *
  %tmp40 = load %class.Tree * * %parent_node
  %tmp41 = load %class.Tree * * %current_node
  %tmp42 = call i1  @__Remove_Tree(%class.Tree * %tmp39, %class.Tree * %tmp40, %class.Tree * %tmp41)
  store i1 %tmp42, i1 * %ntb
  br label %cont17
cont17:
  store i1 true, i1 * %found
  store i1 false, i1 * %cont
  br label %cont11
cont11:
  br label %cont5
cont5:
  store i1 false, i1 * %is_root
  br label %while3
cont2:
  %tmp43 = load i1 * %found
  ret i1 %tmp43
}
define i1 @__Remove_Tree(%class.Tree *  %this, %class.Tree *  %p_node, %class.Tree *  %c_node) {
entry0:
  %p_node_tmp = alloca %class.Tree *
  store %class.Tree * %p_node, %class.Tree * * %p_node_tmp
  %c_node_tmp = alloca %class.Tree *
  store %class.Tree * %c_node, %class.Tree * * %c_node_tmp
  %ntb = alloca i1
  %auxkey1 = alloca i32
  %auxkey2 = alloca i32
  %tmp0 = load %class.Tree * * %c_node_tmp
  %tmp1 = bitcast %class.Tree * %tmp0 to %class.Tree *
  %tmp2 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp1)
  br i1 %tmp2, label %then1, label %else3
then1:
  %tmp3 = bitcast %class.Tree * %this to %class.Tree *
  %tmp4 = load %class.Tree * * %p_node_tmp
  %tmp5 = load %class.Tree * * %c_node_tmp
  %tmp6 = call i1  @__RemoveLeft_Tree(%class.Tree * %tmp3, %class.Tree * %tmp4, %class.Tree * %tmp5)
  store i1 %tmp6, i1 * %ntb
  br label %cont2
else3:
  %tmp7 = load %class.Tree * * %c_node_tmp
  %tmp8 = bitcast %class.Tree * %tmp7 to %class.Tree *
  %tmp9 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp8)
  br i1 %tmp9, label %then4, label %else6
then4:
  %tmp10 = bitcast %class.Tree * %this to %class.Tree *
  %tmp11 = load %class.Tree * * %p_node_tmp
  %tmp12 = load %class.Tree * * %c_node_tmp
  %tmp13 = call i1  @__RemoveRight_Tree(%class.Tree * %tmp10, %class.Tree * %tmp11, %class.Tree * %tmp12)
  store i1 %tmp13, i1 * %ntb
  br label %cont5
else6:
  %tmp14 = load %class.Tree * * %c_node_tmp
  %tmp15 = bitcast %class.Tree * %tmp14 to %class.Tree *
  %tmp16 = call i32  @__GetKey_Tree(%class.Tree * %tmp15)
  store i32 %tmp16, i32 * %auxkey1
  %tmp17 = load %class.Tree * * %p_node_tmp
  %tmp18 = bitcast %class.Tree * %tmp17 to %class.Tree *
  %tmp19 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp18)
  %tmp20 = bitcast %class.Tree * %tmp19 to %class.Tree *
  %tmp21 = call i32  @__GetKey_Tree(%class.Tree * %tmp20)
  store i32 %tmp21, i32 * %auxkey2
  %tmp22 = bitcast %class.Tree * %this to %class.Tree *
  %tmp23 = load i32 * %auxkey1
  %tmp24 = load i32 * %auxkey2
  %tmp25 = call i1  @__Compare_Tree(%class.Tree * %tmp22, i32 %tmp23, i32 %tmp24)
  br i1 %tmp25, label %then7, label %else9
then7:
  %tmp26 = load %class.Tree * * %p_node_tmp
  %tmp27 = bitcast %class.Tree * %tmp26 to %class.Tree *
  %tmp28 = getelementptr %class.Tree * %this, i32 0, i32 6
  %tmp29 = load %class.Tree * * %tmp28
  %tmp30 = call i1  @__SetLeft_Tree(%class.Tree * %tmp27, %class.Tree * %tmp29)
  store i1 %tmp30, i1 * %ntb
  %tmp31 = load %class.Tree * * %p_node_tmp
  %tmp32 = bitcast %class.Tree * %tmp31 to %class.Tree *
  %tmp33 = call i1  @__SetHas_Left_Tree(%class.Tree * %tmp32, i1 false)
  store i1 %tmp33, i1 * %ntb
  br label %cont8
else9:
  %tmp34 = load %class.Tree * * %p_node_tmp
  %tmp35 = bitcast %class.Tree * %tmp34 to %class.Tree *
  %tmp36 = getelementptr %class.Tree * %this, i32 0, i32 6
  %tmp37 = load %class.Tree * * %tmp36
  %tmp38 = call i1  @__SetRight_Tree(%class.Tree * %tmp35, %class.Tree * %tmp37)
  store i1 %tmp38, i1 * %ntb
  %tmp39 = load %class.Tree * * %p_node_tmp
  %tmp40 = bitcast %class.Tree * %tmp39 to %class.Tree *
  %tmp41 = call i1  @__SetHas_Right_Tree(%class.Tree * %tmp40, i1 false)
  store i1 %tmp41, i1 * %ntb
  br label %cont8
cont8:
  br label %cont5
cont5:
  br label %cont2
cont2:
  ret i1 true
}
define i1 @__RemoveRight_Tree(%class.Tree *  %this, %class.Tree *  %p_node, %class.Tree *  %c_node) {
entry0:
  %p_node_tmp = alloca %class.Tree *
  store %class.Tree * %p_node, %class.Tree * * %p_node_tmp
  %c_node_tmp = alloca %class.Tree *
  store %class.Tree * %c_node, %class.Tree * * %c_node_tmp
  %ntb = alloca i1
  br label %while3
while3:
  %tmp0 = load %class.Tree * * %c_node_tmp
  %tmp1 = bitcast %class.Tree * %tmp0 to %class.Tree *
  %tmp2 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp1)
  br i1 %tmp2, label %do1, label %cont2
do1:
  %tmp3 = load %class.Tree * * %c_node_tmp
  %tmp4 = bitcast %class.Tree * %tmp3 to %class.Tree *
  %tmp5 = load %class.Tree * * %c_node_tmp
  %tmp6 = bitcast %class.Tree * %tmp5 to %class.Tree *
  %tmp7 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp6)
  %tmp8 = bitcast %class.Tree * %tmp7 to %class.Tree *
  %tmp9 = call i32  @__GetKey_Tree(%class.Tree * %tmp8)
  %tmp10 = call i1  @__SetKey_Tree(%class.Tree * %tmp4, i32 %tmp9)
  store i1 %tmp10, i1 * %ntb
  %tmp11 = load %class.Tree * * %c_node_tmp
  store %class.Tree * %tmp11, %class.Tree * * %p_node_tmp
  %tmp12 = load %class.Tree * * %c_node_tmp
  %tmp13 = bitcast %class.Tree * %tmp12 to %class.Tree *
  %tmp14 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp13)
  store %class.Tree * %tmp14, %class.Tree * * %c_node_tmp
  br label %while3
cont2:
  %tmp15 = load %class.Tree * * %p_node_tmp
  %tmp16 = bitcast %class.Tree * %tmp15 to %class.Tree *
  %tmp17 = getelementptr %class.Tree * %this, i32 0, i32 6
  %tmp18 = load %class.Tree * * %tmp17
  %tmp19 = call i1  @__SetRight_Tree(%class.Tree * %tmp16, %class.Tree * %tmp18)
  store i1 %tmp19, i1 * %ntb
  %tmp20 = load %class.Tree * * %p_node_tmp
  %tmp21 = bitcast %class.Tree * %tmp20 to %class.Tree *
  %tmp22 = call i1  @__SetHas_Right_Tree(%class.Tree * %tmp21, i1 false)
  store i1 %tmp22, i1 * %ntb
  ret i1 true
}
define i1 @__RemoveLeft_Tree(%class.Tree *  %this, %class.Tree *  %p_node, %class.Tree *  %c_node) {
entry0:
  %p_node_tmp = alloca %class.Tree *
  store %class.Tree * %p_node, %class.Tree * * %p_node_tmp
  %c_node_tmp = alloca %class.Tree *
  store %class.Tree * %c_node, %class.Tree * * %c_node_tmp
  %ntb = alloca i1
  br label %while3
while3:
  %tmp0 = load %class.Tree * * %c_node_tmp
  %tmp1 = bitcast %class.Tree * %tmp0 to %class.Tree *
  %tmp2 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp1)
  br i1 %tmp2, label %do1, label %cont2
do1:
  %tmp3 = load %class.Tree * * %c_node_tmp
  %tmp4 = bitcast %class.Tree * %tmp3 to %class.Tree *
  %tmp5 = load %class.Tree * * %c_node_tmp
  %tmp6 = bitcast %class.Tree * %tmp5 to %class.Tree *
  %tmp7 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp6)
  %tmp8 = bitcast %class.Tree * %tmp7 to %class.Tree *
  %tmp9 = call i32  @__GetKey_Tree(%class.Tree * %tmp8)
  %tmp10 = call i1  @__SetKey_Tree(%class.Tree * %tmp4, i32 %tmp9)
  store i1 %tmp10, i1 * %ntb
  %tmp11 = load %class.Tree * * %c_node_tmp
  store %class.Tree * %tmp11, %class.Tree * * %p_node_tmp
  %tmp12 = load %class.Tree * * %c_node_tmp
  %tmp13 = bitcast %class.Tree * %tmp12 to %class.Tree *
  %tmp14 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp13)
  store %class.Tree * %tmp14, %class.Tree * * %c_node_tmp
  br label %while3
cont2:
  %tmp15 = load %class.Tree * * %p_node_tmp
  %tmp16 = bitcast %class.Tree * %tmp15 to %class.Tree *
  %tmp17 = getelementptr %class.Tree * %this, i32 0, i32 6
  %tmp18 = load %class.Tree * * %tmp17
  %tmp19 = call i1  @__SetLeft_Tree(%class.Tree * %tmp16, %class.Tree * %tmp18)
  store i1 %tmp19, i1 * %ntb
  %tmp20 = load %class.Tree * * %p_node_tmp
  %tmp21 = bitcast %class.Tree * %tmp20 to %class.Tree *
  %tmp22 = call i1  @__SetHas_Left_Tree(%class.Tree * %tmp21, i1 false)
  store i1 %tmp22, i1 * %ntb
  ret i1 true
}
define i32 @__Search_Tree(%class.Tree *  %this, i32  %v_key) {
entry0:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %current_node = alloca %class.Tree *
  %ifound = alloca i32
  %cont = alloca i1
  %key_aux = alloca i32
  store %class.Tree * %this, %class.Tree * * %current_node
  store i1 true, i1 * %cont
  store i32 0, i32 * %ifound
  br label %while3
while3:
  %tmp0 = load i1 * %cont
  br i1 %tmp0, label %do1, label %cont2
do1:
  %tmp1 = load %class.Tree * * %current_node
  %tmp2 = bitcast %class.Tree * %tmp1 to %class.Tree *
  %tmp3 = call i32  @__GetKey_Tree(%class.Tree * %tmp2)
  store i32 %tmp3, i32 * %key_aux
  %tmp4 = load i32 * %v_key_tmp
  %tmp5 = load i32 * %key_aux
  %tmp6 = icmp slt i32 %tmp4, %tmp5
  br i1 %tmp6, label %then4, label %else6
then4:
  %tmp7 = load %class.Tree * * %current_node
  %tmp8 = bitcast %class.Tree * %tmp7 to %class.Tree *
  %tmp9 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp8)
  br i1 %tmp9, label %then7, label %else9
then7:
  %tmp10 = load %class.Tree * * %current_node
  %tmp11 = bitcast %class.Tree * %tmp10 to %class.Tree *
  %tmp12 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp11)
  store %class.Tree * %tmp12, %class.Tree * * %current_node
  br label %cont8
else9:
  store i1 false, i1 * %cont
  br label %cont8
cont8:
  br label %cont5
else6:
  %tmp13 = load i32 * %key_aux
  %tmp14 = load i32 * %v_key_tmp
  %tmp15 = icmp slt i32 %tmp13, %tmp14
  br i1 %tmp15, label %then10, label %else12
then10:
  %tmp16 = load %class.Tree * * %current_node
  %tmp17 = bitcast %class.Tree * %tmp16 to %class.Tree *
  %tmp18 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp17)
  br i1 %tmp18, label %then13, label %else15
then13:
  %tmp19 = load %class.Tree * * %current_node
  %tmp20 = bitcast %class.Tree * %tmp19 to %class.Tree *
  %tmp21 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp20)
  store %class.Tree * %tmp21, %class.Tree * * %current_node
  br label %cont14
else15:
  store i1 false, i1 * %cont
  br label %cont14
cont14:
  br label %cont11
else12:
  store i32 1, i32 * %ifound
  store i1 false, i1 * %cont
  br label %cont11
cont11:
  br label %cont5
cont5:
  br label %while3
cont2:
  %tmp22 = load i32 * %ifound
  ret i32 %tmp22
}
define i1 @__Print_Tree(%class.Tree *  %this) {
entry0:
  %ntb = alloca i1
  %current_node = alloca %class.Tree *
  store %class.Tree * %this, %class.Tree * * %current_node
  %tmp0 = bitcast %class.Tree * %this to %class.Tree *
  %tmp1 = load %class.Tree * * %current_node
  %tmp2 = call i1  @__RecPrint_Tree(%class.Tree * %tmp0, %class.Tree * %tmp1)
  store i1 %tmp2, i1 * %ntb
  ret i1 true
}
define i1 @__RecPrint_Tree(%class.Tree *  %this, %class.Tree *  %node) {
entry0:
  %node_tmp = alloca %class.Tree *
  store %class.Tree * %node, %class.Tree * * %node_tmp
  %ntb = alloca i1
  %tmp0 = load %class.Tree * * %node_tmp
  %tmp1 = bitcast %class.Tree * %tmp0 to %class.Tree *
  %tmp2 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp1)
  br i1 %tmp2, label %then1, label %else3
then1:
  %tmp3 = bitcast %class.Tree * %this to %class.Tree *
  %tmp4 = load %class.Tree * * %node_tmp
  %tmp5 = bitcast %class.Tree * %tmp4 to %class.Tree *
  %tmp6 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp5)
  %tmp7 = call i1  @__RecPrint_Tree(%class.Tree * %tmp3, %class.Tree * %tmp6)
  store i1 %tmp7, i1 * %ntb
  br label %cont2
else3:
  store i1 true, i1 * %ntb
  br label %cont2
cont2:
  %tmp8 = load %class.Tree * * %node_tmp
  %tmp9 = bitcast %class.Tree * %tmp8 to %class.Tree *
  %tmp10 = call i32  @__GetKey_Tree(%class.Tree * %tmp9)
  %tmp11 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp12 = call i32 (i8 *, ...)* @printf(i8 * %tmp11, i32 %tmp10)
  %tmp13 = load %class.Tree * * %node_tmp
  %tmp14 = bitcast %class.Tree * %tmp13 to %class.Tree *
  %tmp15 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp14)
  br i1 %tmp15, label %then4, label %else6
then4:
  %tmp16 = bitcast %class.Tree * %this to %class.Tree *
  %tmp17 = load %class.Tree * * %node_tmp
  %tmp18 = bitcast %class.Tree * %tmp17 to %class.Tree *
  %tmp19 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp18)
  %tmp20 = call i1  @__RecPrint_Tree(%class.Tree * %tmp16, %class.Tree * %tmp19)
  store i1 %tmp20, i1 * %ntb
  br label %cont5
else6:
  store i1 true, i1 * %ntb
  br label %cont5
cont5:
  ret i1 true
}
define i32 @__accept_Tree(%class.Tree *  %this, %class.Visitor *  %v) {
entry0:
  %v_tmp = alloca %class.Visitor *
  store %class.Visitor * %v, %class.Visitor * * %v_tmp
  %nti = alloca i32
  %tmp0 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp1 = call i32 (i8 *, ...)* @printf(i8 * %tmp0, i32 333)
  %tmp2 = load %class.Visitor * * %v_tmp
  %tmp3 = bitcast %class.Visitor * %tmp2 to %class.Visitor *
  %tmp4 = bitcast %class.Visitor * %tmp3 to [1 x i8 *] *
  %tmp5 = getelementptr [1 x i8 *] * %tmp4, i32 0, i32 0
  %tmp6 = bitcast i8 * * %tmp5 to i32 (%class.Visitor *, %class.Tree *)* *
  %tmp7 = load i32 (%class.Visitor *, %class.Tree *)* * %tmp6
  %tmp8 = call i32  %tmp7(%class.Visitor * %tmp3, %class.Tree * %this)
  store i32 %tmp8, i32 * %nti
  ret i32 0
}
define i32 @__visit_Visitor(%class.Visitor *  %this, %class.Tree *  %n) {
entry0:
  %n_tmp = alloca %class.Tree *
  store %class.Tree * %n, %class.Tree * * %n_tmp
  %nti = alloca i32
  %tmp0 = load %class.Tree * * %n_tmp
  %tmp1 = bitcast %class.Tree * %tmp0 to %class.Tree *
  %tmp2 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp1)
  br i1 %tmp2, label %then1, label %else3
then1:
  %tmp3 = load %class.Tree * * %n_tmp
  %tmp4 = bitcast %class.Tree * %tmp3 to %class.Tree *
  %tmp5 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp4)
  %tmp6 = getelementptr %class.Visitor * %this, i32 0, i32 2
  store %class.Tree * %tmp5, %class.Tree * * %tmp6
  %tmp7 = getelementptr %class.Visitor * %this, i32 0, i32 2
  %tmp8 = load %class.Tree * * %tmp7
  %tmp9 = bitcast %class.Tree * %tmp8 to %class.Tree *
  %tmp10 = call i32  @__accept_Tree(%class.Tree * %tmp9, %class.Visitor * %this)
  store i32 %tmp10, i32 * %nti
  br label %cont2
else3:
  store i32 0, i32 * %nti
  br label %cont2
cont2:
  %tmp11 = load %class.Tree * * %n_tmp
  %tmp12 = bitcast %class.Tree * %tmp11 to %class.Tree *
  %tmp13 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp12)
  br i1 %tmp13, label %then4, label %else6
then4:
  %tmp14 = load %class.Tree * * %n_tmp
  %tmp15 = bitcast %class.Tree * %tmp14 to %class.Tree *
  %tmp16 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp15)
  %tmp17 = getelementptr %class.Visitor * %this, i32 0, i32 1
  store %class.Tree * %tmp16, %class.Tree * * %tmp17
  %tmp18 = getelementptr %class.Visitor * %this, i32 0, i32 1
  %tmp19 = load %class.Tree * * %tmp18
  %tmp20 = bitcast %class.Tree * %tmp19 to %class.Tree *
  %tmp21 = call i32  @__accept_Tree(%class.Tree * %tmp20, %class.Visitor * %this)
  store i32 %tmp21, i32 * %nti
  br label %cont5
else6:
  store i32 0, i32 * %nti
  br label %cont5
cont5:
  ret i32 0
}
define i32 @__visit_MyVisitor(%class.MyVisitor *  %this, %class.Tree *  %n) {
entry0:
  %n_tmp = alloca %class.Tree *
  store %class.Tree * %n, %class.Tree * * %n_tmp
  %nti = alloca i32
  %tmp0 = load %class.Tree * * %n_tmp
  %tmp1 = bitcast %class.Tree * %tmp0 to %class.Tree *
  %tmp2 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp1)
  br i1 %tmp2, label %then1, label %else3
then1:
  %tmp3 = load %class.Tree * * %n_tmp
  %tmp4 = bitcast %class.Tree * %tmp3 to %class.Tree *
  %tmp5 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp4)
  %tmp6 = bitcast %class.MyVisitor * %this to %class.Visitor *
  %tmp7 = getelementptr %class.Visitor * %tmp6, i32 0, i32 2
  store %class.Tree * %tmp5, %class.Tree * * %tmp7
  %tmp8 = bitcast %class.MyVisitor * %this to %class.Visitor *
  %tmp9 = getelementptr %class.Visitor * %tmp8, i32 0, i32 2
  %tmp10 = load %class.Tree * * %tmp9
  %tmp11 = bitcast %class.Tree * %tmp10 to %class.Tree *
  %tmp12 = bitcast %class.MyVisitor * %this to %class.Visitor *
  %tmp13 = call i32  @__accept_Tree(%class.Tree * %tmp11, %class.Visitor * %tmp12)
  store i32 %tmp13, i32 * %nti
  br label %cont2
else3:
  store i32 0, i32 * %nti
  br label %cont2
cont2:
  %tmp14 = load %class.Tree * * %n_tmp
  %tmp15 = bitcast %class.Tree * %tmp14 to %class.Tree *
  %tmp16 = call i32  @__GetKey_Tree(%class.Tree * %tmp15)
  %tmp17 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp18 = call i32 (i8 *, ...)* @printf(i8 * %tmp17, i32 %tmp16)
  %tmp19 = load %class.Tree * * %n_tmp
  %tmp20 = bitcast %class.Tree * %tmp19 to %class.Tree *
  %tmp21 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp20)
  br i1 %tmp21, label %then4, label %else6
then4:
  %tmp22 = load %class.Tree * * %n_tmp
  %tmp23 = bitcast %class.Tree * %tmp22 to %class.Tree *
  %tmp24 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp23)
  %tmp25 = bitcast %class.MyVisitor * %this to %class.Visitor *
  %tmp26 = getelementptr %class.Visitor * %tmp25, i32 0, i32 1
  store %class.Tree * %tmp24, %class.Tree * * %tmp26
  %tmp27 = bitcast %class.MyVisitor * %this to %class.Visitor *
  %tmp28 = getelementptr %class.Visitor * %tmp27, i32 0, i32 1
  %tmp29 = load %class.Tree * * %tmp28
  %tmp30 = bitcast %class.Tree * %tmp29 to %class.Tree *
  %tmp31 = bitcast %class.MyVisitor * %this to %class.Visitor *
  %tmp32 = call i32  @__accept_Tree(%class.Tree * %tmp30, %class.Visitor * %tmp31)
  store i32 %tmp32, i32 * %nti
  br label %cont5
else6:
  store i32 0, i32 * %nti
  br label %cont5
cont5:
  ret i32 0
}
define void @$__Visitor_Visitor(%class.Visitor *  %this) {
entry0:
  ret void 
}
define void @$__Tree_Tree(%class.Tree *  %this) {
entry0:
  ret void 
}
define void @$__MyVisitor_MyVisitor(%class.MyVisitor *  %this) {
entry0:
  %tmp0 = bitcast %class.MyVisitor * %this to %class.Visitor *
  call void  @$__Visitor_Visitor(%class.Visitor * %tmp0)
  %tmp1 = bitcast %class.Visitor * %tmp0 to [1 x i8 *] *
  %tmp2 = bitcast i32 (%class.MyVisitor *, %class.Tree *)* @__visit_MyVisitor to i8 *
  %tmp3 = getelementptr [1 x i8 *] * %tmp1, i32 0, i32 0
  store i8 * %tmp2, i8 * * %tmp3
  ret void 
}
define void @$__TreeVisitor_TreeVisitor(%class.TreeVisitor *  %this) {
entry0:
  ret void 
}
define void @$__TV_TV(%class.TV *  %this) {
entry0:
  ret void 
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
