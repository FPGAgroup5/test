module triangle(clk,reset,nt,xi,yi,busy,po,xo,yo);
input       clk, 
            reset,
            nt;
input[2:0]  xi,
            yi;
output reg  busy, 
            po;
output reg[2:0] xo,
                yo;

reg [2:0]   x1,x2,x3,xc,
            y2,y3;
reg[3:0]    y1,yc;
reg[5:0] Boundary,Position;          

reg  [1:0]  State;
parameter ReadVertex1=2'd0, ReadVertex2=2'd1, ReadVertex3=2'd2, Processing=2'd3;
always@(posedge clk)begin
	if(reset) begin
	State=ReadVertex1;
	xc=3'b0;
		yc=3'b0;
		x1=3'b0;
		x2=3'b0;
		x3=3'b0;
		y1=3'b0;
		y2=3'b0;
		y3=3'b0;
		xo=3'b0;
		yo=3'b0;
		po=1'b0;
		busy=1'b0;
	end
	else begin
	case(State)
	ReadVertex1: begin
		if(nt) begin
		xc=3'b0;
		yc=3'b0;
		x1=xi;
		x2=x2;
		x3=x2;
		y1={1'b0,yi};
		y2=y2;
		y3=y3;
		xo=3'b0;
		yo=3'b0;
		po=1'b0;
		busy=1'b0;
		State=ReadVertex2;
		end
		else begin
		xc=3'b0;
		yc=3'b0;
		x1=x1;
		x2=x2;
		x3=x3;
		y1=y1;
		y2=y2;
		y3=y3;
		xo=3'b0;
		yo=3'b0;
		po=1'b0;
		busy=1'b0;
		State=ReadVertex1;
		end
	end
	ReadVertex2: begin
		xc=3'b0;
		yc=3'b0;
		x1=x1;
		x2=xi;
		x3=x3;
		y1=y1;
		y2=yi;
		y3=y3;
		xo=3'b0;
		yo=3'b0;
		po=1'b0;
		busy=1'b1;
		State=ReadVertex3;
		
	end
	ReadVertex3: begin
		xc=3'b0;
		yc=3'b0;
		x1=x1;
		x2=x2;
		x3=xi;
		y1=y1;
		y2=y2;
		y3=yi;
		xo=3'b0;
		yo=3'b0;
		po=1'b0;
		busy=1'b1;
		State=Processing;

	end
	Processing: begin
		x1=x1;
		x2=x2;
		x3=x3;
		y1=y1;
		y2=y2;
		y3=y3;
		xo=xc[2:0]+x1;
		yo=yc[2:0]+y1;
		busy=1'b1;
		Position=(y3-y1)*xc+(x2-x1)*yc;
		Boundary=(y3-y1)*(x2-x1);
		if(Position > Boundary)begin
		po=1'b0;
		xc=0;
		yc=yc+1;
		end
		else begin
		po=1'b1;
		xc=xc+1;
		yc=yc;
		end
		if(yc+y1>y3)
		State=ReadVertex1;
		else
		State=Processing;
	end
		
endcase	
end
end

/*always@(posedge clk)begin
	if(reset)
	State=3'b0;
	else
	State=NextState;
	end*/
endmodule	
	
	
