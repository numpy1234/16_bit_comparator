`timescale 1ns/1ps

module tb_comp16;

reg [15:0] A;
reg [15:0] B;

wire gt;
wire lt;
wire eq;

comp16 DUT (
    .A(A),
    .B(B),
    .A_gt_B(gt),
    .A_lt_B(lt),
    .A_eq_B(eq)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_comp16);

    $display("A\t\tB\t\tGT LT EQ");

    A = 16'h1234; B = 16'h1234; #10;
    A = 16'h5678; B = 16'h1234; #10;
    A = 16'h1234; B = 16'h5678; #10;
    A = 16'hFFFF; B = 16'hFFFE; #10;
    A = 16'h0001; B = 16'h0002; #10;
    A = 16'hABCD; B = 16'hABCE; #10;
    A = 16'h8000; B = 16'h7FFF; #10;

    $finish;
end

initial begin
    $monitor("%h\t%h\t%b  %b  %b", A, B, gt, lt, eq);
end

endmodule