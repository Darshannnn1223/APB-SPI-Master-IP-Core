module tb_baud_rate_generator;
	reg pclk,preset_n;
	reg [1:0]spi_mode;
	reg spiswai;
	reg [2:0]sppr,spr;
	reg cpol,cpha,ss_n;
	
	wire sclk,miso_recv_negsclk,miso_recv_possclk,mosi_send_negsclk,mosi_send_possclk;
	wire [11:0]baudratedivisor;
	
	baud_rate_generator DUT (pclk,preset_n,spi_mode,spiswai,sppr,spr,cpol,cpha,ss_n,
							 sclk,miso_recv_possclk,miso_recv_negsclk,mosi_send_possclk,mosi_send_negsclk,baudratedivisor);
	
	always #5 pclk = ~pclk;
	
	task initialize;
		begin
			pclk=0;
			preset_n=1;
			spi_mode=2'b00;
			spiswai=0;
			sppr=3'b000;
			spr=3'b001;
			cpol=0;
			cpha=1;
			ss_n=1;
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
	
	initial
		begin
			initialize;
			reset;
			#10;
			stimulus(2'd00,0,1,1,0,3'd1,3'd1);
			#500;
			stimulus(2'd0,0,1,0,0,3'd0,3'd3);
			#1000;
			spiswai=1;
			#10;
			spiswai=0;
			#10;
			stimulus(2'd01,0,1,1,0,3'd1,3'd1);
			#500;
			#500;
		#2000 $finish;
		end
	endmodule