add wave select
add wave line0
add wave line1
add wave muxout

force select  0
force line0  0
force line1  0
force muxout  0
run 20

force select  0
force line0  1
force line1  0
force muxout  0
run 20
