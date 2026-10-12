`timescale 1ns/1ps

module shift_register_tb;

reg pclk;
reg preset_n;
reg ss_n;
reg send_data;
reg lsbfe;
reg cpha;
reg cpol;

reg [7:0] data_mosi;
reg [7:0] rx_data;

reg miso;
reg receive_data;

reg spiswai;
reg [1:0] spi_mode;
reg [2:0] sppr;
reg [2:0] spr;

wire sclk;
wire [11:0] baudratedivisor;
wire mosi;
wire [7:0] data_miso;

wire miso_recv_possclk;
wire miso_recv_negsclk;
wire mosi_send_possclk;
wire mosi_send_negsclk;


shift_register DUT(
    pclk,
    preset_n,
    ss_n,
    send_data,
    lsbfe,
    cpol,
    cpha,
    miso_recv_possclk,
    miso_recv_negsclk,
    mosi_send_possclk,
    mosi_send_negsclk,
    data_mosi,
    miso,
    receive_data,
    mosi,
    data_miso
);


baud_rate_generator DUT2(
    pclk,
    preset_n,
    spi_mode,
    spiswai,
    sppr,
    spr,
    cpol,
    cpha,
    ss_n,
    sclk,
    miso_recv_possclk,
    miso_recv_negsclk,
    mosi_send_possclk,
    mosi_send_negsclk,
    baudratedivisor
);


always #10 pclk = ~pclk;


task initialize;
begin
    pclk = 0;
    preset_n = 1;
    ss_n = 1;
    send_data = 0;
    receive_data = 0;

    lsbfe = 0;
    cpol = 0;
    cpha = 0;

    data_mosi = 8'b00000000;
    rx_data = 8'b00000000;
    miso = 0;

    spi_mode = 2'b00;
    spiswai = 0;

    sppr = 3'b001;
    spr = 3'b001;
	
	
	/*miso_recv_possclk=0;
    miso_recv_negsclk=0;
    mosi_send_possclk=0;
    mosi_send_negsclk=0;*/
end
endtask


task reset;
begin
    @(negedge pclk);
    preset_n = 0;

    @(negedge pclk);
    preset_n = 1;

    @(negedge pclk);
end
endtask


task stimulus(input [1:0]sm,input swait,pol,pha,slave, input[2:0]a,b);
begin
	@(negedge pclk)
	spi_mode=sm;
	spiswai=swait;
	cpol=pol;
	cpha=pha;
	ss_n=slave;
	sppr=a;
	spr=b;
	
	end
	endtask
	
	
task transmit_test(input[7:0]dmosi,lsb);
begin
    data_mosi = dmosi;
    lsbfe = lsb;

    @(negedge pclk);
    send_data = 1;

    @(negedge pclk);
    send_data = 0;

    ss_n = 0;

    //ss_n = 1;
end
endtask

/*task receive_d(input [7:0] a);
integer i;
begin
	for(i=0;i<8;i=i+1)
	begin
	@(posedge sclk);
	miso=a[i];
	end
	@(negedge pclk);
	receive_data=1'b1;
	@(negedge pclk);
	receive_data=1'b0;
end
endtask*/

task receive_d(input [7:0] a,input lsbb);
integer i;

begin

    if(lsbb == 0)
    begin
        for(i = 7; i >= 0; i = i - 1)
        begin
            @(negedge sclk);
            miso = a[i];
        end
    end
    else
    begin
        for(i = 0; i < 8; i = i + 1)
        begin
            @(negedge sclk);
            miso = a[i];
        end
    end
	@(negedge pclk);
	receive_data=1'b1;
	@(negedge pclk);
	receive_data=1'b0;
end
endtask

initial
	begin
	initialize;
	reset;
	ss_n=1'b0;
	transmit_test(8'b10110101,1'b1);

	//rx_data   = 8'b10110011;
	
	stimulus(2'd00,0,0,0,0,3'd1,3'd1);
	receive_d(8'b01101001,1);
	#10;
	ss_n=1'b1;
	#100;
	#500;
	

	//receive_bits(1);
	#10;

        #1000 $finish;
	end
	

endmodule