/*��������� ������������. � ���������� ���� � ������� ���������. ��� �������� ������� ����������� ���
� � ������� ��������� ��������� ������������ ������ ���������� �����. � ��� ������������� ����� ���� ����� �������
������� ��� ���� ���������. �� ���� HEX0 ����� �����. ����� � �������� �� ���, � ����� �������, ��� ��� 
� �� ���� ���� ����������� ������� ���� �� ���� 7������������. �� � ��� � ������� ���� �������� � ������� ������������,
��� �� �� ����� �� ������������, �� ��������� ������*/

module lab2(
    
    input logic clkin, 
    
    input  logic       SW9,
    input  logic       KEY0, KEY1, KEY2, KEY3, KEY4, KEY5, KEY6,    
    output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6 
    
    );
    
always_ff @(posedge clkin)
case(SW9)

        1'b0: begin
             HEX0 <= 7'b0111111;//0
             HEX1 <= 7'b0000111;//7
             HEX2 <= 7'b0000111;//7
             HEX3 <= 7'b0111111;//0 ������������ �� ������������� �������� �� SW9 �������� ���� ���� �����, ���� ��������� �����
             HEX4 <= 7'b0111111;//0
             HEX5 <= 7'b1011011;//2
             HEX6 <= 7'b1111111;//8
             end
     
        1'b1: begin
            if (~KEY0) begin
            HEX0 <= 7'b0111111;
            HEX1 <= 7'b0;
            HEX2 <= 7'b0;
            HEX3 <= 7'b0;
            HEX4 <= 7'b0;
            HEX5 <= 7'b0;
            HEX6 <= 7'b0; end
            
            else if (~KEY1) begin
            HEX1 <= 7'b0000111;
            HEX0 <= 7'b0;
            HEX2 <= 7'b0;
            HEX3 <= 7'b0;
            HEX4 <= 7'b0;
            HEX5 <= 7'b0;
            HEX6 <= 7'b0; end
            
            else if (~KEY2) begin
            HEX2 <= 7'b0000111;
            HEX0 <= 7'b0;
            HEX1 <= 7'b0;
            HEX3 <= 7'b0;
            HEX4 <= 7'b0;
            HEX5 <= 7'b0;
            HEX6 <= 7'b0; end
            
            else if (~KEY3) begin
            HEX3 <= 7'b0111111;  //��� ������� ��� ����� - ������������� ������ ���������
            HEX0 <= 7'b0;
            HEX1 <= 7'b0;
            HEX2 <= 7'b0;
            HEX4 <= 7'b0;
            HEX5 <= 7'b0;
            HEX6 <= 7'b0; end
            
            else if (~KEY4) begin
            HEX4 <= 7'b0111111;
            HEX1 <= 7'b0;
            HEX2 <= 7'b0;
            HEX3 <= 7'b0;
            HEX0 <= 7'b0;
            HEX5 <= 7'b0;
            HEX6 <= 7'b0; end
            
            else if (~KEY5) begin
            HEX5 <= 7'b1011011;
            HEX1 <= 7'b0;
            HEX2 <= 7'b0;
            HEX3 <= 7'b0;
            HEX4 <= 7'b0;
            HEX0 <= 7'b0;
            HEX6 <= 7'b0; end
            
            else if (~KEY6) begin
            HEX1 <= 7'b0;
            HEX2 <= 7'b0;
            HEX3 <= 7'b0;
            HEX4 <= 7'b0;
            HEX5 <= 7'b0;
            HEX0 <= 7'b0;
            HEX6 <= 7'b1111111; end
            
        end
     
 endcase
     
    
endmodule
