
module baud_rate_generator(pclk,preset_n,spi_mode,spiswai,sppr,spr,cpol,cpha,ss_n,
						   sclk,miso_recv_possclk,miso_recv_negsclk,mosi_send_possclk,mosi_send_negsclk,baudratedivisor);
						input pclk,preset_n,spiswai;
						input [1:0]spi_mode;
						input [2:0]sppr,spr; 
						input cpol,cpha,ss_n;
						
						output reg sclk;
						output reg miso_recv_possclk,miso_recv_negsclk,mosi_send_possclk,mosi_send_negsclk; 
						output [11:0]baudratedivisor;
						
						reg [11:0]count;
						wire pre_sclk;
						
						assign baudratedivisor = (sppr+1)*2**(spr+1);
						
						assign pre_sclk = cpol ? 1 : 0;
						
						always@(posedge pclk or negedge preset_n)
							begin
								if(!preset_n)
									begin
										sclk<=pre_sclk;
										count<=12'b0;
									end
								else if(((spi_mode==2'b01 && !spiswai) || (spi_mode==2'b00)) && !ss_n)  
									begin
										if (count == (baudratedivisor/2)-1'b1)
											begin
												sclk<=~sclk;
												count<=12'b0;
											end
										else
											begin
												count<=count+1'b1;
											end
									end
								else
									begin
										sclk<=pre_sclk;
										count<=12'b0;
									end
							end
							
							
							
							
						always @(posedge pclk or negedge preset_n)
							begin
								if(!preset_n)
									begin	
										miso_recv_negsclk<=1'b0;
										miso_recv_possclk<=1'b0;
									end
									
								else
								begin
									if((cpol && !cpha)||(!cpol && cpha))
									begin
										if(sclk)
											begin
												if(count == (baudratedivisor/2)-1'b1)
													begin
														miso_recv_negsclk<=1'b1;
													end
												else
													begin
														miso_recv_negsclk<=1'b0;
													end
											end
										else
											begin
												miso_recv_negsclk<=1'b0;
											end
									end
									
									else 
									begin
										if(sclk)
											begin
												miso_recv_possclk<=1'b0;
											end
										else
											begin  
												if(count == (baudratedivisor/2)-1'b1)
													begin
														miso_recv_possclk<=1'b1;
													end
												else
													begin
														miso_recv_possclk<=1'b0;
													end
											end
									end
								end
							end
								
		
						always@(posedge pclk or negedge preset_n)
							begin
									if(!preset_n)
										begin
											mosi_send_negsclk<=1'b0;
											mosi_send_possclk<=1'b0;
										end
										
									else
										begin
											if((!cpol && !cpha)||(cpol && cpha))
												begin
														if(sclk)
																begin
																	mosi_send_possclk<=1'b0;
																end
															else
																begin
																	if(count == (baudratedivisor/2)-2)
																		begin
																			mosi_send_possclk<=1'b1;
																		end
																	else
																		begin
																			mosi_send_possclk<=1'b0;
																		end
																end
															end
													else
														begin
															if(sclk)
														begin 
															if(count == (baudratedivisor/2)-2)
																begin
																	mosi_send_negsclk<=1'b1;
																end
															else
																begin
																	mosi_send_negsclk<=1'b0;
																end
														end
														else
												begin
												mosi_send_negsclk<=1'b0;
												end
														end
											
										end
										end
										
endmodule