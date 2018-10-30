onerror {resume}
quietly WaveActivateNextPane {} 0
add wave /test_bench/hemps/clock
add wave  -divider repository
add wave  -radix hexadecimal /test_bench/ack_app(0)
add wave  -radix hexadecimal /test_bench/req_app(0)
add wave  -radix hexadecimal /test_bench/address(0)
add wave  -radix hexadecimal /test_bench/data_read(0)
add wave  -divider Slaves
add wave  -group {master 00 - 0} /test_bench/hemps/master0/clock
add wave  -group {master 00 - 0} /test_bench/hemps/master0/ack_app
add wave  -group {master 00 - 0} /test_bench/hemps/master0/req_app
add wave  -group {master 00 - 0} /test_bench/hemps/master0/address
add wave  -group {master 00 - 0} /test_bench/hemps/master0/data_read
add wave  -group {master 00 - 0} /test_bench/hemps/master0/cpu_repo_acess
add wave  -group {master 00 - 0} /test_bench/hemps/master0/repo_FSM
add wave  -group {master 00 - 0} -group {ni 00} -radix hexadecimal /test_bench/hemps/master0/tx_ni
add wave  -group {master 00 - 0} -group {ni 00} -radix hexadecimal /test_bench/hemps/master0/credit_i_ni
add wave  -group {master 00 - 0} -group {ni 00} -radix hexadecimal /test_bench/hemps/master0/data_out_ni
add wave  -group {master 00 - 0} -radix hexadecimal /test_bench/hemps/master0/rx_ni
add wave  -group {master 00 - 0} -radix hexadecimal /test_bench/hemps/master0/credit_o_ni
add wave  -group {master 00 - 0} -radix hexadecimal /test_bench/hemps/master0/data_in_ni
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/operation
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/set_address
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/set_address_2
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/set_size
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/set_size_2
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/set_op
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/start
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/size
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/size_2
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/address
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/address_2
add wave  -group {master 00 - 0} -group {dmni 00} -group {config 00} -radix hexadecimal /test_bench/hemps/master0/dmni/config_data
add wave  -group {master 00 - 0} -group {dmni 00} -group {arb 00} -radix hexadecimal /test_bench/hemps/master0/dmni/ARB
add wave  -group {master 00 - 0} -group {dmni 00} -group {arb 00} -radix hexadecimal /test_bench/hemps/master0/dmni/prio
add wave  -group {master 00 - 0} -group {dmni 00} -group {arb 00} -radix hexadecimal /test_bench/hemps/master0/dmni/timer
add wave  -group {master 00 - 0} -group {dmni 00} -group {arb 00} -radix hexadecimal /test_bench/hemps/master0/dmni/write_enable
add wave  -group {master 00 - 0} -group {dmni 00} -group {arb 00} -radix hexadecimal /test_bench/hemps/master0/dmni/read_enable
add wave  -group {master 00 - 0} -group {dmni 00} -group {send 00} -radix hexadecimal /test_bench/hemps/master0/dmni/DMNI_Send
add wave  -group {master 00 - 0} -group {dmni 00} -group {send 00} -radix hexadecimal /test_bench/hemps/master0/dmni/send_address
add wave  -group {master 00 - 0} -group {dmni 00} -group {send 00} -radix hexadecimal /test_bench/hemps/master0/dmni/mem_data_read
add wave  -group {master 00 - 0} -group {dmni 00} -group {send 00} -radix hexadecimal /test_bench/hemps/master0/dmni/send_size
add wave  -group {master 00 - 0} -group {dmni 00} -group {send 00} -radix hexadecimal /test_bench/hemps/master0/dmni/send_address_2
add wave  -group {master 00 - 0} -group {dmni 00} -group {send 00} -radix hexadecimal /test_bench/hemps/master0/dmni/send_size_2
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive 00} -radix hexadecimal /test_bench/hemps/master0/dmni/DMNI_Receive
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive 00} -radix hexadecimal /test_bench/hemps/master0/dmni/recv_address
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive 00} -radix hexadecimal /test_bench/hemps/master0/dmni/mem_data_write
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive 00} -radix hexadecimal /test_bench/hemps/master0/dmni/recv_size
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive 00} -radix hexadecimal /test_bench/hemps/master0/dmni/mem_byte_we
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive NoC 00} -radix hexadecimal /test_bench/hemps/master0/dmni/intr
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive NoC 00} -radix hexadecimal /test_bench/hemps/master0/dmni/intr_count
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive NoC 00} -radix hexadecimal /test_bench/hemps/master0/dmni/SR
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive NoC 00} -radix hexadecimal /test_bench/hemps/master0/dmni/payload_size
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive NoC 00} -radix hexadecimal /test_bench/hemps/master0/dmni/read_av
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive NoC 00} -radix hexadecimal /test_bench/hemps/master0/dmni/slot_available
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive NoC 00} -radix hexadecimal /test_bench/hemps/master0/dmni/first
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive NoC 00} -radix hexadecimal /test_bench/hemps/master0/dmni/last
add wave  -group {master 00 - 0} -group {dmni 00} -group {receive NoC 00} -radix hexadecimal /test_bench/hemps/master0/dmni/add_buffer
add wave  -group {master 00 - 0} -group {dmni 00} -radix hexadecimal /test_bench/hemps/master0/dmni/mem_address
add wave  -group {master 00 - 0} -group {dmni 00} -radix hexadecimal /test_bench/hemps/master0/dmni/is_header
add wave  -group {master 00 - 0} -group {dmni 00} -radix hexadecimal /test_bench/hemps/master0/dmni/send_active
add wave  -group {master 00 - 0} -group {dmni 00} -radix hexadecimal /test_bench/hemps/master0/dmni/receive_active
add wave  -group {master 00 - 0} -group {proc 00} -radix hexadecimal /test_bench/hemps/master0/current_page
add wave  -group {master 00 - 0} -group {proc 00} -radix hexadecimal /test_bench/hemps/master0/cpu_mem_address
add wave  -group {master 00 - 0} -group {proc 00} -radix hexadecimal /test_bench/hemps/master0/write_enable
add wave  -group {master 00 - 0} -group {proc 00} -radix hexadecimal /test_bench/hemps/master0/pending_service
add wave  -group {master 00 - 0} -group {proc 00} -radix hexadecimal /test_bench/hemps/master0/irq_status
add wave  -group {master 00 - 0} -group {router 00 input LESTE} -radix hexadecimal /test_bench/hemps/master0/rx(0)
add wave  -group {master 00 - 0} -group {router 00 input LESTE} -radix hexadecimal /test_bench/hemps/master0/credit_o(0)
add wave  -group {master 00 - 0} -group {router 00 input LESTE} -radix hexadecimal /test_bench/hemps/master0/data_in(0)
add wave  -group {master 00 - 0} -group {router 00 input OESTE} -radix hexadecimal /test_bench/hemps/master0/rx(1)
add wave  -group {master 00 - 0} -group {router 00 input OESTE} -radix hexadecimal /test_bench/hemps/master0/credit_o(1)
add wave  -group {master 00 - 0} -group {router 00 input OESTE} -radix hexadecimal /test_bench/hemps/master0/data_in(1)
add wave  -group {master 00 - 0} -group {router 00 input NORTE} -radix hexadecimal /test_bench/hemps/master0/rx(2)
add wave  -group {master 00 - 0} -group {router 00 input NORTE} -radix hexadecimal /test_bench/hemps/master0/credit_o(2)
add wave  -group {master 00 - 0} -group {router 00 input NORTE} -radix hexadecimal /test_bench/hemps/master0/data_in(2)
add wave  -group {master 00 - 0} -group {router 00 input SUL} -radix hexadecimal /test_bench/hemps/master0/rx(3)
add wave  -group {master 00 - 0} -group {router 00 input SUL} -radix hexadecimal /test_bench/hemps/master0/credit_o(3)
add wave  -group {master 00 - 0} -group {router 00 input SUL} -radix hexadecimal /test_bench/hemps/master0/data_in(3)
add wave  -group {slave 10 - 1} /test_bench/hemps/slave1/clock
add wave  -group {slave 10 - 1} -group {ni 10} -radix hexadecimal /test_bench/hemps/slave1/tx_ni
add wave  -group {slave 10 - 1} -group {ni 10} -radix hexadecimal /test_bench/hemps/slave1/credit_i_ni
add wave  -group {slave 10 - 1} -group {ni 10} -radix hexadecimal /test_bench/hemps/slave1/data_out_ni
add wave  -group {slave 10 - 1} -radix hexadecimal /test_bench/hemps/slave1/rx_ni
add wave  -group {slave 10 - 1} -radix hexadecimal /test_bench/hemps/slave1/credit_o_ni
add wave  -group {slave 10 - 1} -radix hexadecimal /test_bench/hemps/slave1/data_in_ni
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/operation
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/set_address
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/set_address_2
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/set_size
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/set_size_2
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/set_op
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/start
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/size
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/size_2
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/address
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/address_2
add wave  -group {slave 10 - 1} -group {dmni 10} -group {config 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/config_data
add wave  -group {slave 10 - 1} -group {dmni 10} -group {arb 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/ARB
add wave  -group {slave 10 - 1} -group {dmni 10} -group {arb 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/prio
add wave  -group {slave 10 - 1} -group {dmni 10} -group {arb 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/timer
add wave  -group {slave 10 - 1} -group {dmni 10} -group {arb 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/write_enable
add wave  -group {slave 10 - 1} -group {dmni 10} -group {arb 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/read_enable
add wave  -group {slave 10 - 1} -group {dmni 10} -group {send 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/DMNI_Send
add wave  -group {slave 10 - 1} -group {dmni 10} -group {send 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/send_address
add wave  -group {slave 10 - 1} -group {dmni 10} -group {send 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/mem_data_read
add wave  -group {slave 10 - 1} -group {dmni 10} -group {send 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/send_size
add wave  -group {slave 10 - 1} -group {dmni 10} -group {send 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/send_address_2
add wave  -group {slave 10 - 1} -group {dmni 10} -group {send 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/send_size_2
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/DMNI_Receive
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/recv_address
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/mem_data_write
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/recv_size
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/mem_byte_we
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive NoC 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/intr
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive NoC 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/intr_count
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive NoC 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/SR
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive NoC 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/payload_size
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive NoC 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/read_av
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive NoC 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/slot_available
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive NoC 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/first
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive NoC 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/last
add wave  -group {slave 10 - 1} -group {dmni 10} -group {receive NoC 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/add_buffer
add wave  -group {slave 10 - 1} -group {dmni 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/mem_address
add wave  -group {slave 10 - 1} -group {dmni 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/is_header
add wave  -group {slave 10 - 1} -group {dmni 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/send_active
add wave  -group {slave 10 - 1} -group {dmni 10} -radix hexadecimal /test_bench/hemps/slave1/dmni/receive_active
add wave  -group {slave 10 - 1} -group {proc 10} -radix hexadecimal /test_bench/hemps/slave1/current_page
add wave  -group {slave 10 - 1} -group {proc 10} -radix hexadecimal /test_bench/hemps/slave1/cpu_mem_address
add wave  -group {slave 10 - 1} -group {proc 10} -radix hexadecimal /test_bench/hemps/slave1/write_enable
add wave  -group {slave 10 - 1} -group {proc 10} -radix hexadecimal /test_bench/hemps/slave1/pending_service
add wave  -group {slave 10 - 1} -group {proc 10} -radix hexadecimal /test_bench/hemps/slave1/irq_status
add wave  -group {slave 10 - 1} -group {router 10 input LESTE} -radix hexadecimal /test_bench/hemps/slave1/rx(0)
add wave  -group {slave 10 - 1} -group {router 10 input LESTE} -radix hexadecimal /test_bench/hemps/slave1/credit_o(0)
add wave  -group {slave 10 - 1} -group {router 10 input LESTE} -radix hexadecimal /test_bench/hemps/slave1/data_in(0)
add wave  -group {slave 10 - 1} -group {router 10 input OESTE} -radix hexadecimal /test_bench/hemps/slave1/rx(1)
add wave  -group {slave 10 - 1} -group {router 10 input OESTE} -radix hexadecimal /test_bench/hemps/slave1/credit_o(1)
add wave  -group {slave 10 - 1} -group {router 10 input OESTE} -radix hexadecimal /test_bench/hemps/slave1/data_in(1)
add wave  -group {slave 10 - 1} -group {router 10 input NORTE} -radix hexadecimal /test_bench/hemps/slave1/rx(2)
add wave  -group {slave 10 - 1} -group {router 10 input NORTE} -radix hexadecimal /test_bench/hemps/slave1/credit_o(2)
add wave  -group {slave 10 - 1} -group {router 10 input NORTE} -radix hexadecimal /test_bench/hemps/slave1/data_in(2)
add wave  -group {slave 10 - 1} -group {router 10 input SUL} -radix hexadecimal /test_bench/hemps/slave1/rx(3)
add wave  -group {slave 10 - 1} -group {router 10 input SUL} -radix hexadecimal /test_bench/hemps/slave1/credit_o(3)
add wave  -group {slave 10 - 1} -group {router 10 input SUL} -radix hexadecimal /test_bench/hemps/slave1/data_in(3)
add wave  -group {slave 20 - 2} /test_bench/hemps/slave2/clock
add wave  -group {slave 20 - 2} -group {ni 20} -radix hexadecimal /test_bench/hemps/slave2/tx_ni
add wave  -group {slave 20 - 2} -group {ni 20} -radix hexadecimal /test_bench/hemps/slave2/credit_i_ni
add wave  -group {slave 20 - 2} -group {ni 20} -radix hexadecimal /test_bench/hemps/slave2/data_out_ni
add wave  -group {slave 20 - 2} -radix hexadecimal /test_bench/hemps/slave2/rx_ni
add wave  -group {slave 20 - 2} -radix hexadecimal /test_bench/hemps/slave2/credit_o_ni
add wave  -group {slave 20 - 2} -radix hexadecimal /test_bench/hemps/slave2/data_in_ni
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/operation
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/set_address
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/set_address_2
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/set_size
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/set_size_2
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/set_op
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/start
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/size
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/size_2
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/address
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/address_2
add wave  -group {slave 20 - 2} -group {dmni 20} -group {config 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/config_data
add wave  -group {slave 20 - 2} -group {dmni 20} -group {arb 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/ARB
add wave  -group {slave 20 - 2} -group {dmni 20} -group {arb 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/prio
add wave  -group {slave 20 - 2} -group {dmni 20} -group {arb 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/timer
add wave  -group {slave 20 - 2} -group {dmni 20} -group {arb 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/write_enable
add wave  -group {slave 20 - 2} -group {dmni 20} -group {arb 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/read_enable
add wave  -group {slave 20 - 2} -group {dmni 20} -group {send 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/DMNI_Send
add wave  -group {slave 20 - 2} -group {dmni 20} -group {send 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/send_address
add wave  -group {slave 20 - 2} -group {dmni 20} -group {send 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/mem_data_read
add wave  -group {slave 20 - 2} -group {dmni 20} -group {send 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/send_size
add wave  -group {slave 20 - 2} -group {dmni 20} -group {send 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/send_address_2
add wave  -group {slave 20 - 2} -group {dmni 20} -group {send 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/send_size_2
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/DMNI_Receive
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/recv_address
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/mem_data_write
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/recv_size
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/mem_byte_we
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive NoC 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/intr
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive NoC 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/intr_count
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive NoC 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/SR
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive NoC 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/payload_size
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive NoC 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/read_av
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive NoC 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/slot_available
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive NoC 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/first
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive NoC 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/last
add wave  -group {slave 20 - 2} -group {dmni 20} -group {receive NoC 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/add_buffer
add wave  -group {slave 20 - 2} -group {dmni 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/mem_address
add wave  -group {slave 20 - 2} -group {dmni 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/is_header
add wave  -group {slave 20 - 2} -group {dmni 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/send_active
add wave  -group {slave 20 - 2} -group {dmni 20} -radix hexadecimal /test_bench/hemps/slave2/dmni/receive_active
add wave  -group {slave 20 - 2} -group {proc 20} -radix hexadecimal /test_bench/hemps/slave2/current_page
add wave  -group {slave 20 - 2} -group {proc 20} -radix hexadecimal /test_bench/hemps/slave2/cpu_mem_address
add wave  -group {slave 20 - 2} -group {proc 20} -radix hexadecimal /test_bench/hemps/slave2/write_enable
add wave  -group {slave 20 - 2} -group {proc 20} -radix hexadecimal /test_bench/hemps/slave2/pending_service
add wave  -group {slave 20 - 2} -group {proc 20} -radix hexadecimal /test_bench/hemps/slave2/irq_status
add wave  -group {slave 20 - 2} -group {router 20 input LESTE} -radix hexadecimal /test_bench/hemps/slave2/rx(0)
add wave  -group {slave 20 - 2} -group {router 20 input LESTE} -radix hexadecimal /test_bench/hemps/slave2/credit_o(0)
add wave  -group {slave 20 - 2} -group {router 20 input LESTE} -radix hexadecimal /test_bench/hemps/slave2/data_in(0)
add wave  -group {slave 20 - 2} -group {router 20 input OESTE} -radix hexadecimal /test_bench/hemps/slave2/rx(1)
add wave  -group {slave 20 - 2} -group {router 20 input OESTE} -radix hexadecimal /test_bench/hemps/slave2/credit_o(1)
add wave  -group {slave 20 - 2} -group {router 20 input OESTE} -radix hexadecimal /test_bench/hemps/slave2/data_in(1)
add wave  -group {slave 20 - 2} -group {router 20 input NORTE} -radix hexadecimal /test_bench/hemps/slave2/rx(2)
add wave  -group {slave 20 - 2} -group {router 20 input NORTE} -radix hexadecimal /test_bench/hemps/slave2/credit_o(2)
add wave  -group {slave 20 - 2} -group {router 20 input NORTE} -radix hexadecimal /test_bench/hemps/slave2/data_in(2)
add wave  -group {slave 20 - 2} -group {router 20 input SUL} -radix hexadecimal /test_bench/hemps/slave2/rx(3)
add wave  -group {slave 20 - 2} -group {router 20 input SUL} -radix hexadecimal /test_bench/hemps/slave2/credit_o(3)
add wave  -group {slave 20 - 2} -group {router 20 input SUL} -radix hexadecimal /test_bench/hemps/slave2/data_in(3)
add wave  -group {slave 30 - 3} /test_bench/hemps/slave3/clock
add wave  -group {slave 30 - 3} -group {ni 30} -radix hexadecimal /test_bench/hemps/slave3/tx_ni
add wave  -group {slave 30 - 3} -group {ni 30} -radix hexadecimal /test_bench/hemps/slave3/credit_i_ni
add wave  -group {slave 30 - 3} -group {ni 30} -radix hexadecimal /test_bench/hemps/slave3/data_out_ni
add wave  -group {slave 30 - 3} -radix hexadecimal /test_bench/hemps/slave3/rx_ni
add wave  -group {slave 30 - 3} -radix hexadecimal /test_bench/hemps/slave3/credit_o_ni
add wave  -group {slave 30 - 3} -radix hexadecimal /test_bench/hemps/slave3/data_in_ni
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/operation
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/set_address
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/set_address_2
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/set_size
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/set_size_2
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/set_op
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/start
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/size
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/size_2
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/address
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/address_2
add wave  -group {slave 30 - 3} -group {dmni 30} -group {config 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/config_data
add wave  -group {slave 30 - 3} -group {dmni 30} -group {arb 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/ARB
add wave  -group {slave 30 - 3} -group {dmni 30} -group {arb 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/prio
add wave  -group {slave 30 - 3} -group {dmni 30} -group {arb 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/timer
add wave  -group {slave 30 - 3} -group {dmni 30} -group {arb 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/write_enable
add wave  -group {slave 30 - 3} -group {dmni 30} -group {arb 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/read_enable
add wave  -group {slave 30 - 3} -group {dmni 30} -group {send 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/DMNI_Send
add wave  -group {slave 30 - 3} -group {dmni 30} -group {send 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/send_address
add wave  -group {slave 30 - 3} -group {dmni 30} -group {send 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/mem_data_read
add wave  -group {slave 30 - 3} -group {dmni 30} -group {send 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/send_size
add wave  -group {slave 30 - 3} -group {dmni 30} -group {send 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/send_address_2
add wave  -group {slave 30 - 3} -group {dmni 30} -group {send 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/send_size_2
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/DMNI_Receive
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/recv_address
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/mem_data_write
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/recv_size
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/mem_byte_we
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive NoC 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/intr
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive NoC 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/intr_count
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive NoC 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/SR
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive NoC 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/payload_size
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive NoC 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/read_av
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive NoC 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/slot_available
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive NoC 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/first
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive NoC 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/last
add wave  -group {slave 30 - 3} -group {dmni 30} -group {receive NoC 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/add_buffer
add wave  -group {slave 30 - 3} -group {dmni 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/mem_address
add wave  -group {slave 30 - 3} -group {dmni 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/is_header
add wave  -group {slave 30 - 3} -group {dmni 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/send_active
add wave  -group {slave 30 - 3} -group {dmni 30} -radix hexadecimal /test_bench/hemps/slave3/dmni/receive_active
add wave  -group {slave 30 - 3} -group {proc 30} -radix hexadecimal /test_bench/hemps/slave3/current_page
add wave  -group {slave 30 - 3} -group {proc 30} -radix hexadecimal /test_bench/hemps/slave3/cpu_mem_address
add wave  -group {slave 30 - 3} -group {proc 30} -radix hexadecimal /test_bench/hemps/slave3/write_enable
add wave  -group {slave 30 - 3} -group {proc 30} -radix hexadecimal /test_bench/hemps/slave3/pending_service
add wave  -group {slave 30 - 3} -group {proc 30} -radix hexadecimal /test_bench/hemps/slave3/irq_status
add wave  -group {slave 30 - 3} -group {router 30 input LESTE} -radix hexadecimal /test_bench/hemps/slave3/rx(0)
add wave  -group {slave 30 - 3} -group {router 30 input LESTE} -radix hexadecimal /test_bench/hemps/slave3/credit_o(0)
add wave  -group {slave 30 - 3} -group {router 30 input LESTE} -radix hexadecimal /test_bench/hemps/slave3/data_in(0)
add wave  -group {slave 30 - 3} -group {router 30 input OESTE} -radix hexadecimal /test_bench/hemps/slave3/rx(1)
add wave  -group {slave 30 - 3} -group {router 30 input OESTE} -radix hexadecimal /test_bench/hemps/slave3/credit_o(1)
add wave  -group {slave 30 - 3} -group {router 30 input OESTE} -radix hexadecimal /test_bench/hemps/slave3/data_in(1)
add wave  -group {slave 30 - 3} -group {router 30 input NORTE} -radix hexadecimal /test_bench/hemps/slave3/rx(2)
add wave  -group {slave 30 - 3} -group {router 30 input NORTE} -radix hexadecimal /test_bench/hemps/slave3/credit_o(2)
add wave  -group {slave 30 - 3} -group {router 30 input NORTE} -radix hexadecimal /test_bench/hemps/slave3/data_in(2)
add wave  -group {slave 30 - 3} -group {router 30 input SUL} -radix hexadecimal /test_bench/hemps/slave3/rx(3)
add wave  -group {slave 30 - 3} -group {router 30 input SUL} -radix hexadecimal /test_bench/hemps/slave3/credit_o(3)
add wave  -group {slave 30 - 3} -group {router 30 input SUL} -radix hexadecimal /test_bench/hemps/slave3/data_in(3)
add wave  -group {slave 40 - 4} /test_bench/hemps/slave4/clock
add wave  -group {slave 40 - 4} -group {ni 40} -radix hexadecimal /test_bench/hemps/slave4/tx_ni
add wave  -group {slave 40 - 4} -group {ni 40} -radix hexadecimal /test_bench/hemps/slave4/credit_i_ni
add wave  -group {slave 40 - 4} -group {ni 40} -radix hexadecimal /test_bench/hemps/slave4/data_out_ni
add wave  -group {slave 40 - 4} -radix hexadecimal /test_bench/hemps/slave4/rx_ni
add wave  -group {slave 40 - 4} -radix hexadecimal /test_bench/hemps/slave4/credit_o_ni
add wave  -group {slave 40 - 4} -radix hexadecimal /test_bench/hemps/slave4/data_in_ni
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/operation
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/set_address
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/set_address_2
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/set_size
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/set_size_2
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/set_op
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/start
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/size
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/size_2
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/address
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/address_2
add wave  -group {slave 40 - 4} -group {dmni 40} -group {config 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/config_data
add wave  -group {slave 40 - 4} -group {dmni 40} -group {arb 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/ARB
add wave  -group {slave 40 - 4} -group {dmni 40} -group {arb 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/prio
add wave  -group {slave 40 - 4} -group {dmni 40} -group {arb 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/timer
add wave  -group {slave 40 - 4} -group {dmni 40} -group {arb 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/write_enable
add wave  -group {slave 40 - 4} -group {dmni 40} -group {arb 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/read_enable
add wave  -group {slave 40 - 4} -group {dmni 40} -group {send 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/DMNI_Send
add wave  -group {slave 40 - 4} -group {dmni 40} -group {send 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/send_address
add wave  -group {slave 40 - 4} -group {dmni 40} -group {send 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/mem_data_read
add wave  -group {slave 40 - 4} -group {dmni 40} -group {send 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/send_size
add wave  -group {slave 40 - 4} -group {dmni 40} -group {send 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/send_address_2
add wave  -group {slave 40 - 4} -group {dmni 40} -group {send 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/send_size_2
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/DMNI_Receive
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/recv_address
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/mem_data_write
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/recv_size
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/mem_byte_we
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive NoC 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/intr
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive NoC 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/intr_count
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive NoC 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/SR
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive NoC 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/payload_size
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive NoC 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/read_av
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive NoC 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/slot_available
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive NoC 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/first
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive NoC 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/last
add wave  -group {slave 40 - 4} -group {dmni 40} -group {receive NoC 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/add_buffer
add wave  -group {slave 40 - 4} -group {dmni 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/mem_address
add wave  -group {slave 40 - 4} -group {dmni 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/is_header
add wave  -group {slave 40 - 4} -group {dmni 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/send_active
add wave  -group {slave 40 - 4} -group {dmni 40} -radix hexadecimal /test_bench/hemps/slave4/dmni/receive_active
add wave  -group {slave 40 - 4} -group {proc 40} -radix hexadecimal /test_bench/hemps/slave4/current_page
add wave  -group {slave 40 - 4} -group {proc 40} -radix hexadecimal /test_bench/hemps/slave4/cpu_mem_address
add wave  -group {slave 40 - 4} -group {proc 40} -radix hexadecimal /test_bench/hemps/slave4/write_enable
add wave  -group {slave 40 - 4} -group {proc 40} -radix hexadecimal /test_bench/hemps/slave4/pending_service
add wave  -group {slave 40 - 4} -group {proc 40} -radix hexadecimal /test_bench/hemps/slave4/irq_status
add wave  -group {slave 40 - 4} -group {router 40 input LESTE} -radix hexadecimal /test_bench/hemps/slave4/rx(0)
add wave  -group {slave 40 - 4} -group {router 40 input LESTE} -radix hexadecimal /test_bench/hemps/slave4/credit_o(0)
add wave  -group {slave 40 - 4} -group {router 40 input LESTE} -radix hexadecimal /test_bench/hemps/slave4/data_in(0)
add wave  -group {slave 40 - 4} -group {router 40 input OESTE} -radix hexadecimal /test_bench/hemps/slave4/rx(1)
add wave  -group {slave 40 - 4} -group {router 40 input OESTE} -radix hexadecimal /test_bench/hemps/slave4/credit_o(1)
add wave  -group {slave 40 - 4} -group {router 40 input OESTE} -radix hexadecimal /test_bench/hemps/slave4/data_in(1)
add wave  -group {slave 40 - 4} -group {router 40 input NORTE} -radix hexadecimal /test_bench/hemps/slave4/rx(2)
add wave  -group {slave 40 - 4} -group {router 40 input NORTE} -radix hexadecimal /test_bench/hemps/slave4/credit_o(2)
add wave  -group {slave 40 - 4} -group {router 40 input NORTE} -radix hexadecimal /test_bench/hemps/slave4/data_in(2)
add wave  -group {slave 40 - 4} -group {router 40 input SUL} -radix hexadecimal /test_bench/hemps/slave4/rx(3)
add wave  -group {slave 40 - 4} -group {router 40 input SUL} -radix hexadecimal /test_bench/hemps/slave4/credit_o(3)
add wave  -group {slave 40 - 4} -group {router 40 input SUL} -radix hexadecimal /test_bench/hemps/slave4/data_in(3)
add wave  -group {slave 50 - 5} /test_bench/hemps/slave5/clock
add wave  -group {slave 50 - 5} -group {ni 50} -radix hexadecimal /test_bench/hemps/slave5/tx_ni
add wave  -group {slave 50 - 5} -group {ni 50} -radix hexadecimal /test_bench/hemps/slave5/credit_i_ni
add wave  -group {slave 50 - 5} -group {ni 50} -radix hexadecimal /test_bench/hemps/slave5/data_out_ni
add wave  -group {slave 50 - 5} -radix hexadecimal /test_bench/hemps/slave5/rx_ni
add wave  -group {slave 50 - 5} -radix hexadecimal /test_bench/hemps/slave5/credit_o_ni
add wave  -group {slave 50 - 5} -radix hexadecimal /test_bench/hemps/slave5/data_in_ni
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/operation
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/set_address
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/set_address_2
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/set_size
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/set_size_2
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/set_op
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/start
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/size
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/size_2
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/address
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/address_2
add wave  -group {slave 50 - 5} -group {dmni 50} -group {config 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/config_data
add wave  -group {slave 50 - 5} -group {dmni 50} -group {arb 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/ARB
add wave  -group {slave 50 - 5} -group {dmni 50} -group {arb 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/prio
add wave  -group {slave 50 - 5} -group {dmni 50} -group {arb 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/timer
add wave  -group {slave 50 - 5} -group {dmni 50} -group {arb 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/write_enable
add wave  -group {slave 50 - 5} -group {dmni 50} -group {arb 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/read_enable
add wave  -group {slave 50 - 5} -group {dmni 50} -group {send 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/DMNI_Send
add wave  -group {slave 50 - 5} -group {dmni 50} -group {send 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/send_address
add wave  -group {slave 50 - 5} -group {dmni 50} -group {send 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/mem_data_read
add wave  -group {slave 50 - 5} -group {dmni 50} -group {send 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/send_size
add wave  -group {slave 50 - 5} -group {dmni 50} -group {send 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/send_address_2
add wave  -group {slave 50 - 5} -group {dmni 50} -group {send 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/send_size_2
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/DMNI_Receive
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/recv_address
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/mem_data_write
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/recv_size
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/mem_byte_we
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive NoC 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/intr
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive NoC 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/intr_count
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive NoC 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/SR
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive NoC 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/payload_size
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive NoC 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/read_av
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive NoC 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/slot_available
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive NoC 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/first
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive NoC 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/last
add wave  -group {slave 50 - 5} -group {dmni 50} -group {receive NoC 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/add_buffer
add wave  -group {slave 50 - 5} -group {dmni 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/mem_address
add wave  -group {slave 50 - 5} -group {dmni 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/is_header
add wave  -group {slave 50 - 5} -group {dmni 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/send_active
add wave  -group {slave 50 - 5} -group {dmni 50} -radix hexadecimal /test_bench/hemps/slave5/dmni/receive_active
add wave  -group {slave 50 - 5} -group {proc 50} -radix hexadecimal /test_bench/hemps/slave5/current_page
add wave  -group {slave 50 - 5} -group {proc 50} -radix hexadecimal /test_bench/hemps/slave5/cpu_mem_address
add wave  -group {slave 50 - 5} -group {proc 50} -radix hexadecimal /test_bench/hemps/slave5/write_enable
add wave  -group {slave 50 - 5} -group {proc 50} -radix hexadecimal /test_bench/hemps/slave5/pending_service
add wave  -group {slave 50 - 5} -group {proc 50} -radix hexadecimal /test_bench/hemps/slave5/irq_status
add wave  -group {slave 50 - 5} -group {router 50 input LESTE} -radix hexadecimal /test_bench/hemps/slave5/rx(0)
add wave  -group {slave 50 - 5} -group {router 50 input LESTE} -radix hexadecimal /test_bench/hemps/slave5/credit_o(0)
add wave  -group {slave 50 - 5} -group {router 50 input LESTE} -radix hexadecimal /test_bench/hemps/slave5/data_in(0)
add wave  -group {slave 50 - 5} -group {router 50 input OESTE} -radix hexadecimal /test_bench/hemps/slave5/rx(1)
add wave  -group {slave 50 - 5} -group {router 50 input OESTE} -radix hexadecimal /test_bench/hemps/slave5/credit_o(1)
add wave  -group {slave 50 - 5} -group {router 50 input OESTE} -radix hexadecimal /test_bench/hemps/slave5/data_in(1)
add wave  -group {slave 50 - 5} -group {router 50 input NORTE} -radix hexadecimal /test_bench/hemps/slave5/rx(2)
add wave  -group {slave 50 - 5} -group {router 50 input NORTE} -radix hexadecimal /test_bench/hemps/slave5/credit_o(2)
add wave  -group {slave 50 - 5} -group {router 50 input NORTE} -radix hexadecimal /test_bench/hemps/slave5/data_in(2)
add wave  -group {slave 50 - 5} -group {router 50 input SUL} -radix hexadecimal /test_bench/hemps/slave5/rx(3)
add wave  -group {slave 50 - 5} -group {router 50 input SUL} -radix hexadecimal /test_bench/hemps/slave5/credit_o(3)
add wave  -group {slave 50 - 5} -group {router 50 input SUL} -radix hexadecimal /test_bench/hemps/slave5/data_in(3)
add wave  -group {slave 01 - 6} /test_bench/hemps/slave6/clock
add wave  -group {slave 01 - 6} -group {ni 01} -radix hexadecimal /test_bench/hemps/slave6/tx_ni
add wave  -group {slave 01 - 6} -group {ni 01} -radix hexadecimal /test_bench/hemps/slave6/credit_i_ni
add wave  -group {slave 01 - 6} -group {ni 01} -radix hexadecimal /test_bench/hemps/slave6/data_out_ni
add wave  -group {slave 01 - 6} -radix hexadecimal /test_bench/hemps/slave6/rx_ni
add wave  -group {slave 01 - 6} -radix hexadecimal /test_bench/hemps/slave6/credit_o_ni
add wave  -group {slave 01 - 6} -radix hexadecimal /test_bench/hemps/slave6/data_in_ni
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/operation
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/set_address
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/set_address_2
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/set_size
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/set_size_2
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/set_op
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/start
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/size
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/size_2
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/address
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/address_2
add wave  -group {slave 01 - 6} -group {dmni 01} -group {config 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/config_data
add wave  -group {slave 01 - 6} -group {dmni 01} -group {arb 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/ARB
add wave  -group {slave 01 - 6} -group {dmni 01} -group {arb 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/prio
add wave  -group {slave 01 - 6} -group {dmni 01} -group {arb 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/timer
add wave  -group {slave 01 - 6} -group {dmni 01} -group {arb 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/write_enable
add wave  -group {slave 01 - 6} -group {dmni 01} -group {arb 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/read_enable
add wave  -group {slave 01 - 6} -group {dmni 01} -group {send 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/DMNI_Send
add wave  -group {slave 01 - 6} -group {dmni 01} -group {send 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/send_address
add wave  -group {slave 01 - 6} -group {dmni 01} -group {send 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/mem_data_read
add wave  -group {slave 01 - 6} -group {dmni 01} -group {send 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/send_size
add wave  -group {slave 01 - 6} -group {dmni 01} -group {send 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/send_address_2
add wave  -group {slave 01 - 6} -group {dmni 01} -group {send 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/send_size_2
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/DMNI_Receive
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/recv_address
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/mem_data_write
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/recv_size
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/mem_byte_we
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive NoC 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/intr
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive NoC 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/intr_count
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive NoC 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/SR
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive NoC 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/payload_size
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive NoC 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/read_av
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive NoC 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/slot_available
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive NoC 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/first
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive NoC 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/last
add wave  -group {slave 01 - 6} -group {dmni 01} -group {receive NoC 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/add_buffer
add wave  -group {slave 01 - 6} -group {dmni 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/mem_address
add wave  -group {slave 01 - 6} -group {dmni 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/is_header
add wave  -group {slave 01 - 6} -group {dmni 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/send_active
add wave  -group {slave 01 - 6} -group {dmni 01} -radix hexadecimal /test_bench/hemps/slave6/dmni/receive_active
add wave  -group {slave 01 - 6} -group {proc 01} -radix hexadecimal /test_bench/hemps/slave6/current_page
add wave  -group {slave 01 - 6} -group {proc 01} -radix hexadecimal /test_bench/hemps/slave6/cpu_mem_address
add wave  -group {slave 01 - 6} -group {proc 01} -radix hexadecimal /test_bench/hemps/slave6/write_enable
add wave  -group {slave 01 - 6} -group {proc 01} -radix hexadecimal /test_bench/hemps/slave6/pending_service
add wave  -group {slave 01 - 6} -group {proc 01} -radix hexadecimal /test_bench/hemps/slave6/irq_status
add wave  -group {slave 01 - 6} -group {router 01 input LESTE} -radix hexadecimal /test_bench/hemps/slave6/rx(0)
add wave  -group {slave 01 - 6} -group {router 01 input LESTE} -radix hexadecimal /test_bench/hemps/slave6/credit_o(0)
add wave  -group {slave 01 - 6} -group {router 01 input LESTE} -radix hexadecimal /test_bench/hemps/slave6/data_in(0)
add wave  -group {slave 01 - 6} -group {router 01 input OESTE} -radix hexadecimal /test_bench/hemps/slave6/rx(1)
add wave  -group {slave 01 - 6} -group {router 01 input OESTE} -radix hexadecimal /test_bench/hemps/slave6/credit_o(1)
add wave  -group {slave 01 - 6} -group {router 01 input OESTE} -radix hexadecimal /test_bench/hemps/slave6/data_in(1)
add wave  -group {slave 01 - 6} -group {router 01 input NORTE} -radix hexadecimal /test_bench/hemps/slave6/rx(2)
add wave  -group {slave 01 - 6} -group {router 01 input NORTE} -radix hexadecimal /test_bench/hemps/slave6/credit_o(2)
add wave  -group {slave 01 - 6} -group {router 01 input NORTE} -radix hexadecimal /test_bench/hemps/slave6/data_in(2)
add wave  -group {slave 01 - 6} -group {router 01 input SUL} -radix hexadecimal /test_bench/hemps/slave6/rx(3)
add wave  -group {slave 01 - 6} -group {router 01 input SUL} -radix hexadecimal /test_bench/hemps/slave6/credit_o(3)
add wave  -group {slave 01 - 6} -group {router 01 input SUL} -radix hexadecimal /test_bench/hemps/slave6/data_in(3)
add wave  -group {slave 11 - 7} /test_bench/hemps/slave7/clock
add wave  -group {slave 11 - 7} -group {ni 11} -radix hexadecimal /test_bench/hemps/slave7/tx_ni
add wave  -group {slave 11 - 7} -group {ni 11} -radix hexadecimal /test_bench/hemps/slave7/credit_i_ni
add wave  -group {slave 11 - 7} -group {ni 11} -radix hexadecimal /test_bench/hemps/slave7/data_out_ni
add wave  -group {slave 11 - 7} -radix hexadecimal /test_bench/hemps/slave7/rx_ni
add wave  -group {slave 11 - 7} -radix hexadecimal /test_bench/hemps/slave7/credit_o_ni
add wave  -group {slave 11 - 7} -radix hexadecimal /test_bench/hemps/slave7/data_in_ni
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/operation
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/set_address
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/set_address_2
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/set_size
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/set_size_2
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/set_op
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/start
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/size
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/size_2
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/address
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/address_2
add wave  -group {slave 11 - 7} -group {dmni 11} -group {config 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/config_data
add wave  -group {slave 11 - 7} -group {dmni 11} -group {arb 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/ARB
add wave  -group {slave 11 - 7} -group {dmni 11} -group {arb 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/prio
add wave  -group {slave 11 - 7} -group {dmni 11} -group {arb 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/timer
add wave  -group {slave 11 - 7} -group {dmni 11} -group {arb 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/write_enable
add wave  -group {slave 11 - 7} -group {dmni 11} -group {arb 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/read_enable
add wave  -group {slave 11 - 7} -group {dmni 11} -group {send 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/DMNI_Send
add wave  -group {slave 11 - 7} -group {dmni 11} -group {send 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/send_address
add wave  -group {slave 11 - 7} -group {dmni 11} -group {send 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/mem_data_read
add wave  -group {slave 11 - 7} -group {dmni 11} -group {send 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/send_size
add wave  -group {slave 11 - 7} -group {dmni 11} -group {send 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/send_address_2
add wave  -group {slave 11 - 7} -group {dmni 11} -group {send 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/send_size_2
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/DMNI_Receive
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/recv_address
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/mem_data_write
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/recv_size
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/mem_byte_we
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive NoC 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/intr
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive NoC 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/intr_count
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive NoC 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/SR
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive NoC 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/payload_size
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive NoC 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/read_av
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive NoC 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/slot_available
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive NoC 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/first
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive NoC 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/last
add wave  -group {slave 11 - 7} -group {dmni 11} -group {receive NoC 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/add_buffer
add wave  -group {slave 11 - 7} -group {dmni 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/mem_address
add wave  -group {slave 11 - 7} -group {dmni 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/is_header
add wave  -group {slave 11 - 7} -group {dmni 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/send_active
add wave  -group {slave 11 - 7} -group {dmni 11} -radix hexadecimal /test_bench/hemps/slave7/dmni/receive_active
add wave  -group {slave 11 - 7} -group {proc 11} -radix hexadecimal /test_bench/hemps/slave7/current_page
add wave  -group {slave 11 - 7} -group {proc 11} -radix hexadecimal /test_bench/hemps/slave7/cpu_mem_address
add wave  -group {slave 11 - 7} -group {proc 11} -radix hexadecimal /test_bench/hemps/slave7/write_enable
add wave  -group {slave 11 - 7} -group {proc 11} -radix hexadecimal /test_bench/hemps/slave7/pending_service
add wave  -group {slave 11 - 7} -group {proc 11} -radix hexadecimal /test_bench/hemps/slave7/irq_status
add wave  -group {slave 11 - 7} -group {router 11 input LESTE} -radix hexadecimal /test_bench/hemps/slave7/rx(0)
add wave  -group {slave 11 - 7} -group {router 11 input LESTE} -radix hexadecimal /test_bench/hemps/slave7/credit_o(0)
add wave  -group {slave 11 - 7} -group {router 11 input LESTE} -radix hexadecimal /test_bench/hemps/slave7/data_in(0)
add wave  -group {slave 11 - 7} -group {router 11 input OESTE} -radix hexadecimal /test_bench/hemps/slave7/rx(1)
add wave  -group {slave 11 - 7} -group {router 11 input OESTE} -radix hexadecimal /test_bench/hemps/slave7/credit_o(1)
add wave  -group {slave 11 - 7} -group {router 11 input OESTE} -radix hexadecimal /test_bench/hemps/slave7/data_in(1)
add wave  -group {slave 11 - 7} -group {router 11 input NORTE} -radix hexadecimal /test_bench/hemps/slave7/rx(2)
add wave  -group {slave 11 - 7} -group {router 11 input NORTE} -radix hexadecimal /test_bench/hemps/slave7/credit_o(2)
add wave  -group {slave 11 - 7} -group {router 11 input NORTE} -radix hexadecimal /test_bench/hemps/slave7/data_in(2)
add wave  -group {slave 11 - 7} -group {router 11 input SUL} -radix hexadecimal /test_bench/hemps/slave7/rx(3)
add wave  -group {slave 11 - 7} -group {router 11 input SUL} -radix hexadecimal /test_bench/hemps/slave7/credit_o(3)
add wave  -group {slave 11 - 7} -group {router 11 input SUL} -radix hexadecimal /test_bench/hemps/slave7/data_in(3)
add wave  -group {slave 21 - 8} /test_bench/hemps/slave8/clock
add wave  -group {slave 21 - 8} -group {ni 21} -radix hexadecimal /test_bench/hemps/slave8/tx_ni
add wave  -group {slave 21 - 8} -group {ni 21} -radix hexadecimal /test_bench/hemps/slave8/credit_i_ni
add wave  -group {slave 21 - 8} -group {ni 21} -radix hexadecimal /test_bench/hemps/slave8/data_out_ni
add wave  -group {slave 21 - 8} -radix hexadecimal /test_bench/hemps/slave8/rx_ni
add wave  -group {slave 21 - 8} -radix hexadecimal /test_bench/hemps/slave8/credit_o_ni
add wave  -group {slave 21 - 8} -radix hexadecimal /test_bench/hemps/slave8/data_in_ni
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/operation
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/set_address
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/set_address_2
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/set_size
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/set_size_2
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/set_op
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/start
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/size
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/size_2
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/address
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/address_2
add wave  -group {slave 21 - 8} -group {dmni 21} -group {config 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/config_data
add wave  -group {slave 21 - 8} -group {dmni 21} -group {arb 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/ARB
add wave  -group {slave 21 - 8} -group {dmni 21} -group {arb 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/prio
add wave  -group {slave 21 - 8} -group {dmni 21} -group {arb 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/timer
add wave  -group {slave 21 - 8} -group {dmni 21} -group {arb 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/write_enable
add wave  -group {slave 21 - 8} -group {dmni 21} -group {arb 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/read_enable
add wave  -group {slave 21 - 8} -group {dmni 21} -group {send 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/DMNI_Send
add wave  -group {slave 21 - 8} -group {dmni 21} -group {send 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/send_address
add wave  -group {slave 21 - 8} -group {dmni 21} -group {send 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/mem_data_read
add wave  -group {slave 21 - 8} -group {dmni 21} -group {send 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/send_size
add wave  -group {slave 21 - 8} -group {dmni 21} -group {send 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/send_address_2
add wave  -group {slave 21 - 8} -group {dmni 21} -group {send 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/send_size_2
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/DMNI_Receive
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/recv_address
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/mem_data_write
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/recv_size
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/mem_byte_we
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive NoC 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/intr
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive NoC 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/intr_count
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive NoC 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/SR
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive NoC 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/payload_size
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive NoC 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/read_av
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive NoC 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/slot_available
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive NoC 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/first
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive NoC 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/last
add wave  -group {slave 21 - 8} -group {dmni 21} -group {receive NoC 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/add_buffer
add wave  -group {slave 21 - 8} -group {dmni 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/mem_address
add wave  -group {slave 21 - 8} -group {dmni 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/is_header
add wave  -group {slave 21 - 8} -group {dmni 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/send_active
add wave  -group {slave 21 - 8} -group {dmni 21} -radix hexadecimal /test_bench/hemps/slave8/dmni/receive_active
add wave  -group {slave 21 - 8} -group {proc 21} -radix hexadecimal /test_bench/hemps/slave8/current_page
add wave  -group {slave 21 - 8} -group {proc 21} -radix hexadecimal /test_bench/hemps/slave8/cpu_mem_address
add wave  -group {slave 21 - 8} -group {proc 21} -radix hexadecimal /test_bench/hemps/slave8/write_enable
add wave  -group {slave 21 - 8} -group {proc 21} -radix hexadecimal /test_bench/hemps/slave8/pending_service
add wave  -group {slave 21 - 8} -group {proc 21} -radix hexadecimal /test_bench/hemps/slave8/irq_status
add wave  -group {slave 21 - 8} -group {router 21 input LESTE} -radix hexadecimal /test_bench/hemps/slave8/rx(0)
add wave  -group {slave 21 - 8} -group {router 21 input LESTE} -radix hexadecimal /test_bench/hemps/slave8/credit_o(0)
add wave  -group {slave 21 - 8} -group {router 21 input LESTE} -radix hexadecimal /test_bench/hemps/slave8/data_in(0)
add wave  -group {slave 21 - 8} -group {router 21 input OESTE} -radix hexadecimal /test_bench/hemps/slave8/rx(1)
add wave  -group {slave 21 - 8} -group {router 21 input OESTE} -radix hexadecimal /test_bench/hemps/slave8/credit_o(1)
add wave  -group {slave 21 - 8} -group {router 21 input OESTE} -radix hexadecimal /test_bench/hemps/slave8/data_in(1)
add wave  -group {slave 21 - 8} -group {router 21 input NORTE} -radix hexadecimal /test_bench/hemps/slave8/rx(2)
add wave  -group {slave 21 - 8} -group {router 21 input NORTE} -radix hexadecimal /test_bench/hemps/slave8/credit_o(2)
add wave  -group {slave 21 - 8} -group {router 21 input NORTE} -radix hexadecimal /test_bench/hemps/slave8/data_in(2)
add wave  -group {slave 21 - 8} -group {router 21 input SUL} -radix hexadecimal /test_bench/hemps/slave8/rx(3)
add wave  -group {slave 21 - 8} -group {router 21 input SUL} -radix hexadecimal /test_bench/hemps/slave8/credit_o(3)
add wave  -group {slave 21 - 8} -group {router 21 input SUL} -radix hexadecimal /test_bench/hemps/slave8/data_in(3)
add wave  -group {slave 31 - 9} /test_bench/hemps/slave9/clock
add wave  -group {slave 31 - 9} -group {ni 31} -radix hexadecimal /test_bench/hemps/slave9/tx_ni
add wave  -group {slave 31 - 9} -group {ni 31} -radix hexadecimal /test_bench/hemps/slave9/credit_i_ni
add wave  -group {slave 31 - 9} -group {ni 31} -radix hexadecimal /test_bench/hemps/slave9/data_out_ni
add wave  -group {slave 31 - 9} -radix hexadecimal /test_bench/hemps/slave9/rx_ni
add wave  -group {slave 31 - 9} -radix hexadecimal /test_bench/hemps/slave9/credit_o_ni
add wave  -group {slave 31 - 9} -radix hexadecimal /test_bench/hemps/slave9/data_in_ni
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/operation
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/set_address
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/set_address_2
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/set_size
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/set_size_2
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/set_op
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/start
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/size
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/size_2
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/address
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/address_2
add wave  -group {slave 31 - 9} -group {dmni 31} -group {config 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/config_data
add wave  -group {slave 31 - 9} -group {dmni 31} -group {arb 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/ARB
add wave  -group {slave 31 - 9} -group {dmni 31} -group {arb 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/prio
add wave  -group {slave 31 - 9} -group {dmni 31} -group {arb 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/timer
add wave  -group {slave 31 - 9} -group {dmni 31} -group {arb 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/write_enable
add wave  -group {slave 31 - 9} -group {dmni 31} -group {arb 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/read_enable
add wave  -group {slave 31 - 9} -group {dmni 31} -group {send 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/DMNI_Send
add wave  -group {slave 31 - 9} -group {dmni 31} -group {send 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/send_address
add wave  -group {slave 31 - 9} -group {dmni 31} -group {send 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/mem_data_read
add wave  -group {slave 31 - 9} -group {dmni 31} -group {send 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/send_size
add wave  -group {slave 31 - 9} -group {dmni 31} -group {send 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/send_address_2
add wave  -group {slave 31 - 9} -group {dmni 31} -group {send 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/send_size_2
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/DMNI_Receive
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/recv_address
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/mem_data_write
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/recv_size
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/mem_byte_we
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive NoC 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/intr
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive NoC 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/intr_count
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive NoC 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/SR
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive NoC 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/payload_size
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive NoC 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/read_av
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive NoC 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/slot_available
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive NoC 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/first
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive NoC 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/last
add wave  -group {slave 31 - 9} -group {dmni 31} -group {receive NoC 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/add_buffer
add wave  -group {slave 31 - 9} -group {dmni 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/mem_address
add wave  -group {slave 31 - 9} -group {dmni 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/is_header
add wave  -group {slave 31 - 9} -group {dmni 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/send_active
add wave  -group {slave 31 - 9} -group {dmni 31} -radix hexadecimal /test_bench/hemps/slave9/dmni/receive_active
add wave  -group {slave 31 - 9} -group {proc 31} -radix hexadecimal /test_bench/hemps/slave9/current_page
add wave  -group {slave 31 - 9} -group {proc 31} -radix hexadecimal /test_bench/hemps/slave9/cpu_mem_address
add wave  -group {slave 31 - 9} -group {proc 31} -radix hexadecimal /test_bench/hemps/slave9/write_enable
add wave  -group {slave 31 - 9} -group {proc 31} -radix hexadecimal /test_bench/hemps/slave9/pending_service
add wave  -group {slave 31 - 9} -group {proc 31} -radix hexadecimal /test_bench/hemps/slave9/irq_status
add wave  -group {slave 31 - 9} -group {router 31 input LESTE} -radix hexadecimal /test_bench/hemps/slave9/rx(0)
add wave  -group {slave 31 - 9} -group {router 31 input LESTE} -radix hexadecimal /test_bench/hemps/slave9/credit_o(0)
add wave  -group {slave 31 - 9} -group {router 31 input LESTE} -radix hexadecimal /test_bench/hemps/slave9/data_in(0)
add wave  -group {slave 31 - 9} -group {router 31 input OESTE} -radix hexadecimal /test_bench/hemps/slave9/rx(1)
add wave  -group {slave 31 - 9} -group {router 31 input OESTE} -radix hexadecimal /test_bench/hemps/slave9/credit_o(1)
add wave  -group {slave 31 - 9} -group {router 31 input OESTE} -radix hexadecimal /test_bench/hemps/slave9/data_in(1)
add wave  -group {slave 31 - 9} -group {router 31 input NORTE} -radix hexadecimal /test_bench/hemps/slave9/rx(2)
add wave  -group {slave 31 - 9} -group {router 31 input NORTE} -radix hexadecimal /test_bench/hemps/slave9/credit_o(2)
add wave  -group {slave 31 - 9} -group {router 31 input NORTE} -radix hexadecimal /test_bench/hemps/slave9/data_in(2)
add wave  -group {slave 31 - 9} -group {router 31 input SUL} -radix hexadecimal /test_bench/hemps/slave9/rx(3)
add wave  -group {slave 31 - 9} -group {router 31 input SUL} -radix hexadecimal /test_bench/hemps/slave9/credit_o(3)
add wave  -group {slave 31 - 9} -group {router 31 input SUL} -radix hexadecimal /test_bench/hemps/slave9/data_in(3)
add wave  -group {slave 41 - 10} /test_bench/hemps/slave10/clock
add wave  -group {slave 41 - 10} -group {ni 41} -radix hexadecimal /test_bench/hemps/slave10/tx_ni
add wave  -group {slave 41 - 10} -group {ni 41} -radix hexadecimal /test_bench/hemps/slave10/credit_i_ni
add wave  -group {slave 41 - 10} -group {ni 41} -radix hexadecimal /test_bench/hemps/slave10/data_out_ni
add wave  -group {slave 41 - 10} -radix hexadecimal /test_bench/hemps/slave10/rx_ni
add wave  -group {slave 41 - 10} -radix hexadecimal /test_bench/hemps/slave10/credit_o_ni
add wave  -group {slave 41 - 10} -radix hexadecimal /test_bench/hemps/slave10/data_in_ni
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/operation
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/set_address
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/set_address_2
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/set_size
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/set_size_2
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/set_op
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/start
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/size
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/size_2
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/address
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/address_2
add wave  -group {slave 41 - 10} -group {dmni 41} -group {config 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/config_data
add wave  -group {slave 41 - 10} -group {dmni 41} -group {arb 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/ARB
add wave  -group {slave 41 - 10} -group {dmni 41} -group {arb 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/prio
add wave  -group {slave 41 - 10} -group {dmni 41} -group {arb 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/timer
add wave  -group {slave 41 - 10} -group {dmni 41} -group {arb 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/write_enable
add wave  -group {slave 41 - 10} -group {dmni 41} -group {arb 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/read_enable
add wave  -group {slave 41 - 10} -group {dmni 41} -group {send 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/DMNI_Send
add wave  -group {slave 41 - 10} -group {dmni 41} -group {send 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/send_address
add wave  -group {slave 41 - 10} -group {dmni 41} -group {send 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/mem_data_read
add wave  -group {slave 41 - 10} -group {dmni 41} -group {send 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/send_size
add wave  -group {slave 41 - 10} -group {dmni 41} -group {send 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/send_address_2
add wave  -group {slave 41 - 10} -group {dmni 41} -group {send 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/send_size_2
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/DMNI_Receive
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/recv_address
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/mem_data_write
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/recv_size
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/mem_byte_we
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive NoC 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/intr
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive NoC 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/intr_count
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive NoC 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/SR
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive NoC 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/payload_size
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive NoC 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/read_av
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive NoC 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/slot_available
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive NoC 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/first
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive NoC 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/last
add wave  -group {slave 41 - 10} -group {dmni 41} -group {receive NoC 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/add_buffer
add wave  -group {slave 41 - 10} -group {dmni 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/mem_address
add wave  -group {slave 41 - 10} -group {dmni 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/is_header
add wave  -group {slave 41 - 10} -group {dmni 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/send_active
add wave  -group {slave 41 - 10} -group {dmni 41} -radix hexadecimal /test_bench/hemps/slave10/dmni/receive_active
add wave  -group {slave 41 - 10} -group {proc 41} -radix hexadecimal /test_bench/hemps/slave10/current_page
add wave  -group {slave 41 - 10} -group {proc 41} -radix hexadecimal /test_bench/hemps/slave10/cpu_mem_address
add wave  -group {slave 41 - 10} -group {proc 41} -radix hexadecimal /test_bench/hemps/slave10/write_enable
add wave  -group {slave 41 - 10} -group {proc 41} -radix hexadecimal /test_bench/hemps/slave10/pending_service
add wave  -group {slave 41 - 10} -group {proc 41} -radix hexadecimal /test_bench/hemps/slave10/irq_status
add wave  -group {slave 41 - 10} -group {router 41 input LESTE} -radix hexadecimal /test_bench/hemps/slave10/rx(0)
add wave  -group {slave 41 - 10} -group {router 41 input LESTE} -radix hexadecimal /test_bench/hemps/slave10/credit_o(0)
add wave  -group {slave 41 - 10} -group {router 41 input LESTE} -radix hexadecimal /test_bench/hemps/slave10/data_in(0)
add wave  -group {slave 41 - 10} -group {router 41 input OESTE} -radix hexadecimal /test_bench/hemps/slave10/rx(1)
add wave  -group {slave 41 - 10} -group {router 41 input OESTE} -radix hexadecimal /test_bench/hemps/slave10/credit_o(1)
add wave  -group {slave 41 - 10} -group {router 41 input OESTE} -radix hexadecimal /test_bench/hemps/slave10/data_in(1)
add wave  -group {slave 41 - 10} -group {router 41 input NORTE} -radix hexadecimal /test_bench/hemps/slave10/rx(2)
add wave  -group {slave 41 - 10} -group {router 41 input NORTE} -radix hexadecimal /test_bench/hemps/slave10/credit_o(2)
add wave  -group {slave 41 - 10} -group {router 41 input NORTE} -radix hexadecimal /test_bench/hemps/slave10/data_in(2)
add wave  -group {slave 41 - 10} -group {router 41 input SUL} -radix hexadecimal /test_bench/hemps/slave10/rx(3)
add wave  -group {slave 41 - 10} -group {router 41 input SUL} -radix hexadecimal /test_bench/hemps/slave10/credit_o(3)
add wave  -group {slave 41 - 10} -group {router 41 input SUL} -radix hexadecimal /test_bench/hemps/slave10/data_in(3)
add wave  -group {slave 51 - 11} /test_bench/hemps/slave11/clock
add wave  -group {slave 51 - 11} -group {ni 51} -radix hexadecimal /test_bench/hemps/slave11/tx_ni
add wave  -group {slave 51 - 11} -group {ni 51} -radix hexadecimal /test_bench/hemps/slave11/credit_i_ni
add wave  -group {slave 51 - 11} -group {ni 51} -radix hexadecimal /test_bench/hemps/slave11/data_out_ni
add wave  -group {slave 51 - 11} -radix hexadecimal /test_bench/hemps/slave11/rx_ni
add wave  -group {slave 51 - 11} -radix hexadecimal /test_bench/hemps/slave11/credit_o_ni
add wave  -group {slave 51 - 11} -radix hexadecimal /test_bench/hemps/slave11/data_in_ni
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/operation
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/set_address
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/set_address_2
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/set_size
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/set_size_2
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/set_op
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/start
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/size
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/size_2
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/address
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/address_2
add wave  -group {slave 51 - 11} -group {dmni 51} -group {config 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/config_data
add wave  -group {slave 51 - 11} -group {dmni 51} -group {arb 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/ARB
add wave  -group {slave 51 - 11} -group {dmni 51} -group {arb 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/prio
add wave  -group {slave 51 - 11} -group {dmni 51} -group {arb 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/timer
add wave  -group {slave 51 - 11} -group {dmni 51} -group {arb 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/write_enable
add wave  -group {slave 51 - 11} -group {dmni 51} -group {arb 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/read_enable
add wave  -group {slave 51 - 11} -group {dmni 51} -group {send 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/DMNI_Send
add wave  -group {slave 51 - 11} -group {dmni 51} -group {send 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/send_address
add wave  -group {slave 51 - 11} -group {dmni 51} -group {send 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/mem_data_read
add wave  -group {slave 51 - 11} -group {dmni 51} -group {send 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/send_size
add wave  -group {slave 51 - 11} -group {dmni 51} -group {send 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/send_address_2
add wave  -group {slave 51 - 11} -group {dmni 51} -group {send 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/send_size_2
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/DMNI_Receive
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/recv_address
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/mem_data_write
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/recv_size
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/mem_byte_we
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive NoC 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/intr
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive NoC 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/intr_count
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive NoC 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/SR
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive NoC 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/payload_size
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive NoC 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/read_av
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive NoC 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/slot_available
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive NoC 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/first
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive NoC 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/last
add wave  -group {slave 51 - 11} -group {dmni 51} -group {receive NoC 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/add_buffer
add wave  -group {slave 51 - 11} -group {dmni 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/mem_address
add wave  -group {slave 51 - 11} -group {dmni 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/is_header
add wave  -group {slave 51 - 11} -group {dmni 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/send_active
add wave  -group {slave 51 - 11} -group {dmni 51} -radix hexadecimal /test_bench/hemps/slave11/dmni/receive_active
add wave  -group {slave 51 - 11} -group {proc 51} -radix hexadecimal /test_bench/hemps/slave11/current_page
add wave  -group {slave 51 - 11} -group {proc 51} -radix hexadecimal /test_bench/hemps/slave11/cpu_mem_address
add wave  -group {slave 51 - 11} -group {proc 51} -radix hexadecimal /test_bench/hemps/slave11/write_enable
add wave  -group {slave 51 - 11} -group {proc 51} -radix hexadecimal /test_bench/hemps/slave11/pending_service
add wave  -group {slave 51 - 11} -group {proc 51} -radix hexadecimal /test_bench/hemps/slave11/irq_status
add wave  -group {slave 51 - 11} -group {router 51 input LESTE} -radix hexadecimal /test_bench/hemps/slave11/rx(0)
add wave  -group {slave 51 - 11} -group {router 51 input LESTE} -radix hexadecimal /test_bench/hemps/slave11/credit_o(0)
add wave  -group {slave 51 - 11} -group {router 51 input LESTE} -radix hexadecimal /test_bench/hemps/slave11/data_in(0)
add wave  -group {slave 51 - 11} -group {router 51 input OESTE} -radix hexadecimal /test_bench/hemps/slave11/rx(1)
add wave  -group {slave 51 - 11} -group {router 51 input OESTE} -radix hexadecimal /test_bench/hemps/slave11/credit_o(1)
add wave  -group {slave 51 - 11} -group {router 51 input OESTE} -radix hexadecimal /test_bench/hemps/slave11/data_in(1)
add wave  -group {slave 51 - 11} -group {router 51 input NORTE} -radix hexadecimal /test_bench/hemps/slave11/rx(2)
add wave  -group {slave 51 - 11} -group {router 51 input NORTE} -radix hexadecimal /test_bench/hemps/slave11/credit_o(2)
add wave  -group {slave 51 - 11} -group {router 51 input NORTE} -radix hexadecimal /test_bench/hemps/slave11/data_in(2)
add wave  -group {slave 51 - 11} -group {router 51 input SUL} -radix hexadecimal /test_bench/hemps/slave11/rx(3)
add wave  -group {slave 51 - 11} -group {router 51 input SUL} -radix hexadecimal /test_bench/hemps/slave11/credit_o(3)
add wave  -group {slave 51 - 11} -group {router 51 input SUL} -radix hexadecimal /test_bench/hemps/slave11/data_in(3)
add wave  -group {slave 02 - 12} /test_bench/hemps/slave12/clock
add wave  -group {slave 02 - 12} -group {ni 02} -radix hexadecimal /test_bench/hemps/slave12/tx_ni
add wave  -group {slave 02 - 12} -group {ni 02} -radix hexadecimal /test_bench/hemps/slave12/credit_i_ni
add wave  -group {slave 02 - 12} -group {ni 02} -radix hexadecimal /test_bench/hemps/slave12/data_out_ni
add wave  -group {slave 02 - 12} -radix hexadecimal /test_bench/hemps/slave12/rx_ni
add wave  -group {slave 02 - 12} -radix hexadecimal /test_bench/hemps/slave12/credit_o_ni
add wave  -group {slave 02 - 12} -radix hexadecimal /test_bench/hemps/slave12/data_in_ni
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/operation
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/set_address
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/set_address_2
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/set_size
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/set_size_2
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/set_op
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/start
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/size
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/size_2
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/address
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/address_2
add wave  -group {slave 02 - 12} -group {dmni 02} -group {config 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/config_data
add wave  -group {slave 02 - 12} -group {dmni 02} -group {arb 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/ARB
add wave  -group {slave 02 - 12} -group {dmni 02} -group {arb 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/prio
add wave  -group {slave 02 - 12} -group {dmni 02} -group {arb 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/timer
add wave  -group {slave 02 - 12} -group {dmni 02} -group {arb 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/write_enable
add wave  -group {slave 02 - 12} -group {dmni 02} -group {arb 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/read_enable
add wave  -group {slave 02 - 12} -group {dmni 02} -group {send 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/DMNI_Send
add wave  -group {slave 02 - 12} -group {dmni 02} -group {send 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/send_address
add wave  -group {slave 02 - 12} -group {dmni 02} -group {send 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/mem_data_read
add wave  -group {slave 02 - 12} -group {dmni 02} -group {send 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/send_size
add wave  -group {slave 02 - 12} -group {dmni 02} -group {send 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/send_address_2
add wave  -group {slave 02 - 12} -group {dmni 02} -group {send 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/send_size_2
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/DMNI_Receive
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/recv_address
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/mem_data_write
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/recv_size
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/mem_byte_we
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive NoC 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/intr
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive NoC 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/intr_count
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive NoC 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/SR
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive NoC 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/payload_size
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive NoC 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/read_av
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive NoC 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/slot_available
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive NoC 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/first
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive NoC 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/last
add wave  -group {slave 02 - 12} -group {dmni 02} -group {receive NoC 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/add_buffer
add wave  -group {slave 02 - 12} -group {dmni 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/mem_address
add wave  -group {slave 02 - 12} -group {dmni 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/is_header
add wave  -group {slave 02 - 12} -group {dmni 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/send_active
add wave  -group {slave 02 - 12} -group {dmni 02} -radix hexadecimal /test_bench/hemps/slave12/dmni/receive_active
add wave  -group {slave 02 - 12} -group {proc 02} -radix hexadecimal /test_bench/hemps/slave12/current_page
add wave  -group {slave 02 - 12} -group {proc 02} -radix hexadecimal /test_bench/hemps/slave12/cpu_mem_address
add wave  -group {slave 02 - 12} -group {proc 02} -radix hexadecimal /test_bench/hemps/slave12/write_enable
add wave  -group {slave 02 - 12} -group {proc 02} -radix hexadecimal /test_bench/hemps/slave12/pending_service
add wave  -group {slave 02 - 12} -group {proc 02} -radix hexadecimal /test_bench/hemps/slave12/irq_status
add wave  -group {slave 02 - 12} -group {router 02 input LESTE} -radix hexadecimal /test_bench/hemps/slave12/rx(0)
add wave  -group {slave 02 - 12} -group {router 02 input LESTE} -radix hexadecimal /test_bench/hemps/slave12/credit_o(0)
add wave  -group {slave 02 - 12} -group {router 02 input LESTE} -radix hexadecimal /test_bench/hemps/slave12/data_in(0)
add wave  -group {slave 02 - 12} -group {router 02 input OESTE} -radix hexadecimal /test_bench/hemps/slave12/rx(1)
add wave  -group {slave 02 - 12} -group {router 02 input OESTE} -radix hexadecimal /test_bench/hemps/slave12/credit_o(1)
add wave  -group {slave 02 - 12} -group {router 02 input OESTE} -radix hexadecimal /test_bench/hemps/slave12/data_in(1)
add wave  -group {slave 02 - 12} -group {router 02 input NORTE} -radix hexadecimal /test_bench/hemps/slave12/rx(2)
add wave  -group {slave 02 - 12} -group {router 02 input NORTE} -radix hexadecimal /test_bench/hemps/slave12/credit_o(2)
add wave  -group {slave 02 - 12} -group {router 02 input NORTE} -radix hexadecimal /test_bench/hemps/slave12/data_in(2)
add wave  -group {slave 02 - 12} -group {router 02 input SUL} -radix hexadecimal /test_bench/hemps/slave12/rx(3)
add wave  -group {slave 02 - 12} -group {router 02 input SUL} -radix hexadecimal /test_bench/hemps/slave12/credit_o(3)
add wave  -group {slave 02 - 12} -group {router 02 input SUL} -radix hexadecimal /test_bench/hemps/slave12/data_in(3)
add wave  -group {slave 12 - 13} /test_bench/hemps/slave13/clock
add wave  -group {slave 12 - 13} -group {ni 12} -radix hexadecimal /test_bench/hemps/slave13/tx_ni
add wave  -group {slave 12 - 13} -group {ni 12} -radix hexadecimal /test_bench/hemps/slave13/credit_i_ni
add wave  -group {slave 12 - 13} -group {ni 12} -radix hexadecimal /test_bench/hemps/slave13/data_out_ni
add wave  -group {slave 12 - 13} -radix hexadecimal /test_bench/hemps/slave13/rx_ni
add wave  -group {slave 12 - 13} -radix hexadecimal /test_bench/hemps/slave13/credit_o_ni
add wave  -group {slave 12 - 13} -radix hexadecimal /test_bench/hemps/slave13/data_in_ni
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/operation
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/set_address
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/set_address_2
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/set_size
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/set_size_2
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/set_op
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/start
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/size
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/size_2
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/address
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/address_2
add wave  -group {slave 12 - 13} -group {dmni 12} -group {config 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/config_data
add wave  -group {slave 12 - 13} -group {dmni 12} -group {arb 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/ARB
add wave  -group {slave 12 - 13} -group {dmni 12} -group {arb 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/prio
add wave  -group {slave 12 - 13} -group {dmni 12} -group {arb 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/timer
add wave  -group {slave 12 - 13} -group {dmni 12} -group {arb 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/write_enable
add wave  -group {slave 12 - 13} -group {dmni 12} -group {arb 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/read_enable
add wave  -group {slave 12 - 13} -group {dmni 12} -group {send 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/DMNI_Send
add wave  -group {slave 12 - 13} -group {dmni 12} -group {send 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/send_address
add wave  -group {slave 12 - 13} -group {dmni 12} -group {send 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/mem_data_read
add wave  -group {slave 12 - 13} -group {dmni 12} -group {send 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/send_size
add wave  -group {slave 12 - 13} -group {dmni 12} -group {send 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/send_address_2
add wave  -group {slave 12 - 13} -group {dmni 12} -group {send 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/send_size_2
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/DMNI_Receive
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/recv_address
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/mem_data_write
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/recv_size
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/mem_byte_we
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive NoC 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/intr
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive NoC 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/intr_count
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive NoC 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/SR
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive NoC 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/payload_size
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive NoC 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/read_av
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive NoC 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/slot_available
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive NoC 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/first
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive NoC 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/last
add wave  -group {slave 12 - 13} -group {dmni 12} -group {receive NoC 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/add_buffer
add wave  -group {slave 12 - 13} -group {dmni 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/mem_address
add wave  -group {slave 12 - 13} -group {dmni 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/is_header
add wave  -group {slave 12 - 13} -group {dmni 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/send_active
add wave  -group {slave 12 - 13} -group {dmni 12} -radix hexadecimal /test_bench/hemps/slave13/dmni/receive_active
add wave  -group {slave 12 - 13} -group {proc 12} -radix hexadecimal /test_bench/hemps/slave13/current_page
add wave  -group {slave 12 - 13} -group {proc 12} -radix hexadecimal /test_bench/hemps/slave13/cpu_mem_address
add wave  -group {slave 12 - 13} -group {proc 12} -radix hexadecimal /test_bench/hemps/slave13/write_enable
add wave  -group {slave 12 - 13} -group {proc 12} -radix hexadecimal /test_bench/hemps/slave13/pending_service
add wave  -group {slave 12 - 13} -group {proc 12} -radix hexadecimal /test_bench/hemps/slave13/irq_status
add wave  -group {slave 12 - 13} -group {router 12 input LESTE} -radix hexadecimal /test_bench/hemps/slave13/rx(0)
add wave  -group {slave 12 - 13} -group {router 12 input LESTE} -radix hexadecimal /test_bench/hemps/slave13/credit_o(0)
add wave  -group {slave 12 - 13} -group {router 12 input LESTE} -radix hexadecimal /test_bench/hemps/slave13/data_in(0)
add wave  -group {slave 12 - 13} -group {router 12 input OESTE} -radix hexadecimal /test_bench/hemps/slave13/rx(1)
add wave  -group {slave 12 - 13} -group {router 12 input OESTE} -radix hexadecimal /test_bench/hemps/slave13/credit_o(1)
add wave  -group {slave 12 - 13} -group {router 12 input OESTE} -radix hexadecimal /test_bench/hemps/slave13/data_in(1)
add wave  -group {slave 12 - 13} -group {router 12 input NORTE} -radix hexadecimal /test_bench/hemps/slave13/rx(2)
add wave  -group {slave 12 - 13} -group {router 12 input NORTE} -radix hexadecimal /test_bench/hemps/slave13/credit_o(2)
add wave  -group {slave 12 - 13} -group {router 12 input NORTE} -radix hexadecimal /test_bench/hemps/slave13/data_in(2)
add wave  -group {slave 12 - 13} -group {router 12 input SUL} -radix hexadecimal /test_bench/hemps/slave13/rx(3)
add wave  -group {slave 12 - 13} -group {router 12 input SUL} -radix hexadecimal /test_bench/hemps/slave13/credit_o(3)
add wave  -group {slave 12 - 13} -group {router 12 input SUL} -radix hexadecimal /test_bench/hemps/slave13/data_in(3)
add wave  -group {slave 22 - 14} /test_bench/hemps/slave14/clock
add wave  -group {slave 22 - 14} -group {ni 22} -radix hexadecimal /test_bench/hemps/slave14/tx_ni
add wave  -group {slave 22 - 14} -group {ni 22} -radix hexadecimal /test_bench/hemps/slave14/credit_i_ni
add wave  -group {slave 22 - 14} -group {ni 22} -radix hexadecimal /test_bench/hemps/slave14/data_out_ni
add wave  -group {slave 22 - 14} -radix hexadecimal /test_bench/hemps/slave14/rx_ni
add wave  -group {slave 22 - 14} -radix hexadecimal /test_bench/hemps/slave14/credit_o_ni
add wave  -group {slave 22 - 14} -radix hexadecimal /test_bench/hemps/slave14/data_in_ni
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/operation
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/set_address
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/set_address_2
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/set_size
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/set_size_2
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/set_op
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/start
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/size
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/size_2
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/address
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/address_2
add wave  -group {slave 22 - 14} -group {dmni 22} -group {config 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/config_data
add wave  -group {slave 22 - 14} -group {dmni 22} -group {arb 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/ARB
add wave  -group {slave 22 - 14} -group {dmni 22} -group {arb 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/prio
add wave  -group {slave 22 - 14} -group {dmni 22} -group {arb 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/timer
add wave  -group {slave 22 - 14} -group {dmni 22} -group {arb 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/write_enable
add wave  -group {slave 22 - 14} -group {dmni 22} -group {arb 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/read_enable
add wave  -group {slave 22 - 14} -group {dmni 22} -group {send 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/DMNI_Send
add wave  -group {slave 22 - 14} -group {dmni 22} -group {send 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/send_address
add wave  -group {slave 22 - 14} -group {dmni 22} -group {send 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/mem_data_read
add wave  -group {slave 22 - 14} -group {dmni 22} -group {send 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/send_size
add wave  -group {slave 22 - 14} -group {dmni 22} -group {send 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/send_address_2
add wave  -group {slave 22 - 14} -group {dmni 22} -group {send 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/send_size_2
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/DMNI_Receive
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/recv_address
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/mem_data_write
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/recv_size
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/mem_byte_we
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive NoC 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/intr
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive NoC 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/intr_count
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive NoC 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/SR
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive NoC 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/payload_size
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive NoC 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/read_av
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive NoC 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/slot_available
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive NoC 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/first
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive NoC 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/last
add wave  -group {slave 22 - 14} -group {dmni 22} -group {receive NoC 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/add_buffer
add wave  -group {slave 22 - 14} -group {dmni 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/mem_address
add wave  -group {slave 22 - 14} -group {dmni 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/is_header
add wave  -group {slave 22 - 14} -group {dmni 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/send_active
add wave  -group {slave 22 - 14} -group {dmni 22} -radix hexadecimal /test_bench/hemps/slave14/dmni/receive_active
add wave  -group {slave 22 - 14} -group {proc 22} -radix hexadecimal /test_bench/hemps/slave14/current_page
add wave  -group {slave 22 - 14} -group {proc 22} -radix hexadecimal /test_bench/hemps/slave14/cpu_mem_address
add wave  -group {slave 22 - 14} -group {proc 22} -radix hexadecimal /test_bench/hemps/slave14/write_enable
add wave  -group {slave 22 - 14} -group {proc 22} -radix hexadecimal /test_bench/hemps/slave14/pending_service
add wave  -group {slave 22 - 14} -group {proc 22} -radix hexadecimal /test_bench/hemps/slave14/irq_status
add wave  -group {slave 22 - 14} -group {router 22 input LESTE} -radix hexadecimal /test_bench/hemps/slave14/rx(0)
add wave  -group {slave 22 - 14} -group {router 22 input LESTE} -radix hexadecimal /test_bench/hemps/slave14/credit_o(0)
add wave  -group {slave 22 - 14} -group {router 22 input LESTE} -radix hexadecimal /test_bench/hemps/slave14/data_in(0)
add wave  -group {slave 22 - 14} -group {router 22 input OESTE} -radix hexadecimal /test_bench/hemps/slave14/rx(1)
add wave  -group {slave 22 - 14} -group {router 22 input OESTE} -radix hexadecimal /test_bench/hemps/slave14/credit_o(1)
add wave  -group {slave 22 - 14} -group {router 22 input OESTE} -radix hexadecimal /test_bench/hemps/slave14/data_in(1)
add wave  -group {slave 22 - 14} -group {router 22 input NORTE} -radix hexadecimal /test_bench/hemps/slave14/rx(2)
add wave  -group {slave 22 - 14} -group {router 22 input NORTE} -radix hexadecimal /test_bench/hemps/slave14/credit_o(2)
add wave  -group {slave 22 - 14} -group {router 22 input NORTE} -radix hexadecimal /test_bench/hemps/slave14/data_in(2)
add wave  -group {slave 22 - 14} -group {router 22 input SUL} -radix hexadecimal /test_bench/hemps/slave14/rx(3)
add wave  -group {slave 22 - 14} -group {router 22 input SUL} -radix hexadecimal /test_bench/hemps/slave14/credit_o(3)
add wave  -group {slave 22 - 14} -group {router 22 input SUL} -radix hexadecimal /test_bench/hemps/slave14/data_in(3)
add wave  -group {slave 32 - 15} /test_bench/hemps/slave15/clock
add wave  -group {slave 32 - 15} -group {ni 32} -radix hexadecimal /test_bench/hemps/slave15/tx_ni
add wave  -group {slave 32 - 15} -group {ni 32} -radix hexadecimal /test_bench/hemps/slave15/credit_i_ni
add wave  -group {slave 32 - 15} -group {ni 32} -radix hexadecimal /test_bench/hemps/slave15/data_out_ni
add wave  -group {slave 32 - 15} -radix hexadecimal /test_bench/hemps/slave15/rx_ni
add wave  -group {slave 32 - 15} -radix hexadecimal /test_bench/hemps/slave15/credit_o_ni
add wave  -group {slave 32 - 15} -radix hexadecimal /test_bench/hemps/slave15/data_in_ni
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/operation
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/set_address
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/set_address_2
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/set_size
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/set_size_2
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/set_op
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/start
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/size
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/size_2
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/address
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/address_2
add wave  -group {slave 32 - 15} -group {dmni 32} -group {config 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/config_data
add wave  -group {slave 32 - 15} -group {dmni 32} -group {arb 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/ARB
add wave  -group {slave 32 - 15} -group {dmni 32} -group {arb 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/prio
add wave  -group {slave 32 - 15} -group {dmni 32} -group {arb 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/timer
add wave  -group {slave 32 - 15} -group {dmni 32} -group {arb 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/write_enable
add wave  -group {slave 32 - 15} -group {dmni 32} -group {arb 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/read_enable
add wave  -group {slave 32 - 15} -group {dmni 32} -group {send 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/DMNI_Send
add wave  -group {slave 32 - 15} -group {dmni 32} -group {send 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/send_address
add wave  -group {slave 32 - 15} -group {dmni 32} -group {send 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/mem_data_read
add wave  -group {slave 32 - 15} -group {dmni 32} -group {send 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/send_size
add wave  -group {slave 32 - 15} -group {dmni 32} -group {send 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/send_address_2
add wave  -group {slave 32 - 15} -group {dmni 32} -group {send 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/send_size_2
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/DMNI_Receive
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/recv_address
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/mem_data_write
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/recv_size
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/mem_byte_we
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive NoC 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/intr
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive NoC 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/intr_count
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive NoC 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/SR
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive NoC 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/payload_size
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive NoC 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/read_av
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive NoC 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/slot_available
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive NoC 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/first
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive NoC 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/last
add wave  -group {slave 32 - 15} -group {dmni 32} -group {receive NoC 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/add_buffer
add wave  -group {slave 32 - 15} -group {dmni 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/mem_address
add wave  -group {slave 32 - 15} -group {dmni 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/is_header
add wave  -group {slave 32 - 15} -group {dmni 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/send_active
add wave  -group {slave 32 - 15} -group {dmni 32} -radix hexadecimal /test_bench/hemps/slave15/dmni/receive_active
add wave  -group {slave 32 - 15} -group {proc 32} -radix hexadecimal /test_bench/hemps/slave15/current_page
add wave  -group {slave 32 - 15} -group {proc 32} -radix hexadecimal /test_bench/hemps/slave15/cpu_mem_address
add wave  -group {slave 32 - 15} -group {proc 32} -radix hexadecimal /test_bench/hemps/slave15/write_enable
add wave  -group {slave 32 - 15} -group {proc 32} -radix hexadecimal /test_bench/hemps/slave15/pending_service
add wave  -group {slave 32 - 15} -group {proc 32} -radix hexadecimal /test_bench/hemps/slave15/irq_status
add wave  -group {slave 32 - 15} -group {router 32 input LESTE} -radix hexadecimal /test_bench/hemps/slave15/rx(0)
add wave  -group {slave 32 - 15} -group {router 32 input LESTE} -radix hexadecimal /test_bench/hemps/slave15/credit_o(0)
add wave  -group {slave 32 - 15} -group {router 32 input LESTE} -radix hexadecimal /test_bench/hemps/slave15/data_in(0)
add wave  -group {slave 32 - 15} -group {router 32 input OESTE} -radix hexadecimal /test_bench/hemps/slave15/rx(1)
add wave  -group {slave 32 - 15} -group {router 32 input OESTE} -radix hexadecimal /test_bench/hemps/slave15/credit_o(1)
add wave  -group {slave 32 - 15} -group {router 32 input OESTE} -radix hexadecimal /test_bench/hemps/slave15/data_in(1)
add wave  -group {slave 32 - 15} -group {router 32 input NORTE} -radix hexadecimal /test_bench/hemps/slave15/rx(2)
add wave  -group {slave 32 - 15} -group {router 32 input NORTE} -radix hexadecimal /test_bench/hemps/slave15/credit_o(2)
add wave  -group {slave 32 - 15} -group {router 32 input NORTE} -radix hexadecimal /test_bench/hemps/slave15/data_in(2)
add wave  -group {slave 32 - 15} -group {router 32 input SUL} -radix hexadecimal /test_bench/hemps/slave15/rx(3)
add wave  -group {slave 32 - 15} -group {router 32 input SUL} -radix hexadecimal /test_bench/hemps/slave15/credit_o(3)
add wave  -group {slave 32 - 15} -group {router 32 input SUL} -radix hexadecimal /test_bench/hemps/slave15/data_in(3)
add wave  -group {slave 42 - 16} /test_bench/hemps/slave16/clock
add wave  -group {slave 42 - 16} -group {ni 42} -radix hexadecimal /test_bench/hemps/slave16/tx_ni
add wave  -group {slave 42 - 16} -group {ni 42} -radix hexadecimal /test_bench/hemps/slave16/credit_i_ni
add wave  -group {slave 42 - 16} -group {ni 42} -radix hexadecimal /test_bench/hemps/slave16/data_out_ni
add wave  -group {slave 42 - 16} -radix hexadecimal /test_bench/hemps/slave16/rx_ni
add wave  -group {slave 42 - 16} -radix hexadecimal /test_bench/hemps/slave16/credit_o_ni
add wave  -group {slave 42 - 16} -radix hexadecimal /test_bench/hemps/slave16/data_in_ni
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/operation
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/set_address
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/set_address_2
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/set_size
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/set_size_2
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/set_op
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/start
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/size
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/size_2
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/address
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/address_2
add wave  -group {slave 42 - 16} -group {dmni 42} -group {config 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/config_data
add wave  -group {slave 42 - 16} -group {dmni 42} -group {arb 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/ARB
add wave  -group {slave 42 - 16} -group {dmni 42} -group {arb 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/prio
add wave  -group {slave 42 - 16} -group {dmni 42} -group {arb 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/timer
add wave  -group {slave 42 - 16} -group {dmni 42} -group {arb 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/write_enable
add wave  -group {slave 42 - 16} -group {dmni 42} -group {arb 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/read_enable
add wave  -group {slave 42 - 16} -group {dmni 42} -group {send 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/DMNI_Send
add wave  -group {slave 42 - 16} -group {dmni 42} -group {send 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/send_address
add wave  -group {slave 42 - 16} -group {dmni 42} -group {send 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/mem_data_read
add wave  -group {slave 42 - 16} -group {dmni 42} -group {send 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/send_size
add wave  -group {slave 42 - 16} -group {dmni 42} -group {send 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/send_address_2
add wave  -group {slave 42 - 16} -group {dmni 42} -group {send 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/send_size_2
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/DMNI_Receive
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/recv_address
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/mem_data_write
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/recv_size
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/mem_byte_we
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive NoC 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/intr
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive NoC 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/intr_count
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive NoC 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/SR
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive NoC 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/payload_size
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive NoC 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/read_av
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive NoC 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/slot_available
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive NoC 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/first
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive NoC 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/last
add wave  -group {slave 42 - 16} -group {dmni 42} -group {receive NoC 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/add_buffer
add wave  -group {slave 42 - 16} -group {dmni 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/mem_address
add wave  -group {slave 42 - 16} -group {dmni 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/is_header
add wave  -group {slave 42 - 16} -group {dmni 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/send_active
add wave  -group {slave 42 - 16} -group {dmni 42} -radix hexadecimal /test_bench/hemps/slave16/dmni/receive_active
add wave  -group {slave 42 - 16} -group {proc 42} -radix hexadecimal /test_bench/hemps/slave16/current_page
add wave  -group {slave 42 - 16} -group {proc 42} -radix hexadecimal /test_bench/hemps/slave16/cpu_mem_address
add wave  -group {slave 42 - 16} -group {proc 42} -radix hexadecimal /test_bench/hemps/slave16/write_enable
add wave  -group {slave 42 - 16} -group {proc 42} -radix hexadecimal /test_bench/hemps/slave16/pending_service
add wave  -group {slave 42 - 16} -group {proc 42} -radix hexadecimal /test_bench/hemps/slave16/irq_status
add wave  -group {slave 42 - 16} -group {router 42 input LESTE} -radix hexadecimal /test_bench/hemps/slave16/rx(0)
add wave  -group {slave 42 - 16} -group {router 42 input LESTE} -radix hexadecimal /test_bench/hemps/slave16/credit_o(0)
add wave  -group {slave 42 - 16} -group {router 42 input LESTE} -radix hexadecimal /test_bench/hemps/slave16/data_in(0)
add wave  -group {slave 42 - 16} -group {router 42 input OESTE} -radix hexadecimal /test_bench/hemps/slave16/rx(1)
add wave  -group {slave 42 - 16} -group {router 42 input OESTE} -radix hexadecimal /test_bench/hemps/slave16/credit_o(1)
add wave  -group {slave 42 - 16} -group {router 42 input OESTE} -radix hexadecimal /test_bench/hemps/slave16/data_in(1)
add wave  -group {slave 42 - 16} -group {router 42 input NORTE} -radix hexadecimal /test_bench/hemps/slave16/rx(2)
add wave  -group {slave 42 - 16} -group {router 42 input NORTE} -radix hexadecimal /test_bench/hemps/slave16/credit_o(2)
add wave  -group {slave 42 - 16} -group {router 42 input NORTE} -radix hexadecimal /test_bench/hemps/slave16/data_in(2)
add wave  -group {slave 42 - 16} -group {router 42 input SUL} -radix hexadecimal /test_bench/hemps/slave16/rx(3)
add wave  -group {slave 42 - 16} -group {router 42 input SUL} -radix hexadecimal /test_bench/hemps/slave16/credit_o(3)
add wave  -group {slave 42 - 16} -group {router 42 input SUL} -radix hexadecimal /test_bench/hemps/slave16/data_in(3)
add wave  -group {slave 52 - 17} /test_bench/hemps/slave17/clock
add wave  -group {slave 52 - 17} -group {ni 52} -radix hexadecimal /test_bench/hemps/slave17/tx_ni
add wave  -group {slave 52 - 17} -group {ni 52} -radix hexadecimal /test_bench/hemps/slave17/credit_i_ni
add wave  -group {slave 52 - 17} -group {ni 52} -radix hexadecimal /test_bench/hemps/slave17/data_out_ni
add wave  -group {slave 52 - 17} -radix hexadecimal /test_bench/hemps/slave17/rx_ni
add wave  -group {slave 52 - 17} -radix hexadecimal /test_bench/hemps/slave17/credit_o_ni
add wave  -group {slave 52 - 17} -radix hexadecimal /test_bench/hemps/slave17/data_in_ni
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/operation
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/set_address
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/set_address_2
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/set_size
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/set_size_2
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/set_op
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/start
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/size
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/size_2
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/address
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/address_2
add wave  -group {slave 52 - 17} -group {dmni 52} -group {config 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/config_data
add wave  -group {slave 52 - 17} -group {dmni 52} -group {arb 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/ARB
add wave  -group {slave 52 - 17} -group {dmni 52} -group {arb 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/prio
add wave  -group {slave 52 - 17} -group {dmni 52} -group {arb 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/timer
add wave  -group {slave 52 - 17} -group {dmni 52} -group {arb 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/write_enable
add wave  -group {slave 52 - 17} -group {dmni 52} -group {arb 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/read_enable
add wave  -group {slave 52 - 17} -group {dmni 52} -group {send 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/DMNI_Send
add wave  -group {slave 52 - 17} -group {dmni 52} -group {send 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/send_address
add wave  -group {slave 52 - 17} -group {dmni 52} -group {send 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/mem_data_read
add wave  -group {slave 52 - 17} -group {dmni 52} -group {send 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/send_size
add wave  -group {slave 52 - 17} -group {dmni 52} -group {send 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/send_address_2
add wave  -group {slave 52 - 17} -group {dmni 52} -group {send 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/send_size_2
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/DMNI_Receive
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/recv_address
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/mem_data_write
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/recv_size
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/mem_byte_we
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive NoC 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/intr
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive NoC 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/intr_count
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive NoC 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/SR
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive NoC 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/payload_size
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive NoC 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/read_av
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive NoC 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/slot_available
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive NoC 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/first
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive NoC 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/last
add wave  -group {slave 52 - 17} -group {dmni 52} -group {receive NoC 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/add_buffer
add wave  -group {slave 52 - 17} -group {dmni 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/mem_address
add wave  -group {slave 52 - 17} -group {dmni 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/is_header
add wave  -group {slave 52 - 17} -group {dmni 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/send_active
add wave  -group {slave 52 - 17} -group {dmni 52} -radix hexadecimal /test_bench/hemps/slave17/dmni/receive_active
add wave  -group {slave 52 - 17} -group {proc 52} -radix hexadecimal /test_bench/hemps/slave17/current_page
add wave  -group {slave 52 - 17} -group {proc 52} -radix hexadecimal /test_bench/hemps/slave17/cpu_mem_address
add wave  -group {slave 52 - 17} -group {proc 52} -radix hexadecimal /test_bench/hemps/slave17/write_enable
add wave  -group {slave 52 - 17} -group {proc 52} -radix hexadecimal /test_bench/hemps/slave17/pending_service
add wave  -group {slave 52 - 17} -group {proc 52} -radix hexadecimal /test_bench/hemps/slave17/irq_status
add wave  -group {slave 52 - 17} -group {router 52 input LESTE} -radix hexadecimal /test_bench/hemps/slave17/rx(0)
add wave  -group {slave 52 - 17} -group {router 52 input LESTE} -radix hexadecimal /test_bench/hemps/slave17/credit_o(0)
add wave  -group {slave 52 - 17} -group {router 52 input LESTE} -radix hexadecimal /test_bench/hemps/slave17/data_in(0)
add wave  -group {slave 52 - 17} -group {router 52 input OESTE} -radix hexadecimal /test_bench/hemps/slave17/rx(1)
add wave  -group {slave 52 - 17} -group {router 52 input OESTE} -radix hexadecimal /test_bench/hemps/slave17/credit_o(1)
add wave  -group {slave 52 - 17} -group {router 52 input OESTE} -radix hexadecimal /test_bench/hemps/slave17/data_in(1)
add wave  -group {slave 52 - 17} -group {router 52 input NORTE} -radix hexadecimal /test_bench/hemps/slave17/rx(2)
add wave  -group {slave 52 - 17} -group {router 52 input NORTE} -radix hexadecimal /test_bench/hemps/slave17/credit_o(2)
add wave  -group {slave 52 - 17} -group {router 52 input NORTE} -radix hexadecimal /test_bench/hemps/slave17/data_in(2)
add wave  -group {slave 52 - 17} -group {router 52 input SUL} -radix hexadecimal /test_bench/hemps/slave17/rx(3)
add wave  -group {slave 52 - 17} -group {router 52 input SUL} -radix hexadecimal /test_bench/hemps/slave17/credit_o(3)
add wave  -group {slave 52 - 17} -group {router 52 input SUL} -radix hexadecimal /test_bench/hemps/slave17/data_in(3)
add wave  -group {slave 03 - 18} /test_bench/hemps/slave18/clock
add wave  -group {slave 03 - 18} -group {ni 03} -radix hexadecimal /test_bench/hemps/slave18/tx_ni
add wave  -group {slave 03 - 18} -group {ni 03} -radix hexadecimal /test_bench/hemps/slave18/credit_i_ni
add wave  -group {slave 03 - 18} -group {ni 03} -radix hexadecimal /test_bench/hemps/slave18/data_out_ni
add wave  -group {slave 03 - 18} -radix hexadecimal /test_bench/hemps/slave18/rx_ni
add wave  -group {slave 03 - 18} -radix hexadecimal /test_bench/hemps/slave18/credit_o_ni
add wave  -group {slave 03 - 18} -radix hexadecimal /test_bench/hemps/slave18/data_in_ni
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/operation
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/set_address
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/set_address_2
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/set_size
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/set_size_2
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/set_op
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/start
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/size
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/size_2
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/address
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/address_2
add wave  -group {slave 03 - 18} -group {dmni 03} -group {config 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/config_data
add wave  -group {slave 03 - 18} -group {dmni 03} -group {arb 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/ARB
add wave  -group {slave 03 - 18} -group {dmni 03} -group {arb 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/prio
add wave  -group {slave 03 - 18} -group {dmni 03} -group {arb 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/timer
add wave  -group {slave 03 - 18} -group {dmni 03} -group {arb 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/write_enable
add wave  -group {slave 03 - 18} -group {dmni 03} -group {arb 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/read_enable
add wave  -group {slave 03 - 18} -group {dmni 03} -group {send 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/DMNI_Send
add wave  -group {slave 03 - 18} -group {dmni 03} -group {send 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/send_address
add wave  -group {slave 03 - 18} -group {dmni 03} -group {send 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/mem_data_read
add wave  -group {slave 03 - 18} -group {dmni 03} -group {send 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/send_size
add wave  -group {slave 03 - 18} -group {dmni 03} -group {send 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/send_address_2
add wave  -group {slave 03 - 18} -group {dmni 03} -group {send 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/send_size_2
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/DMNI_Receive
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/recv_address
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/mem_data_write
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/recv_size
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/mem_byte_we
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive NoC 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/intr
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive NoC 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/intr_count
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive NoC 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/SR
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive NoC 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/payload_size
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive NoC 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/read_av
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive NoC 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/slot_available
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive NoC 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/first
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive NoC 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/last
add wave  -group {slave 03 - 18} -group {dmni 03} -group {receive NoC 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/add_buffer
add wave  -group {slave 03 - 18} -group {dmni 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/mem_address
add wave  -group {slave 03 - 18} -group {dmni 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/is_header
add wave  -group {slave 03 - 18} -group {dmni 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/send_active
add wave  -group {slave 03 - 18} -group {dmni 03} -radix hexadecimal /test_bench/hemps/slave18/dmni/receive_active
add wave  -group {slave 03 - 18} -group {proc 03} -radix hexadecimal /test_bench/hemps/slave18/current_page
add wave  -group {slave 03 - 18} -group {proc 03} -radix hexadecimal /test_bench/hemps/slave18/cpu_mem_address
add wave  -group {slave 03 - 18} -group {proc 03} -radix hexadecimal /test_bench/hemps/slave18/write_enable
add wave  -group {slave 03 - 18} -group {proc 03} -radix hexadecimal /test_bench/hemps/slave18/pending_service
add wave  -group {slave 03 - 18} -group {proc 03} -radix hexadecimal /test_bench/hemps/slave18/irq_status
add wave  -group {slave 03 - 18} -group {router 03 input LESTE} -radix hexadecimal /test_bench/hemps/slave18/rx(0)
add wave  -group {slave 03 - 18} -group {router 03 input LESTE} -radix hexadecimal /test_bench/hemps/slave18/credit_o(0)
add wave  -group {slave 03 - 18} -group {router 03 input LESTE} -radix hexadecimal /test_bench/hemps/slave18/data_in(0)
add wave  -group {slave 03 - 18} -group {router 03 input OESTE} -radix hexadecimal /test_bench/hemps/slave18/rx(1)
add wave  -group {slave 03 - 18} -group {router 03 input OESTE} -radix hexadecimal /test_bench/hemps/slave18/credit_o(1)
add wave  -group {slave 03 - 18} -group {router 03 input OESTE} -radix hexadecimal /test_bench/hemps/slave18/data_in(1)
add wave  -group {slave 03 - 18} -group {router 03 input NORTE} -radix hexadecimal /test_bench/hemps/slave18/rx(2)
add wave  -group {slave 03 - 18} -group {router 03 input NORTE} -radix hexadecimal /test_bench/hemps/slave18/credit_o(2)
add wave  -group {slave 03 - 18} -group {router 03 input NORTE} -radix hexadecimal /test_bench/hemps/slave18/data_in(2)
add wave  -group {slave 03 - 18} -group {router 03 input SUL} -radix hexadecimal /test_bench/hemps/slave18/rx(3)
add wave  -group {slave 03 - 18} -group {router 03 input SUL} -radix hexadecimal /test_bench/hemps/slave18/credit_o(3)
add wave  -group {slave 03 - 18} -group {router 03 input SUL} -radix hexadecimal /test_bench/hemps/slave18/data_in(3)
add wave  -group {slave 13 - 19} /test_bench/hemps/slave19/clock
add wave  -group {slave 13 - 19} -group {ni 13} -radix hexadecimal /test_bench/hemps/slave19/tx_ni
add wave  -group {slave 13 - 19} -group {ni 13} -radix hexadecimal /test_bench/hemps/slave19/credit_i_ni
add wave  -group {slave 13 - 19} -group {ni 13} -radix hexadecimal /test_bench/hemps/slave19/data_out_ni
add wave  -group {slave 13 - 19} -radix hexadecimal /test_bench/hemps/slave19/rx_ni
add wave  -group {slave 13 - 19} -radix hexadecimal /test_bench/hemps/slave19/credit_o_ni
add wave  -group {slave 13 - 19} -radix hexadecimal /test_bench/hemps/slave19/data_in_ni
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/operation
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/set_address
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/set_address_2
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/set_size
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/set_size_2
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/set_op
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/start
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/size
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/size_2
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/address
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/address_2
add wave  -group {slave 13 - 19} -group {dmni 13} -group {config 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/config_data
add wave  -group {slave 13 - 19} -group {dmni 13} -group {arb 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/ARB
add wave  -group {slave 13 - 19} -group {dmni 13} -group {arb 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/prio
add wave  -group {slave 13 - 19} -group {dmni 13} -group {arb 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/timer
add wave  -group {slave 13 - 19} -group {dmni 13} -group {arb 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/write_enable
add wave  -group {slave 13 - 19} -group {dmni 13} -group {arb 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/read_enable
add wave  -group {slave 13 - 19} -group {dmni 13} -group {send 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/DMNI_Send
add wave  -group {slave 13 - 19} -group {dmni 13} -group {send 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/send_address
add wave  -group {slave 13 - 19} -group {dmni 13} -group {send 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/mem_data_read
add wave  -group {slave 13 - 19} -group {dmni 13} -group {send 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/send_size
add wave  -group {slave 13 - 19} -group {dmni 13} -group {send 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/send_address_2
add wave  -group {slave 13 - 19} -group {dmni 13} -group {send 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/send_size_2
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/DMNI_Receive
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/recv_address
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/mem_data_write
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/recv_size
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/mem_byte_we
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive NoC 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/intr
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive NoC 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/intr_count
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive NoC 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/SR
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive NoC 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/payload_size
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive NoC 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/read_av
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive NoC 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/slot_available
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive NoC 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/first
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive NoC 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/last
add wave  -group {slave 13 - 19} -group {dmni 13} -group {receive NoC 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/add_buffer
add wave  -group {slave 13 - 19} -group {dmni 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/mem_address
add wave  -group {slave 13 - 19} -group {dmni 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/is_header
add wave  -group {slave 13 - 19} -group {dmni 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/send_active
add wave  -group {slave 13 - 19} -group {dmni 13} -radix hexadecimal /test_bench/hemps/slave19/dmni/receive_active
add wave  -group {slave 13 - 19} -group {proc 13} -radix hexadecimal /test_bench/hemps/slave19/current_page
add wave  -group {slave 13 - 19} -group {proc 13} -radix hexadecimal /test_bench/hemps/slave19/cpu_mem_address
add wave  -group {slave 13 - 19} -group {proc 13} -radix hexadecimal /test_bench/hemps/slave19/write_enable
add wave  -group {slave 13 - 19} -group {proc 13} -radix hexadecimal /test_bench/hemps/slave19/pending_service
add wave  -group {slave 13 - 19} -group {proc 13} -radix hexadecimal /test_bench/hemps/slave19/irq_status
add wave  -group {slave 13 - 19} -group {router 13 input LESTE} -radix hexadecimal /test_bench/hemps/slave19/rx(0)
add wave  -group {slave 13 - 19} -group {router 13 input LESTE} -radix hexadecimal /test_bench/hemps/slave19/credit_o(0)
add wave  -group {slave 13 - 19} -group {router 13 input LESTE} -radix hexadecimal /test_bench/hemps/slave19/data_in(0)
add wave  -group {slave 13 - 19} -group {router 13 input OESTE} -radix hexadecimal /test_bench/hemps/slave19/rx(1)
add wave  -group {slave 13 - 19} -group {router 13 input OESTE} -radix hexadecimal /test_bench/hemps/slave19/credit_o(1)
add wave  -group {slave 13 - 19} -group {router 13 input OESTE} -radix hexadecimal /test_bench/hemps/slave19/data_in(1)
add wave  -group {slave 13 - 19} -group {router 13 input NORTE} -radix hexadecimal /test_bench/hemps/slave19/rx(2)
add wave  -group {slave 13 - 19} -group {router 13 input NORTE} -radix hexadecimal /test_bench/hemps/slave19/credit_o(2)
add wave  -group {slave 13 - 19} -group {router 13 input NORTE} -radix hexadecimal /test_bench/hemps/slave19/data_in(2)
add wave  -group {slave 13 - 19} -group {router 13 input SUL} -radix hexadecimal /test_bench/hemps/slave19/rx(3)
add wave  -group {slave 13 - 19} -group {router 13 input SUL} -radix hexadecimal /test_bench/hemps/slave19/credit_o(3)
add wave  -group {slave 13 - 19} -group {router 13 input SUL} -radix hexadecimal /test_bench/hemps/slave19/data_in(3)
add wave  -group {slave 23 - 20} /test_bench/hemps/slave20/clock
add wave  -group {slave 23 - 20} -group {ni 23} -radix hexadecimal /test_bench/hemps/slave20/tx_ni
add wave  -group {slave 23 - 20} -group {ni 23} -radix hexadecimal /test_bench/hemps/slave20/credit_i_ni
add wave  -group {slave 23 - 20} -group {ni 23} -radix hexadecimal /test_bench/hemps/slave20/data_out_ni
add wave  -group {slave 23 - 20} -radix hexadecimal /test_bench/hemps/slave20/rx_ni
add wave  -group {slave 23 - 20} -radix hexadecimal /test_bench/hemps/slave20/credit_o_ni
add wave  -group {slave 23 - 20} -radix hexadecimal /test_bench/hemps/slave20/data_in_ni
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/operation
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/set_address
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/set_address_2
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/set_size
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/set_size_2
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/set_op
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/start
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/size
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/size_2
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/address
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/address_2
add wave  -group {slave 23 - 20} -group {dmni 23} -group {config 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/config_data
add wave  -group {slave 23 - 20} -group {dmni 23} -group {arb 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/ARB
add wave  -group {slave 23 - 20} -group {dmni 23} -group {arb 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/prio
add wave  -group {slave 23 - 20} -group {dmni 23} -group {arb 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/timer
add wave  -group {slave 23 - 20} -group {dmni 23} -group {arb 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/write_enable
add wave  -group {slave 23 - 20} -group {dmni 23} -group {arb 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/read_enable
add wave  -group {slave 23 - 20} -group {dmni 23} -group {send 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/DMNI_Send
add wave  -group {slave 23 - 20} -group {dmni 23} -group {send 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/send_address
add wave  -group {slave 23 - 20} -group {dmni 23} -group {send 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/mem_data_read
add wave  -group {slave 23 - 20} -group {dmni 23} -group {send 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/send_size
add wave  -group {slave 23 - 20} -group {dmni 23} -group {send 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/send_address_2
add wave  -group {slave 23 - 20} -group {dmni 23} -group {send 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/send_size_2
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/DMNI_Receive
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/recv_address
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/mem_data_write
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/recv_size
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/mem_byte_we
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive NoC 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/intr
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive NoC 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/intr_count
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive NoC 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/SR
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive NoC 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/payload_size
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive NoC 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/read_av
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive NoC 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/slot_available
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive NoC 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/first
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive NoC 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/last
add wave  -group {slave 23 - 20} -group {dmni 23} -group {receive NoC 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/add_buffer
add wave  -group {slave 23 - 20} -group {dmni 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/mem_address
add wave  -group {slave 23 - 20} -group {dmni 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/is_header
add wave  -group {slave 23 - 20} -group {dmni 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/send_active
add wave  -group {slave 23 - 20} -group {dmni 23} -radix hexadecimal /test_bench/hemps/slave20/dmni/receive_active
add wave  -group {slave 23 - 20} -group {proc 23} -radix hexadecimal /test_bench/hemps/slave20/current_page
add wave  -group {slave 23 - 20} -group {proc 23} -radix hexadecimal /test_bench/hemps/slave20/cpu_mem_address
add wave  -group {slave 23 - 20} -group {proc 23} -radix hexadecimal /test_bench/hemps/slave20/write_enable
add wave  -group {slave 23 - 20} -group {proc 23} -radix hexadecimal /test_bench/hemps/slave20/pending_service
add wave  -group {slave 23 - 20} -group {proc 23} -radix hexadecimal /test_bench/hemps/slave20/irq_status
add wave  -group {slave 23 - 20} -group {router 23 input LESTE} -radix hexadecimal /test_bench/hemps/slave20/rx(0)
add wave  -group {slave 23 - 20} -group {router 23 input LESTE} -radix hexadecimal /test_bench/hemps/slave20/credit_o(0)
add wave  -group {slave 23 - 20} -group {router 23 input LESTE} -radix hexadecimal /test_bench/hemps/slave20/data_in(0)
add wave  -group {slave 23 - 20} -group {router 23 input OESTE} -radix hexadecimal /test_bench/hemps/slave20/rx(1)
add wave  -group {slave 23 - 20} -group {router 23 input OESTE} -radix hexadecimal /test_bench/hemps/slave20/credit_o(1)
add wave  -group {slave 23 - 20} -group {router 23 input OESTE} -radix hexadecimal /test_bench/hemps/slave20/data_in(1)
add wave  -group {slave 23 - 20} -group {router 23 input NORTE} -radix hexadecimal /test_bench/hemps/slave20/rx(2)
add wave  -group {slave 23 - 20} -group {router 23 input NORTE} -radix hexadecimal /test_bench/hemps/slave20/credit_o(2)
add wave  -group {slave 23 - 20} -group {router 23 input NORTE} -radix hexadecimal /test_bench/hemps/slave20/data_in(2)
add wave  -group {slave 23 - 20} -group {router 23 input SUL} -radix hexadecimal /test_bench/hemps/slave20/rx(3)
add wave  -group {slave 23 - 20} -group {router 23 input SUL} -radix hexadecimal /test_bench/hemps/slave20/credit_o(3)
add wave  -group {slave 23 - 20} -group {router 23 input SUL} -radix hexadecimal /test_bench/hemps/slave20/data_in(3)
add wave  -group {slave 33 - 21} /test_bench/hemps/slave21/clock
add wave  -group {slave 33 - 21} -group {ni 33} -radix hexadecimal /test_bench/hemps/slave21/tx_ni
add wave  -group {slave 33 - 21} -group {ni 33} -radix hexadecimal /test_bench/hemps/slave21/credit_i_ni
add wave  -group {slave 33 - 21} -group {ni 33} -radix hexadecimal /test_bench/hemps/slave21/data_out_ni
add wave  -group {slave 33 - 21} -radix hexadecimal /test_bench/hemps/slave21/rx_ni
add wave  -group {slave 33 - 21} -radix hexadecimal /test_bench/hemps/slave21/credit_o_ni
add wave  -group {slave 33 - 21} -radix hexadecimal /test_bench/hemps/slave21/data_in_ni
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/operation
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/set_address
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/set_address_2
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/set_size
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/set_size_2
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/set_op
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/start
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/size
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/size_2
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/address
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/address_2
add wave  -group {slave 33 - 21} -group {dmni 33} -group {config 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/config_data
add wave  -group {slave 33 - 21} -group {dmni 33} -group {arb 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/ARB
add wave  -group {slave 33 - 21} -group {dmni 33} -group {arb 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/prio
add wave  -group {slave 33 - 21} -group {dmni 33} -group {arb 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/timer
add wave  -group {slave 33 - 21} -group {dmni 33} -group {arb 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/write_enable
add wave  -group {slave 33 - 21} -group {dmni 33} -group {arb 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/read_enable
add wave  -group {slave 33 - 21} -group {dmni 33} -group {send 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/DMNI_Send
add wave  -group {slave 33 - 21} -group {dmni 33} -group {send 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/send_address
add wave  -group {slave 33 - 21} -group {dmni 33} -group {send 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/mem_data_read
add wave  -group {slave 33 - 21} -group {dmni 33} -group {send 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/send_size
add wave  -group {slave 33 - 21} -group {dmni 33} -group {send 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/send_address_2
add wave  -group {slave 33 - 21} -group {dmni 33} -group {send 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/send_size_2
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/DMNI_Receive
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/recv_address
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/mem_data_write
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/recv_size
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/mem_byte_we
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive NoC 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/intr
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive NoC 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/intr_count
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive NoC 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/SR
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive NoC 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/payload_size
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive NoC 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/read_av
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive NoC 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/slot_available
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive NoC 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/first
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive NoC 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/last
add wave  -group {slave 33 - 21} -group {dmni 33} -group {receive NoC 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/add_buffer
add wave  -group {slave 33 - 21} -group {dmni 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/mem_address
add wave  -group {slave 33 - 21} -group {dmni 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/is_header
add wave  -group {slave 33 - 21} -group {dmni 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/send_active
add wave  -group {slave 33 - 21} -group {dmni 33} -radix hexadecimal /test_bench/hemps/slave21/dmni/receive_active
add wave  -group {slave 33 - 21} -group {proc 33} -radix hexadecimal /test_bench/hemps/slave21/current_page
add wave  -group {slave 33 - 21} -group {proc 33} -radix hexadecimal /test_bench/hemps/slave21/cpu_mem_address
add wave  -group {slave 33 - 21} -group {proc 33} -radix hexadecimal /test_bench/hemps/slave21/write_enable
add wave  -group {slave 33 - 21} -group {proc 33} -radix hexadecimal /test_bench/hemps/slave21/pending_service
add wave  -group {slave 33 - 21} -group {proc 33} -radix hexadecimal /test_bench/hemps/slave21/irq_status
add wave  -group {slave 33 - 21} -group {router 33 input LESTE} -radix hexadecimal /test_bench/hemps/slave21/rx(0)
add wave  -group {slave 33 - 21} -group {router 33 input LESTE} -radix hexadecimal /test_bench/hemps/slave21/credit_o(0)
add wave  -group {slave 33 - 21} -group {router 33 input LESTE} -radix hexadecimal /test_bench/hemps/slave21/data_in(0)
add wave  -group {slave 33 - 21} -group {router 33 input OESTE} -radix hexadecimal /test_bench/hemps/slave21/rx(1)
add wave  -group {slave 33 - 21} -group {router 33 input OESTE} -radix hexadecimal /test_bench/hemps/slave21/credit_o(1)
add wave  -group {slave 33 - 21} -group {router 33 input OESTE} -radix hexadecimal /test_bench/hemps/slave21/data_in(1)
add wave  -group {slave 33 - 21} -group {router 33 input NORTE} -radix hexadecimal /test_bench/hemps/slave21/rx(2)
add wave  -group {slave 33 - 21} -group {router 33 input NORTE} -radix hexadecimal /test_bench/hemps/slave21/credit_o(2)
add wave  -group {slave 33 - 21} -group {router 33 input NORTE} -radix hexadecimal /test_bench/hemps/slave21/data_in(2)
add wave  -group {slave 33 - 21} -group {router 33 input SUL} -radix hexadecimal /test_bench/hemps/slave21/rx(3)
add wave  -group {slave 33 - 21} -group {router 33 input SUL} -radix hexadecimal /test_bench/hemps/slave21/credit_o(3)
add wave  -group {slave 33 - 21} -group {router 33 input SUL} -radix hexadecimal /test_bench/hemps/slave21/data_in(3)
add wave  -group {slave 43 - 22} /test_bench/hemps/slave22/clock
add wave  -group {slave 43 - 22} -group {ni 43} -radix hexadecimal /test_bench/hemps/slave22/tx_ni
add wave  -group {slave 43 - 22} -group {ni 43} -radix hexadecimal /test_bench/hemps/slave22/credit_i_ni
add wave  -group {slave 43 - 22} -group {ni 43} -radix hexadecimal /test_bench/hemps/slave22/data_out_ni
add wave  -group {slave 43 - 22} -radix hexadecimal /test_bench/hemps/slave22/rx_ni
add wave  -group {slave 43 - 22} -radix hexadecimal /test_bench/hemps/slave22/credit_o_ni
add wave  -group {slave 43 - 22} -radix hexadecimal /test_bench/hemps/slave22/data_in_ni
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/operation
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/set_address
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/set_address_2
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/set_size
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/set_size_2
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/set_op
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/start
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/size
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/size_2
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/address
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/address_2
add wave  -group {slave 43 - 22} -group {dmni 43} -group {config 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/config_data
add wave  -group {slave 43 - 22} -group {dmni 43} -group {arb 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/ARB
add wave  -group {slave 43 - 22} -group {dmni 43} -group {arb 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/prio
add wave  -group {slave 43 - 22} -group {dmni 43} -group {arb 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/timer
add wave  -group {slave 43 - 22} -group {dmni 43} -group {arb 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/write_enable
add wave  -group {slave 43 - 22} -group {dmni 43} -group {arb 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/read_enable
add wave  -group {slave 43 - 22} -group {dmni 43} -group {send 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/DMNI_Send
add wave  -group {slave 43 - 22} -group {dmni 43} -group {send 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/send_address
add wave  -group {slave 43 - 22} -group {dmni 43} -group {send 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/mem_data_read
add wave  -group {slave 43 - 22} -group {dmni 43} -group {send 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/send_size
add wave  -group {slave 43 - 22} -group {dmni 43} -group {send 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/send_address_2
add wave  -group {slave 43 - 22} -group {dmni 43} -group {send 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/send_size_2
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/DMNI_Receive
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/recv_address
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/mem_data_write
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/recv_size
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/mem_byte_we
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive NoC 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/intr
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive NoC 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/intr_count
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive NoC 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/SR
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive NoC 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/payload_size
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive NoC 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/read_av
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive NoC 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/slot_available
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive NoC 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/first
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive NoC 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/last
add wave  -group {slave 43 - 22} -group {dmni 43} -group {receive NoC 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/add_buffer
add wave  -group {slave 43 - 22} -group {dmni 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/mem_address
add wave  -group {slave 43 - 22} -group {dmni 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/is_header
add wave  -group {slave 43 - 22} -group {dmni 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/send_active
add wave  -group {slave 43 - 22} -group {dmni 43} -radix hexadecimal /test_bench/hemps/slave22/dmni/receive_active
add wave  -group {slave 43 - 22} -group {proc 43} -radix hexadecimal /test_bench/hemps/slave22/current_page
add wave  -group {slave 43 - 22} -group {proc 43} -radix hexadecimal /test_bench/hemps/slave22/cpu_mem_address
add wave  -group {slave 43 - 22} -group {proc 43} -radix hexadecimal /test_bench/hemps/slave22/write_enable
add wave  -group {slave 43 - 22} -group {proc 43} -radix hexadecimal /test_bench/hemps/slave22/pending_service
add wave  -group {slave 43 - 22} -group {proc 43} -radix hexadecimal /test_bench/hemps/slave22/irq_status
add wave  -group {slave 43 - 22} -group {router 43 input LESTE} -radix hexadecimal /test_bench/hemps/slave22/rx(0)
add wave  -group {slave 43 - 22} -group {router 43 input LESTE} -radix hexadecimal /test_bench/hemps/slave22/credit_o(0)
add wave  -group {slave 43 - 22} -group {router 43 input LESTE} -radix hexadecimal /test_bench/hemps/slave22/data_in(0)
add wave  -group {slave 43 - 22} -group {router 43 input OESTE} -radix hexadecimal /test_bench/hemps/slave22/rx(1)
add wave  -group {slave 43 - 22} -group {router 43 input OESTE} -radix hexadecimal /test_bench/hemps/slave22/credit_o(1)
add wave  -group {slave 43 - 22} -group {router 43 input OESTE} -radix hexadecimal /test_bench/hemps/slave22/data_in(1)
add wave  -group {slave 43 - 22} -group {router 43 input NORTE} -radix hexadecimal /test_bench/hemps/slave22/rx(2)
add wave  -group {slave 43 - 22} -group {router 43 input NORTE} -radix hexadecimal /test_bench/hemps/slave22/credit_o(2)
add wave  -group {slave 43 - 22} -group {router 43 input NORTE} -radix hexadecimal /test_bench/hemps/slave22/data_in(2)
add wave  -group {slave 43 - 22} -group {router 43 input SUL} -radix hexadecimal /test_bench/hemps/slave22/rx(3)
add wave  -group {slave 43 - 22} -group {router 43 input SUL} -radix hexadecimal /test_bench/hemps/slave22/credit_o(3)
add wave  -group {slave 43 - 22} -group {router 43 input SUL} -radix hexadecimal /test_bench/hemps/slave22/data_in(3)
add wave  -group {slave 53 - 23} /test_bench/hemps/slave23/clock
add wave  -group {slave 53 - 23} -group {ni 53} -radix hexadecimal /test_bench/hemps/slave23/tx_ni
add wave  -group {slave 53 - 23} -group {ni 53} -radix hexadecimal /test_bench/hemps/slave23/credit_i_ni
add wave  -group {slave 53 - 23} -group {ni 53} -radix hexadecimal /test_bench/hemps/slave23/data_out_ni
add wave  -group {slave 53 - 23} -radix hexadecimal /test_bench/hemps/slave23/rx_ni
add wave  -group {slave 53 - 23} -radix hexadecimal /test_bench/hemps/slave23/credit_o_ni
add wave  -group {slave 53 - 23} -radix hexadecimal /test_bench/hemps/slave23/data_in_ni
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/operation
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/set_address
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/set_address_2
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/set_size
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/set_size_2
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/set_op
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/start
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/size
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/size_2
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/address
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/address_2
add wave  -group {slave 53 - 23} -group {dmni 53} -group {config 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/config_data
add wave  -group {slave 53 - 23} -group {dmni 53} -group {arb 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/ARB
add wave  -group {slave 53 - 23} -group {dmni 53} -group {arb 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/prio
add wave  -group {slave 53 - 23} -group {dmni 53} -group {arb 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/timer
add wave  -group {slave 53 - 23} -group {dmni 53} -group {arb 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/write_enable
add wave  -group {slave 53 - 23} -group {dmni 53} -group {arb 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/read_enable
add wave  -group {slave 53 - 23} -group {dmni 53} -group {send 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/DMNI_Send
add wave  -group {slave 53 - 23} -group {dmni 53} -group {send 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/send_address
add wave  -group {slave 53 - 23} -group {dmni 53} -group {send 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/mem_data_read
add wave  -group {slave 53 - 23} -group {dmni 53} -group {send 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/send_size
add wave  -group {slave 53 - 23} -group {dmni 53} -group {send 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/send_address_2
add wave  -group {slave 53 - 23} -group {dmni 53} -group {send 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/send_size_2
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/DMNI_Receive
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/recv_address
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/mem_data_write
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/recv_size
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/mem_byte_we
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive NoC 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/intr
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive NoC 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/intr_count
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive NoC 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/SR
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive NoC 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/payload_size
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive NoC 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/read_av
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive NoC 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/slot_available
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive NoC 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/first
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive NoC 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/last
add wave  -group {slave 53 - 23} -group {dmni 53} -group {receive NoC 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/add_buffer
add wave  -group {slave 53 - 23} -group {dmni 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/mem_address
add wave  -group {slave 53 - 23} -group {dmni 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/is_header
add wave  -group {slave 53 - 23} -group {dmni 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/send_active
add wave  -group {slave 53 - 23} -group {dmni 53} -radix hexadecimal /test_bench/hemps/slave23/dmni/receive_active
add wave  -group {slave 53 - 23} -group {proc 53} -radix hexadecimal /test_bench/hemps/slave23/current_page
add wave  -group {slave 53 - 23} -group {proc 53} -radix hexadecimal /test_bench/hemps/slave23/cpu_mem_address
add wave  -group {slave 53 - 23} -group {proc 53} -radix hexadecimal /test_bench/hemps/slave23/write_enable
add wave  -group {slave 53 - 23} -group {proc 53} -radix hexadecimal /test_bench/hemps/slave23/pending_service
add wave  -group {slave 53 - 23} -group {proc 53} -radix hexadecimal /test_bench/hemps/slave23/irq_status
add wave  -group {slave 53 - 23} -group {router 53 input LESTE} -radix hexadecimal /test_bench/hemps/slave23/rx(0)
add wave  -group {slave 53 - 23} -group {router 53 input LESTE} -radix hexadecimal /test_bench/hemps/slave23/credit_o(0)
add wave  -group {slave 53 - 23} -group {router 53 input LESTE} -radix hexadecimal /test_bench/hemps/slave23/data_in(0)
add wave  -group {slave 53 - 23} -group {router 53 input OESTE} -radix hexadecimal /test_bench/hemps/slave23/rx(1)
add wave  -group {slave 53 - 23} -group {router 53 input OESTE} -radix hexadecimal /test_bench/hemps/slave23/credit_o(1)
add wave  -group {slave 53 - 23} -group {router 53 input OESTE} -radix hexadecimal /test_bench/hemps/slave23/data_in(1)
add wave  -group {slave 53 - 23} -group {router 53 input NORTE} -radix hexadecimal /test_bench/hemps/slave23/rx(2)
add wave  -group {slave 53 - 23} -group {router 53 input NORTE} -radix hexadecimal /test_bench/hemps/slave23/credit_o(2)
add wave  -group {slave 53 - 23} -group {router 53 input NORTE} -radix hexadecimal /test_bench/hemps/slave23/data_in(2)
add wave  -group {slave 53 - 23} -group {router 53 input SUL} -radix hexadecimal /test_bench/hemps/slave23/rx(3)
add wave  -group {slave 53 - 23} -group {router 53 input SUL} -radix hexadecimal /test_bench/hemps/slave23/credit_o(3)
add wave  -group {slave 53 - 23} -group {router 53 input SUL} -radix hexadecimal /test_bench/hemps/slave23/data_in(3)
add wave  -group {slave 04 - 24} /test_bench/hemps/slave24/clock
add wave  -group {slave 04 - 24} -group {ni 04} -radix hexadecimal /test_bench/hemps/slave24/tx_ni
add wave  -group {slave 04 - 24} -group {ni 04} -radix hexadecimal /test_bench/hemps/slave24/credit_i_ni
add wave  -group {slave 04 - 24} -group {ni 04} -radix hexadecimal /test_bench/hemps/slave24/data_out_ni
add wave  -group {slave 04 - 24} -radix hexadecimal /test_bench/hemps/slave24/rx_ni
add wave  -group {slave 04 - 24} -radix hexadecimal /test_bench/hemps/slave24/credit_o_ni
add wave  -group {slave 04 - 24} -radix hexadecimal /test_bench/hemps/slave24/data_in_ni
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/operation
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/set_address
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/set_address_2
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/set_size
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/set_size_2
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/set_op
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/start
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/size
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/size_2
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/address
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/address_2
add wave  -group {slave 04 - 24} -group {dmni 04} -group {config 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/config_data
add wave  -group {slave 04 - 24} -group {dmni 04} -group {arb 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/ARB
add wave  -group {slave 04 - 24} -group {dmni 04} -group {arb 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/prio
add wave  -group {slave 04 - 24} -group {dmni 04} -group {arb 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/timer
add wave  -group {slave 04 - 24} -group {dmni 04} -group {arb 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/write_enable
add wave  -group {slave 04 - 24} -group {dmni 04} -group {arb 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/read_enable
add wave  -group {slave 04 - 24} -group {dmni 04} -group {send 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/DMNI_Send
add wave  -group {slave 04 - 24} -group {dmni 04} -group {send 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/send_address
add wave  -group {slave 04 - 24} -group {dmni 04} -group {send 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/mem_data_read
add wave  -group {slave 04 - 24} -group {dmni 04} -group {send 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/send_size
add wave  -group {slave 04 - 24} -group {dmni 04} -group {send 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/send_address_2
add wave  -group {slave 04 - 24} -group {dmni 04} -group {send 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/send_size_2
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/DMNI_Receive
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/recv_address
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/mem_data_write
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/recv_size
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/mem_byte_we
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive NoC 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/intr
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive NoC 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/intr_count
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive NoC 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/SR
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive NoC 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/payload_size
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive NoC 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/read_av
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive NoC 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/slot_available
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive NoC 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/first
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive NoC 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/last
add wave  -group {slave 04 - 24} -group {dmni 04} -group {receive NoC 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/add_buffer
add wave  -group {slave 04 - 24} -group {dmni 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/mem_address
add wave  -group {slave 04 - 24} -group {dmni 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/is_header
add wave  -group {slave 04 - 24} -group {dmni 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/send_active
add wave  -group {slave 04 - 24} -group {dmni 04} -radix hexadecimal /test_bench/hemps/slave24/dmni/receive_active
add wave  -group {slave 04 - 24} -group {proc 04} -radix hexadecimal /test_bench/hemps/slave24/current_page
add wave  -group {slave 04 - 24} -group {proc 04} -radix hexadecimal /test_bench/hemps/slave24/cpu_mem_address
add wave  -group {slave 04 - 24} -group {proc 04} -radix hexadecimal /test_bench/hemps/slave24/write_enable
add wave  -group {slave 04 - 24} -group {proc 04} -radix hexadecimal /test_bench/hemps/slave24/pending_service
add wave  -group {slave 04 - 24} -group {proc 04} -radix hexadecimal /test_bench/hemps/slave24/irq_status
add wave  -group {slave 04 - 24} -group {router 04 input LESTE} -radix hexadecimal /test_bench/hemps/slave24/rx(0)
add wave  -group {slave 04 - 24} -group {router 04 input LESTE} -radix hexadecimal /test_bench/hemps/slave24/credit_o(0)
add wave  -group {slave 04 - 24} -group {router 04 input LESTE} -radix hexadecimal /test_bench/hemps/slave24/data_in(0)
add wave  -group {slave 04 - 24} -group {router 04 input OESTE} -radix hexadecimal /test_bench/hemps/slave24/rx(1)
add wave  -group {slave 04 - 24} -group {router 04 input OESTE} -radix hexadecimal /test_bench/hemps/slave24/credit_o(1)
add wave  -group {slave 04 - 24} -group {router 04 input OESTE} -radix hexadecimal /test_bench/hemps/slave24/data_in(1)
add wave  -group {slave 04 - 24} -group {router 04 input NORTE} -radix hexadecimal /test_bench/hemps/slave24/rx(2)
add wave  -group {slave 04 - 24} -group {router 04 input NORTE} -radix hexadecimal /test_bench/hemps/slave24/credit_o(2)
add wave  -group {slave 04 - 24} -group {router 04 input NORTE} -radix hexadecimal /test_bench/hemps/slave24/data_in(2)
add wave  -group {slave 04 - 24} -group {router 04 input SUL} -radix hexadecimal /test_bench/hemps/slave24/rx(3)
add wave  -group {slave 04 - 24} -group {router 04 input SUL} -radix hexadecimal /test_bench/hemps/slave24/credit_o(3)
add wave  -group {slave 04 - 24} -group {router 04 input SUL} -radix hexadecimal /test_bench/hemps/slave24/data_in(3)
add wave  -group {slave 14 - 25} /test_bench/hemps/slave25/clock
add wave  -group {slave 14 - 25} -group {ni 14} -radix hexadecimal /test_bench/hemps/slave25/tx_ni
add wave  -group {slave 14 - 25} -group {ni 14} -radix hexadecimal /test_bench/hemps/slave25/credit_i_ni
add wave  -group {slave 14 - 25} -group {ni 14} -radix hexadecimal /test_bench/hemps/slave25/data_out_ni
add wave  -group {slave 14 - 25} -radix hexadecimal /test_bench/hemps/slave25/rx_ni
add wave  -group {slave 14 - 25} -radix hexadecimal /test_bench/hemps/slave25/credit_o_ni
add wave  -group {slave 14 - 25} -radix hexadecimal /test_bench/hemps/slave25/data_in_ni
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/operation
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/set_address
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/set_address_2
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/set_size
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/set_size_2
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/set_op
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/start
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/size
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/size_2
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/address
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/address_2
add wave  -group {slave 14 - 25} -group {dmni 14} -group {config 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/config_data
add wave  -group {slave 14 - 25} -group {dmni 14} -group {arb 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/ARB
add wave  -group {slave 14 - 25} -group {dmni 14} -group {arb 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/prio
add wave  -group {slave 14 - 25} -group {dmni 14} -group {arb 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/timer
add wave  -group {slave 14 - 25} -group {dmni 14} -group {arb 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/write_enable
add wave  -group {slave 14 - 25} -group {dmni 14} -group {arb 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/read_enable
add wave  -group {slave 14 - 25} -group {dmni 14} -group {send 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/DMNI_Send
add wave  -group {slave 14 - 25} -group {dmni 14} -group {send 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/send_address
add wave  -group {slave 14 - 25} -group {dmni 14} -group {send 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/mem_data_read
add wave  -group {slave 14 - 25} -group {dmni 14} -group {send 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/send_size
add wave  -group {slave 14 - 25} -group {dmni 14} -group {send 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/send_address_2
add wave  -group {slave 14 - 25} -group {dmni 14} -group {send 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/send_size_2
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/DMNI_Receive
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/recv_address
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/mem_data_write
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/recv_size
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/mem_byte_we
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive NoC 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/intr
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive NoC 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/intr_count
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive NoC 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/SR
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive NoC 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/payload_size
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive NoC 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/read_av
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive NoC 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/slot_available
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive NoC 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/first
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive NoC 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/last
add wave  -group {slave 14 - 25} -group {dmni 14} -group {receive NoC 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/add_buffer
add wave  -group {slave 14 - 25} -group {dmni 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/mem_address
add wave  -group {slave 14 - 25} -group {dmni 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/is_header
add wave  -group {slave 14 - 25} -group {dmni 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/send_active
add wave  -group {slave 14 - 25} -group {dmni 14} -radix hexadecimal /test_bench/hemps/slave25/dmni/receive_active
add wave  -group {slave 14 - 25} -group {proc 14} -radix hexadecimal /test_bench/hemps/slave25/current_page
add wave  -group {slave 14 - 25} -group {proc 14} -radix hexadecimal /test_bench/hemps/slave25/cpu_mem_address
add wave  -group {slave 14 - 25} -group {proc 14} -radix hexadecimal /test_bench/hemps/slave25/write_enable
add wave  -group {slave 14 - 25} -group {proc 14} -radix hexadecimal /test_bench/hemps/slave25/pending_service
add wave  -group {slave 14 - 25} -group {proc 14} -radix hexadecimal /test_bench/hemps/slave25/irq_status
add wave  -group {slave 14 - 25} -group {router 14 input LESTE} -radix hexadecimal /test_bench/hemps/slave25/rx(0)
add wave  -group {slave 14 - 25} -group {router 14 input LESTE} -radix hexadecimal /test_bench/hemps/slave25/credit_o(0)
add wave  -group {slave 14 - 25} -group {router 14 input LESTE} -radix hexadecimal /test_bench/hemps/slave25/data_in(0)
add wave  -group {slave 14 - 25} -group {router 14 input OESTE} -radix hexadecimal /test_bench/hemps/slave25/rx(1)
add wave  -group {slave 14 - 25} -group {router 14 input OESTE} -radix hexadecimal /test_bench/hemps/slave25/credit_o(1)
add wave  -group {slave 14 - 25} -group {router 14 input OESTE} -radix hexadecimal /test_bench/hemps/slave25/data_in(1)
add wave  -group {slave 14 - 25} -group {router 14 input NORTE} -radix hexadecimal /test_bench/hemps/slave25/rx(2)
add wave  -group {slave 14 - 25} -group {router 14 input NORTE} -radix hexadecimal /test_bench/hemps/slave25/credit_o(2)
add wave  -group {slave 14 - 25} -group {router 14 input NORTE} -radix hexadecimal /test_bench/hemps/slave25/data_in(2)
add wave  -group {slave 14 - 25} -group {router 14 input SUL} -radix hexadecimal /test_bench/hemps/slave25/rx(3)
add wave  -group {slave 14 - 25} -group {router 14 input SUL} -radix hexadecimal /test_bench/hemps/slave25/credit_o(3)
add wave  -group {slave 14 - 25} -group {router 14 input SUL} -radix hexadecimal /test_bench/hemps/slave25/data_in(3)
add wave  -group {slave 24 - 26} /test_bench/hemps/slave26/clock
add wave  -group {slave 24 - 26} -group {ni 24} -radix hexadecimal /test_bench/hemps/slave26/tx_ni
add wave  -group {slave 24 - 26} -group {ni 24} -radix hexadecimal /test_bench/hemps/slave26/credit_i_ni
add wave  -group {slave 24 - 26} -group {ni 24} -radix hexadecimal /test_bench/hemps/slave26/data_out_ni
add wave  -group {slave 24 - 26} -radix hexadecimal /test_bench/hemps/slave26/rx_ni
add wave  -group {slave 24 - 26} -radix hexadecimal /test_bench/hemps/slave26/credit_o_ni
add wave  -group {slave 24 - 26} -radix hexadecimal /test_bench/hemps/slave26/data_in_ni
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/operation
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/set_address
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/set_address_2
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/set_size
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/set_size_2
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/set_op
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/start
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/size
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/size_2
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/address
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/address_2
add wave  -group {slave 24 - 26} -group {dmni 24} -group {config 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/config_data
add wave  -group {slave 24 - 26} -group {dmni 24} -group {arb 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/ARB
add wave  -group {slave 24 - 26} -group {dmni 24} -group {arb 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/prio
add wave  -group {slave 24 - 26} -group {dmni 24} -group {arb 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/timer
add wave  -group {slave 24 - 26} -group {dmni 24} -group {arb 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/write_enable
add wave  -group {slave 24 - 26} -group {dmni 24} -group {arb 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/read_enable
add wave  -group {slave 24 - 26} -group {dmni 24} -group {send 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/DMNI_Send
add wave  -group {slave 24 - 26} -group {dmni 24} -group {send 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/send_address
add wave  -group {slave 24 - 26} -group {dmni 24} -group {send 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/mem_data_read
add wave  -group {slave 24 - 26} -group {dmni 24} -group {send 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/send_size
add wave  -group {slave 24 - 26} -group {dmni 24} -group {send 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/send_address_2
add wave  -group {slave 24 - 26} -group {dmni 24} -group {send 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/send_size_2
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/DMNI_Receive
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/recv_address
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/mem_data_write
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/recv_size
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/mem_byte_we
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive NoC 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/intr
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive NoC 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/intr_count
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive NoC 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/SR
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive NoC 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/payload_size
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive NoC 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/read_av
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive NoC 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/slot_available
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive NoC 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/first
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive NoC 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/last
add wave  -group {slave 24 - 26} -group {dmni 24} -group {receive NoC 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/add_buffer
add wave  -group {slave 24 - 26} -group {dmni 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/mem_address
add wave  -group {slave 24 - 26} -group {dmni 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/is_header
add wave  -group {slave 24 - 26} -group {dmni 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/send_active
add wave  -group {slave 24 - 26} -group {dmni 24} -radix hexadecimal /test_bench/hemps/slave26/dmni/receive_active
add wave  -group {slave 24 - 26} -group {proc 24} -radix hexadecimal /test_bench/hemps/slave26/current_page
add wave  -group {slave 24 - 26} -group {proc 24} -radix hexadecimal /test_bench/hemps/slave26/cpu_mem_address
add wave  -group {slave 24 - 26} -group {proc 24} -radix hexadecimal /test_bench/hemps/slave26/write_enable
add wave  -group {slave 24 - 26} -group {proc 24} -radix hexadecimal /test_bench/hemps/slave26/pending_service
add wave  -group {slave 24 - 26} -group {proc 24} -radix hexadecimal /test_bench/hemps/slave26/irq_status
add wave  -group {slave 24 - 26} -group {router 24 input LESTE} -radix hexadecimal /test_bench/hemps/slave26/rx(0)
add wave  -group {slave 24 - 26} -group {router 24 input LESTE} -radix hexadecimal /test_bench/hemps/slave26/credit_o(0)
add wave  -group {slave 24 - 26} -group {router 24 input LESTE} -radix hexadecimal /test_bench/hemps/slave26/data_in(0)
add wave  -group {slave 24 - 26} -group {router 24 input OESTE} -radix hexadecimal /test_bench/hemps/slave26/rx(1)
add wave  -group {slave 24 - 26} -group {router 24 input OESTE} -radix hexadecimal /test_bench/hemps/slave26/credit_o(1)
add wave  -group {slave 24 - 26} -group {router 24 input OESTE} -radix hexadecimal /test_bench/hemps/slave26/data_in(1)
add wave  -group {slave 24 - 26} -group {router 24 input NORTE} -radix hexadecimal /test_bench/hemps/slave26/rx(2)
add wave  -group {slave 24 - 26} -group {router 24 input NORTE} -radix hexadecimal /test_bench/hemps/slave26/credit_o(2)
add wave  -group {slave 24 - 26} -group {router 24 input NORTE} -radix hexadecimal /test_bench/hemps/slave26/data_in(2)
add wave  -group {slave 24 - 26} -group {router 24 input SUL} -radix hexadecimal /test_bench/hemps/slave26/rx(3)
add wave  -group {slave 24 - 26} -group {router 24 input SUL} -radix hexadecimal /test_bench/hemps/slave26/credit_o(3)
add wave  -group {slave 24 - 26} -group {router 24 input SUL} -radix hexadecimal /test_bench/hemps/slave26/data_in(3)
add wave  -group {slave 34 - 27} /test_bench/hemps/slave27/clock
add wave  -group {slave 34 - 27} -group {ni 34} -radix hexadecimal /test_bench/hemps/slave27/tx_ni
add wave  -group {slave 34 - 27} -group {ni 34} -radix hexadecimal /test_bench/hemps/slave27/credit_i_ni
add wave  -group {slave 34 - 27} -group {ni 34} -radix hexadecimal /test_bench/hemps/slave27/data_out_ni
add wave  -group {slave 34 - 27} -radix hexadecimal /test_bench/hemps/slave27/rx_ni
add wave  -group {slave 34 - 27} -radix hexadecimal /test_bench/hemps/slave27/credit_o_ni
add wave  -group {slave 34 - 27} -radix hexadecimal /test_bench/hemps/slave27/data_in_ni
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/operation
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/set_address
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/set_address_2
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/set_size
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/set_size_2
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/set_op
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/start
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/size
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/size_2
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/address
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/address_2
add wave  -group {slave 34 - 27} -group {dmni 34} -group {config 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/config_data
add wave  -group {slave 34 - 27} -group {dmni 34} -group {arb 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/ARB
add wave  -group {slave 34 - 27} -group {dmni 34} -group {arb 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/prio
add wave  -group {slave 34 - 27} -group {dmni 34} -group {arb 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/timer
add wave  -group {slave 34 - 27} -group {dmni 34} -group {arb 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/write_enable
add wave  -group {slave 34 - 27} -group {dmni 34} -group {arb 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/read_enable
add wave  -group {slave 34 - 27} -group {dmni 34} -group {send 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/DMNI_Send
add wave  -group {slave 34 - 27} -group {dmni 34} -group {send 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/send_address
add wave  -group {slave 34 - 27} -group {dmni 34} -group {send 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/mem_data_read
add wave  -group {slave 34 - 27} -group {dmni 34} -group {send 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/send_size
add wave  -group {slave 34 - 27} -group {dmni 34} -group {send 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/send_address_2
add wave  -group {slave 34 - 27} -group {dmni 34} -group {send 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/send_size_2
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/DMNI_Receive
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/recv_address
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/mem_data_write
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/recv_size
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/mem_byte_we
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive NoC 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/intr
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive NoC 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/intr_count
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive NoC 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/SR
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive NoC 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/payload_size
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive NoC 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/read_av
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive NoC 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/slot_available
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive NoC 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/first
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive NoC 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/last
add wave  -group {slave 34 - 27} -group {dmni 34} -group {receive NoC 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/add_buffer
add wave  -group {slave 34 - 27} -group {dmni 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/mem_address
add wave  -group {slave 34 - 27} -group {dmni 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/is_header
add wave  -group {slave 34 - 27} -group {dmni 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/send_active
add wave  -group {slave 34 - 27} -group {dmni 34} -radix hexadecimal /test_bench/hemps/slave27/dmni/receive_active
add wave  -group {slave 34 - 27} -group {proc 34} -radix hexadecimal /test_bench/hemps/slave27/current_page
add wave  -group {slave 34 - 27} -group {proc 34} -radix hexadecimal /test_bench/hemps/slave27/cpu_mem_address
add wave  -group {slave 34 - 27} -group {proc 34} -radix hexadecimal /test_bench/hemps/slave27/write_enable
add wave  -group {slave 34 - 27} -group {proc 34} -radix hexadecimal /test_bench/hemps/slave27/pending_service
add wave  -group {slave 34 - 27} -group {proc 34} -radix hexadecimal /test_bench/hemps/slave27/irq_status
add wave  -group {slave 34 - 27} -group {router 34 input LESTE} -radix hexadecimal /test_bench/hemps/slave27/rx(0)
add wave  -group {slave 34 - 27} -group {router 34 input LESTE} -radix hexadecimal /test_bench/hemps/slave27/credit_o(0)
add wave  -group {slave 34 - 27} -group {router 34 input LESTE} -radix hexadecimal /test_bench/hemps/slave27/data_in(0)
add wave  -group {slave 34 - 27} -group {router 34 input OESTE} -radix hexadecimal /test_bench/hemps/slave27/rx(1)
add wave  -group {slave 34 - 27} -group {router 34 input OESTE} -radix hexadecimal /test_bench/hemps/slave27/credit_o(1)
add wave  -group {slave 34 - 27} -group {router 34 input OESTE} -radix hexadecimal /test_bench/hemps/slave27/data_in(1)
add wave  -group {slave 34 - 27} -group {router 34 input NORTE} -radix hexadecimal /test_bench/hemps/slave27/rx(2)
add wave  -group {slave 34 - 27} -group {router 34 input NORTE} -radix hexadecimal /test_bench/hemps/slave27/credit_o(2)
add wave  -group {slave 34 - 27} -group {router 34 input NORTE} -radix hexadecimal /test_bench/hemps/slave27/data_in(2)
add wave  -group {slave 34 - 27} -group {router 34 input SUL} -radix hexadecimal /test_bench/hemps/slave27/rx(3)
add wave  -group {slave 34 - 27} -group {router 34 input SUL} -radix hexadecimal /test_bench/hemps/slave27/credit_o(3)
add wave  -group {slave 34 - 27} -group {router 34 input SUL} -radix hexadecimal /test_bench/hemps/slave27/data_in(3)
add wave  -group {slave 44 - 28} /test_bench/hemps/slave28/clock
add wave  -group {slave 44 - 28} -group {ni 44} -radix hexadecimal /test_bench/hemps/slave28/tx_ni
add wave  -group {slave 44 - 28} -group {ni 44} -radix hexadecimal /test_bench/hemps/slave28/credit_i_ni
add wave  -group {slave 44 - 28} -group {ni 44} -radix hexadecimal /test_bench/hemps/slave28/data_out_ni
add wave  -group {slave 44 - 28} -radix hexadecimal /test_bench/hemps/slave28/rx_ni
add wave  -group {slave 44 - 28} -radix hexadecimal /test_bench/hemps/slave28/credit_o_ni
add wave  -group {slave 44 - 28} -radix hexadecimal /test_bench/hemps/slave28/data_in_ni
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/operation
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/set_address
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/set_address_2
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/set_size
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/set_size_2
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/set_op
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/start
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/size
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/size_2
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/address
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/address_2
add wave  -group {slave 44 - 28} -group {dmni 44} -group {config 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/config_data
add wave  -group {slave 44 - 28} -group {dmni 44} -group {arb 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/ARB
add wave  -group {slave 44 - 28} -group {dmni 44} -group {arb 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/prio
add wave  -group {slave 44 - 28} -group {dmni 44} -group {arb 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/timer
add wave  -group {slave 44 - 28} -group {dmni 44} -group {arb 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/write_enable
add wave  -group {slave 44 - 28} -group {dmni 44} -group {arb 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/read_enable
add wave  -group {slave 44 - 28} -group {dmni 44} -group {send 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/DMNI_Send
add wave  -group {slave 44 - 28} -group {dmni 44} -group {send 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/send_address
add wave  -group {slave 44 - 28} -group {dmni 44} -group {send 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/mem_data_read
add wave  -group {slave 44 - 28} -group {dmni 44} -group {send 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/send_size
add wave  -group {slave 44 - 28} -group {dmni 44} -group {send 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/send_address_2
add wave  -group {slave 44 - 28} -group {dmni 44} -group {send 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/send_size_2
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/DMNI_Receive
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/recv_address
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/mem_data_write
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/recv_size
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/mem_byte_we
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive NoC 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/intr
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive NoC 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/intr_count
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive NoC 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/SR
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive NoC 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/payload_size
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive NoC 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/read_av
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive NoC 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/slot_available
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive NoC 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/first
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive NoC 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/last
add wave  -group {slave 44 - 28} -group {dmni 44} -group {receive NoC 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/add_buffer
add wave  -group {slave 44 - 28} -group {dmni 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/mem_address
add wave  -group {slave 44 - 28} -group {dmni 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/is_header
add wave  -group {slave 44 - 28} -group {dmni 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/send_active
add wave  -group {slave 44 - 28} -group {dmni 44} -radix hexadecimal /test_bench/hemps/slave28/dmni/receive_active
add wave  -group {slave 44 - 28} -group {proc 44} -radix hexadecimal /test_bench/hemps/slave28/current_page
add wave  -group {slave 44 - 28} -group {proc 44} -radix hexadecimal /test_bench/hemps/slave28/cpu_mem_address
add wave  -group {slave 44 - 28} -group {proc 44} -radix hexadecimal /test_bench/hemps/slave28/write_enable
add wave  -group {slave 44 - 28} -group {proc 44} -radix hexadecimal /test_bench/hemps/slave28/pending_service
add wave  -group {slave 44 - 28} -group {proc 44} -radix hexadecimal /test_bench/hemps/slave28/irq_status
add wave  -group {slave 44 - 28} -group {router 44 input LESTE} -radix hexadecimal /test_bench/hemps/slave28/rx(0)
add wave  -group {slave 44 - 28} -group {router 44 input LESTE} -radix hexadecimal /test_bench/hemps/slave28/credit_o(0)
add wave  -group {slave 44 - 28} -group {router 44 input LESTE} -radix hexadecimal /test_bench/hemps/slave28/data_in(0)
add wave  -group {slave 44 - 28} -group {router 44 input OESTE} -radix hexadecimal /test_bench/hemps/slave28/rx(1)
add wave  -group {slave 44 - 28} -group {router 44 input OESTE} -radix hexadecimal /test_bench/hemps/slave28/credit_o(1)
add wave  -group {slave 44 - 28} -group {router 44 input OESTE} -radix hexadecimal /test_bench/hemps/slave28/data_in(1)
add wave  -group {slave 44 - 28} -group {router 44 input NORTE} -radix hexadecimal /test_bench/hemps/slave28/rx(2)
add wave  -group {slave 44 - 28} -group {router 44 input NORTE} -radix hexadecimal /test_bench/hemps/slave28/credit_o(2)
add wave  -group {slave 44 - 28} -group {router 44 input NORTE} -radix hexadecimal /test_bench/hemps/slave28/data_in(2)
add wave  -group {slave 44 - 28} -group {router 44 input SUL} -radix hexadecimal /test_bench/hemps/slave28/rx(3)
add wave  -group {slave 44 - 28} -group {router 44 input SUL} -radix hexadecimal /test_bench/hemps/slave28/credit_o(3)
add wave  -group {slave 44 - 28} -group {router 44 input SUL} -radix hexadecimal /test_bench/hemps/slave28/data_in(3)
add wave  -group {slave 54 - 29} /test_bench/hemps/slave29/clock
add wave  -group {slave 54 - 29} -group {ni 54} -radix hexadecimal /test_bench/hemps/slave29/tx_ni
add wave  -group {slave 54 - 29} -group {ni 54} -radix hexadecimal /test_bench/hemps/slave29/credit_i_ni
add wave  -group {slave 54 - 29} -group {ni 54} -radix hexadecimal /test_bench/hemps/slave29/data_out_ni
add wave  -group {slave 54 - 29} -radix hexadecimal /test_bench/hemps/slave29/rx_ni
add wave  -group {slave 54 - 29} -radix hexadecimal /test_bench/hemps/slave29/credit_o_ni
add wave  -group {slave 54 - 29} -radix hexadecimal /test_bench/hemps/slave29/data_in_ni
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/operation
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/set_address
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/set_address_2
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/set_size
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/set_size_2
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/set_op
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/start
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/size
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/size_2
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/address
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/address_2
add wave  -group {slave 54 - 29} -group {dmni 54} -group {config 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/config_data
add wave  -group {slave 54 - 29} -group {dmni 54} -group {arb 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/ARB
add wave  -group {slave 54 - 29} -group {dmni 54} -group {arb 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/prio
add wave  -group {slave 54 - 29} -group {dmni 54} -group {arb 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/timer
add wave  -group {slave 54 - 29} -group {dmni 54} -group {arb 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/write_enable
add wave  -group {slave 54 - 29} -group {dmni 54} -group {arb 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/read_enable
add wave  -group {slave 54 - 29} -group {dmni 54} -group {send 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/DMNI_Send
add wave  -group {slave 54 - 29} -group {dmni 54} -group {send 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/send_address
add wave  -group {slave 54 - 29} -group {dmni 54} -group {send 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/mem_data_read
add wave  -group {slave 54 - 29} -group {dmni 54} -group {send 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/send_size
add wave  -group {slave 54 - 29} -group {dmni 54} -group {send 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/send_address_2
add wave  -group {slave 54 - 29} -group {dmni 54} -group {send 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/send_size_2
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/DMNI_Receive
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/recv_address
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/mem_data_write
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/recv_size
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/mem_byte_we
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive NoC 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/intr
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive NoC 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/intr_count
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive NoC 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/SR
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive NoC 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/payload_size
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive NoC 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/read_av
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive NoC 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/slot_available
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive NoC 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/first
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive NoC 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/last
add wave  -group {slave 54 - 29} -group {dmni 54} -group {receive NoC 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/add_buffer
add wave  -group {slave 54 - 29} -group {dmni 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/mem_address
add wave  -group {slave 54 - 29} -group {dmni 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/is_header
add wave  -group {slave 54 - 29} -group {dmni 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/send_active
add wave  -group {slave 54 - 29} -group {dmni 54} -radix hexadecimal /test_bench/hemps/slave29/dmni/receive_active
add wave  -group {slave 54 - 29} -group {proc 54} -radix hexadecimal /test_bench/hemps/slave29/current_page
add wave  -group {slave 54 - 29} -group {proc 54} -radix hexadecimal /test_bench/hemps/slave29/cpu_mem_address
add wave  -group {slave 54 - 29} -group {proc 54} -radix hexadecimal /test_bench/hemps/slave29/write_enable
add wave  -group {slave 54 - 29} -group {proc 54} -radix hexadecimal /test_bench/hemps/slave29/pending_service
add wave  -group {slave 54 - 29} -group {proc 54} -radix hexadecimal /test_bench/hemps/slave29/irq_status
add wave  -group {slave 54 - 29} -group {router 54 input LESTE} -radix hexadecimal /test_bench/hemps/slave29/rx(0)
add wave  -group {slave 54 - 29} -group {router 54 input LESTE} -radix hexadecimal /test_bench/hemps/slave29/credit_o(0)
add wave  -group {slave 54 - 29} -group {router 54 input LESTE} -radix hexadecimal /test_bench/hemps/slave29/data_in(0)
add wave  -group {slave 54 - 29} -group {router 54 input OESTE} -radix hexadecimal /test_bench/hemps/slave29/rx(1)
add wave  -group {slave 54 - 29} -group {router 54 input OESTE} -radix hexadecimal /test_bench/hemps/slave29/credit_o(1)
add wave  -group {slave 54 - 29} -group {router 54 input OESTE} -radix hexadecimal /test_bench/hemps/slave29/data_in(1)
add wave  -group {slave 54 - 29} -group {router 54 input NORTE} -radix hexadecimal /test_bench/hemps/slave29/rx(2)
add wave  -group {slave 54 - 29} -group {router 54 input NORTE} -radix hexadecimal /test_bench/hemps/slave29/credit_o(2)
add wave  -group {slave 54 - 29} -group {router 54 input NORTE} -radix hexadecimal /test_bench/hemps/slave29/data_in(2)
add wave  -group {slave 54 - 29} -group {router 54 input SUL} -radix hexadecimal /test_bench/hemps/slave29/rx(3)
add wave  -group {slave 54 - 29} -group {router 54 input SUL} -radix hexadecimal /test_bench/hemps/slave29/credit_o(3)
add wave  -group {slave 54 - 29} -group {router 54 input SUL} -radix hexadecimal /test_bench/hemps/slave29/data_in(3)
add wave  -group {slave 05 - 30} /test_bench/hemps/slave30/clock
add wave  -group {slave 05 - 30} -group {ni 05} -radix hexadecimal /test_bench/hemps/slave30/tx_ni
add wave  -group {slave 05 - 30} -group {ni 05} -radix hexadecimal /test_bench/hemps/slave30/credit_i_ni
add wave  -group {slave 05 - 30} -group {ni 05} -radix hexadecimal /test_bench/hemps/slave30/data_out_ni
add wave  -group {slave 05 - 30} -radix hexadecimal /test_bench/hemps/slave30/rx_ni
add wave  -group {slave 05 - 30} -radix hexadecimal /test_bench/hemps/slave30/credit_o_ni
add wave  -group {slave 05 - 30} -radix hexadecimal /test_bench/hemps/slave30/data_in_ni
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/operation
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/set_address
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/set_address_2
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/set_size
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/set_size_2
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/set_op
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/start
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/size
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/size_2
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/address
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/address_2
add wave  -group {slave 05 - 30} -group {dmni 05} -group {config 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/config_data
add wave  -group {slave 05 - 30} -group {dmni 05} -group {arb 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/ARB
add wave  -group {slave 05 - 30} -group {dmni 05} -group {arb 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/prio
add wave  -group {slave 05 - 30} -group {dmni 05} -group {arb 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/timer
add wave  -group {slave 05 - 30} -group {dmni 05} -group {arb 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/write_enable
add wave  -group {slave 05 - 30} -group {dmni 05} -group {arb 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/read_enable
add wave  -group {slave 05 - 30} -group {dmni 05} -group {send 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/DMNI_Send
add wave  -group {slave 05 - 30} -group {dmni 05} -group {send 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/send_address
add wave  -group {slave 05 - 30} -group {dmni 05} -group {send 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/mem_data_read
add wave  -group {slave 05 - 30} -group {dmni 05} -group {send 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/send_size
add wave  -group {slave 05 - 30} -group {dmni 05} -group {send 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/send_address_2
add wave  -group {slave 05 - 30} -group {dmni 05} -group {send 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/send_size_2
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/DMNI_Receive
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/recv_address
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/mem_data_write
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/recv_size
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/mem_byte_we
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive NoC 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/intr
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive NoC 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/intr_count
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive NoC 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/SR
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive NoC 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/payload_size
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive NoC 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/read_av
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive NoC 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/slot_available
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive NoC 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/first
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive NoC 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/last
add wave  -group {slave 05 - 30} -group {dmni 05} -group {receive NoC 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/add_buffer
add wave  -group {slave 05 - 30} -group {dmni 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/mem_address
add wave  -group {slave 05 - 30} -group {dmni 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/is_header
add wave  -group {slave 05 - 30} -group {dmni 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/send_active
add wave  -group {slave 05 - 30} -group {dmni 05} -radix hexadecimal /test_bench/hemps/slave30/dmni/receive_active
add wave  -group {slave 05 - 30} -group {proc 05} -radix hexadecimal /test_bench/hemps/slave30/current_page
add wave  -group {slave 05 - 30} -group {proc 05} -radix hexadecimal /test_bench/hemps/slave30/cpu_mem_address
add wave  -group {slave 05 - 30} -group {proc 05} -radix hexadecimal /test_bench/hemps/slave30/write_enable
add wave  -group {slave 05 - 30} -group {proc 05} -radix hexadecimal /test_bench/hemps/slave30/pending_service
add wave  -group {slave 05 - 30} -group {proc 05} -radix hexadecimal /test_bench/hemps/slave30/irq_status
add wave  -group {slave 05 - 30} -group {router 05 input LESTE} -radix hexadecimal /test_bench/hemps/slave30/rx(0)
add wave  -group {slave 05 - 30} -group {router 05 input LESTE} -radix hexadecimal /test_bench/hemps/slave30/credit_o(0)
add wave  -group {slave 05 - 30} -group {router 05 input LESTE} -radix hexadecimal /test_bench/hemps/slave30/data_in(0)
add wave  -group {slave 05 - 30} -group {router 05 input OESTE} -radix hexadecimal /test_bench/hemps/slave30/rx(1)
add wave  -group {slave 05 - 30} -group {router 05 input OESTE} -radix hexadecimal /test_bench/hemps/slave30/credit_o(1)
add wave  -group {slave 05 - 30} -group {router 05 input OESTE} -radix hexadecimal /test_bench/hemps/slave30/data_in(1)
add wave  -group {slave 05 - 30} -group {router 05 input NORTE} -radix hexadecimal /test_bench/hemps/slave30/rx(2)
add wave  -group {slave 05 - 30} -group {router 05 input NORTE} -radix hexadecimal /test_bench/hemps/slave30/credit_o(2)
add wave  -group {slave 05 - 30} -group {router 05 input NORTE} -radix hexadecimal /test_bench/hemps/slave30/data_in(2)
add wave  -group {slave 05 - 30} -group {router 05 input SUL} -radix hexadecimal /test_bench/hemps/slave30/rx(3)
add wave  -group {slave 05 - 30} -group {router 05 input SUL} -radix hexadecimal /test_bench/hemps/slave30/credit_o(3)
add wave  -group {slave 05 - 30} -group {router 05 input SUL} -radix hexadecimal /test_bench/hemps/slave30/data_in(3)
add wave  -group {slave 15 - 31} /test_bench/hemps/slave31/clock
add wave  -group {slave 15 - 31} -group {ni 15} -radix hexadecimal /test_bench/hemps/slave31/tx_ni
add wave  -group {slave 15 - 31} -group {ni 15} -radix hexadecimal /test_bench/hemps/slave31/credit_i_ni
add wave  -group {slave 15 - 31} -group {ni 15} -radix hexadecimal /test_bench/hemps/slave31/data_out_ni
add wave  -group {slave 15 - 31} -radix hexadecimal /test_bench/hemps/slave31/rx_ni
add wave  -group {slave 15 - 31} -radix hexadecimal /test_bench/hemps/slave31/credit_o_ni
add wave  -group {slave 15 - 31} -radix hexadecimal /test_bench/hemps/slave31/data_in_ni
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/operation
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/set_address
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/set_address_2
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/set_size
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/set_size_2
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/set_op
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/start
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/size
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/size_2
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/address
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/address_2
add wave  -group {slave 15 - 31} -group {dmni 15} -group {config 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/config_data
add wave  -group {slave 15 - 31} -group {dmni 15} -group {arb 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/ARB
add wave  -group {slave 15 - 31} -group {dmni 15} -group {arb 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/prio
add wave  -group {slave 15 - 31} -group {dmni 15} -group {arb 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/timer
add wave  -group {slave 15 - 31} -group {dmni 15} -group {arb 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/write_enable
add wave  -group {slave 15 - 31} -group {dmni 15} -group {arb 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/read_enable
add wave  -group {slave 15 - 31} -group {dmni 15} -group {send 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/DMNI_Send
add wave  -group {slave 15 - 31} -group {dmni 15} -group {send 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/send_address
add wave  -group {slave 15 - 31} -group {dmni 15} -group {send 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/mem_data_read
add wave  -group {slave 15 - 31} -group {dmni 15} -group {send 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/send_size
add wave  -group {slave 15 - 31} -group {dmni 15} -group {send 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/send_address_2
add wave  -group {slave 15 - 31} -group {dmni 15} -group {send 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/send_size_2
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/DMNI_Receive
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/recv_address
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/mem_data_write
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/recv_size
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/mem_byte_we
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive NoC 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/intr
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive NoC 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/intr_count
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive NoC 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/SR
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive NoC 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/payload_size
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive NoC 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/read_av
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive NoC 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/slot_available
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive NoC 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/first
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive NoC 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/last
add wave  -group {slave 15 - 31} -group {dmni 15} -group {receive NoC 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/add_buffer
add wave  -group {slave 15 - 31} -group {dmni 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/mem_address
add wave  -group {slave 15 - 31} -group {dmni 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/is_header
add wave  -group {slave 15 - 31} -group {dmni 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/send_active
add wave  -group {slave 15 - 31} -group {dmni 15} -radix hexadecimal /test_bench/hemps/slave31/dmni/receive_active
add wave  -group {slave 15 - 31} -group {proc 15} -radix hexadecimal /test_bench/hemps/slave31/current_page
add wave  -group {slave 15 - 31} -group {proc 15} -radix hexadecimal /test_bench/hemps/slave31/cpu_mem_address
add wave  -group {slave 15 - 31} -group {proc 15} -radix hexadecimal /test_bench/hemps/slave31/write_enable
add wave  -group {slave 15 - 31} -group {proc 15} -radix hexadecimal /test_bench/hemps/slave31/pending_service
add wave  -group {slave 15 - 31} -group {proc 15} -radix hexadecimal /test_bench/hemps/slave31/irq_status
add wave  -group {slave 15 - 31} -group {router 15 input LESTE} -radix hexadecimal /test_bench/hemps/slave31/rx(0)
add wave  -group {slave 15 - 31} -group {router 15 input LESTE} -radix hexadecimal /test_bench/hemps/slave31/credit_o(0)
add wave  -group {slave 15 - 31} -group {router 15 input LESTE} -radix hexadecimal /test_bench/hemps/slave31/data_in(0)
add wave  -group {slave 15 - 31} -group {router 15 input OESTE} -radix hexadecimal /test_bench/hemps/slave31/rx(1)
add wave  -group {slave 15 - 31} -group {router 15 input OESTE} -radix hexadecimal /test_bench/hemps/slave31/credit_o(1)
add wave  -group {slave 15 - 31} -group {router 15 input OESTE} -radix hexadecimal /test_bench/hemps/slave31/data_in(1)
add wave  -group {slave 15 - 31} -group {router 15 input NORTE} -radix hexadecimal /test_bench/hemps/slave31/rx(2)
add wave  -group {slave 15 - 31} -group {router 15 input NORTE} -radix hexadecimal /test_bench/hemps/slave31/credit_o(2)
add wave  -group {slave 15 - 31} -group {router 15 input NORTE} -radix hexadecimal /test_bench/hemps/slave31/data_in(2)
add wave  -group {slave 15 - 31} -group {router 15 input SUL} -radix hexadecimal /test_bench/hemps/slave31/rx(3)
add wave  -group {slave 15 - 31} -group {router 15 input SUL} -radix hexadecimal /test_bench/hemps/slave31/credit_o(3)
add wave  -group {slave 15 - 31} -group {router 15 input SUL} -radix hexadecimal /test_bench/hemps/slave31/data_in(3)
add wave  -group {slave 25 - 32} /test_bench/hemps/slave32/clock
add wave  -group {slave 25 - 32} -group {ni 25} -radix hexadecimal /test_bench/hemps/slave32/tx_ni
add wave  -group {slave 25 - 32} -group {ni 25} -radix hexadecimal /test_bench/hemps/slave32/credit_i_ni
add wave  -group {slave 25 - 32} -group {ni 25} -radix hexadecimal /test_bench/hemps/slave32/data_out_ni
add wave  -group {slave 25 - 32} -radix hexadecimal /test_bench/hemps/slave32/rx_ni
add wave  -group {slave 25 - 32} -radix hexadecimal /test_bench/hemps/slave32/credit_o_ni
add wave  -group {slave 25 - 32} -radix hexadecimal /test_bench/hemps/slave32/data_in_ni
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/operation
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/set_address
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/set_address_2
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/set_size
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/set_size_2
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/set_op
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/start
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/size
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/size_2
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/address
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/address_2
add wave  -group {slave 25 - 32} -group {dmni 25} -group {config 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/config_data
add wave  -group {slave 25 - 32} -group {dmni 25} -group {arb 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/ARB
add wave  -group {slave 25 - 32} -group {dmni 25} -group {arb 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/prio
add wave  -group {slave 25 - 32} -group {dmni 25} -group {arb 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/timer
add wave  -group {slave 25 - 32} -group {dmni 25} -group {arb 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/write_enable
add wave  -group {slave 25 - 32} -group {dmni 25} -group {arb 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/read_enable
add wave  -group {slave 25 - 32} -group {dmni 25} -group {send 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/DMNI_Send
add wave  -group {slave 25 - 32} -group {dmni 25} -group {send 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/send_address
add wave  -group {slave 25 - 32} -group {dmni 25} -group {send 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/mem_data_read
add wave  -group {slave 25 - 32} -group {dmni 25} -group {send 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/send_size
add wave  -group {slave 25 - 32} -group {dmni 25} -group {send 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/send_address_2
add wave  -group {slave 25 - 32} -group {dmni 25} -group {send 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/send_size_2
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/DMNI_Receive
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/recv_address
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/mem_data_write
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/recv_size
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/mem_byte_we
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive NoC 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/intr
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive NoC 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/intr_count
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive NoC 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/SR
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive NoC 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/payload_size
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive NoC 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/read_av
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive NoC 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/slot_available
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive NoC 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/first
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive NoC 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/last
add wave  -group {slave 25 - 32} -group {dmni 25} -group {receive NoC 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/add_buffer
add wave  -group {slave 25 - 32} -group {dmni 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/mem_address
add wave  -group {slave 25 - 32} -group {dmni 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/is_header
add wave  -group {slave 25 - 32} -group {dmni 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/send_active
add wave  -group {slave 25 - 32} -group {dmni 25} -radix hexadecimal /test_bench/hemps/slave32/dmni/receive_active
add wave  -group {slave 25 - 32} -group {proc 25} -radix hexadecimal /test_bench/hemps/slave32/current_page
add wave  -group {slave 25 - 32} -group {proc 25} -radix hexadecimal /test_bench/hemps/slave32/cpu_mem_address
add wave  -group {slave 25 - 32} -group {proc 25} -radix hexadecimal /test_bench/hemps/slave32/write_enable
add wave  -group {slave 25 - 32} -group {proc 25} -radix hexadecimal /test_bench/hemps/slave32/pending_service
add wave  -group {slave 25 - 32} -group {proc 25} -radix hexadecimal /test_bench/hemps/slave32/irq_status
add wave  -group {slave 25 - 32} -group {router 25 input LESTE} -radix hexadecimal /test_bench/hemps/slave32/rx(0)
add wave  -group {slave 25 - 32} -group {router 25 input LESTE} -radix hexadecimal /test_bench/hemps/slave32/credit_o(0)
add wave  -group {slave 25 - 32} -group {router 25 input LESTE} -radix hexadecimal /test_bench/hemps/slave32/data_in(0)
add wave  -group {slave 25 - 32} -group {router 25 input OESTE} -radix hexadecimal /test_bench/hemps/slave32/rx(1)
add wave  -group {slave 25 - 32} -group {router 25 input OESTE} -radix hexadecimal /test_bench/hemps/slave32/credit_o(1)
add wave  -group {slave 25 - 32} -group {router 25 input OESTE} -radix hexadecimal /test_bench/hemps/slave32/data_in(1)
add wave  -group {slave 25 - 32} -group {router 25 input NORTE} -radix hexadecimal /test_bench/hemps/slave32/rx(2)
add wave  -group {slave 25 - 32} -group {router 25 input NORTE} -radix hexadecimal /test_bench/hemps/slave32/credit_o(2)
add wave  -group {slave 25 - 32} -group {router 25 input NORTE} -radix hexadecimal /test_bench/hemps/slave32/data_in(2)
add wave  -group {slave 25 - 32} -group {router 25 input SUL} -radix hexadecimal /test_bench/hemps/slave32/rx(3)
add wave  -group {slave 25 - 32} -group {router 25 input SUL} -radix hexadecimal /test_bench/hemps/slave32/credit_o(3)
add wave  -group {slave 25 - 32} -group {router 25 input SUL} -radix hexadecimal /test_bench/hemps/slave32/data_in(3)
add wave  -group {slave 35 - 33} /test_bench/hemps/slave33/clock
add wave  -group {slave 35 - 33} -group {ni 35} -radix hexadecimal /test_bench/hemps/slave33/tx_ni
add wave  -group {slave 35 - 33} -group {ni 35} -radix hexadecimal /test_bench/hemps/slave33/credit_i_ni
add wave  -group {slave 35 - 33} -group {ni 35} -radix hexadecimal /test_bench/hemps/slave33/data_out_ni
add wave  -group {slave 35 - 33} -radix hexadecimal /test_bench/hemps/slave33/rx_ni
add wave  -group {slave 35 - 33} -radix hexadecimal /test_bench/hemps/slave33/credit_o_ni
add wave  -group {slave 35 - 33} -radix hexadecimal /test_bench/hemps/slave33/data_in_ni
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/operation
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/set_address
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/set_address_2
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/set_size
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/set_size_2
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/set_op
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/start
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/size
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/size_2
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/address
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/address_2
add wave  -group {slave 35 - 33} -group {dmni 35} -group {config 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/config_data
add wave  -group {slave 35 - 33} -group {dmni 35} -group {arb 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/ARB
add wave  -group {slave 35 - 33} -group {dmni 35} -group {arb 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/prio
add wave  -group {slave 35 - 33} -group {dmni 35} -group {arb 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/timer
add wave  -group {slave 35 - 33} -group {dmni 35} -group {arb 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/write_enable
add wave  -group {slave 35 - 33} -group {dmni 35} -group {arb 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/read_enable
add wave  -group {slave 35 - 33} -group {dmni 35} -group {send 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/DMNI_Send
add wave  -group {slave 35 - 33} -group {dmni 35} -group {send 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/send_address
add wave  -group {slave 35 - 33} -group {dmni 35} -group {send 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/mem_data_read
add wave  -group {slave 35 - 33} -group {dmni 35} -group {send 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/send_size
add wave  -group {slave 35 - 33} -group {dmni 35} -group {send 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/send_address_2
add wave  -group {slave 35 - 33} -group {dmni 35} -group {send 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/send_size_2
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/DMNI_Receive
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/recv_address
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/mem_data_write
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/recv_size
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/mem_byte_we
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive NoC 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/intr
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive NoC 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/intr_count
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive NoC 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/SR
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive NoC 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/payload_size
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive NoC 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/read_av
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive NoC 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/slot_available
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive NoC 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/first
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive NoC 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/last
add wave  -group {slave 35 - 33} -group {dmni 35} -group {receive NoC 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/add_buffer
add wave  -group {slave 35 - 33} -group {dmni 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/mem_address
add wave  -group {slave 35 - 33} -group {dmni 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/is_header
add wave  -group {slave 35 - 33} -group {dmni 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/send_active
add wave  -group {slave 35 - 33} -group {dmni 35} -radix hexadecimal /test_bench/hemps/slave33/dmni/receive_active
add wave  -group {slave 35 - 33} -group {proc 35} -radix hexadecimal /test_bench/hemps/slave33/current_page
add wave  -group {slave 35 - 33} -group {proc 35} -radix hexadecimal /test_bench/hemps/slave33/cpu_mem_address
add wave  -group {slave 35 - 33} -group {proc 35} -radix hexadecimal /test_bench/hemps/slave33/write_enable
add wave  -group {slave 35 - 33} -group {proc 35} -radix hexadecimal /test_bench/hemps/slave33/pending_service
add wave  -group {slave 35 - 33} -group {proc 35} -radix hexadecimal /test_bench/hemps/slave33/irq_status
add wave  -group {slave 35 - 33} -group {router 35 input LESTE} -radix hexadecimal /test_bench/hemps/slave33/rx(0)
add wave  -group {slave 35 - 33} -group {router 35 input LESTE} -radix hexadecimal /test_bench/hemps/slave33/credit_o(0)
add wave  -group {slave 35 - 33} -group {router 35 input LESTE} -radix hexadecimal /test_bench/hemps/slave33/data_in(0)
add wave  -group {slave 35 - 33} -group {router 35 input OESTE} -radix hexadecimal /test_bench/hemps/slave33/rx(1)
add wave  -group {slave 35 - 33} -group {router 35 input OESTE} -radix hexadecimal /test_bench/hemps/slave33/credit_o(1)
add wave  -group {slave 35 - 33} -group {router 35 input OESTE} -radix hexadecimal /test_bench/hemps/slave33/data_in(1)
add wave  -group {slave 35 - 33} -group {router 35 input NORTE} -radix hexadecimal /test_bench/hemps/slave33/rx(2)
add wave  -group {slave 35 - 33} -group {router 35 input NORTE} -radix hexadecimal /test_bench/hemps/slave33/credit_o(2)
add wave  -group {slave 35 - 33} -group {router 35 input NORTE} -radix hexadecimal /test_bench/hemps/slave33/data_in(2)
add wave  -group {slave 35 - 33} -group {router 35 input SUL} -radix hexadecimal /test_bench/hemps/slave33/rx(3)
add wave  -group {slave 35 - 33} -group {router 35 input SUL} -radix hexadecimal /test_bench/hemps/slave33/credit_o(3)
add wave  -group {slave 35 - 33} -group {router 35 input SUL} -radix hexadecimal /test_bench/hemps/slave33/data_in(3)
add wave  -group {slave 45 - 34} /test_bench/hemps/slave34/clock
add wave  -group {slave 45 - 34} -group {ni 45} -radix hexadecimal /test_bench/hemps/slave34/tx_ni
add wave  -group {slave 45 - 34} -group {ni 45} -radix hexadecimal /test_bench/hemps/slave34/credit_i_ni
add wave  -group {slave 45 - 34} -group {ni 45} -radix hexadecimal /test_bench/hemps/slave34/data_out_ni
add wave  -group {slave 45 - 34} -radix hexadecimal /test_bench/hemps/slave34/rx_ni
add wave  -group {slave 45 - 34} -radix hexadecimal /test_bench/hemps/slave34/credit_o_ni
add wave  -group {slave 45 - 34} -radix hexadecimal /test_bench/hemps/slave34/data_in_ni
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/operation
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/set_address
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/set_address_2
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/set_size
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/set_size_2
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/set_op
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/start
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/size
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/size_2
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/address
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/address_2
add wave  -group {slave 45 - 34} -group {dmni 45} -group {config 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/config_data
add wave  -group {slave 45 - 34} -group {dmni 45} -group {arb 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/ARB
add wave  -group {slave 45 - 34} -group {dmni 45} -group {arb 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/prio
add wave  -group {slave 45 - 34} -group {dmni 45} -group {arb 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/timer
add wave  -group {slave 45 - 34} -group {dmni 45} -group {arb 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/write_enable
add wave  -group {slave 45 - 34} -group {dmni 45} -group {arb 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/read_enable
add wave  -group {slave 45 - 34} -group {dmni 45} -group {send 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/DMNI_Send
add wave  -group {slave 45 - 34} -group {dmni 45} -group {send 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/send_address
add wave  -group {slave 45 - 34} -group {dmni 45} -group {send 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/mem_data_read
add wave  -group {slave 45 - 34} -group {dmni 45} -group {send 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/send_size
add wave  -group {slave 45 - 34} -group {dmni 45} -group {send 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/send_address_2
add wave  -group {slave 45 - 34} -group {dmni 45} -group {send 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/send_size_2
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/DMNI_Receive
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/recv_address
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/mem_data_write
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/recv_size
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/mem_byte_we
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive NoC 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/intr
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive NoC 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/intr_count
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive NoC 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/SR
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive NoC 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/payload_size
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive NoC 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/read_av
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive NoC 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/slot_available
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive NoC 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/first
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive NoC 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/last
add wave  -group {slave 45 - 34} -group {dmni 45} -group {receive NoC 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/add_buffer
add wave  -group {slave 45 - 34} -group {dmni 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/mem_address
add wave  -group {slave 45 - 34} -group {dmni 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/is_header
add wave  -group {slave 45 - 34} -group {dmni 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/send_active
add wave  -group {slave 45 - 34} -group {dmni 45} -radix hexadecimal /test_bench/hemps/slave34/dmni/receive_active
add wave  -group {slave 45 - 34} -group {proc 45} -radix hexadecimal /test_bench/hemps/slave34/current_page
add wave  -group {slave 45 - 34} -group {proc 45} -radix hexadecimal /test_bench/hemps/slave34/cpu_mem_address
add wave  -group {slave 45 - 34} -group {proc 45} -radix hexadecimal /test_bench/hemps/slave34/write_enable
add wave  -group {slave 45 - 34} -group {proc 45} -radix hexadecimal /test_bench/hemps/slave34/pending_service
add wave  -group {slave 45 - 34} -group {proc 45} -radix hexadecimal /test_bench/hemps/slave34/irq_status
add wave  -group {slave 45 - 34} -group {router 45 input LESTE} -radix hexadecimal /test_bench/hemps/slave34/rx(0)
add wave  -group {slave 45 - 34} -group {router 45 input LESTE} -radix hexadecimal /test_bench/hemps/slave34/credit_o(0)
add wave  -group {slave 45 - 34} -group {router 45 input LESTE} -radix hexadecimal /test_bench/hemps/slave34/data_in(0)
add wave  -group {slave 45 - 34} -group {router 45 input OESTE} -radix hexadecimal /test_bench/hemps/slave34/rx(1)
add wave  -group {slave 45 - 34} -group {router 45 input OESTE} -radix hexadecimal /test_bench/hemps/slave34/credit_o(1)
add wave  -group {slave 45 - 34} -group {router 45 input OESTE} -radix hexadecimal /test_bench/hemps/slave34/data_in(1)
add wave  -group {slave 45 - 34} -group {router 45 input NORTE} -radix hexadecimal /test_bench/hemps/slave34/rx(2)
add wave  -group {slave 45 - 34} -group {router 45 input NORTE} -radix hexadecimal /test_bench/hemps/slave34/credit_o(2)
add wave  -group {slave 45 - 34} -group {router 45 input NORTE} -radix hexadecimal /test_bench/hemps/slave34/data_in(2)
add wave  -group {slave 45 - 34} -group {router 45 input SUL} -radix hexadecimal /test_bench/hemps/slave34/rx(3)
add wave  -group {slave 45 - 34} -group {router 45 input SUL} -radix hexadecimal /test_bench/hemps/slave34/credit_o(3)
add wave  -group {slave 45 - 34} -group {router 45 input SUL} -radix hexadecimal /test_bench/hemps/slave34/data_in(3)
add wave  -group {slave 55 - 35} /test_bench/hemps/slave35/clock
add wave  -group {slave 55 - 35} -group {ni 55} -radix hexadecimal /test_bench/hemps/slave35/tx_ni
add wave  -group {slave 55 - 35} -group {ni 55} -radix hexadecimal /test_bench/hemps/slave35/credit_i_ni
add wave  -group {slave 55 - 35} -group {ni 55} -radix hexadecimal /test_bench/hemps/slave35/data_out_ni
add wave  -group {slave 55 - 35} -radix hexadecimal /test_bench/hemps/slave35/rx_ni
add wave  -group {slave 55 - 35} -radix hexadecimal /test_bench/hemps/slave35/credit_o_ni
add wave  -group {slave 55 - 35} -radix hexadecimal /test_bench/hemps/slave35/data_in_ni
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/operation
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/set_address
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/set_address_2
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/set_size
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/set_size_2
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/set_op
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/start
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/size
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/size_2
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/address
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/address_2
add wave  -group {slave 55 - 35} -group {dmni 55} -group {config 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/config_data
add wave  -group {slave 55 - 35} -group {dmni 55} -group {arb 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/ARB
add wave  -group {slave 55 - 35} -group {dmni 55} -group {arb 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/prio
add wave  -group {slave 55 - 35} -group {dmni 55} -group {arb 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/timer
add wave  -group {slave 55 - 35} -group {dmni 55} -group {arb 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/write_enable
add wave  -group {slave 55 - 35} -group {dmni 55} -group {arb 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/read_enable
add wave  -group {slave 55 - 35} -group {dmni 55} -group {send 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/DMNI_Send
add wave  -group {slave 55 - 35} -group {dmni 55} -group {send 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/send_address
add wave  -group {slave 55 - 35} -group {dmni 55} -group {send 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/mem_data_read
add wave  -group {slave 55 - 35} -group {dmni 55} -group {send 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/send_size
add wave  -group {slave 55 - 35} -group {dmni 55} -group {send 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/send_address_2
add wave  -group {slave 55 - 35} -group {dmni 55} -group {send 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/send_size_2
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/DMNI_Receive
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/recv_address
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/mem_data_write
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/recv_size
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/mem_byte_we
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive NoC 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/intr
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive NoC 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/intr_count
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive NoC 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/SR
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive NoC 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/payload_size
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive NoC 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/read_av
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive NoC 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/slot_available
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive NoC 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/first
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive NoC 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/last
add wave  -group {slave 55 - 35} -group {dmni 55} -group {receive NoC 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/add_buffer
add wave  -group {slave 55 - 35} -group {dmni 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/mem_address
add wave  -group {slave 55 - 35} -group {dmni 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/is_header
add wave  -group {slave 55 - 35} -group {dmni 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/send_active
add wave  -group {slave 55 - 35} -group {dmni 55} -radix hexadecimal /test_bench/hemps/slave35/dmni/receive_active
add wave  -group {slave 55 - 35} -group {proc 55} -radix hexadecimal /test_bench/hemps/slave35/current_page
add wave  -group {slave 55 - 35} -group {proc 55} -radix hexadecimal /test_bench/hemps/slave35/cpu_mem_address
add wave  -group {slave 55 - 35} -group {proc 55} -radix hexadecimal /test_bench/hemps/slave35/write_enable
add wave  -group {slave 55 - 35} -group {proc 55} -radix hexadecimal /test_bench/hemps/slave35/pending_service
add wave  -group {slave 55 - 35} -group {proc 55} -radix hexadecimal /test_bench/hemps/slave35/irq_status
add wave  -group {slave 55 - 35} -group {router 55 input LESTE} -radix hexadecimal /test_bench/hemps/slave35/rx(0)
add wave  -group {slave 55 - 35} -group {router 55 input LESTE} -radix hexadecimal /test_bench/hemps/slave35/credit_o(0)
add wave  -group {slave 55 - 35} -group {router 55 input LESTE} -radix hexadecimal /test_bench/hemps/slave35/data_in(0)
add wave  -group {slave 55 - 35} -group {router 55 input OESTE} -radix hexadecimal /test_bench/hemps/slave35/rx(1)
add wave  -group {slave 55 - 35} -group {router 55 input OESTE} -radix hexadecimal /test_bench/hemps/slave35/credit_o(1)
add wave  -group {slave 55 - 35} -group {router 55 input OESTE} -radix hexadecimal /test_bench/hemps/slave35/data_in(1)
add wave  -group {slave 55 - 35} -group {router 55 input NORTE} -radix hexadecimal /test_bench/hemps/slave35/rx(2)
add wave  -group {slave 55 - 35} -group {router 55 input NORTE} -radix hexadecimal /test_bench/hemps/slave35/credit_o(2)
add wave  -group {slave 55 - 35} -group {router 55 input NORTE} -radix hexadecimal /test_bench/hemps/slave35/data_in(2)
add wave  -group {slave 55 - 35} -group {router 55 input SUL} -radix hexadecimal /test_bench/hemps/slave35/rx(3)
add wave  -group {slave 55 - 35} -group {router 55 input SUL} -radix hexadecimal /test_bench/hemps/slave35/credit_o(3)
add wave  -group {slave 55 - 35} -group {router 55 input SUL} -radix hexadecimal /test_bench/hemps/slave35/data_in(3)
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1627970253 ps} 0}
configure wave -namecolwidth 190
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3198211064 ps}
