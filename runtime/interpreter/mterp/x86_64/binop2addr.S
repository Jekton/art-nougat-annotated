%default {"result":"%eax"}
/*
 * Generic 32-bit "/2addr" binary operation.  Provide an "instr" line
 * that specifies an instruction that performs "result = r0 op r1".
 * This could be an instruction or a function call.
 *
 * For: add-int/2addr, sub-int/2addr, mul-int/2addr, div-int/2addr,
 *      rem-int/2addr, and-int/2addr, or-int/2addr, xor-int/2addr,
 *      shl-int/2addr, shr-int/2addr, ushr-int/2addr, add-float/2addr,
 *      sub-float/2addr, mul-float/2addr, div-float/2addr, rem-float/2addr
 */
    /* binop/2addr vA, vB */
    movl    rINST, %ecx                     # rcx <- A+
    sarl    $$4, rINST                      # rINST <- B
    andb    $$0xf, %cl                      # ecx <- A
    GET_VREG %eax, rINSTq                   # eax <- vB
    $instr                                  # for ex: addl   %eax,(rFP,%ecx,4)
    CLEAR_REF %rcx
    ADVANCE_PC_FETCH_AND_GOTO_NEXT 1
