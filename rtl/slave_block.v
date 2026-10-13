module slave_block(pclk,preset_n,mstr,spiswai,spi_mode,send_data,baudratedivisor,receive_data,ss,tip);
input pclk,preset_n,mstr,spiswai;
input [1:0] spi_mode;
input send_data;
input [11:0] baudratedivisor;
output reg receive_data,ss;
output tip;

wire [15:0] target;
reg  [15:0] counter;
reg rcv;
 
assign target = baudratedivisor*8;
assign tip = ~ss;

always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n) begin
		ss <= 1;
		counter <= 16'hffff;
		rcv <= 0;
	end
	else begin
		if((spi_mode == 2'b00 || (spi_mode == 2'b01 && !spiswai))&& mstr) begin
			if(!send_data) begin
				if(counter <= (target-1'b1)) begin
					ss <= 0;
					counter <= counter + 1'b1;
					if(counter == (target- 1'b1))
					rcv <= 1;
				end
				else begin 
					ss <= 1;
					counter <= 16'hffff;
					rcv <= 0;
				end
			end
			else begin
				ss <= 0;
				counter <= 0;
				rcv <=0;
			end
		end
		else begin
			ss <= 1;
			counter <= 16'hffff;
			rcv <= 0;
		end
	end
end

always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n)
		receive_data<=1'b0;
	else begin
		
		receive_data<=rcv;
		end
end
endmodule
