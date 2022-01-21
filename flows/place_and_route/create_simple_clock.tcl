set input_db $::env(INPUT_DB)
read_db $input_db

set_cmd_units -time ps
create_clock [get_ports $::env(CONSTANT_CLOCK_PORT)] -period $::env(CONSTANT_CLOCK_PERIOD_PS)

set output_db $::env(OUTPUT_DB)
write_db $output_db
