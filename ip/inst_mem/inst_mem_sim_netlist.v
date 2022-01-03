// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Mon Jan  3 11:03:30 2022
// Host        : DESKTOP-SMAMSI4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/17218/Desktop/step_into_mips-lab_4/lab_4/rtl/ip/inst_mem/inst_mem_sim_netlist.v
// Design      : inst_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "inst_mem,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module inst_mem
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [5:0]addra;
  wire clka;
  wire [31:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.375199 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "inst_mem.mem" *) 
  (* C_INIT_FILE_NAME = "inst_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  inst_mem_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18704)
`pragma protect data_block
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
TwRRfye3/ks=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
