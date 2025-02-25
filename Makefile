two-reg-file: two-register-file.v two-register-file-tb.v
	iverilog -o tworegfile.o two-register-file.v two-register-file-tb.v
	vvp tworegfile.o 