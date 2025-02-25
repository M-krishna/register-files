two-reg-file: two-register-file.v two-register-file-tb.v
	iverilog -o tworegfile.o two-register-file.v two-register-file-tb.v
	vvp tworegfile.o 

three-reg-file: three-register-file.v three-register-file-tb.v
	iverilog -o threeregfile.o three-register-file.v three-register-file-tb.v
	vvp threeregfile.o