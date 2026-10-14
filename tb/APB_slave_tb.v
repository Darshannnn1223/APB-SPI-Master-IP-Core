`timescale 1ns/1ps

module apb_slave_tb;

reg pclk;
reg preset_n;
reg [2:0] PAADR;
reg PWRITE;
reg PSEL;
reg PENABLE;
reg [7:0] PWDATA;

reg ss_n;
reg [7:0] miso_data;
reg received_data;
reg tip;

wire [7:0] PRDATA;
wire mstr;
wire cpol;
wire cpha;
wire lsbfe;
wire spiswai;
wire [2:0] sppr;
wire [2:0] spr;
wire spi_interrupt_request;
wire PREADY;
wire PSLVERR;
wire send_data;
wire [7:0] mosi_data;
wire [1:0] spi_mode;

apb_slave dut(
    pclk,
    preset_n,
    PAADR,
    PWRITE,
    PSEL,
    PENABLE,
    PWDATA,
    ss_n,
    miso_data,
    received_data,
    tip,
    PRDATA,
    mstr,
    cpol,
    cpha,
    lsbfe,
    spiswai,
    sppr,
    spr,
    spi_interrupt_request,
    PREADY,
    PSLVERR,
    send_data,
    mosi_data,
    spi_mode
);

initial begin
    pclk = 1'b0;
    forever #5 pclk = ~pclk;
end

task initialize;
begin
    preset_n      = 1'b0;
    PAADR         = 3'b000;
    PWRITE        = 1'b0;
    PSEL          = 1'b0;
    PENABLE       = 1'b0;
    PWDATA        = 8'h00;
    ss_n          = 1'b1;
    miso_data     = 8'h00;
    received_data = 1'b0;
    tip           = 1'b0;
end
endtask

task reset;
begin
    preset_n = 1'b0;

    repeat(2)
        @(negedge pclk);

    preset_n = 1'b1;

    @(negedge pclk);
end
endtask

task apb_write;
input [2:0] addr;
input [7:0] data;

begin
    @(negedge pclk);

    PAADR   = addr;
    PWDATA  = data;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;//setup
    PENABLE = 1'b0;

    @(negedge pclk);

    PENABLE = 1'b1;//enable

    while(!PREADY)
        @(posedge pclk);

    @(negedge pclk);

    PSEL    = 1'b0;
    PENABLE = 1'b0;
end
endtask

task apb_read;
input [2:0] addr;

begin
    @(negedge pclk);

    PAADR   = addr;
    PWRITE  = 1'b0;
    PSEL    = 1'b1;
    PENABLE = 1'b0;

    @(negedge pclk);

    PENABLE = 1'b1;

    while(!PREADY)
        @(posedge pclk);

    @(negedge pclk);

    PSEL    = 1'b0;
    PENABLE = 1'b0;
end
endtask

task spi_receive;
input [7:0] rx_data;

begin
    miso_data     = rx_data;
    received_data = 1'b1;

    @(negedge pclk);

    received_data = 1'b0;

    apb_read(3'b101);
end
endtask

initial
begin
    initialize;

    reset;

    apb_write(3'b000, 8'hAA);

    apb_write(3'b001, 8'h11);

    apb_write(3'b010, 8'hAA);

    apb_write(3'b101, 8'hFF);

    apb_read(3'b001);
    apb_read(3'b101);
    apb_read(3'b000);
    apb_read(3'b010);
    apb_read(3'b011);

    spi_receive(8'hA5);

    #100;

    $finish;
end

endmodule