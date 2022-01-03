`include "defines.vh"
module condition (
    input wire rsM,rtM,
    input wire[7:0] op,
    output reg ok
);

    always@(*)begin
      case(op)
        `EXE_BEQ_OP: ok<= (rsM==rtM);
        `EXE_BNE_OP: ok<= (rsM!=rtM);
        `EXE_BGEZ_OP,`EXE_BGEZAL_OP: ok<=(rsM>=0);
        `EXE_BLEZ_OP: ok<=(rsM<=0);
        `EXE_BLTZ_OP,`EXE_BLTZAL_OP: ok<=(rsM<0);
        `EXE_BGTZ_OP: ok<=(rsM>0);
      endcase
    end
    
endmodule