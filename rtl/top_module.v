
module SPI_Top(
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

input        pclk;
input        preset_n;
input  [2:0] PAADR;
input        PWRITE;
input        PSEL;
input        PENABLE;
input  [7:0] PWDATA;
input        miso;

output [7:0] PRDATA;
output       PREADY;
output       PSLVERR;
output       spi_interrupt_request;
output       mosi;
output       sclk;
output       ss_n;

wire       mstr;
wire       cpol;
wire       cpha;
wire       lsbfe;
wire       spiswai;

wire [2:0] sppr;
wire [2:0] spr;

wire [1:0] spi_mode;

wire       send_data;
wire [7:0] data_mosi;

wire [7:0] data_miso;

wire       receive_data;
wire       tip;

wire       miso_recv_possclk;
wire       miso_recv_negsclk;
wire       mosi_send_possclk;
wire       mosi_send_negsclk;

wire [11:0] baudratedivisor;

baud_rate_generator BRD(pclk,preset_n,spi_mode,spiswai,sppr,spr,cpol,cpha,ss_n,
						   sclk,miso_recv_possclk,miso_recv_negsclk,mosi_send_possclk,mosi_send_negsclk,baudratedivisor);
						   
shift_register  SHIREG( pclk,preset_n,ss_n,send_data,lsbfe,cpha,cpol,miso_recv_possclk,miso_recv_negsclk,mosi_send_possclk,mosi_send_negsclk,data_mosi,miso,receive_data,mosi,data_miso);

slave_block SLS(pclk,preset_n,mstr,spiswai,spi_mode,send_data,baudratedivisor,receive_data,ss_n,tip);

apb_slave FSMREG(pclk,preset_n,PAADR,PWRITE,PSEL,PENABLE,PWDATA,ss_n,data_miso,receive_data,tip,
				PRDATA,mstr,cpol,cpha,lsbfe,spiswai,sppr,spr,spi_interrupt_request,PREADY,PSLVERR,send_data,data_mosi,spi_mode);
endmodule