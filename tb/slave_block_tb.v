module slave_block_tb;
reg pclk;
reg preset_n;
reg mstr;
reg spiswai;

reg [1:0] spi_mode;
reg send_data;
reg [11:0] baudratedivisor;

wire receive_data;
wire ss;
wire tip;

slave_block DUT (pclk,preset_n,mstr,spiswai,spi_mode,send_data,baudratedivisor,receive_data,ss,tip);

always #5 pclk = ~pclk;

task initialize;
begin
	pclk=0;
	preset_n=1;
	mstr =0;
	spiswai =0;
	send_data=0;
	spi_mode=2'b00;
	baudratedivisor=12'b0;
end
endtask

task reset;
		begin
			@(negedge pclk)
				preset_n=0;
			@(negedge pclk)
				preset_n=1;
		end
	endtask
	
task stimulus(input master,swai,[1:0]mode,sendd,[11:0]bd);
begin
	@(negedge pclk)
	mstr= master;
	spiswai= swai;
	spi_mode= mode;
	send_data = sendd;
	baudratedivisor=bd;
	
end
endtask

initial begin
	initialize;
	reset;
	
	stimulus(1,0,2'b00,1,12'd2);
	@(negedge pclk)
	send_data =1'b0;
	#300;
	stimulus(1,0,2'b01,1,12'd4);
	@(negedge pclk)
	send_data =1'b0;
	#400;
	stimulus(1,0,2'b01,1,12'd16);
	@(negedge pclk)
	send_data =1'b0;
	#1000 $finish;
	
end
endmodule
