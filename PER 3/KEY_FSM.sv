

module KEY_FSM(
    input CLK_500KHz,
    input [2:0] COLS,
    output logic [3:0] ROWS,
    output logic [3:0] BUTTON_PRESS,
    output logic REG_LD
);

localparam [2:0] ST_ROWS_0 = 0;
localparam [2:0] ST_ROWS_1 = 1;
localparam [2:0] ST_ROWS_2 = 2;
localparam [2:0] ST_ROWS_3 = 3;

logic [3:0] TEMP_BUTTON_PRESS;
logic [2:0] PS ;
logic [2:0] NS;
logic TEMP_REG_LD;

always @(posedge CLK_500KHz)
begin: sync_clk
    PS <= NS;
end

always_comb
begin: FSM_STATE_DETECT
    ROWS = 0; 
    TEMP_BUTTON_PRESS = 0;
    NS = ST_ROWS_0;
    TEMP_REG_LD = 0;
    case(PS)
    ST_ROWS_0:
        begin
//            ROWS = 4'b0001;
//            case(COLS)
            
//                3'b001: TEMP_BUTTON_PRESS = 4'h1;
//                3'b010: TEMP_BUTTON_PRESS = 4'h2;
//                3'b100: TEMP_BUTTON_PRESS = 4'h3;
//                default:
//                begin
//                    TEMP_BUTTON_PRESS = 4'hF;
//                    NS = ST_ROWS_1;
//                    end
//            endcase
            
                if (COLS == 3'b001)
                    begin
                        TEMP_BUTTON_PRESS = 4'h1;
                        NS = ST_ROWS_0;
                        ROWS = 4'B0001;
                        TEMP_REG_LD = 1'B1;
                    end
                else if (COLS == 3'b010)
                    begin
                        TEMP_BUTTON_PRESS = 4'h2;
                        NS = ST_ROWS_0;
                        ROWS = 4'B0001;
                        TEMP_REG_LD = 1'B1;
                    end
                else if (COLS == 3'b100)
                    begin
                        TEMP_BUTTON_PRESS = 4'h3;
                        NS = ST_ROWS_0;
                        ROWS = 4'B0001;
                        TEMP_REG_LD = 1'B1;
                    end
                else
                    begin
                        TEMP_BUTTON_PRESS = 4'hF;
                        NS = ST_ROWS_1;
                        ROWS = 4'B0010;
                        TEMP_REG_LD = 1'B1;
                    end
        end
        
     ST_ROWS_1:
        begin
            
//            case(COLS)
            
//                3'b001: TEMP_BUTTON_PRESS = 4'h4;
//                3'b010: TEMP_BUTTON_PRESS = 4'h5;
//                3'b100: TEMP_BUTTON_PRESS = 4'h6;
//                default:
//                begin
//                    TEMP_BUTTON_PRESS = 4'hF;
//                    NS = ST_ROWS_1;
//                end
//            endcase

                if (COLS == 3'b001)
                    begin
                        TEMP_BUTTON_PRESS = 4'h4;
                        NS = ST_ROWS_1;
                        ROWS = 4'b0010;
                        TEMP_REG_LD = 1'B1;
                    end
                else if (COLS == 3'b010)
                    begin
                        TEMP_BUTTON_PRESS = 4'h5;
                        NS = ST_ROWS_1;
                        ROWS = 4'B0010;
                        TEMP_REG_LD = 1'B1;
                    end
                else if (COLS == 3'b100)
                    begin
                        TEMP_BUTTON_PRESS = 4'h6;
                        NS = ST_ROWS_1;
                        ROWS = 4'B0010;
                        TEMP_REG_LD = 1'B1;
                    end
                else
                    begin
                        TEMP_BUTTON_PRESS = 4'hF;
                        NS = ST_ROWS_2;
                        ROWS = 4'B0100;
                        TEMP_REG_LD = 1'B1;
                    end
        end
        
     ST_ROWS_2:
        begin

//            case(COLS)
            
//                3'b001: TEMP_BUTTON_PRESS = 4'h7;
//                3'b010: TEMP_BUTTON_PRESS = 4'h8;
//                3'b100: TEMP_BUTTON_PRESS = 4'h9;
//                default:
//                begin
//                    TEMP_BUTTON_PRESS = 4'hF;
//                    NS = ST_ROWS_2;
//                end
//            endcase

                if (COLS == 3'b001)
                    begin
                        TEMP_BUTTON_PRESS = 4'h7;
                        NS = ST_ROWS_2;
                        ROWS = 4'B0100;
                        TEMP_REG_LD = 1'B1;
                    end
                else if (COLS == 3'b010)
                    begin
                        TEMP_BUTTON_PRESS = 4'h8;
                        NS = ST_ROWS_2;
                        ROWS = 4'B0100;
                        TEMP_REG_LD = 1'B1;
                    end
                else if (COLS == 3'b100)
                    begin
                        TEMP_BUTTON_PRESS = 4'h9;
                        NS = ST_ROWS_2;
                        ROWS = 4'B0100;
                        TEMP_REG_LD = 1'B1;
                    end
                else
                    begin
                        TEMP_BUTTON_PRESS = 4'hF;
                        NS = ST_ROWS_3;
                        ROWS = 4'B1000;
                        TEMP_REG_LD = 1'B1;
                    end
        end  
        
     ST_ROWS_3:
        begin
//            ROWS = 4'b1000;
//            case(COLS)
            
//                3'b001: TEMP_BUTTON_PRESS = 4'hA;
//                3'b010: TEMP_BUTTON_PRESS = 4'h0;
//                3'b100: TEMP_BUTTON_PRESS = 4'hB;
//                default:
//                    begin
//                    TEMP_BUTTON_PRESS = 4'hF;
//                    NS = ST_ROWS_0;
//                    end
//            endcase

                if (COLS == 3'b001)
                    begin
                        TEMP_BUTTON_PRESS = 4'hA;
                        NS = ST_ROWS_3;
                        ROWS = 4'B1000;
                        TEMP_REG_LD = 1'B1;
                    end
                else if (COLS == 3'b010)
                    begin
                        TEMP_BUTTON_PRESS = 4'h0;
                        NS = ST_ROWS_3;
                        ROWS = 4'B1000;
                        TEMP_REG_LD = 1'B1;
                    end
                else if (COLS == 3'b100)
                    begin
                        TEMP_BUTTON_PRESS = 4'hB;
                        NS = ST_ROWS_3;
                        ROWS = 4'B1000;
                        TEMP_REG_LD = 1'B1;
                    end
                else
                    begin
                        TEMP_BUTTON_PRESS = 4'hF;
                        NS = ST_ROWS_0;
                        ROWS = 4'B0001;
                        TEMP_REG_LD = 1'B1;
                    end
        end
        
////        always_comb 
//            if (TEMP_BUTTON_PRESS == 4'h1 && ROWS == 4'h1 && COLS == 3'b001)
//                TEMP_BUTTON_PRESS = 4'h1;
//            else if (TEMP_BUTTON_PRESS == 4'h2 && ROWS == 4'h1 && COLS == 3'b010)
//                TEMP_BUTTON_PRESS = 4'h2;
//            else if (TEMP_BUTTON_PRESS == 4'h3 && ROWS == 4'h1 && COLS == 3'b100)
//                TEMP_BUTTON_PRESS = 4'h3;
//            else if (TEMP_BUTTON_PRESS == 4'h4 && ROWS == 4'h2 && COLS == 3'b001)
//                TEMP_BUTTON_PRESS = 4'h4;
//            else if (TEMP_BUTTON_PRESS == 4'h5 && ROWS == 4'h2 && COLS == 3'b010)
//                TEMP_BUTTON_PRESS = 4'h5;
//            else if (TEMP_BUTTON_PRESS == 4'h6 && ROWS == 4'h2 && COLS == 3'b100)
//                TEMP_BUTTON_PRESS = 4'h6;
//            else if (TEMP_BUTTON_PRESS == 4'h7 && ROWS == 4'h4 && COLS == 3'b001)
//                TEMP_BUTTON_PRESS = 4'h7;
//            else if (TEMP_BUTTON_PRESS == 4'h8 && ROWS == 4'h4 && COLS == 3'b010)
//                TEMP_BUTTON_PRESS = 4'h8;
//            else if (TEMP_BUTTON_PRESS == 4'h9 && ROWS == 4'h4 && COLS == 3'b100)
//                TEMP_BUTTON_PRESS = 4'h9;
//            else if (TEMP_BUTTON_PRESS == 4'hA && ROWS == 4'h8 && COLS == 3'b001)
//                TEMP_BUTTON_PRESS = 4'hA;
//            else if (TEMP_BUTTON_PRESS == 4'h0 && ROWS == 4'h8 && COLS == 3'b010)
//                TEMP_BUTTON_PRESS = 4'h0;
//            else if (TEMP_BUTTON_PRESS == 4'hB && ROWS == 4'h8 && COLS == 3'b100)
//                TEMP_BUTTON_PRESS = 4'hB;
//            else
//                TEMP_BUTTON_PRESS = 4'hF;
                
     default:
         NS = ST_ROWS_0;
   endcase
 end
                      
 assign BUTTON_PRESS = TEMP_BUTTON_PRESS;
 assign REG_LD = TEMP_REG_LD;
            
endmodule