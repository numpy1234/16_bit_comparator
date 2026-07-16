module comp4(
    input  [3:0] A,
    input  [3:0] B,
    output A_gt_B,
    output A_lt_B,
    output A_eq_B
);

assign A_gt_B = (A > B);
assign A_lt_B = (A < B);
assign A_eq_B = (A == B);

endmodule




module comp16(
    input  [15:0] A,
    input  [15:0] B,
    output A_gt_B,
    output A_lt_B,
    output A_eq_B
);

wire gt3, lt3, eq3;
wire gt2, lt2, eq2;
wire gt1, lt1, eq1;
wire gt0, lt0, eq0;

// Compare bits [15:12]
comp4 C3 (
    .A(A[15:12]),
    .B(B[15:12]),
    .A_gt_B(gt3),
    .A_lt_B(lt3),
    .A_eq_B(eq3)
);

// Compare bits [11:8]
comp4 C2 (
    .A(A[11:8]),
    .B(B[11:8]),
    .A_gt_B(gt2),
    .A_lt_B(lt2),
    .A_eq_B(eq2)
);

// Compare bits [7:4]
comp4 C1 (
    .A(A[7:4]),
    .B(B[7:4]),
    .A_gt_B(gt1),
    .A_lt_B(lt1),
    .A_eq_B(eq1)
);

// Compare bits [3:0]
comp4 C0 (
    .A(A[3:0]),
    .B(B[3:0]),
    .A_gt_B(gt0),
    .A_lt_B(lt0),
    .A_eq_B(eq0)
);

// Final comparison logic
assign A_gt_B = gt3 |
                (eq3 & gt2) |
                (eq3 & eq2 & gt1) |
                (eq3 & eq2 & eq1 & gt0);

assign A_lt_B = lt3 |
                (eq3 & lt2) |
                (eq3 & eq2 & lt1) |
                (eq3 & eq2 & eq1 & lt0);

assign A_eq_B = eq3 & eq2 & eq1 & eq0;

endmodule