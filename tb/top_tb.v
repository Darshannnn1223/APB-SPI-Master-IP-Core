`timescale 1ns/1ps

module SPI_Top_tb;

reg pclk;
reg preset_n;
reg [2:0] PAADR;
reg PWRITE;
reg PSEL;
reg PENABLE;
reg [7:0] PWDATA;
reg miso;

wire [7:0] PRDATA;
wire PREADY;
wire PSLVERR;
wire spi_interrupt_request;
wire mosi;
wire sclk;
wire ss_n;


/*==================================================
                    DUT
==================================================*/

SPI_Top dut(
    pclk,
    preset_n,
    PAADR,
    PWRITE,
    PSEL,
    PENABLE,
    PWDATA,
    miso,
    PRDATA,
    PREADY,
    PSLVERR,
    spi_interrupt_request,
    mosi,
    sclk,
    ss_n
);


/*==================================================
                    CLOCK
==================================================*/

initial begin
    pclk = 1'b0;

    forever #5 pclk = ~pclk;
end


/*==================================================
                  INITIALIZE
==================================================*/

task initialize;

begin

    preset_n = 1'b0;

    PAADR    = 3'b000;
    PWRITE   = 1'b0;
    PSEL     = 1'b0;
    PENABLE  = 1'b0;
    PWDATA   = 8'h00;

    miso     = 1'b0;
   // mosi    = 1'b0;

end

endtask


/*==================================================
                     RESET
==================================================*/

task reset;

begin

    preset_n = 1'b0;

    repeat(2)
        @(negedge pclk);

    preset_n = 1'b1;

    @(negedge pclk);

end

endtask


/*==================================================
                   APB WRITE
==================================================*/

task apb_write;

input [2:0] addr;
input [7:0] data;

begin

    @(negedge pclk);

    PAADR   = addr;
    PWDATA  = data;
    PWRITE  = 1'b1;
    PSEL    = 1'b1;
    PENABLE = 1'b0;

    @(negedge pclk);

    PENABLE = 1'b1;

    while(PREADY == 1'b0)
        @(posedge pclk);

    @(negedge pclk);

    PSEL    = 1'b0;
    PENABLE = 1'b0;
    PWRITE  = 1'b0;

end

endtask


/*==================================================
                    APB READ
==================================================*/

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

    while(PREADY == 1'b0)
        @(posedge pclk);

    @(negedge pclk);

    PSEL    = 1'b0;
    PENABLE = 1'b0;

end

endtask


/*==================================================
                 SPI RECEIVE TASK
==================================================*/

task spi_receive;

input [7:0] rx_data;
integer i;

begin

    for(i = 7; i >= 0; i = i - 1)
    begin

        miso = rx_data[i];

        @(posedge sclk);

        @(negedge sclk);

    end

    miso = 1'b0;

end

endtask


/*==================================================
                      MAIN
==================================================*/

initial
begin

    initialize;

    reset;


   apb_write(3'b000, 8'b01011101);

    apb_write(3'b001, 8'b00000000);

    apb_write(3'b010, 8'b00000001);

    apb_write(3'b101, 8'hAA);


    /* READ REGISTERS */

    apb_read(3'b000);

    apb_read(3'b001);

    apb_read(3'b010);

    apb_read(3'b011);

    apb_read(3'b101);


    /* SPI RECEIVE */

    spi_receive(8'hA5);


    #100;

    $finish;

end

endmodule