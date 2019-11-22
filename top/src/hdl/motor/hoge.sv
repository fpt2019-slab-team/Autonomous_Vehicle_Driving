module hoge (
  input wire [6:0]  in_acc,
  input wire [7:0]  in_ste,
  input wire        brk,

  output wire [6:0] v_r,
  output wire [6:0] v_l
);

  wire [15:0] piyo = fuga({1'd0, in_acc}, in_ste, brk);

  assign v_l = piyo[14:8];
  assign v_r = piyo[ 6:0];

  function [15:0] fuga (input [7:0] vacc, input [7:0] vste, input vbrk);
    begin
      // BREAK
      if (vbrk) begin
        fuga = 16'b0;
      end
      else begin
        // Go Straight
        if (vste == 8'b0) begin
          fuga = {vacc, vacc};
        end
      // Turn Left
        else if (!vste[7]) begin
          // acc < ste
          if (vacc < vste) begin
            fuga = {8'd0, vacc};
          end else begin
            fuga = {vacc - vste, vacc};
          end
        end
      // Turn Right
        else begin
          //acc < ste
          if (8'h7F < vacc + vste) begin
            fuga = {vacc, 8'd0};
          end else begin
            fuga = {vacc, vacc + vste};
          end
        end
      end
    end
  endfunction

endmodule
