`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Created for Indiana University's E315 Class
//
// 
// Andrew Lukefahr
// lukefahr@iu.edu
//
// Ethan Japundza
// ejapundz@iu.edu
//
// 2021-02-23
// 2020-02-25
//
//////////////////////////////////////////////////////////////////////////////////


module popcount(
        input               ACLK,
        input               ARESETN,

        //MMIO Inputs
        input [31:0]        WRITE_DATA,
        input               WRITE_VALID,
        
        // Count signals
        output logic [31:0] COUNT,
        input               COUNT_RST,
        output logic        COUNT_BUSY //busy = 1 when counting is happening, busy=0 at idle 
        
    );

    // update me!
    assign COUNT = 32'h0;
    assign COUNT_BUSY = 1'h0;

endmodule
