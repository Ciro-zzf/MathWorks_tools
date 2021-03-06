global ref_design
global fpga_board

if {$ref_design eq "Rx" || $ref_design eq "Rx & Tx"} {
    # Disconnect the ADC PACK pins
    disconnect_bd_net /util_ad9361_adc_fifo_dout_valid_0 [get_bd_pins util_ad9361_adc_pack/adc_valid_0]
    disconnect_bd_net /util_ad9361_adc_fifo_dout_valid_1 [get_bd_pins util_ad9361_adc_pack/adc_valid_1]
    disconnect_bd_net /util_ad9361_adc_fifo_dout_valid_2 [get_bd_pins util_ad9361_adc_pack/adc_valid_2]
    disconnect_bd_net /util_ad9361_adc_fifo_dout_valid_3 [get_bd_pins util_ad9361_adc_pack/adc_valid_3]

    disconnect_bd_net /util_ad9361_adc_fifo_dout_data_0 [get_bd_pins util_ad9361_adc_pack/adc_data_0]
    disconnect_bd_net /util_ad9361_adc_fifo_dout_data_1 [get_bd_pins util_ad9361_adc_pack/adc_data_1]
    disconnect_bd_net /util_ad9361_adc_fifo_dout_data_2 [get_bd_pins util_ad9361_adc_pack/adc_data_2]
    disconnect_bd_net /util_ad9361_adc_fifo_dout_data_3 [get_bd_pins util_ad9361_adc_pack/adc_data_3]

    # Connect the ADC PACK valid signals together
    connect_bd_net [get_bd_pins util_ad9361_adc_pack/adc_valid_0] [get_bd_pins util_ad9361_adc_pack/adc_valid_1]
    connect_bd_net [get_bd_pins util_ad9361_adc_pack/adc_valid_0] [get_bd_pins util_ad9361_adc_pack/adc_valid_2]
    connect_bd_net [get_bd_pins util_ad9361_adc_pack/adc_valid_0] [get_bd_pins util_ad9361_adc_pack/adc_valid_3]
}

if {$ref_design eq "Tx" || $ref_design eq "Rx & Tx"} {
    # Disconnect the DAC UNPACK pins
    delete_bd_objs [get_bd_nets axi_ad9361_dac_fifo_din_valid_0]
    delete_bd_objs [get_bd_nets axi_ad9361_dac_fifo_din_valid_1]
    delete_bd_objs [get_bd_nets axi_ad9361_dac_fifo_din_valid_2]
    delete_bd_objs [get_bd_nets axi_ad9361_dac_fifo_din_valid_3]

    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_dac_data_0]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_dac_data_1]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_dac_data_2]
    delete_bd_objs [get_bd_nets util_ad9361_dac_upack_dac_data_3]

    # Connect the DAC UNPACK valid signals together
    connect_bd_net [get_bd_pins util_ad9361_dac_upack/dac_valid_0] [get_bd_pins util_ad9361_dac_upack/dac_valid_1]
    connect_bd_net [get_bd_pins util_ad9361_dac_upack/dac_valid_0] [get_bd_pins util_ad9361_dac_upack/dac_valid_2]
    connect_bd_net [get_bd_pins util_ad9361_dac_upack/dac_valid_0] [get_bd_pins util_ad9361_dac_upack/dac_valid_3]
}