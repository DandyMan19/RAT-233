module INTERRUPT_PULSE_GENERATOR (

 input clk,
 input REG_LD,
 output logic INTERRUPT	   //Outputs the interrupt signal 
   //from the Basys Board
    );

typedef enum{

	START_ST,
	ST_1,
	ST_2,
	ST_3,
	ST_4,
	ST_5,
	ST_6,
	ST_FIN

	} STATE;

	STATE NS, PS = START_ST;
    
    always_ff @ (posedge clk)
          PS <= NS; 
    
    always_comb 
    begin
	   INTERRUPT = 1'B0;
	  // NS = START_ST;
	   case(PS)

          START_ST:
          begin
          
              INTERRUPT = 1'B0;
            if(REG_LD == 1'B1)
                NS = ST_1;
            else
                NS = START_ST;
          end
	  

          ST_1:
          begin
            INTERRUPT = 1'B1;
            NS = START_ST;
          end


	      ST_2:
          begin
            INTERRUPT = 1'B1;
            NS = START_ST;
          end

          ST_3:
          begin
            INTERRUPT = 1'B1;
            NS = START_ST;
          end
          
          ST_4:
          begin
            INTERRUPT = 1'B1;
            NS = START_ST;
          end
          
          ST_5:
          begin
            INTERRUPT = 1'B1;
            NS = START_ST;
          end
    
          ST_6:
          begin
            INTERRUPT = 1'B1;
            NS = ST_FIN;
          end

	  ST_FIN:
          begin
                INTERRUPT = 1'B0;
                if (REG_LD == 1'B0)
                    NS = START_ST;
                else
                    NS = PS;
              end
              
	       default: NS = START_ST;
          endcase
      end              
endmodule