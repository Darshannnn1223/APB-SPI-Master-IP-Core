module shift_register( pclk,preset_n,ss_n,send_data,lsbfe,cpha,cpol,miso_recv_possclk,miso_recv_negsclk,mosi_send_possclk,mosi_send_negsclk,data_mosi,miso,receive_data,mosi,data_miso);

input pclk,preset_n,ss_n,send_data,lsbfe,cpha,cpol,miso_recv_possclk,miso_recv_negsclk,mosi_send_possclk,mosi_send_negsclk;

input [7:0] data_mosi;

input miso;

input receive_data;

output reg mosi;

output  [7:0]data_miso;


reg [7:0] shift_reg;

reg [7:0] temp_reg;

reg[2:0] count,count1,count2,count3;

assign data_miso = receive_data ? temp_reg : 8'h0;

always@(posedge pclk or negedge preset_n) begin
	if(!preset_n) begin
		shift_reg <= 8'd0;
	end
	else begin
		if(send_data) begin
			shift_reg <= data_mosi;
		end
		else begin
			shift_reg <= shift_reg;
		end
	end
end


always@(posedge pclk or negedge preset_n) begin
	if(!preset_n) begin
		count2 <= 3'd0;
		count3 <= 3'd7;
		temp_reg <= 0;
	end
	
	else begin
		if(ss_n) begin
			count2 <= count2;
			count3 <= count3;
		end
		else begin
			if((!cpol&&!cpha) || (cpol&&cpha)) begin
				if(lsbfe) begin
					if(count2 <= 3'd7) begin
						if(miso_recv_possclk) begin
							temp_reg[count2] <= miso;
							count2 <= count2+1;
						end
						else begin
							temp_reg[count2] <= temp_reg[count2];
							count2 <= count2;
						end
					end
					else begin
						count2 <= 3'd0;
					end
				end
				else begin
					if(count3 >= 3'd0) begin
						if(miso_recv_possclk) begin
							temp_reg[count3] <= miso;
							count3 <= count3-1;
						end
						
						else begin
							temp_reg[count3] <= temp_reg[count3];
							count3 <= count3;
						end
					end
					else begin
						count3 <= 3'd7;
					end
				end
			end
			else begin
				if(lsbfe) begin
					if(count2 <= 3'd7) begin
						if(miso_recv_negsclk) begin
							temp_reg[count2] <= miso;
							count2 <= count2+1;
						end
						
						else begin
							temp_reg[count2] <= temp_reg[count2];
							count2 <= count2;
						end
					end
					else begin
						count2 <= 3'd0;
					end
				end
				else begin
					if(count3 >= 3'd0) begin
						if(miso_recv_negsclk) begin
							temp_reg[count3] <= miso;
							count3 <= count3-1;
						end
						
						else begin
							temp_reg[count3] <= temp_reg[count3];
							count3 <= count3;
						end
					end
					else begin
						count3 <= 3'd7;
					end
				end
			end
		end
	end
end


always@(posedge pclk or negedge preset_n) begin
	if(!preset_n) begin
		count <= 3'd0;
		count1 <= 3'd7;
		shift_reg<=0;
	end
	
	else begin
		if(ss_n) begin
			count <= count;
			count1 <= count1;
		end
		else begin
			if((!cpol&&cpha) || (cpol&&!cpha)) begin
				if(lsbfe) begin
					if(count <= 3'd7) begin
						if(mosi_send_negsclk) begin
							mosi <= shift_reg[count];
							count <= count+1;
						end
						
						else begin
							shift_reg[count] <= shift_reg[count];
							count <= count;
						end
					end
					else begin
						count <= 3'd0;
					end
				end
				else begin
					if(count1 >= 3'd0) begin
						if(mosi_send_negsclk) begin
							mosi <= shift_reg[count1];
							count1 <= count1-1;
						end
						
						else begin
							shift_reg[count1] <= shift_reg[count1];
							count1 <= count1;
						end
					end
					else begin
						count1 <= 3'd7;
					end
				end
			end
			else begin
				if(lsbfe) begin
					if(count <= 3'd7) begin
						if(mosi_send_possclk) begin
							mosi <= shift_reg[count];
							count <= count+1;
						end
						
						else begin
							shift_reg[count] <= shift_reg[count];
							count <= count;
						end
					end
					else begin
						count <= 3'd0;
					end
				end
				else begin
					if(count1 >= 3'd0) begin
						if(mosi_send_possclk) begin
							mosi <= shift_reg[count1];
							count1 <= count1-1;
						end
						
						else begin
							shift_reg[count1] <= shift_reg[count1];
							count1 <= count1;
						end
					end
					else begin
						count1 <= 3'd7;
					end
				end
			end
		end
	end
end

endmodule