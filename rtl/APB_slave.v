module apb_slave(pclk,preset_n,PAADR,PWRITE,PSEL,PENABLE,PWDATA,ss_n,miso_data,received_data,tip,
				PRDATA,mstr,cpol,cpha,lsbfe,spiswai,sppr,spr,spi_interrupt_request,PREADY,PSLVERR,send_data,mosi_data,spi_mode);
input pclk,preset_n,PWRITE,PSEL,PENABLE;
input [2:0]PAADR;
input [7:0]PWDATA;
input ss_n;
input [7:0]miso_data;
input received_data,tip;

output reg [7:0]PRDATA;
output  mstr,cpol,cpha,lsbfe,spiswai;
output  [2:0]sppr,spr;
output reg spi_interrupt_request,send_data;
output reg [7:0]mosi_data;
output reg [1:0]spi_mode;

output PREADY,PSLVERR;

reg [7:0]SPICR1,SPICR2,SPIBR,SPISR,SPIDR;

wire wr_en,rd_en;
wire spie,spe,sptie,modfen,ssoe;
wire spif,sptef,modf;

reg [2:0]state,next_state;

reg [1:0]next_mode;

//apb parameter
parameter IDLE=3'b100;
parameter SETUP=3'b101;
parameter ENABLE=3'b110;

//spi paramter
parameter RUN=2'b00;
parameter WAIT=2'b01;
parameter STOP=2'b10;



//wr_en
/*assign wr_en=((state==ENABLE)&&PWRITE)?1'b1:1'b0;
//rd_enb
assign rd_en=((state==ENABLE)&&(!PWRITE))?1'b1:1'b0;*/

assign rd_en = PSEL && PENABLE && !PWRITE && PREADY;
assign wr_en = PSEL && PENABLE && PWRITE && PREADY;


//PREADY
assign PREADY=(state==ENABLE)?1'b1:1'b0;
//PSLVERR
assign PSLVERR=(state==ENABLE)?(~tip):1'b0;

//SPICR1
always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n)begin
		SPICR1<=8'h04;
	end
	else begin
		if(wr_en)begin
			if(PAADR==3'b000)begin
				SPICR1<=PWDATA;
			end
			else begin
				SPICR1<=SPICR1;
			end
		end
		else begin
			SPICR1<=SPICR1;
		end
	end
end



//SPICR2
parameter CR2MASK=8'b00011011;

always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n)begin
		SPICR2<=8'h00;
	end
	else begin
		if(wr_en)begin
			if(PAADR==3'b001)begin
				SPICR2<=(PWDATA&CR2MASK);
			end
			else begin
				SPICR2<=SPICR2;
			end
		end
		else begin
			SPICR2<=SPICR2;
		end
	end
end



//SPIBR
parameter BRMASK=8'b01110111;

always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n)begin
		SPIBR<=8'h00;
	end
	else begin
		if(wr_en)begin
			if(PAADR==3'b010)begin
				SPIBR<=(PWDATA&BRMASK);
			end
			else begin
				SPIBR<=SPIBR;
			end
		end
		else begin
			SPIBR<=SPIBR;
		end
	end
end



//SPIDR
always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n)begin
		SPIDR<=8'h00;
	end
	else begin
		if(wr_en)begin
			if(PAADR==3'b101)begin
				SPIDR<=PWDATA;
			end
			else begin
				SPIDR<=SPIDR;
			end
		end
		else begin
			if(((SPIDR==PWDATA)&&(SPIDR!=miso_data))&&(spi_mode == 2'b00 || (spi_mode == 2'b01 && !spiswai)))begin
				SPIDR<=8'h00;
			end
			else begin
				if((spi_mode == 2'b00 || (spi_mode == 2'b01 && !spiswai))&& received_data)begin
					SPIDR<=miso_data;
				end
				else begin
					SPIDR<=SPIDR;
				end
			end
		end
	end
end



//SPISR
always@(*)begin
	if(!preset_n)begin
		SPISR=8'b00100000;
	end
	else begin
		SPISR={spif,1'b0,sptef,modf,4'b0};
	end
end

//sptef
assign sptef=(SPIDR==8'b0)?1'b1:1'b0;

//spif
assign spif=(SPIDR!=8'b0)?1'b1:1'b0;

//modf//ssoe and modfen value not initialized
assign modf=((!ss_n)&(mstr)&(modfen)&(!ssoe));


//mosi_data logic
always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n)begin
		mosi_data<=8'd0;
	end
	else begin
		if((spi_mode == 2'b00 || (spi_mode == 2'b01 && !spiswai))&&(SPIDR!=miso_data)&&(SPIDR==PWDATA))begin
			mosi_data<=SPIDR;
		end
		else begin
			mosi_data<=mosi_data;
		end
	end
end


//send data logic
always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n)begin
		send_data<=0;
	end
	else begin
		if(wr_en)begin
			send_data<=0;
		end
		else begin
			if((spi_mode == 2'b00 || (spi_mode == 2'b01 && !spiswai))&&(SPIDR!=miso_data)&&(SPIDR==PWDATA))begin
				send_data<=1;
			end
			else begin
				send_data<=0;
			end
		end
	end
end


//read opreation
always@(*)begin
	if(!preset_n)begin
		PRDATA=8'h00;
	end
	else begin
	if(!PWRITE && rd_en)begin
		case(PAADR)
			3'b000:PRDATA=SPICR1;
			3'b001:PRDATA=SPICR2;
			3'b010:PRDATA=SPIBR;
			3'b011:PRDATA=SPISR;
			3'b101:PRDATA=SPIDR;
			
			default:PRDATA=8'h00;
			
		endcase
	end
	end
end


//wires
//SPICR1 wires
assign spie=SPICR1[7];
assign spe=SPICR1[6];
assign sptie=SPICR1[5];
assign mstr=SPICR1[4];
assign cpol=SPICR1[3];
assign cpha=SPICR1[2];
assign ssoe=SPICR1[1];
assign lsbfe=SPICR1[0];

//SPICR2 wires
assign modfen=SPICR2[4];
assign spiswai=SPICR2[1];

//SPIBR wires
assign sppr=SPIBR[6:4];
assign spr=SPIBR[2:0];


//apb fsm

always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n)begin
		state<=IDLE;
	end
	else begin
		state<=next_state;
	end
end

always@(*)begin
	//if(!preset_n)
	next_state=IDLE;
	
	case(state)
		IDLE:begin
				if(PSEL&&(!PENABLE))
					next_state=SETUP;
				else
					next_state=IDLE;
			 end
		SETUP:begin
				if(PSEL&&PENABLE)
					next_state=ENABLE;
				else if(PSEL&&(!PENABLE))
					next_state=SETUP;
				else
					next_state=IDLE;
			  end
		ENABLE:begin
				if(!PSEL)//irrespective of enable whem psel is 0 it go to idel
					next_state=IDLE;
				else if(PSEL&&(!PENABLE))
					next_state=SETUP;
				else 
					next_state=ENABLE;
			   end
	endcase
end



//spi fsm

always@(posedge pclk or negedge preset_n)
begin
	if(!preset_n)begin
		spi_mode<=RUN;
	end
	else begin
		spi_mode<=next_mode;
	end
end

always@(*)begin
	next_mode=RUN;
	
	case(spi_mode)
		RUN:begin
				if((!spe)&&(!spiswai))//neglect spiswai irrespective
				  next_mode=WAIT;
				else if((!spe)&&spiswai)
				  next_mode=STOP;
				 else
				  next_mode=RUN;
		    end
		WAIT:begin
				if((!spe)&&spiswai)
					next_mode=STOP;
				else if((!spe) && (!spiswai))
					next_mode=WAIT;
				else
					next_mode=RUN;
			 end
		STOP:begin
			  if(spe)
				next_mode=RUN;
			  else if((!spe)&&(!spiswai))
				next_mode=WAIT;
			  else
				next_mode=STOP;
		     end
	endcase
end


//spi_interrupt_request
always@(*)begin
	if((!spie)&&(!sptie))
		spi_interrupt_request=1'b0;
	else begin
		if((!sptie)&&spie)
			spi_interrupt_request=(spif|modf);
		else begin
			if((!spie)&&sptie)
				spi_interrupt_request=sptef;
			else 
				spi_interrupt_request=(spif|modf|sptef);
		end
	end
end


endmodule



